class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Add sanitised parameters for devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # Configures allowed parameters for Devise.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :family_name, :scottish_candidate_number, :national_insurance_number])
    end

    # Throws a not found exception, displaying the 404 page
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    # Redirects unauthorized users back from whence they came.
    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to(request.referrer || root_path)
    end

    # Gets the currently signed in user.
    def current_user
      current_student or current_staff
    end
end
