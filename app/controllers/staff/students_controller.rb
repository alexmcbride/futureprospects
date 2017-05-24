class Staff::StudentsController < Staff::StaffController
  before_action :set_staff_student, only: [:show, :edit, :update, :remove, :destroy]

  # GET /staff/students
  def index
    @staff_students =  policy_scope(Student).paginate(page: params[:page], per_page: 15).order(:first_name, :family_name)
  end

  # GET /staff/students/1
  def show
    authorize @staff_student
  end

  # GET /staff/students/1/edit
  def edit
    authorize @staff_student
  end

  # PATCH/PUT /staff/students/1
  def update
    authorize @staff_student
    respond_to do |format|
      if @staff_student.update(staff_student_params)
        format.html { redirect_to @staff_student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff_student }
      else
        format.html { render :edit }
        format.json { render json: @staff_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /staff/students/1/remove
  def remove
    authorize @staff_student
  end

  # DELETE /staff/students/1
  def destroy
    authorize @staff_student
    if @staff_student.remove params[:username]
      redirect_to staff_students_url, notice: 'Student was successfully removed.'
    else
      render :remove
    end
  end

  # GET /staff/students/search.json?term=<term>
  def search
    authorize Student

    term = params[:term] ? params[:term].strip : nil
    puts term
    respond_to do |format|
      if term
        term = "%#{term.downcase}%"
        students = Student.where('LOWER(first_name) LIKE ? OR LOWER(family_name) LIKE ? OR LOWER(username) LIKE ? or LOWER(EMAIL) LIKE ?', term, term, term, term)
                       .order(:first_name, :family_name)
                       .limit 15
        format.json { render json: students, only: [:id, :first_name, :family_name] }
      else
        format.json { head :ok } # blank json response
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_student
      @staff_student = Staff::Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_student_params
      params.require(:staff_student).permit(:email, :first_name, :family_name, :username, :scottish_candidate_number, :national_insurance_number)
    end
end
