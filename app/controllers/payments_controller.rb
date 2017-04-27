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
  end

  # POST  /payments/choose_payment_method/continue
  def payment_method_continue
    # Store payment method in session
    session[:payment_type] = params[:payment_type].to_sym if params[:payment_type]

    if session[:payment_type] == :paypal
      set_application
      redirect_to Payment::setup_paypal @application.calculate_fee, request.remote_ip, new_payment_url, payment_method_url
    elsif session[:payment_type] == :credit_card
      redirect_to new_payment_path
    else
      session.delete :payment_type
      set_application
      flash[:notice] = 'You must choose a payment method.'
      render :payment_method
    end
  end

  # GET /payments/new
  def new
    @payment = Payment.new payment_type: session[:payment_type]

    # Paypal redirects us to this action with the token set.
    if @payment.paypal?
      @payment.update_from_token params[:token]
    end
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)
    @payment.remote_ip = request.remote_ip # Needed for PayPal payment.
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
    # Sets the application for actions what need it, unless the application is cancelled.
    def set_application
      @application = current_student.current_application
      user_not_authorized if @application.cancelled?
    end

    # Sets the payment and checks if the student has permission to view it.
    def set_payment
      @payment = Payment.find(params[:id])
      user_not_authorized unless @payment.owner? current_student.current_application
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:payment_type, :card_brand, :card_number, :card_cvv, :card_expiry, :card_first_name, :card_last_name, :paypal_payer_id, :paypal_token)
    end
end
