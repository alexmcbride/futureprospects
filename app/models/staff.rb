class Staff < User
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: false

  belongs_to :college

  # Gets all of the job titles for the college the staff member belongs to.
  def college_job_titles
    Staff.where(college_id: self.college_id).select(:job_title).distinct
  end

  # Gets all staff job titles.
  def self.all_job_titles
    Staff.select(:job_title).distinct
  end

  # Gets the combined college name and job title of the staff member.
  def college_and_job
    if self.college.present?
      "#{self.college.name} - #{self.job_title}"
    else
      'Site Admin'
    end
  end

  # Changed a staff member's roles.
  def change_roles(new_roles)
    old_roles = self.roles.map {|r| r.name.to_s}

    # add
    new_roles.each do |role|
      unless old_roles.include? role
        self.add_role role
      end
      old_roles.delete role
    end

    old_roles.each {|r| self.remove_role r }
    new_roles
  end

  def promote_admin
    self.add_role :site_admin
  end

  def demote_admin
    self.remove_role :site_admin
  end
end
