class Staff < User
  # Include rolify, for handling roles
  rolify

  # Validators
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true
  validates :job_title, presence: true

  # Foreign keys
  belongs_to :college
end
