# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Controller class to manage creating a new student application.
class NewApplicationsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_application, except: [:index, :show, :create,
                                           :qualifications, :qualifications_add, :qualifications_remove,
                                           :education_remove, :education_edit, :education_update,
                                           :employment_edit, :employment_update, :employment_remove, :courses_remove,
                                           :completed]

  # GET /applications
  #
  # Shows a list of the student's previous applications.
  def index
    @applications = current_student.applications.where.not(status: :submitting)
    if @applications.count == 1
      redirect_to application_path(@applications.first)
    end
  end

  # GET /applications/:id
  #
  # Shows a particular student application.
  def show
    @application = Application.find params[:id]
    @application.owned_by?(current_student) or user_not_authorized
  end

  # POST /applications
  #
  # Creates a new application for the student, already filed in with some data that we know, then redirects to intro.
  def create
    respond_to do |format|
      @application = current_student.create_application
      if @application.nil?
        format.html { redirect_to root_path, notice: 'Application has already been created' }
      else
        format.html { redirect_to applications_intro_path }
      end
    end
  end

  # GET /applications/continue
  #
  # Continues an existing application, by redirecting the student to their first incomplete stage.
  def continue
    # Redirects student to the first incomplete part of their application.
    paths = { intro_stage: applications_intro_path,
              profile_stage: applications_profile_path,
              education_stage: applications_education_path,
              employment_stage: applications_employment_path,
              references_stage: applications_references_path,
              statement_stage: applications_statement_path,
              courses_stage: applications_courses_path,
              submit_stage: applications_submit_path }
    stage = @application.current_stage.to_sym

    respond_to do |format|
      format.html { redirect_to paths[stage] }
    end
  end

  # GET /applications/intro
  #
  # Shows intro stage.
  def intro
    @application.save_intro
  end

  # GET /applications/profile
  #
  # Displays profile stage.
  def profile
  end

  # POST /applications/profile
  #
  # Updates application profile and redirects to education.
  def profile_next
    respond_to do |format|
      if @application.save_profile application_params
        format.html { redirect_to applications_education_path }
      else
        format.html { render :profile }
      end
    end
  end

  # GET /applications/education
  #
  # Displays add education form.
  def education
    @school = School.new
  end

  # POST /applications/education/add
  #
  # Adds a new educational establishment to the application and redirects back to education.
  def education_add
    @school = School.new school_params
    @school.application = @application
    respond_to do |format|
      if @school.save
        format.js
        format.html { redirect_to applications_education_path, notice: 'Added school' }
      else
        format.js
        format.html { render :education }
      end
    end
  end

  # GET /applications/education/search.json?term=<String>
  #
  # Searches for previously used school name for use in autocomplete forms.
  def education_search
    schools = School.search(params[:term]).limit(10)
    respond_to do |format|
      format.json do
        render :json => schools, :only => [:name, :address_1, :address_2, :city, :postcode, :country]
      end
    end
  end

  # DELETE /applications/education/:id
  #
  # Removes an educational establishment from the application then redirects back to education.
  def education_remove
    school = School.find params[:id]
    school.destroy
    respond_to do |format|
      format.js do
        @application = school.application
      end
      format.html { redirect_to applications_education_path, notice: 'Removed school' }
    end
  end

  # GET /applications/education/:id/edit
  #
  # Shows the edit school form.
  def education_edit
    @school = School.find params[:id]
  end

  # PATCH /applications/education/:id
  #
  # Update the school and redirects back to education.
  def education_update
    @school = School.find params[:id]
    if @school.update(school_params)
      redirect_to applications_education_path, notice: 'Updated school'
    else
      render :education_edit
    end
  end

  # POST /applications/education_next
  #
  # Submits the education stage and redirects to employment.
  def education_next
    respond_to do |format|
      if @application.save_education
        format.html { redirect_to applications_employment_path }
      else
        @school = School.new
        format.html { render :education }
      end
    end
  end

  # GET /applications/qualifications/:id
  #
  # Displays the add qualifications form.
  def qualifications
    @school = School.find params[:id]
    @qualification = Qualification.new
  end

  # POST /applications/qualifications/:id
  #
  # Adds a qualification to the school and redirects to qualifications.
  def qualifications_add
    @school = School.find params[:id]
    @application = @school.application
    @qualification = Qualification.new qualification_params

    respond_to do |format|
      if @school.add_qualification @qualification
        format.js
        format.html { redirect_to applications_qualifications_path(@school), notice: 'Added qualification' }
      else
        format.js
        format.html { render :qualifications }
      end
    end
  end

  # DELETE /applications/qualifications/:id
  #
  # Removes a qualification from a school and redirects to qualifications.
  def qualifications_remove
    qualification = Qualification.find params[:id]
    qualification.destroy
    respond_to do |format|
      format.js do
        @school = qualification.school
      end
      format.html { redirect_to applications_qualifications_path(qualification.school), notice: 'Removed qualification' }
    end
  end

  # GET /applications/employment
  #
  # Displays add employment form.
  def employment
    @job = Job.new
  end

  # POST /applications/employment
  #
  # Adds new job to the application and redirects back to employment.
  def employment_add
    @job = Job.new job_params
    @job.application = @application
    respond_to do |format|
      if @job.save
        format.js
        format.html { redirect_to applications_employment_path, notice: 'Employment added' }
      else
        format.js
        format.html { render :employment }
      end
    end
  end

  # GET /applications/employment/search.json?term=<term>
  #
  # Searches for previously used school name for use in autocomplete forms.
  def employment_search
    jobs = Job.search(params[:term]).limit(10)
    respond_to do |format|
      format.json do
        render :json => jobs, :only => [:employer, :address_1, :address_2, :city, :postcode, :country]
      end
    end
  end

  # DELETE /applications/employment/:id
  #
  # Removes job from the application and redirects to employment.
  def employment_remove
    @job = (Job.find params[:id] or not_found)
    @job.destroy
    respond_to do |format|
      format.js do
        @application = @job.application
      end
      format.html { redirect_to applications_employment_path, notice: 'Employment removed' }
    end
  end

  # GET /applications/employment/:id/edit
  #
  # Displays the edit job form.
  def employment_edit
    @job = Job.find params[:id]
  end

  # PATCH/PUT /applications/employment/:id
  #
  # Updates the job with the new params and redirects back to employment.
  def employment_update
    @job = Job.find params[:id]
    if @job.update job_params
      redirect_to applications_employment_path, notice: 'Employment updated'
    else
      render :employment_edit
    end
  end

  # POST /applications/employment/next
  #
  # Submits employment stage and redirects to references.
  def employment_next
    respond_to do |format|
      @application.save_employment
      format.html { redirect_to applications_references_path }
    end
  end

  # GET /applications/references
  #
  # Shows references form. There is just a single references model that holds both references.
  def references
    @reference = @application.create_reference
  end

  # POST /applications/references
  #
  # Submits references stage and redirects to statement.
  def references_next
    @reference = @application.create_reference
    respond_to do |format|
      if @application.save_references @reference, reference_params
        format.html { redirect_to applications_statement_path }
      else
        format.html { render :references }
      end
    end
  end

  # GET /applicationsstatement
  #
  # Displays personal statement form.
  def statement
  end

  # POST /applications/:id/statement
  #
  # Submits personal statement stage and redirects to courses.
  def statement_next
    respond_to do |format|
      if @application.save_statement statement_params
        format.html { redirect_to applications_courses_path }
      else
        format.html { render :statement }
      end
    end
  end

  # GET /applications/:id/courses
  #
  # Displays the add courses form.
  def courses
    @course_selection = CourseSelection.new
    @course_selections = @application.course_selections.includes(:course)
  end

  # POST /applications/courses
  #
  # Adds course to application and redirects back to courses.
  def courses_add
    @course_selection = CourseSelection.new course_params
    @course_selections = @application.course_selections.includes(:course)
    respond_to do |format|
      if @application.add_course @course_selection
        format.js
        format.html { redirect_to applications_courses_path, notice: 'Course added to application' }
      else
        format.js
        format.html do
          render :courses
        end
      end
    end
  end

  # DELETE /applications/courses/:id
  #
  # Removes course from application and redirects back to courses.
  def courses_remove
    @selection = (CourseSelection.find params[:id] or not_found)
    @selection.destroy
    respond_to do |format|
      format.js do
        @application = @selection.application
        @course_selections = @application.course_selections.includes(:course)
      end
      format.html { redirect_to applications_courses_path, notice: 'Course removed from application' }
    end
  end

  # POST /applicationscourses/next
  #
  # Submits courses stage and redirects to submit.
  def courses_next
    respond_to do |format|
      if @application.save_courses
        format.html { redirect_to applications_submit_path }
      else
        @course_selection = CourseSelection.new
        @course_selections = @application.course_selections.includes(:course)
        format.html { render :courses }
      end
    end
  end

  # GET /applications/submit
  #
  # Shows submit stage.
  def submit
  end

  # POST /applications/submit
  #
  # Submits final stage and redirects to +PaymentsController+.
  def submit_next
    respond_to do |format|
      confirmed = !params[:confirm].nil?
      if @application.save_submit confirmed
        format.html { redirect_to payment_redirect_path(applications_completed_path), notice: 'Submitted application' }
      else
        format.html { render :submit }
      end
    end
  end

  # GET /applications/completed
  #
  # Displays the application completed page.
  def completed
  end

  private
    # Sets current application object,  checks if student is owner of application, and checks application not cancelled.
    def set_application
      @application = current_student.current_application
      user_not_authorized unless @application && @application.submitting?
    end

    # Sanitises submitted form parameters
    def course_params
      params.require(:course_selection).permit(:course_id)
    end

    # Sanitises submitted form parameters
    def statement_params
      params.require(:application).permit(:personal_statement)
    end

    # Sanitises submitted form parameters
    def qualification_params
      params.require(:qualification).permit(:subject, :award, :grade, :start_date, :end_date)
    end

    # Sanitises submitted form parameters
    def school_params
      params.require(:school).permit(:id, :name, :address_1, :address_2, :city, :postcode, :country)
    end

    # Sanitises submitted form parameters
    def job_params
      params.require(:job).permit(:employer, :address_1, :address_2, :city, :postcode, :country, :job_title, :duties, :start_date, :end_date)
    end

    # Sanitises submitted form parameters
    def reference_params
      params.require(:reference).permit(:reference_1_full_name, :reference_1_occupation, :reference_1_relationship,
                                        :reference_1_address_1, :reference_1_address_2, :reference_1_city, :reference_1_country,
                                        :reference_1_postcode, :reference_1_telephone, :reference_1_email,
                                        :reference_2_full_name, :reference_2_occupation, :reference_2_relationship,
                                        :reference_2_address_1, :reference_2_address_2, :reference_2_city,:reference_2_country,
                                        :reference_2_postcode, :reference_2_telephone, :reference_2_email)
    end

    # Sanitises submitted form parameters
    def application_params
      params.require(:application).permit(:title, :first_name, :middle_name, :family_name, :previous_name, :gender,
                     :telephone, :mobile, :disability, :permanent_house_number, :permanent_address_1, :permanent_address_2,
                     :permanent_city, :permanent_postcode, :permanent_country, :correspondence_house_number, :correspondence_address_1,
                     :correspondence_address_2, :correspondence_city, :correspondence_postcode, :correspondence_country, :birth_date)
    end
end
