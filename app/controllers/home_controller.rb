class HomeController < ApplicationController
  # GET /home
  def index
    @categories = Category.all
  end
end
