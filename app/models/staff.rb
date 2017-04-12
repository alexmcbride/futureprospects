class Staff < User
  rolify

  # Validators
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true

  # Foreign keys
  belongs_to :college
end
