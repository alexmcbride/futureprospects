class Staff::CollegesController < Staff::StaffController
  before_action :set_college, only: [:show, :edit, :update, :remove, :destroy]

  # GET /staff/colleges
  # GET /staff/colleges.json
  def index
    # If the user isn't an admin, we just redirect them to their own college page
    if current_staff.has_role? :site_admin
      @colleges = policy_scope College
    else
      skip_policy_scope # Skip this rule to stop pundit complaining.
      redirect_to staff_college_path(current_staff.college)
    end
  end

  # GET /staff/colleges/1
  # GET /staff/colleges/1.json
  def show
    authorize @college
  end

  # GET /staff/colleges/new
  def new
    authorize College
    @college = College.new
  end

  # GET /staff/colleges/1/edit
  def edit
    authorize @college
  end

  # POST /staff/colleges
  # POST /staff/colleges.json
  def create
    @college = College.new(college_params)

    respond_to do |format|
      if @college.save
        format.html { redirect_to staff_college_path(@college), notice: 'College was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/colleges/1
  # PATCH/PUT /staff/colleges/1.json
  def update
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to staff_college_path(@college), notice: 'College was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def remove
    authorize @college
  end

  # DELETE /staff/colleges/1
  # DELETE /staff/colleges/1.json
  def destroy
    respond_to do |format|
      if @college.remove_college params[:college_name]
        format.html { redirect_to root_path, notice: 'College was successfully destroyed.' }
      else
        format.html { render :remove }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:college).permit(:name, :description, :telephone, :email, :website, :address, :postcode, :image, :image_cache)
    end
end
