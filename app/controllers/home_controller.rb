# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Controller class to manage home page.
class HomeController < ApplicationController
  # GET /
  #
  # Displays the site home page, which varies depending on whether the user is signed out, or signed in and a student or a staff member.
  def index
    @categories = Category.where('courses_count>0').order(:name)
    respond_to do |format|
      # Show home page depending on whether the user is signed in or not
      if student_signed_in?
        @application = current_student.current_application
        format.html { render :student_index }
      elsif staff_signed_in?
        @applications = policy_scope(Application).awaiting.current.includes(:student).limit(10)
        format.html { render :staff_index }
      else
        format.html { render :index }
      end
    end
  end
end
