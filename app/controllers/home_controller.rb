class HomeController < ApplicationController
  # GET /home
  def index
    @categories = Category.all
    @application = current_student.current_application if student_signed_in?
  end
end
