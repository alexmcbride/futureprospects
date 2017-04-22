class Staff::CategoriesController < Staff::StaffController
  before_action :set_staff_category, only: [:show, :edit, :update, :remove, :destroy]

  # GET /staff/categories
  def index
    @categories = policy_scope(Category).order(:name)
  end

  # GET /staff/categories/1
  def show
    authorize @category
  end

  # GET /staff/categories/new
  def new
    authorize Category
    @category = Category.new
  end

  # GET /staff/categories/1/edit
  def edit
    authorize @category
  end

  # POST /staff/categories
  def create
    authorize Category
    @category = Category.new(staff_category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to staff_categories_path, notice: "Category '#{@category.name} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staff/categories/1
  def update
    authorize @category
    respond_to do |format|
      if @category.update(staff_category_params)
        format.html { redirect_to staff_categories_path, notice: "Category '#{@category.name} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # GET /staff/categories/1/remove
  def remove
    authorize @category
  end

  # DELETE /staff/categories/1
  def destroy
    authorize @category
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
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_category_params
      params.require(:category).permit(:name)
    end
end
