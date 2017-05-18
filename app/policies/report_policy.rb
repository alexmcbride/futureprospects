class ReportPolicy < Struct.new(:user, :report)
  def index?
    user.has_role?(:site_admin) || user.has_role?(:can_view_reports)
  end

  def courses?
    index?
  end

  def course?
    index?
  end

  def colleges?
    index?
  end

  def college?
    index?
  end
end