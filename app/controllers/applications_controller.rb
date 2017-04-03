class ApplicationsController < ApplicationController
  before_action :authenticate_student!

  # GET: /applications
  def index

  end

  # GET: /applications/profile
  def profile
    @application = Application.current
  end

  # POST: /applications/profile
  def profile_next
    @application = Application.current
    @application.attributes = post_params
    @application.student = current_student
    @application.state = :active
    respond_to do |format|
      if @application.save
        format.html { redirect_to applications_education_path }
      else
        format.html { render :profile }
      end
    end
  end

  # GET: /applications/education
  def education
    @application = Application.current
  end

  # POST: /applications/education
  def education_next
    @application = Application.current
  end

  def employment
  end

  def references

  end

  def statement
  end

  def courses
  end

  def submit
  end

  private
    def post_params
      params
          .require(:application)
          .permit(:title, :first_name, :middle_name, :family_name, :previous_name, :gender,
                  :telephone, :mobile, :email, :disability, :personal_statement, :scottish_candidate_number,
                  :national_insurance_number, :permanent_house_number, :permanent_address_1, :permanent_address_2,
                  :permanent_postcode, :permanent_country, :correspondence_house_number, :correspondence_address_1,
                  :correspondence_address_2, :correspondence_postcode, :correspondence_country)
    end
end
