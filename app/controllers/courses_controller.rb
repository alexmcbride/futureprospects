class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    @search_term = params[:s]
    @courses = Course.search_for(@search_term).paginate(:page => params[:page])
    @categories = Category.all
  end

  # GET /courses/category/1
  # GET /courses/category/1.json
  def category
    @categories = Category.all
    @category = Category.left_outer_joins(:courses).find params[:id] # Left outer join as courses can be empty
    @courses = @category.courses.paginate(:page => params[:page]).includes(:college).order(:title)
    render :index
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @categories = Category.all
  end
end
