class DecisionsController < ApplicationController
  before_action :set_application, only: [:index, :firm, :firm_post, :insurance, :insurance_post, :decline, :review,
                                         :review_post, :completed]
  before_action :check_allowed, except: [:index, :completed]

  # GET /decisions/:id
  def index
  end

  # get /decisions/:id/firm
  def firm
  end

  # POST /decisions/:id/firm
  def firm_post
    @application.course_selections.each do |selection|
      # Update all courses with new choice.
      if selection.id.to_s == params[:course_selection_id]
        selection.student_choice = :firm_choice
      else
        selection.student_choice = nil
      end
      selection.save!
    end

    redirect_to decisions_insurance_path(@application), notice: 'Firm choice saved'
  end

  # GET /decisions/:id/insurance
  def insurance
  end

  # POST /decisions/:id/insurance
  def insurance_post
    @application.course_selections.each do |selection|
      # Update all courses with new choice.
      if selection.id.to_s == params[:course_selection_id]
        selection.student_choice = :insurance_choice
      elsif !selection.firm_choice?
        selection.student_choice = :declined
      end
      selection.save!
    end

    redirect_to decisions_review_path(@application), notice: 'Insurance choice saved'
  end

  # POST /decisions/:id/decline
  def decline
    which = params[:which_to_decline].to_sym
    @application.course_selections.each do |selection|
      if which == :all || (which == :insurance && !selection.firm_choice?)
        selection.student_choice = :declined
      end
      selection.save!
    end
    redirect_to decisions_review_path(@application), notice: 'All choices declined'
  end

  # GET /decisions/:id/review
  def review
  end

  # POST /decisions/:id/review
  def review_post
    @application.status = :completed
    @application.save!
    redirect_to decisions_completed_path(@application), notice: 'Application completed'
  end

  # GET /decisions/:id/completed
  def completed

  end

  private
    # Sets the application object for action that need it.
    def set_application
      @application = Application.find params[:id]
    end

    def check_allowed
      @application.all_rejected? and user_not_authorized
    end
end