class Staff::ApplicationsController < ApplicationController
  before_action :set_staff_application, only: [:show, :edit, :update, :destroy]

  # GET /staff/applications
  # GET /staff/applications.json
  def index
    @applications = policy_scope(Application).includes(:student).where.not(status: :submitting)
  end

  # GET /staff/applications/1
  # GET /staff/applications/1.json
  def show
  end

  # GET /staff/applications/new
  def new
    @application = Application.new
  end

  # GET /staff/applications/1/edit
  def edit
  end

  # POST /staff/applications
  # POST /staff/applications.json
  def create
    @application = Application.new(staff_application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/applications/1
  # PATCH/PUT /staff/applications/1.json
  def update
    respond_to do |format|
      if @application.update(staff_application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/applications/1
  # DELETE /staff/applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to staff_applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_application_params
      params.fetch(:staff_application, {})
    end
end
