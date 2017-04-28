# Custom version of Devise's RegistrationsController to add reCAPTCHA support and custom parameters.
class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Only check when creating new student.
  before_action :configure_permitted_parameters

  private
    # Configures allowed parameters for Devise.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :family_name, :scottish_candidate_number,
                                                         :national_insurance_number])
    end

    # Check that the captcha has been verified.
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
      end
    end
end