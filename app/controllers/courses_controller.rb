class CoursesController < ApplicationController
  # GET /courses
  def index
    @search_term = params[:search]
    # Do search using scoped_search. If search term is empty then all records are returned.
    @courses = Course.search(@search_term).paginate(:page => params[:page])
    @categories = Category.order(:name).all
  end

  # GET /courses/category/1
  def category
    @categories = Category.order(:name).all
    @category = Category.left_outer_joins(:courses).find params[:id] # Left outer join as courses can be empty
    @courses = @category.courses.paginate(:page => params[:page]).includes(:college).order(:title)
    render :index
  end

  # GET /courses/1
  def show
    @course = Course.find(params[:id])
    @categories = Category.order(:name).all
  end

  # GET /courses/search.json
  def search
    @courses = Course.search(params[:term]).take 13
    respond_to do |format|
      # Respond with course title, college name, and category name
      format.json { render :json => @courses, :only => [:id, :title],
                           :include => {:category => {:only => :name},
                                        :college => {:only => :name}} }
    end
  end
end
