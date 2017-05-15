class CoursesController < ApplicationController
  before_action :set_categories, except: [:search]

  # GET /courses
  #
  # Shows a searchable list of college courses.
  def index
    @search_term = params[:search]
    # Do search using scoped_search. If search term is empty then all records are returned.
    @courses = Course.available.full_search(@search_term).order(:title).page(params[:page])

    if params[:college]
      @courses = @courses.where(college_id: params[:college])
    end
  end

  # GET /courses/category/1
  #
  # Shows courses in a particular category.
  def category
    @search_term = params[:search]
    @category = Category.left_outer_joins(:courses).find params[:id] # Left outer join as courses can be empty
    @courses = Course.available.full_search(@search_term, @category).page(params[:page]).includes(:college).order(:title)

    if params[:college]
      @courses = @courses.where(college_id: params[:college])
    end

    render :index
  end

  # GET /courses/1
  #
  # Shows details of a specific course.
  def show
    @course = Course.find(params[:id])

    # For the add to application button
    @course_selection = CourseSelection.new course_id: @course.id
  end

  # GET /courses/search.json
  #
  # Returns course search results as JSON, for use in autocomplete text inputs.
  def search
    # with empty term scoped_search returns all results, which we don't want.
    term = params[:term].strip unless params[:term].nil?
    respond_to do |format|
      if term.nil? or term.empty?
        format.json { head :ok } # blank json response
      else
        # Perform search.
        @courses = Course.full_search(params[:term]).where(status: :open).take 10
        format.json { render :json => @courses, :only => [:id, :title],
                             :include => {:college => {:only => :name}, :category => {:only => :name}} }
      end
    end
  end

  def clearance
    @courses = (if student_signed_in?
      Course.clearance_courses(current_student.current_application).includes(:college).includes(:category).order('courses.title')
    else
      Course.all_clearance_courses.includes(:college).includes(:category)
    end).paginate(page: params[:page], per_page: 10)
  end

  def clearance_show

  end

  def clearance_create

  end

  private
    # Sets categories for courses what need it.
    def set_categories
      @categories = Category.where('courses_count > 0').order(:name)
    end
end
