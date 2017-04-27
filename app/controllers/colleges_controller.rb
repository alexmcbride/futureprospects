class CollegesController < ApplicationController
  # GET /colleges
  #
  # Displays list of colleges.
  def index
    @colleges = College.order(:name)
  end

  # GET /colleges/:id/
  #
  # Displays specific college.
  def show
    @colleges = College.order(:name)
    @college = College.find params[:id]
  end
end
