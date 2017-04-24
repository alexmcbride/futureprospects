class PaymentsController < ApplicationController
  before_action :authenticate_student!
  #before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_application, only: [:index, :new, :create]

  # GET /payments
  def index
  end

  # POST / payments
  def index_continue
    # We store the current payment type in the session.
    session[:payment_type] = params[:payment_type]
    redirect_to new_payment_path
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    @payment.application = @application
    respond_to do |format|
      if @payment.authorize
        format.html { redirect_to @payment, notice: 'Payment was successfully authorized.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
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
