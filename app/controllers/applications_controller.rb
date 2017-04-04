class ApplicationsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_application

  # GET: /applications/:id
  def index
  end

  # POST: /applications/:id
  def index_next
    @application.completed_intro = true
    @application.save validate: false
    respond_to do |format|
      format.html { redirect_to applications_profile_path }
    end
  end

  # GET: /applications/:id/profile
  def profile
  end

  # POST: /applications/:id/profile
  def profile_next
    @application.attributes = post_params
    @application.state = :active
    respond_to do |format|
      if @application.valid?
        @application.completed_profile = true
        @application.save!
        format.html { redirect_to applications_education_path }
      else
        format.html { render :profile }
      end
    end
  end

  # GET: /applications/:id/education
  def education
  end

  # POST: /applications/:id/education
  def education_next
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

  # GET /applications/:id/continue
  def continue
    # Redirects user to the first incomplete part of application.
    respond_to do |format|
      if not @application.completed_intro
        format.html {redirect_to applications_index_path}
      elsif not @application.completed_profile
        format.html {redirect_to applications_profile_path}
      elsif not @application.completed_education
        format.html {redirect_to applications_education_path}
      elsif not @application.completed_employment
        format.html {redirect_to applications_employment_path}
      elsif not @application.completed_references
        format.html {redirect_to applications_references_path}
      elsif not @application.completed_statement
        format.html {redirect_to applications_statement_path}
      elsif not @application.completed_courses
        format.html {redirect_to applications_courses_path}
      else
        format.html {redirect_to applications_submit_path}
      end
    end
  end

  private
    # Sets default application object and checks permission for controller views.
    def set_application
      @application = (Application.find(params[:id]) or not_found)
      @application.owned_by? current_student or user_not_authorized
    end

    # Sanitises submitted form parameters
    def post_params
      params.require(:application).permit(:title, :first_name, :middle_name, :family_name, :previous_name, :gender,
                     :telephone, :mobile, :email, :disability, :personal_statement, :scottish_candidate_number,
                     :national_insurance_number, :permanent_house_number, :permanent_address_1, :permanent_address_2,
                     :permanent_postcode, :permanent_country, :correspondence_house_number, :correspondence_address_1,
                     :correspondence_address_2, :correspondence_postcode, :correspondence_country)
    end
end
