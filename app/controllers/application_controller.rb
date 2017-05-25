# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# * Base controller that all controllers inherit from.
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  helper_method :payment_redirect_path

  # Helper method to use when redirecting to take a payment.
  #
  # @param return_path [String] the path to return to once the payment is complete.
  # @return [String] the path to redirect to for the payment to be processed.
  def payment_redirect_path(return_path)
    session[:payment_redirect] = return_path
    payment_method_path
  end

  protected
    # Throws a not found exception, displaying the 404 error page.
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
    #
    # @return [User]
    def current_user
      current_student or current_staff
    end
end
