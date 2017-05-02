class Staff::ApplicationsController < ApplicationController
  before_action :set_application, only: [:update, :destroy]

  # GET /staff/applications
  # GET /staff/applications.json
  def index
    @applications = policy_scope(Application)
                        .filter(params)
                        .order(:submitted_date)
                        .paginate(page: params[:page], per_page: 15)
                        .includes(:student)
    @colleges = policy_scope(College)
  end

  # GET /staff/applications/1
  # GET /staff/applications/1.json
  def show
    @application = Application.includes(schools: [:qualifications])
                       .includes(:jobs)
                       .includes(:reference)
                       .find params[:id]
    authorize @application
  end

  # GET /staff/applications/1/edit
  def edit
    @application = Application.includes(course_selections: [:course])
                       .includes(:payments)
                       .find params[:id]
    respond_to do |format|
      format.html do
        authorize @application
        unless @application.awaiting_decisions?
          redirect_to staff_applications_path, notice: 'This action cannot be completed at this time'
        end
      end
    end
  end

  # PATCH/PUT /staff/applications/1
  # PATCH/PUT /staff/applications/1.json
  def update
    authorize @application
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to staff_application_path(@application), notice: 'Application was successfully updated.' }
      else
        format.html { render :edit }
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
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(course_selections_attributes: [:id, :college_offer, :note])
    end
end
