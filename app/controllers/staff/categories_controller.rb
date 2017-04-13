class Staff::CategoriesController < ApplicationController
  before_action :set_staff_category, only: [:show, :edit, :update, :remove, :destroy]

  # GET /staff/categories
  # GET /staff/categories.json
  def index
    @categories = Staff::Category.order(:name)
  end

  # GET /staff/categories/1
  # GET /staff/categories/1.json
  def show
  end

  # GET /staff/categories/new
  def new
    @category = Staff::Category.new
  end

  # GET /staff/categories/1/edit
  def edit
  end

  # POST /staff/categories
  # POST /staff/categories.json
  def create
    @category = Staff::Category.new(staff_category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to staff_categories_path, notice: "Category '#{@category.name} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/categories/1
  # PATCH/PUT /staff/categories/1.json
  def update
    respond_to do |format|
      if @category.update(staff_category_params)
        format.html { redirect_to staff_categories_path, notice: "Category '#{@category.name} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def remove

  end

  # DELETE /staff/categories/1
  # DELETE /staff/categories/1.json
  def destroy
    respond_to do |format|
      if @category.remove? params[:category_name]
        format.html { redirect_to staff_categories_url, notice: 'Category was successfully destroyed.' }
      else
        format.html { render :remove }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_category
      @category = Staff::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_category_params
      params.require(:category).permit(:name)
    end
end
