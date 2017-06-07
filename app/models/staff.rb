# * Name: Alex McBride
# * Date: 25/05/2017
# * Project: Future Prospects
# * Model class to represent a staff member. Inherits from User and uses Single-Table Inheritance.
class Staff < User
  validates :job_title, presence: true, length: {maximum: 35}
  validates :college_id, presence: true, unless: :is_admin?

  # @!attribute college
  #   @return [College]
  #   The staff member's parent college.
  belongs_to :college

  # The number of staff members to display per page when paginated.
  self.per_page = 15

  # Finds all of the job titles for the college the staff member belongs to.
  #
  # @return [Array<String>]
  def college_job_titles
    Staff.where(college_id: self.college_id).select(:job_title).distinct
  end

  # Finds all staff member job titles across all colleges.
  #
  # @return [Array<String>]
  def self.all_job_titles
    Staff.select(:job_title).distinct
  end

  # Changes a staff member's roles to those specified.
  #
  # @param new_roles [Array<Symbol>] the new roles for the staff member
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

  # Promotes a user to admin by adding a +:site_admin+ flag to their roles.
  def promote_admin
    self.add_role :site_admin
  end

  # Demotes a user from admin by removing the +:site_admin+ flag from their roles.
  def demote_admin
    self.remove_role :site_admin
  end

  # Filter staff list based on parameters (+:full_name+, +:college+, and +:job_title+).
  #
  # @param params [Hash] the request params containing filter data.
  # @return [Array<Staff>]
  def self.filter(params)
    staff = Staff.all
    if params[:full_name].present?
      sql = 'LOWER(first_name) LIKE :term OR LOWER(family_name) LIKE :term OR LOWER(username) LIKE :term'
      staff = staff.where(sql, {term: "%#{params[:full_name].downcase}%"})
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
    # @return [Boolean] true if they are an admin.
    def is_admin?
      has_role? :site_admin
    end
end
