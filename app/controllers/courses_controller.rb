class CoursesController < ApplicationController
  # GET /courses
  def index
    @search_term = params[:search]
    # Do search using scoped_search. If search term is empty then all records are returned.
    @courses = Course.search_for(@search_term).includes(:category, :college).paginate(:page => params[:page])
    @categories = Category.all
  end

  # GET /courses/category/1
  def category
    @categories = Category.all
    @category = Category.left_outer_joins(:courses).find params[:id] # Left outer join as courses can be empty
    @courses = @category.courses.paginate(:page => params[:page]).includes(:college).order(:title)
    render :index
  end

  # GET /courses/1
  def show
    @course = Course.find(params[:id])
    @categories = Category.all
  end
end
