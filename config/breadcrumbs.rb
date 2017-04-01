# Breadcrumb menus for Gretel gem

# root
crumb :root do
  link 'Home', root_path
end

# courses
crumb :courses do |category|
  parent :root
  link 'Courses', courses_path
  unless category.nil?
    link category.name, courses_category_path(category)
  end
end

# courses/:id
crumb :course do |course|
  parent :root
  parent :courses, course.category
  link course.title, course
end

# colleges
crumb :colleges do
  parent :root
  link 'Colleges', colleges_path
end

# colleges/:id
crumb :college do |college|
  parent :colleges
  link college.name, college_path(college)
end
