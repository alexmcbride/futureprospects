# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# * Controller class for tracking student applications and managing student decisions/replies.
class DecisionsController < ApplicationController
  before_action :set_application
  before_action :authorize_user, except: [:completed]

  # GET /decisions
  #
  # Displays the track applications page.
  def index
  end

  # GET /decisions/firm
  #
  # Displays the page that allows the student to make their firm choice.
  def firm
    # Wipe any previous choices at the start.
    CourseSelection.clear_all_choices @application
  end

  # POST /decisions/firm
  #
  # Updates the model with the student's firm choice, if the user can still make an insurance choice redirects to that page, otherwise redirects to review.
  def firm_post
    selection = CourseSelection.find params[:course_selection_id]
    if selection.make_firm_choice
      redirect_to decisions_review_path
    else
      redirect_to decisions_insurance_path
    end
  end

  # GET /decisions/insurance
  #
  # Allows student to make their insurance choice.
  def insurance
  end

  # POST /decisions/insurance
  #
  # Updates the model with the insurance choice and redirects to review.
  def insurance_post
    selection = CourseSelection.find params[:course_selection_id]
    selection.make_insurance_choice
    redirect_to decisions_review_path
  end

  # POST /decisions/decline?which=<Symbol>
  #
  # Updates the model to decline offers depending on the +which+ query parameter, then redirects to decisions.
  def decline
    which = params[:which_to_decline].to_sym
    CourseSelection.decline which, @application
    redirect_to decisions_review_path, notice: 'Choices successfully declined'
  end

  # GET /decisions/review
  #
  # Page to let students review their decisions.
  def review
  end

  # POST /decisions/review
  #
  # Updates model to save student decisions and redirects to completed.
  def review_post
    @application.save_completed

    redirect_to decisions_completed_path, notice: 'Application completed'
  end

  # GET /decisions/completed
  #
  # Displays the application complete page.
  def completed
  end

  private
    # Sets the application object for action that need it.
    def set_application
      @application = current_student.current_application
    end

    # Checks the user can view this controller.
    def authorize_user
      user_not_authorized unless @application.can_make_decision?
    end
end