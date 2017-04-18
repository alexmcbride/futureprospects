class Staff < User
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true

  belongs_to :college

  rolify

  # Creates a new user from params with a generated password
  def self.create_staff(params)
    staff = Staff.new params
    # The generated password is not used, the staff member is made to create a new one before they can sign in, but
    # devise expects there to be a password so we just generate a random one here to make life easier.
    password = User.generate_password
    staff.password = password
    staff.password_confirmation = password
    staff
  end

  # After account confirmed, staff member needs to change their password.
  def after_confirmation
      self.send_reset_password_instructions
  end
end
