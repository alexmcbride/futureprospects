class Staff::CoursesController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_staff_course, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :new, :edit, :create, :update]

  # GET /staff/courses
  # GET /staff/courses.json
  def index
    @courses = Course.includes(:category)
                   .filter_and_sort(params[:title], params[:category], params[:status], params[:sort])
                   .where(college_id: current_staff.college_id)
                   .paginate(page: params[:page], per_page: 15)
    @categories = Category.all
  end

  # GET /staff/courses/1
  # GET /staff/courses/1.json
  def show
  end

  # GET /staff/courses/new
  def new
    @staff_course = Staff::Course.new
    @categories = Category.all
  end

  # GET /staff/courses/1/edit
  def edit
    @categories = Category.all
  end

  # POST /staff/courses
  # POST /staff/courses.json
  def create
    @staff_course = Staff::Course.new(staff_course_params)
    @staff_course.college = current_staff.college

    respond_to do |format|
      if @staff_course.save
        format.html { redirect_to staff_courses_path, notice: "Course '#{@staff_course.title}' was successfully created." }
      else
        @categories = Category.all
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/courses/1
  # PATCH/PUT /staff/courses/1.json
  def update
    respond_to do |format|
      if @staff_course.update(staff_course_params)
        format.html { redirect_to staff_courses_path, notice: "Course '#{@staff_course.title}' was successfully updated." }
        format.json { render :show, status: :ok, location: @staff_course }
      else
        format.html { render :edit }
        format.json { render json: @staff_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/courses/1
  # DELETE /staff/courses/1.json
  def destroy
    @staff_course.destroy
    respond_to do |format|
      format.html { redirect_to staff_courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_course
      @staff_course = Staff::Course.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_course_params
      params.require(:course).permit(:title, :description, :entry_requirements, :career_prospects, :start_date, :end_date, :spaces, :level, :image, :category_id, :status)
    end
end
