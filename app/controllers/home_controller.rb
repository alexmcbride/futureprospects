class HomeController < ApplicationController
  # GET /home
  def index
    @categories = Category.order(:name).all

    respond_to do |format|
      # Show home page depending on whether the user is signed in or not
      if student_signed_in?
        @application = current_student.current_application
        format.html { render :index_student }
      elsif staff_signed_in?
        format.html { render :index_staff }
      else
        format.html { render :index }
      end
    end
  end
end
