class CollegesController < ApplicationController
  # GET /colleges
  def index
    @colleges = College.order(:name)
  end

  def show
    @colleges = College.order(:name)
    @college = College.find params[:id]
  end
end
