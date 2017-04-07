class ApplicationsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_application, except: [:create, :education_remove, :qualifications,
                                           :qualifications_add, :qualifications_remove, :employment_remove]

  # POST: /applications
  def create
    @application = current_student.create_application
    respond_to do |format|
      format.html { redirect_to applications_index_path(@application) }
    end
  end

  # GET /applications/:id/continue
  def continue
    # Redirects student to the first incomplete part of their application.
    paths = { intro: applications_index_path(@application),
              profile: applications_profile_path(@application),
              education: applications_education_path(@application),
              employment: applications_employment_path(@application),
              references: applications_references_path(@application),
              statement: applications_statement_path(@application),
              courses: applications_courses_path(@application),
              submit: applications_submit_path(@application) }

    respond_to do |format|
      format.html { redirect_to paths[@application.next_stage] }
    end
  end

  # GET: /applications/:id
  def index
    @application.save_intro?
  end

  # GET: /applications/:id/profile
  def profile
  end

  # POST: /applications/:id/profile
  def profile_next
    respond_to do |format|
      if @application.save_profile? application_params
        format.html { redirect_to applications_education_path(@application) }
      else
        format.html { render :profile }
      end
    end
  end

  # GET: /applications/:id/education
  def education
    @school = School.new
  end

  # POST: /applications/:id/education/add
  def education_add
    @school = School.new school_params
    @school.application = @application
    respond_to do |format|
      if @school.save
        format.html { redirect_to applications_education_path(@application), notice: 'Added school' }
      else
        format.html { render :education }
      end
    end
  end

  # DELETE: /applications/:id/education
  def education_remove
    school = School.find params[:id]
    id = school.application_id
    school.destroy_with_qualifications
    respond_to do |format|
      format.html { redirect_to applications_education_path(id), notice: 'Removed school' }
    end
  end

  # POST: /applications/:id/education_next
  def education_next
    respond_to do |format|
      if @application.save_education?
        format.html { redirect_to applications_employment_path(@application) }
      else
        @school = School.new
        format.html { render :education }
      end
    end
  end

  # GET: /applications/qualifications/:id
  def qualifications
    @school = School.find params[:id]
    @qualification = Qualification.new
  end

  # POST: /applications/qualifications/:id
  def qualifications_add
    @school = School.find params[:id]
    @application = @school.application
    @qualification = Qualification.new qualification_params

    respond_to do |format|
      if @school.add_qualification? @qualification
        format.html { redirect_to applications_qualifications_path(@school), notice: 'Added qualification' }
      else
        format.html { render :qualifications }
      end
    end
  end

  # DELETE: /applications/qualifications/:id
  def qualifications_remove
    qualification = Qualification.find params[:id]
    qualification.destroy
    respond_to do |format|
      format.html { redirect_to applications_qualifications_path(qualification.school), notice: 'Removed qualification' }
    end
  end

  # GET: /applications/:id/employment
  def employment
    @job = Job.new
  end

  # POST: /applications/:id/employment
  def employment_add
    @job = Job.new job_params
    @job.application = @application
    respond_to do |format|
      if @job.save
        format.html { redirect_to applications_employment_path(@application), notice: 'Employment added' }
      else
        format.html { render :employment }
      end
    end
  end

  # DELETE: /applications/:id/employment
  def employment_remove
    @job = (Job.find params[:id] or not_found)
    @job.destroy
    respond_to do |format|
      format.html { redirect_to applications_employment_path(@job.application_id), notice: 'Employment removed' }
    end
  end

  # POST: /applications/:id/employment/next
  def employment_next
    respond_to do |format|
      @application.save_employment?
      format.html { redirect_to applications_references_path(@application) }
    end
  end

  # GET: /applications/:id/references
  def references
    @reference = @application.create_reference
  end

  # POST: /applications/:id/references
  def references_next
    @reference = @application.create_reference
    respond_to do |format|
      if @application.save_references? @reference, reference_params
        format.html { redirect_to applications_statement_path(@application) }
      else
        format.html { render :references }
      end
    end
  end

  def statement
  end

  def statement_next
  end

  def courses
  end

  def courses_next
  end

  def submit
  end

  def submit_next
  end

  private
    # Sets current application object and checks if student is owner of application
    def set_application
      @application = (Application.find(params[:id]) or not_found)
      @application.owned_by? current_student or user_not_authorized
    end

    # Sanitises submitted form parameters
    def qualification_params
      params.require(:qualification).permit(:subject, :award, :grade, :start_date, :end_date)
    end

    # Sanitises submitted form parameters
    def school_params
      params.require(:school).permit(:name, :address_1, :address_2, :postcode, :country)
    end

    # Sanitises submitted form parameters
    def job_params
      params.require(:job).permit(:employer, :address_1, :address_2, :postcode, :country, :job_title, :duties, :start_date, :end_date)
    end

    # Sanitises submitted form parameters
    def reference_params
      params.require(:reference).permit(:reference_1_full_name, :reference_1_occupation, :reference_1_relationship,
                                        :reference_1_address_1, :reference_1_address_2, :reference_1_country,
                                        :reference_1_postcode, :reference_1_telephone, :reference_1_email,
                                        :reference_2_full_name, :reference_2_occupation, :reference_2_relationship,
                                        :reference_2_address_1, :reference_2_address_2, :reference_2_country,
                                        :reference_2_postcode, :reference_2_telephone, :reference_2_email)
    end

    # Sanitises submitted form parameters
    def application_params
      params.require(:application).permit(:title, :first_name, :middle_name, :family_name, :previous_name, :gender,
                     :telephone, :mobile, :email, :disability, :personal_statement, :scottish_candidate_number,
                     :national_insurance_number, :permanent_house_number, :permanent_address_1, :permanent_address_2,
                     :permanent_postcode, :permanent_country, :correspondence_house_number, :correspondence_address_1,
                     :correspondence_address_2, :correspondence_postcode, :correspondence_country)
    end
end
