# * Name: Alex McBride
# * Date: 24/05/2017
# * Project: Future Prospects
# Module to define HTML helpers for the staff section.
module Staff::StaffHelper
  # Gets combined college name and job title
  #
  # @return [String] the combined college and job title.
  def college_and_job
    if current_staff.has_role? :site_admin
      'Site Admin'
    else
      "#{current_staff.job_title}, #{current_staff.college.name}"
    end
  end
end