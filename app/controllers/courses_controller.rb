# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Controller class for displaying courses.
class CoursesController < ApplicationController
  before_action :set_categories, except: [:search]

  # GET /courses?search=<String>&college=<Integer>
  #
  # Shows a list of college courses with an optional search term and college ID.
  def index
    @search_term = params[:search]
    # Do search using scoped_search. If search term is empty then all records are returned.
    @courses = Course.available.full_search(@search_term).order(:title).page(params[:page])

    # Load category.
    @category = nil
    if params[:category]
      @courses = @courses.where(category_id: params[:category])
      @category = Category.find params[:category]
    end

    # Filter by college if needed.
    if params[:college]
      @courses = @courses.where(college_id: params[:college])
    end
  end

  # GET /courses/1
  #
  # Shows details of a specific course.
  def show
    @course = Course.find(params[:id])

    # For the add to application button
    @course_selection = CourseSelection.new course_id: @course.id
  end

  # GET /courses/search.json?term=<String>
  #
  # Searches courses for the term and returns the results as JSON. This is for use within the create application add courses page.
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

  private
    # Sets categories for the main categories list.
    def set_categories
      @categories = Category.where('courses_count > 0').order(:name)
    end
end
