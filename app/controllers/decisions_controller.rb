class DecisionsController < ApplicationController
  before_action :set_application#, only: [:index, :firm, :firm_post, :insurance, :insurance_post, :decline, :review,
                                 #        :review_post, :completed]
  before_action :check_can_view

  # GET /decisions/:id
  def index
  end

  # get /decisions/firm
  def firm
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
    if which == :all
      CourseSelection.decline_all @application
    elsif which == :insurance
      CourseSelection.decline_insurance @application
    end
    redirect_to decisions_review_path(@application), notice: 'All choices declined'
  end

  # GET /decisions/review
  def review
  end

  # POST /decisions/review
  def review_post
    @application.status = :completed
    @application.save!
    redirect_to decisions_completed_path(@application), notice: 'Application completed'
  end

  # GET /decisions/completed
  def completed

  end

  # GET /decisions/change
  def change
    @course_selections = @application.course_selections.where(college_offer: nil)
  end

  def change_post
    p = params
  end

  private
    # Sets the application object for action that need it.
    def set_application
      @application = current_student.current_application
    end

    def check_can_view
      user_not_authorized unless (@application.awaiting_decisions? || @application.all_decisions_made? || @application.all_rejected?)
    end
end