class Staff::CoursesController < ApplicationController
  before_action :authenticate_staff!
  before_action :set_staff_course, only: [:show, :edit, :update, :destroy]

  # GET /staff/courses
  # GET /staff/courses.json
  def index
    @courses = Course.filter(params[:title], params[:category], params[:status])
    @courses = @courses.includes(:category).where(college_id: current_staff.college_id)
    @courses = @courses.paginate(page: params[:page])
    @categories = Category.all
  end

  # GET /staff/courses/1
  # GET /staff/courses/1.json
  def show
  end

  # GET /staff/courses/new
  def new
    @staff_course = Staff::Course.new
  end

  # GET /staff/courses/1/edit
  def edit
  end

  # POST /staff/courses
  # POST /staff/courses.json
  def create
    @staff_course = Staff::Course.new(staff_course_params)

    respond_to do |format|
      if @staff_course.save
        format.html { redirect_to @staff_course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @staff_course }
      else
        format.html { render :new }
        format.json { render json: @staff_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/courses/1
  # PATCH/PUT /staff/courses/1.json
  def update
    respond_to do |format|
      if @staff_course.update(staff_course_params)
        format.html { redirect_to @staff_course, notice: 'Course was successfully updated.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_course_params
      params.fetch(:staff_course, {})
    end
end
