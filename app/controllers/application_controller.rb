class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  # Add sanitised parameters for devise
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

    def authenticate_staff_role! role
      authenticate_staff!
      if staff_signed_in? and not current_staff.has_role? role
        user_not_authorized
      end
    end
end
