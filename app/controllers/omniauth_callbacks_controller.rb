# Devise Omniauth Callbacks - for open auth providers. Open authentication providers redirect to this controller, where
# we register/sign in the student as necessary.
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # GET /students/auth/google_oauth2/callback
  #
  # Action called by Google open auth when redirecting back to the site.
  def google_oauth2
    handle_oauth
  end

  # GET /students/auth/facebook/callback
  #
  # Action called by Facebook open auth when redirecting back to the site.
  def facebook
    handle_oauth
  end

  # GET /students/oauth/new
  #
  # Action to display oauth sign-up form, although signing up with oauth we still need some info from the student.
  def new
    @student = Student.new_from_oauth session['devise.oauth_data']
  end

  # POST /students/oauth/new
  #
  # Post action for oauth signup form.
  def create
    @student = Student.create_from_oauth session['devise.oauth_data'], student_params
    if @student.save
      sign_in_and_redirect @student, :event => :authentication
    else
      render :new
    end
  end

  private
    # Handles the oauth callback. We check to see if a student for that oauth provider exists, if so we sign them in.
    # Otherwise we show the new student form in order to gain some more info we need.
    def handle_oauth
      data = request.env['omniauth.auth']
      puts "DATA: #{data['info'].inspect}"
      # Try find student for provider, if found authenticate normally otherwise redirect to oauth signup page.
      @student = Student.find_open_auth(data.provider, data.uid).first
      if @student && @student.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', :kind => 'Google'
        sign_in_and_redirect @student, :event => :authentication
      else
        # Store auth data in session (remove extra to stop cookie overflow). We mark this with 'devise' so it gets
        # #automatically cleaned up.
        session['devise.oauth_data'] = data.except(:extra)
        redirect_to new_student_oauth_path, alert: (@student.errors.full_messages.join("\n") if @student)
      end
    end

    # Sanitize sign up form.
    def student_params
      params.require(:student).permit(:first_name, :family_name, :scottish_candidate_number, :national_insurance_number)
    end
end
