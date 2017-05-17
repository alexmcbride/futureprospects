class Staff::ApplicationsController < Staff::StaffController
  before_action :set_application, only: [:update, :destroy]

  # GET /staff/applications
  def index
    # Default filter option if not set.
    unless params.key? :status
      params[:status] = :awaiting_decisions
    end

    # Default sort order if not set.
    unless params.key? :order
      params[:order] = :submitted_date
    end

    @applications = policy_scope(Application)
        .by_year(params)
        .filter(params)
        .includes(:student)
        .page(params[:page])

    # Stuff for filter sidebar
    @categories = Category.order(:name)
    @colleges = policy_scope(College)
    @years = policy_scope(Application).group_by_year('applications.created_at', reverse: true).count
    puts @years
  end

  # GET /staff/applications/1
  def show
    @application = Application.find params[:id]
    authorize @application
  end

  # GET /staff/applications/1/full
  def full
    @application = Application.includes(schools: [:qualifications])
                       .includes(:jobs)
                       .includes(:reference)
                       .find params[:id]
    authorize @application
  end

  # GET /staff/applications/1/edit
  def edit
    @application = Application.find params[:id]
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
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to staff_applications_url, notice: 'Application was successfully destroyed.' }
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
