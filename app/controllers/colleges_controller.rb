class CollegesController < ApplicationController
  # GET /colleges
  def index
    @colleges = College.all
  end

  def show
    @colleges = College.all
    @college = College.find params[:id]
  end
end
