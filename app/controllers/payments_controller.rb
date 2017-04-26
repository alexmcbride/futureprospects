class PaymentsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_payment, only: [:show]
  before_action :set_application, only: [:payment_method, :new, :create]

  # GET /payments
  def index
    @payments = current_student.all_payments.order(created_at: :desc)
  end

  # GET /payments/choose_payment_method
  def payment_method
    if @application.cancelled?
      redirect_to root_path # Go back to route where there's a cancellation message.
    end
  end

  # POST  /payments/choose_payment_method/continue
  def payment_method_continue
    # Store payment type in session if it exists.
    if params[:payment_type].present? && Payment::valid_payment_type?(params[:payment_type])
      session[:payment_type] = params[:payment_type].to_sym
      redirect_to new_payment_path
    else
      # Show error.
      flash[:notice] = 'You must choose a payment method.'
      set_application
      render :payment_method
    end
  end

  # GET /payments/new
  def new
    @payment = Payment.new payment_type: session[:payment_type]
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)
    @payment.application = @application
    respond_to do |format|
      if @payment.authorize
        format.html { redirect_to payment_path(@payment), notice: 'Payment was successfully authorized.' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /payments/:id
  def show
  end

  private
    # Sets the application for actions what need it.
    def set_application
      @application = current_student.current_application
    end

    # Sets the payment and checks if the student has permission to view it.
    def set_payment
      @payment = Payment.find(params[:id])
      unless @payment.owner? current_student.current_application
        user_not_authorized
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:payment_type, :card_brand, :card_number, :card_cvv, :card_expiry, :card_first_name, :card_last_name)
    end
end
