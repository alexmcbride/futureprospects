# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Controller class to manage payments.
# Handles credit-card and paypal payments.
# A payment item is created with a null status and inserted into payments table. The calling controller redirects to
# +payments#payment_method+, from where this controller takes over. Optionally the calling controller can set
# session[:payment_redirect] with a path the payment controller will redirect to once the payment has finished. If no
# path is supplied it redirects to root.
class PaymentsController < ApplicationController
  # Callbacks
  before_action :authenticate_student!
  before_action :set_payment, only: [:show]
  before_action :set_application, only: [:payment_method, :payment_method_continue, :new, :create]

  # GET /payments
  #
  # Displays list of student payments.
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

    @payment = @application.unpaid_payment
  end

  # POST  /payments/payment_method/continue
  #
  # Saves payment method to session and redirects to the +new_payment_path+, optionally through PayPal if the option is chosen.
  def payment_method_continue
    # Store payment method in session
    session[:payment_type] = params[:payment_type].to_sym if params[:payment_type]

    if session[:payment_type] == :paypal
      payment = @application.unpaid_payment
      redirect_to payment.generate_paypal_url(request.remote_ip, new_payment_url, payment_method_url)
    elsif session[:payment_type] == :credit_card
      redirect_to new_payment_path
    else
      flash[:notice] = 'You must choose a payment method.'
      @payment = @application.unpaid_payment
      render :payment_method
    end
  end

  # GET /payments/new
  #
  # Displays new payment form, unless redirected from payment, in which case the authorize paypal form is displayed.
  # When PayPal redirects us here its includes a token in the URL that we need later for authorization.
  def new
    @payment = @application.update_payment session[:payment_type], params[:token]
  end

  # POST /payments
  #
  # Authorizes either credit card or paypal payment depending on the form that posts to it.
  def create
    @payment = @application.authorize_payment payment_params, request.remote_ip
    if @payment.authorized?
      redirect_to payment_path(@payment), notice: 'Payment was successfully authorized.'
    else
      render :new
    end
  end

  # GET /payments/:id
  # GET /payments/:id.pdf
  #
  # Shows a specific payment, or if provided with a format (e.g. .pdf) allows downloading of invoice file.
  def show
    respond_to do |format|
      format.html

      # Download PDF invoice.
      format.pdf do
        pdf = @payment.to_pdf(view_context)
        send_data pdf.render, filename: pdf.filename, type: pdf.mime_type
      end
    end
  end

  private
    # Sets the application for actions what need it if the user can view it.
    def set_application
      @application = current_student.current_application
      user_not_authorized unless @application.awaiting_payment? || @application.payment_failed?
    end

    # Sets the payment object for the controller.
    def set_payment
      @payment = Payment.find(params[:id])
      user_not_authorized unless @payment.owner? current_student.current_application
    end

    # Sanitizes form parameters.
    def payment_params
      params.require(:payment).permit(:payment_type, :card_brand, :card_number, :card_cvv, :card_expiry, :card_first_name, :card_last_name, :paypal_payer_id, :paypal_token)
    end
end
