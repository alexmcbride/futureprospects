class ApplicationsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_application, except: [:create, :education_remove, :qualifications,
                                           :qualifications_add, :qualifications_remove]

  # POST: /applications
  def create
    # Create new application and supply some starting info we already know
    @application = Application.new
    @application.email = current_student.email
    @application.first_name = current_student.first_name
    @application.family_name = current_student.family_name
    @application.scottish_candidate_number = current_student.scottish_candidate_number
    @application.national_insurance_number = current_student.national_insurance_number
    @application.student = current_student
    @application.save validate: false # Can't validate at this point
    respond_to do |format|
      format.html { redirect_to applications_index_path(@application) }
    end
  end

  # GET /applications/:id/continue
  def continue
    # Redirects student to the first incomplete part of their application.
    respond_to do |format|
      if not @application.completed_intro
        format.html { redirect_to applications_index_path(@application) }
      elsif not @application.completed_profile
        format.html { redirect_to applications_profile_path(@application) }
      elsif not @application.completed_education
        format.html { redirect_to applications_education_path(@application) }
      elsif not @application.completed_employment
        format.html { redirect_to applications_employment_path(@application) }
      elsif not @application.completed_references
        format.html { redirect_to applications_references_path(@application) }
      elsif not @application.completed_statement
        format.html { redirect_to applications_statement_path(@application) }
      elsif not @application.completed_courses
        format.html { redirect_to applications_courses_path(@application) }
      else
        format.html { redirect_to applications_submit_path(@application) }
      end
    end
  end

  # GET: /applications/:id
  def index
    @application.completed_intro = true
    @application.save validate: false
  end

  # GET: /applications/:id/profile
  def profile
  end

  # POST: /applications/:id/profile
  def profile_next
    @application.attributes = application_params
    @application.state = :active
    respond_to do |format|
      if @application.valid?
        @application.completed_profile = true
        @application.save
        format.html { redirect_to applications_education_path }
      else
        format.html { render :profile }
      end
    end
  end

  # GET: /applications/:id/education
  def education
    @institution = Institution.new
  end

  # POST: /applications/:id/education/add
  def education_add
    @institution = Institution.new institution_params
    @institution.application = @application
    respond_to do |format|
      if @institution.save
        format.html { redirect_to applications_education_path(@application), notice: 'Added educational institution' }
      else
        format.html { render :education }
      end
    end
  end

  # DELETE: /applications/:id/education
  def education_remove
    institution = Institution.find params[:id]
    id = institution.application_id
    institution.qualifications.destroy_all # Delete all qualifications at this institution
    institution.destroy
    respond_to do |format|
      format.html { redirect_to applications_education_path(id), notice: 'Removed educational institution' }
    end
  end

  # POST: /applications/:id/education_next
  def education_next
    respond_to do |format|
      @application.validate_institutions = true
      valid = @application.valid?
      @application.completed_education = valid
      @application.save validate: false

      if valid
        format.html { redirect_to applications_employment_path(@application) }
      else
        @institution = Institution.new
        format.html { render :education }
      end
    end
  end

  # GET: /applications/qualifications/:id
  def qualifications
    @institution = Institution.find params[:id]
    @application = @institution.application
    @qualification = Qualification.new
  end

  # POST: /applications/qualifications/:id
  def qualifications_add
    @institution = Institution.find params[:id]
    @application = @institution.application
    @qualification = Qualification.new qualification_params
    @qualification.institution = @institution
    respond_to do |format|
      if @qualification.save
        format.html { redirect_to applications_qualifications_path(@institution), notice: 'Added qualification' }
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
      format.html { redirect_to applications_qualifications_path(qualification.institution), notice: 'Removed qualification' }
    end
  end

  def employment
  end

  def employment_next
  end

  def references
  end

  def references_next
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
    def institution_params
      params.require(:institution).permit(:name, :address_1, :address_2, :postcode, :country)
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
