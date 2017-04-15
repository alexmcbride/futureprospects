class Staff::UsersController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_staff_user, only: [:show, :edit, :update, :destroy]

  # GET /staff/users
  # GET /staff/users.json
  def index
    college = current_staff.college
    @staff_users = college.staff.order(:created_at).paginate(page: params[:page])
  end

  # GET /staff/users/1
  # GET /staff/users/1.json
  def show
  end

  # GET /staff/users/new
  def new
    @staff_user = Staff::User.new
  end

  # GET /staff/users/1/edit
  def edit
  end

  # POST /staff/users
  # POST /staff/users.json
  def create
    @staff_user = Staff::User.new(staff_user_params)

    respond_to do |format|
      if @staff_user.save
        format.html { redirect_to @staff_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @staff_user }
      else
        format.html { render :new }
        format.json { render json: @staff_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/users/1
  # PATCH/PUT /staff/users/1.json
  def update
    respond_to do |format|
      if @staff_user.update(staff_user_params)
        format.html { redirect_to @staff_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff_user }
      else
        format.html { render :edit }
        format.json { render json: @staff_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/users/1
  # DELETE /staff/users/1.json
  def destroy
    @staff_user.destroy
    respond_to do |format|
      format.html { redirect_to staff_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_user
      @staff_user = Staff::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_user_params
      params.fetch(:staff_user, {})
    end
end
