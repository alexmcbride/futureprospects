class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    data = request.env['omniauth.auth']

    @student = Student.where(provider: data.provider, uid: data.uid).first
    if @student && @student.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', :kind => 'Google'
      sign_in_and_redirect @student, :event => :authentication
    else
      # Store auth data in session (remove extra to stop cookie overflow). We mark this with 'devise' so it gets automatically cleaned up.
      session['devise.google_data'] = data.except(:extra)
      redirect_to new_student_oauth_path, alert: (@student.errors.full_messages.join("\n") if @student)
    end
  end

  def new
    data = session['devise.google_data']
    puts data.inspect
    @student = Student.new
    @student.email = data['info']['email']
    @student.first_name = data['info']['first_name']
    @student.family_name = data['info']['last_name']
  end

  def create
    data = session['devise.google_data']
    @student = Student.new student_params
    @student.provider = data['provider']
    @student.uid = data['uid']
    @student.email = data['info']['email']
    @student.password_confirmation = @student.password = Devise.friendly_token[0,20]
    @student.skip_confirmation!

    if @student.save
      sign_in_and_redirect @student, :event => :authentication
    else
      render :new
    end
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :family_name, :scottish_candidate_number, :national_insurance_number)
  end
end
