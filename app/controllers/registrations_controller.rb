# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Controller class that's a custom version of +Devise::RegistrationsController+, which allows the addition of
# reCAPTCHA support and also custom parameter sanitisation.
class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  # Overrides Devise's +create+ method called when creating a new student, in order to inject captcha verification.
  def create
    if verify_recaptcha
      # If verified then init devise create method as if nothing happened...
      super
    else
      # Otherwise send the student back to the new registration form.
      self.resource = resource_class.new sign_up_params
      respond_with_navigational(resource) { render :new }
    end
  end

  private
    # Configures allowed parameters for Devise.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :family_name, :scottish_candidate_number,
                                                         :national_insurance_number, :confirmed_at])
    end
end