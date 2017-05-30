# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Controller class to display colleges.
class CollegesController < ApplicationController
  # GET /colleges
  #
  # Displays a list of colleges.
  def index
    @colleges = College.order(:name)
  end

  # GET /colleges/:id/
  #
  # Displays a specific college.
  def show
    @colleges = College.order(:name)
    @college = College.find params[:id]
  end
end
