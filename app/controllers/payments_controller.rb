class PaymentsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_payment, only: [:show]
  before_action :set_application, only: [:payment_method, :payment_method_continue, :new, :create]

  # GET /payments
  #
  # Displays list of student's payments.
  def index
    @payments = current_student.all_payments.order(created_at: :desc)
  end

  # GET /payments/payment_method
  #
  # Lets student choose the payment method.
  def payment_method
    # If redirected here with token, means user selected cancel option at PayPal.
    if params.key? :token
      flash[:notice] = 'PayPal payment cancelled'
    end
  end

  # POST  /payments/payment_method/continue
  #
  # Saves payment method to session and redirects to the new_payment_path, optionally through PayPal if the option is chosen.
  def payment_method_continue
    # Store payment method in session
    session[:payment_type] = params[:payment_type].to_sym if params[:payment_type]

    if session[:payment_type] == :paypal
      payment = Payment.new application: @application
      redirect_to payment.generate_paypal_url request.remote_ip, new_payment_url, payment_method_url
    elsif session[:payment_type] == :credit_card
      redirect_to new_payment_path
    else
      flash[:notice] = 'You must choose a payment method.'
      render :payment_method
    end
  end

  # GET /payments/new
  #
  # Displays new payment form, unless redirected from payment, in which case the authorize paypal form is displayed.
  # When PayPal redirects us here its includes a token in the URL that we need later for authorization.
  def new
    @payment = Payment.new payment_type: session[:payment_type]
    @payment.update_from_paypal params[:token]
  end

  # POST /payments
  #
  # Authorizes either credit card or paypal payments depending on the form that posts to it..
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
  #
  # Shows a specific payment.
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
