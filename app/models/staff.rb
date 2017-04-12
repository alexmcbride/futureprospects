class Staff < User
  rolify

  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true

  belongs_to :college
  before_create :before_staff_create

  # Automatically confirm staff email.
  def before_staff_create
    self.confirmed_at = DateTime.now
  end
end
