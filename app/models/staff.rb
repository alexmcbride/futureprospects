class Staff < User
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true

  belongs_to :college

  # Gets all of the job titles at the specified college
  def self.job_titles(college_id)
    Staff.where(college_id: college_id).select(:job_title).distinct
  end

  def self.all_job_titles
    Staff.select(:job_title).distinct
  end
end
