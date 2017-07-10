# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# Controller class to allow staff members to manage students.
class Staff::StudentsController < Staff::StaffController
  before_action :set_staff_student, only: [:show, :edit, :update, :remove, :destroy]

  # GET /staff/students
  #
  # Gets a list of students based on the +StudentPolicy+ scope.
  def index
    @staff_students =  policy_scope(Student).paginate(page: params[:page], per_page: 15).order(:first_name, :family_name)
  end

  # GET /staff/students/1
  #
  # Shows a specific student.
  def show
    authorize @staff_student
  end

  # GET /staff/students/1/edi
  #
  # Displays the edit student form.
  def edit
    authorize @staff_student
  end

  # PATCH/PUT /staff/students/1
  #
  # Updates student and redirects to show action.
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
  #
  # Displays the remove student form.
  def remove
    authorize @staff_student
  end

  # DELETE /staff/students/1
  #
  # Removes student and redirects to index action.
  def destroy
    authorize @staff_student
    if @staff_student.remove_user params[:username]
      redirect_to staff_students_url, notice: 'Student was successfully removed.'
    else
      render :remove
    end
  end

  # GET /staff/students/search.json?term=<String>
  #
  # Allow JSON search for student details for use in auto-complete forms.
  def search
    authorize Student

    respond_to do |format|
      term = params[:term] ? params[:term].strip : nil
      if term
        # TODO: replace with scoped_search?
        students = Student.search(term).order(:first_name, :family_name).limit 15
        format.json { render json: students, only: [:id, :first_name, :family_name, :email] }
      else
        format.json { head :ok } # blank json response
      end
    end
  end

  private
    # Set main student object for controller.
    def set_staff_student
      @staff_student = Staff::Student.find(params[:id])
    end

    # Sanitise input parameters.
    def staff_student_params
      params.require(:staff_student).permit(:email, :first_name, :family_name, :username, :scottish_candidate_number, :national_insurance_number)
    end
end
