class PaymentsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_payment, only: [:confirmation]#, :edit, :update, :destroy]
  before_action :set_application, only: [:check, :new, :create]

  # GET /payments
  def index

  end

  # GET /payments/:id
  def show
  end

  # GET /payments/check
  def check

  end

  # POST /payments/check
  def check_continue
    # We store the current payment type in the session.
    session[:payment_type] = params[:payment_type]
    redirect_to new_payment_path
  end

  # GET /payments/1/confirmation
  def confirmation
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)
    @payment.application = @application
    respond_to do |format|
      if @payment.authorize
        format.html { redirect_to payment_confirmation_path(@payment), notice: 'Payment was successfully authorized.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_application
      @application = current_student.current_application
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:card_brand, :card_number, :card_cvv, :card_expiry, :card_first_name, :card_last_name)
    end
end
