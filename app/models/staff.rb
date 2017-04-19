class Staff < User
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true

  belongs_to :college

  rolify
end
