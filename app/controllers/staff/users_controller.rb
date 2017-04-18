class Staff::UsersController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_colleges, only: [:new, :edit, :create, :update]

  # GET /staff/users
  # GET /staff/users.json
  def index
    college = current_staff.college
    @users = college.staff.order(:created_at).paginate(page: params[:page])
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
    @user = Staff.create_staff user_params
    respond_to do |format|
      if @user.save
        format.html { redirect_to staff_user_path(@user), notice: "User '#{@user.username}' was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/users/1
  # PATCH/PUT /staff/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/users/1
  # DELETE /staff/users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to staff_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = Staff.find(params[:id])
    end

    def set_colleges
      @colleges = College.order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:staff).permit(:first_name, :family_name, :email, :college, :college_id, :job_title, :password, :password_confirmation)
    end
end
