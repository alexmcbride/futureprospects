class CollegesController < ApplicationController
  # GET /colleges
  def index
    # If no college selected then select the first one available
    if params[:id].nil?
      @college = College.first
    else
      @college = College.find params[:id]
    end
    @colleges = College.all
  end
end
