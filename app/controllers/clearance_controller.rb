# Controller class to manage applying for a clearance course.
class ClearanceController < ApplicationController
  before_action :authenticate_student!, except: [:index]
  before_action :set_application, except: [:show]

  # GET /clearance
  #
  # Gets a list of clearance courses, either all clearance courses, or just for the logged in user.
  def index
    @courses = (if student_signed_in?
                  Course.clearance_courses(@application).includes(:college).includes(:category).order('courses.title')
                else
                  Course.all_clearance_courses.includes(:college).includes(:category)
                end).paginate(page: params[:page], per_page: 10)
  end

  # GET /clearance/:id/new
  #
  # Shows the new course application form.
  def new
    course = Course.find params[:id]
    @selection = CourseSelection.new course: course, application: current_student.current_application
  end

  # POST /clearance/:id/create
  #
  # Updates the application with the new course selection.
  def create
    @selection = CourseSelection.new selection_params
    if @application.add_clearance_course @selection
      redirect_to clearance_path(@selection), notice: 'Applied for clearance course'
    else
      render :new
    end
  end

  # GET /clearance/id
  #
  # Shows the clearance course selection.
  def show
    @selection = CourseSelection.find params[:id]
  end

  private
    # Permitted params for course selection.
    def selection_params
      params.require(:course_selection).permit(:course_id, :application_id)
    end

    # Sets the application object and verifies that the student can view the page.
    def set_application
      @application = current_student.current_application
      @application.all_rejected? or user_not_authorized
    end
end