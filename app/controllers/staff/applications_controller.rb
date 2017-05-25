# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Controller class that allows staff to manage student applications.
class Staff::ApplicationsController < Staff::StaffController
  before_action :set_application, only: [:update, :destroy]

  # GET /staff/applications
  #
  # Displays the application list, that allows a staff member to choose which application to administer.
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
        .by_year(params[:year])
        .filter(params) # Include filter options.
        .includes(:student)
        .page(params[:page])

    # Stuff for filter sidebar
    @categories = Category.order(:name)
    @colleges = policy_scope(College)
    @years = policy_scope(Application).years.count
  end

  # GET /staff/applications/1
  #
  # Displays a single student application.
  def show
    @application = Application.find params[:id]
    authorize @application
  end

  # GET /staff/applications/1/full
  #
  # Displays the student's full application (including all info).
  def full
    @application = Application.includes(schools: [:qualifications])
                       .includes(:jobs)
                       .includes(:reference)
                       .find params[:id]
    authorize @application
  end

  # GET /staff/applications/1/edit
  #
  # Displays the application edit form, which allows staff members to make decisions about applications.
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
  #
  # Updates an application with the staff member's decisions and redirects back to show.
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

  private
    # Sets the main application object for actions that need it.
    def set_application
      @application = Application.find(params[:id])
    end

    # Sanitise allowed application parameters.
    def application_params
      params.require(:application).permit(course_selections_attributes: [:id, :college_offer, :note])
    end
end
