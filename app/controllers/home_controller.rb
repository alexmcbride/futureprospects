class HomeController < ApplicationController
  # GET /home
  def index
    @categories = Category.all
    @application = current_student.current_application if student_signed_in?

    respond_to do |format|
      if student_signed_in?
        format.html { render :index_student }
      else
        format.html { render :index }
      end
    end
  end
end
