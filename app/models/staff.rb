# Model class to represent a staff member. Inherits from User and uses Single-Table Inheritance.
class Staff < User
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true, unless: :is_admin?

  belongs_to :college

  # The number of staff members to display per page when paginated.
  self.per_page = 15

  # Finds all of the job titles for the college the staff member belongs to.
  #
  # Returns an ActiveRecord::Relation containing all of the job_titles at this staff member's college.
  def college_job_titles
    Staff.where(college_id: self.college_id).select(:job_title).distinct
  end

  # Finds all staff job titles of staff members at all colleges.
  #
  # Returns an ActiveRecord::Relation containing all of the job_titles at the colleges.
  def self.all_job_titles
    Staff.select(:job_title).distinct
  end

  # Changes a staff member's roles.
  #
  # * +new_roles+ - the new roles for the staff member
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

  # Promotes a user to admin by adding a :site_admin flag to their roles.
  def promote_admin
    self.add_role :site_admin
  end

  # Demotes a user from admin by removing the :site_admin flag from their roles.
  def demote_admin
    self.remove_role :site_admin
  end

  # Filter staff list based on parameters (:full_name, :college, and :job_title).
  #
  # * +params+ - the request params containing filter data.
  #
  # Returns An ActiveRecord::Relation contaning the results of the filtering operation.
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

  private
    # Determines if the staff member is an admin.
    #
    # Returns true if they are an admin.
    def is_admin?
      self.email == 'admin@admin.com'
    end
end
