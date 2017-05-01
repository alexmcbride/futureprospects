# Base controller that all controllers inherit from.
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
    # Throws a not found exception, displaying the 404 page
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    # Redirects unauthorized users back from whence they came.
    def user_not_authorized
      message = 'You are not authorized to perform this action.'
      flash[:alert] = message
      redirect_to(request.referrer || root_path)
    end

    # Gets the currently signed in user.
    def current_user
      current_student or current_staff
    end
end
