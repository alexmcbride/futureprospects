# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Controller class to allow staff member to manage course categories.
class Staff::CategoriesController < Staff::StaffController
  before_action :set_staff_category, only: [:show, :edit, :update, :remove, :destroy]

  # GET /staff/categories
  #
  # Display a list of categories (including the add new category form).
  def index
    @categories = Category.order(:name)
    @category = Category.new
    skip_policy_scope
  end

  # GET /staff/categories/1/edit
  #
  # Displays the edit category form.
  def edit
    authorize @category
  end

  # POST /staff/categories
  #
  # Creates a new category and redirects to the index action.
  def create
    authorize Category
    @category = Category.new(staff_category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to staff_categories_path, notice: "Category '#{@category.name} was successfully created." }
      else
        @categories = Category.order(:name)
        skip_policy_scope
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /staff/categories/1
  #
  # Updates an existing category and redirects to the index action.
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
  #
  # Displays the remove category form.
  def remove
    authorize @category
  end

  # DELETE /staff/categories/1
  #
  # Deletes the category and redirects to the index action.
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
    # Sets the main category object for the controller.
    def set_staff_category
      @category = Category.find(params[:id])
    end

    # Sanitises parameters.
    def staff_category_params
      params.require(:category).permit(:name)
    end
end
