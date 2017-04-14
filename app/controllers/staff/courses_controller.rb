class Staff::CoursesController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_course, only: [:show, :edit, :update, :remove, :destroy]
  before_action :set_categories, only: [:index, :new, :edit, :create, :update]

  # GET /staff/courses
  def index
    @courses = Course.includes(:category)
                   .filter_and_sort(params)
                   .where(college_id: current_staff.college_id)
                   .paginate(page: params[:page], per_page: 15)
    @categories = Category.all
  end

  # GET /staff/courses/1
  def show
  end

  # GET /staff/courses/new
  def new
    @course = Course.new
    @categories = Category.all
  end

  # GET /staff/courses/1/edit
  def edit
    @categories = Category.all
  end

  # POST /staff/courses
  def create
    @course = Course.new(staff_course_params)
    @course.college = current_staff.college

    respond_to do |format|
      if @course.save
        format.html { redirect_to staff_course_path(@course), notice: "Course '#{@course.title}' was successfully created." }
      else
        @categories = Category.all
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/courses/1
  def update
    respond_to do |format|
      if @course.update_with_status(staff_course_params)
        format.html { redirect_to staff_course_path(@course), notice: "Course '#{@course.title}' was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # GET /staff/courses/1/remove
  def remove
  end

  # DELETE /staff/courses/1
  def destroy
    respond_to do |format|
      if @course.remove_valid? params[:course_title]
        @course.destroy!
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

    def set_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_course_params
      params.require(:course).permit(:title, :description, :entry_requirements, :career_prospects, :start_date, :end_date, :spaces, :level, :image, :image_cache, :category_id, :status)
    end
end
