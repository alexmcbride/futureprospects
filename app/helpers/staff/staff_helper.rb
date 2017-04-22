module Staff::StaffHelper
  # Gets combined college name and job title
  def college_and_job
    if current_staff.has_role? :site_admin
      'Site Admin'
    else
      "#{current_staff.college.name} &mdash; #{current_staff.job_title}".html_safe
    end
  end
end