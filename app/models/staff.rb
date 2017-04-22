class Staff < User
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: false

  belongs_to :college

  self.per_page = 15

  # Gets all of the job titles for the college the staff member belongs to.
  def college_job_titles
    Staff.where(college_id: self.college_id).select(:job_title).distinct
  end

  # Gets all staff job titles.
  def self.all_job_titles
    Staff.select(:job_title).distinct
  end

  # Changed a staff member's roles.
  def change_roles(new_roles)
    old_roles = self.roles.map {|r| r.name.to_s}

    # Add any new role and remove from old ones
    new_roles.each do |role|
      unless old_roles.include? role
        self.add_role role
      end
      old_roles.delete role
    end

    # Remove any old roles from the user.
    old_roles.each {|r| self.remove_role r }
  end

  # Promote user to admin.
  def promote_admin
    self.add_role :site_admin
  end

  # Demote user from admin
  def demote_admin
    self.remove_role :site_admin
  end

  # Filter staff list based on parameters
  def self.filter(params)
    staff = Staff.all
    if params[:full_name].present?
      sql = 'LOWER(first_name) LIKE :term OR LOWER(family_name) LIKE :term OR LOWER(username) LIKE :term'
      staff = staff.where(sql, {term: "%#{params[:full_name.downcase]}%"})
    end
    if params[:college].present? and params[:college] != '0'
      staff = staff.where(college_id: params[:college])
    end
    if params[:job_title].present? and params[:job_title] != 'all'
      staff = staff.where(job_title: params[:job_title])
    end
    staff
  end
end
