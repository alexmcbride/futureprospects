class DecisionsController < ApplicationController
  before_action :set_application
  before_action :check_can_view, except: [:completed]

  # GET /decisions/:id
  def index
  end

  # GET /decisions/firm
  def firm
    # Wipe any previous choices at the start.
    CourseSelection.clear_all_choices @application
  end

  # POST /decisions/firm
  def firm_post
    selection = CourseSelection.find params[:course_selection_id]
    if selection.make_firm_choice
      redirect_to decisions_review_path
    else
      redirect_to decisions_insurance_path
    end
  end

  # GET /decisions/insurance
  def insurance
  end

  # POST /decisions/insurance
  def insurance_post
    selection = CourseSelection.find params[:course_selection_id]
    selection.make_insurance_choice
    redirect_to decisions_review_path
  end

  # POST /decisions/decline
  def decline
    which = params[:which_to_decline].to_sym
    CourseSelection.decline which, @application
    redirect_to decisions_review_path, notice: 'Choices successfully declined'
  end

  # GET /decisions/review
  def review
  end

  # POST /decisions/review
  def review_post
    @application.save_completed

    redirect_to decisions_completed_path, notice: 'Application completed'
  end

  # GET /decisions/completed
  def completed
  end

  private
    # Sets the application object for action that need it.
    def set_application
      @application = current_student.current_application
    end

    def check_can_view
      # TODO: move into Application as can_make_decision? Application should control who makes decisions.
      user_not_authorized unless (@application.awaiting_decisions? || @application.awaiting_replies? || @application.all_rejected?)
    end
end