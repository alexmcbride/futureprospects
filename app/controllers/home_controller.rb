class HomeController < ApplicationController
  # GET /
  #
  # Displays home page depending on what the user is logged in as.
  def index
    @categories = Category.where('courses_count>0').order(:name)
    respond_to do |format|
      # Show home page depending on whether the user is signed in or not
      if student_signed_in?
        @application = current_student.current_application
        format.html { render :student_index }
      elsif staff_signed_in?
        @applications = policy_scope(Application.awaiting).includes(:student)
        format.html { render :staff_index }
      else
        format.html { render :index }
      end
    end
  end
end
