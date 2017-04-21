class Staff::UsersController < Staff::StaffController
  before_action :set_member, only: [:show, :edit, :update, :destroy, :remove, :permissions, :permissions_update]
  before_action :set_colleges, only: [:index, :new, :edit]

  # GET /staff/users
  # GET /staff/users.json
  def index
    @members = policy_scope(Staff).includes(:college).order(:created_at).paginate(page: params[:page])
    if current_staff.has_role? :site_admin
      @job_titles = Staff.all_job_titles
    else
      @job_titles = current_staff.college_job_titles
    end
  end

  # GET /staff/users/1
  # GET /staff/users/1.json
  def show
    authorize @member
  end

  # GET /staff/users/new
  def new
    authorize Staff
    @member = Staff.new
  end

  # POST /staff/users
  # POST /staff/users.json
  def create
    @member = Staff.new user_params_with_password

    # Non-admin can only add staff to their own college.
    unless current_staff.has_role? :site_admin
      @member.college = current_staff.college
    end

    authorize @member
    respond_to do |format|
      if @member.save
        format.html { redirect_to staff_user_path(@member), notice: 'User was successfully created.' }
      else
        set_colleges
        format.html { render :new }
      end
    end
  end

  # GET /staff/users/1/edit
  def edit
    authorize @member
  end

  # PATCH/PUT /staff/users/1
  # PATCH/PUT /staff/users/1.json
  def update
    # Make sure correct college set
    unless current_staff.has_role? :site_admin
      @member.college = current_staff.college
    end

    authorize @member

    respond_to do |format|
      if @member.update(user_params)
        format.html { redirect_to staff_user_path(@member), notice: 'User was successfully updated.' }
      else
        set_colleges
        format.html { render :edit }
      end
    end
  end

  # GET /staff/users/1/remove
  def remove
    authorize @member
  end

  # DELETE /staff/users/1
  # DELETE /staff/users/1.json
  def destroy
    authorize @member
    respond_to do |format|
      if @member.remove_user params[:member_username]
        format.html { redirect_to staff_users_url, notice: 'User was successfully destroyed.' }
      else
        format.html { render :remove }
      end
    end
  end

  # GET /staff/users/1/permission
  def permissions
    authorize @member
    @roles = Role.all
  end

  def permissions_update
    authorize @member
    @member.change_roles params
    respond_to do |format|
      format.html { redirect_to staff_user_path(@member), notice: 'The permissions were successfully updated.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params_with_password
      params.require(:staff).permit(:first_name, :family_name, :email, :college, :college_id, :job_title, :password, :password_confirmation)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:staff).permit(:first_name, :family_name, :email, :college, :college_id, :job_title)
    end
end
