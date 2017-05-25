# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Controller class to allow staff member's to manage a college.
class Staff::CollegesController < Staff::StaffController
  before_action :set_college, only: [:show, :edit, :update, :remove, :destroy, :clearance, :clearance_update]

  # GET /staff/colleges
  #
  # Displays list of colleges, unless the user is a staff member in which case it redirects to that staff member's show college action.
  def index
    # If the user isn't an admin, we just redirect them to their own college page.
    if current_staff.has_role?(:site_admin)
      @colleges = policy_scope College
    else
      skip_policy_scope # Skip this rule to stop pundit complaining.
      redirect_to staff_college_path(current_staff.college)
    end
  end

  # GET /staff/colleges/1
  #
  # Displays information about a specified college.
  def show
    authorize @college
  end

  # GET /staff/colleges/new
  #
  # Displays the new college form.
  def new
    authorize College
    @college = College.new
  end

  # GET /staff/colleges/1/edit
  #
  # Displays the edit college form.
  def edit
    authorize @college
  end

  # POST /staff/colleges
  #
  # Creates a new college and redirects to show action.
  def create
    @college = College.new(college_params)
    authorize @college

    respond_to do |format|
      if @college.save
        format.html { redirect_to staff_college_path(@college), notice: 'College was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/colleges/1
  #
  # Updates existing college and redirects to show action.
  def update
    authorize @college
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to staff_college_path(@college), notice: 'College was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # GET /staff/colleges/1/remove
  #
  # Displays the remove college form.
  def remove
    authorize @college
  end

  # DELETE /staff/colleges/1
  #
  # Removes college and redirects to index action.
  def destroy
    authorize @college
    respond_to do |format|
      if @college.remove_college params[:college_name]
        format.html { redirect_to staff_colleges_pathll, notice: 'College was successfully removed.' }
      else
        format.html { render :remove }
      end
    end
  end

  # GET /staff/colleges/1/clearance
  #
  # Displays clearance form.
  def clearance
    authorize @college

    @applications = @college.clearance_applications
  end

  # POST /staff/colleges/1/clearance
  #
  # Updates clearance on college and redirects to clearance action.
  def clearance_update
    authorize @college
    @college.update_for_clearance college_params
    redirect_to staff_college_clearance_path(@college), notice: 'Clearance updated'
  end

  private
    # Sets college object for the controller.
    def set_college
      @college = College.find(params[:id])
    end

    # Sanitises input parameters.
    def college_params
      params.require(:college).permit(:name, :description, :telephone, :email, :website, :address, :postcode, :image, :image_cache, :clearance)
    end
end
