class Staff::CoursesController < Staff::StaffController
  before_action :set_course, only: [:show, :edit, :update, :remove, :destroy]
  before_action :set_categories, only: [:index, :new, :edit]
  before_action :set_colleges, only: [:index, :new, :edit]

  # GET /staff/courses
  def index
    @courses = policy_scope(Course)
                   .includes(:category)
                   .order(:title)
                   .filter(params)
                   .paginate(page: params[:page], per_page: 15)
  end

  # GET /staff/courses/1
  def show
    authorize @course
  end

  # GET /staff/courses/new
  def new
    authorize Course
    @course = Course.new college: current_staff.college
  end

  # GET /staff/courses/1/edit
  def edit
    authorize @course
  end

  # POST /staff/courses
  def create
    @course = Course.new(staff_course_params)

    # Non-admin can only administer their own college.
    unless current_staff.has_role? :site_admin
      @course.college = current_staff.college
    end

    authorize @course # Do this after college set so its gets checked too
    respond_to do |format|
      if @course.save
        format.html { redirect_to staff_course_path(@course), notice: 'Course was successfully created.' }
      else
        set_categories
        set_colleges
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/courses/1
  def update
    authorize @course
    respond_to do |format|
      if @course.update_with_status(staff_course_params)
        format.html { redirect_to staff_course_path(@course), notice: 'Course was successfully updated.' }
      else
        set_categories
        set_colleges
        format.html { render :edit }
      end
    end
  end

  # GET /staff/courses/1/remove
  def remove
    authorize @course
  end

  # DELETE /staff/courses/1
  def destroy
    authorize @course
    respond_to do |format|
      if @course.remove params[:course_title]
        format.html { redirect_to staff_courses_path, notice: 'Course was successfully destroyed.' }
      else
        format.html { render :remove }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Sets categories for action what need them.
    def set_categories
      @categories = policy_scope(Category).where('courses_count > 0').order(:name)
    end

    # Sets colleges attribute based on policy scope.
    def set_colleges
      @colleges = policy_scope(College).order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_course_params
      params.require(:course).permit(:title, :description, :entry_requirements, :career_prospects, :start_date, :end_date, :spaces, :level, :image, :image_cache, :category_id, :college_id, :status)
    end
end
