class CoursesGrid
  include Datagrid

  filter :college_id, :integer, multiple: true

  scope do
    Course.includes(:category)
  end

  column(:title)
  column(:category) do |course|
    course.category.name
  end
  column(:status)
end