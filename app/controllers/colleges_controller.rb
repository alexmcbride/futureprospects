class CollegesController < ApplicationController
  # GET /colleges
  # GET /colleges.json
  def index
    # If not college selected then select the first one available
    if params[:id].nil?
      @college = College.first
    else
      @college = College.find params[:id]
    end
    @colleges = College.all
  end
end
