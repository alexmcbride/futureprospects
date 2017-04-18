class Staff < User
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true

  belongs_to :college

  rolify

  def self.create_staff(params)
    staff = Staff.new params
    # We need to add a password to create a user
    # So just get Devise to generate a random one.
    password = Devise.friendly_token.first 8
    staff.password = password
    staff.password_confirmation = password
    staff
  end

  def after_confirmation
    # After account confirmed, staff member needs to change their password.
      self.send_reset_password_instructions
  end
end
