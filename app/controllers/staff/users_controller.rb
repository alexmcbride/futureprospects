class Staff::UsersController < ApplicationController
  before_action do
    authenticate_staff_role! :manage_staff
  end
  before_action :set_user, only: [:show, :edit, :update, :destroy, :remove, :permissions, :permissions_update]
  before_action :set_colleges, only: [:index, :new, :edit]
  before_action :forbid_self, only: [:edit, :update, :destroy, :remove, :permissions, :permissions_update]

  # GET /staff/users
  # GET /staff/users.json
  def index
    college = current_staff.college
    @users = college.staff.order(:created_at).paginate(page: params[:page])
    @job_titles = college.staff.select(:job_title).distinct
  end

  # GET /staff/users/1
  # GET /staff/users/1.json
  def show
  end

  # GET /staff/users/new
  def new
    @user = Staff.new
  end

  # GET /staff/users/1/edit
  def edit
  end

  # POST /staff/users
  # POST /staff/users.json
  def create
    @user = Staff.new user_params_with_password
    respond_to do |format|
      if @user.save
        format.html { redirect_to staff_user_path(@user), notice: "User '#{@user.username}' was successfully created." }
      else
        set_colleges
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/users/1
  # PATCH/PUT /staff/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to staff_user_path(@user), notice: "User '#{@user.username}' was successfully updated." }
      else
        set_colleges
        format.html { render :edit }
      end
    end
  end

  def remove
  end

  # DELETE /staff/users/1
  # DELETE /staff/users/1.json
  def destroy
    respond_to do |format|
      if @user.remove_user params[:user_username]
        format.html { redirect_to staff_users_url, notice: 'User was successfully destroyed.' }
      else
        format.html { render :remove }
      end
    end
  end

  # GET /staff/users/1/permission
  def permissions
    @roles = Role.all
  end

  def permissions_update
    @user.change_roles params[:permission]
    respond_to do |format|
      format.html { redirect_to staff_user_permissions_path(@user), notice: 'The permissions were successfully updated.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find params[:id]
      @user = @user.becomes(User) # To make Rolify work with single-table inheritance.
    end

    # Sets the colleges attribute for certain actions.
    def set_colleges
      @colleges = College.select('id, name').order(:name) # only need id, name for select inputs
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params_with_password
      params.require(:user).permit(:first_name, :family_name, :email, :college, :college_id, :job_title, :password, :password_confirmation)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :family_name, :email, :college, :college_id, :job_title)
    end

    # Checks if this is your own user account, then redirects you.
    def forbid_self
      if @user.id == current_staff.id
        user_not_authorized 'You cannot change your own user account'
      end
    end
end
