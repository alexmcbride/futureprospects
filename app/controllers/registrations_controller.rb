# Custom version of Devise's RegistrationsController to add reCAPTCHA support and custom parameters.
class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  # Overrides Devise create method to inject captcha verification.
  def create
    if verify_recaptcha
      # If verified then init devise create method as if nothing happened...
      super
    else
      # This seems to work...
      self.resource = resource_class.new sign_up_params
      respond_with_navigational(resource) { render :new }
    end
  end

  private
    # Configures allowed parameters for Devise.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :family_name, :scottish_candidate_number,
                                                         :national_insurance_number])
    end
end