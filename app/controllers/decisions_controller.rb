class DecisionsController < ApplicationController
  before_action :set_application, only: [:index]

  # GET /decisions/:id
  def index
  end

  # GET /decisions/:id/firm
  def firm
  end

  private
    # Sets the application object for action that need it.
    def set_application
      @application = Application.find params[:id]
    end
end