# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Controller class that allows staff to manage other staff members. Staff members and admin cannot modify their own accounts,
# only the accounts of others.
class Staff::MembersController < Staff::StaffController
  before_action :set_member, only: [:show, :edit, :update, :destroy, :remove, :permissions, :permissions_update,
                                    :promote_admin, :demote_admin]
  before_action :set_colleges, only: [:index, :new, :edit]

  # GET /staff/users
  #
  # Displays list of members based on filter options and +StaffPolicy+ scope.
  def index
    @members = policy_scope(Staff).filter(params).includes(:college).order(:created_at).paginate(page: params[:page])

    # Get list of job titles for filter sidebar.
    if current_staff.has_role? :site_admin
      @job_titles = Staff.all_job_titles.order(:job_title)
    else
      @job_titles = current_staff.college_job_titles.order(:job_title)
    end
  end

  # GET /staff/users/1
  #
  # Displays single staff member
  def show
    authorize @member
  end

  # GET /staff/users/new
  #
  # Displays the new staff member form.
  def new
    authorize Staff
    @member = Staff.new
  end

  # POST /staff/users
  #
  # Creates a new database entry for the staff member and redirects to permissions action.
  def create
    @member = Staff.new user_params_with_password
    @member.skip_confirmation!

    # Non-admin can only add staff to their own college.
    unless current_staff.has_role? :site_admin
      @member.college = current_staff.college
    end

    authorize @member
    respond_to do |format|
      if @member.save
        format.html { redirect_to staff_member_permissions_path(@member), notice: 'User was successfully created.' }
      else
        set_colleges
        format.html { render :new }
      end
    end
  end

  # GET /staff/users/1/edit
  #
  # Displays edit staff member form.
  def edit
    authorize @member
  end

  # PATCH/PUT /staff/users/1
  #
  # Updates staff member and redirects to show action.
  def update
    # Make sure correct college set
    unless current_staff.has_role? :site_admin
      @member.college = current_staff.college
    end

    authorize @member

    respond_to do |format|
      if @member.update(user_params)
        format.html { redirect_to staff_member_path(@member), notice: 'User was successfully updated.' }
      else
        set_colleges
        format.html { render :edit }
      end
    end
  end

  # GET /staff/users/1/remove
  #
  # Displays remove staff member form.
  def remove
    authorize @member
  end

  # DELETE /staff/users/1
  #
  # Removes staff member and redirects to index action.
  def destroy
    authorize @member
    respond_to do |format|
      if @member.remove_user params[:member_username]
        format.html { redirect_to staff_members_url, notice: 'User was successfully removed.' }
      else
        format.html { render :remove }
      end
    end
  end

  # GET /staff/users/1/permission
  #
  # Displays the change permissions form.
  def permissions
    authorize @member
    @roles = Role.all
  end

  # POST /staff/users/1/permission
  #
  # Updates the permissions and redirects to the show action.
  def permissions_update
    authorize @member
    @member.change_roles params[:permission].nil? ? [] : params[:permission].map {|k, v| k}
    respond_to do |format|
      format.html { redirect_to staff_member_path(@member), notice: 'The permissions were successfully updated.' }
    end
  end

  # POST /staff/users/1/promote_admin
  #
  # Promotes a staff member to admin and then redirects to the show form.
  def promote_admin
    authorize @member
    @member.promote_admin
    respond_to do |format|
      format.html { redirect_to staff_member_path(@member), notice: 'The admin permission was successfully added.' }
    end
  end

  # POST /staff/users/1/demote_admin
  #
  # Demotes a staff member from admin and redirects to the show form.
  def demote_admin
    authorize @member
    @member.demote_admin
    respond_to do |format|
      format.html { redirect_to staff_member_path(@member), notice: 'The admin permission was successfully revoked.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Staff.find params[:id]
    end

    # Sets the colleges attribute for certain actions.
    def set_colleges
      @colleges = policy_scope(College).select('id, name').order(:name) # only need id, name for select inputs
    end

    # Sanitises input parameters (with password).
    def user_params_with_password
      params.require(:staff).permit(:first_name, :family_name, :email, :college, :college_id, :job_title, :password,
                                    :password_confirmation)
    end

  # Sanitises input parameters (without password).
    def user_params
      params.require(:staff).permit(:first_name, :family_name, :email, :college, :college_id, :job_title)
    end
end
