# Class to represent reports headless policy. Reports are also governed by normal show policies, contained in the
# +CoursePolicy+ and +CollegePolicy+ classes. The combined policies are used to determine if the report can be viewed
# or downloaded.
class ReportPolicy < Struct.new(:user, :report)
  # Whether the report can be viewed.
  #
  # @return [Boolean]
  def view?
    user.has_role?(:site_admin) || user.has_role?(:can_view_reports)
  end

  # Whether the report can be downloaded.
  #
  # @return [Boolean]
  def download?
    user.has_role?(:site_admin) || user.has_role?(:can_download_reports)
  end
end