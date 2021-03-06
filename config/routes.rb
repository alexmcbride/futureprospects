Rails.application.routes.draw do
  # Payments
  get 'payments/payment_method', to: 'payments#payment_method', as: 'payment_method'
  post 'payments/payment_method/continue', to: 'payments#payment_method_continue', as: 'payment_method_continue'
  resources :payments

  # Devise authentication
  devise_for :staff, :skip => [:registrations] # Skip staff sign-up
  devise_scope :staff do
    # We skip registrations to stop staff sign up, but we still need to enable staff profile editing
    get 'staff/edit', to: 'devise/registrations#edit', as: 'edit_staff_registration'
    put 'staff', to: 'devise/registrations#update', as: 'staff_registration'
  end
  devise_for :students, controllers: { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks'}
  devise_scope :student do
    get 'students/oauth/new', to: 'omniauth_callbacks#new', as: 'new_student_oauth'
    post 'students/oauth/new', to: 'omniauth_callbacks#create', as: 'create_student_oauth'
  end

  namespace :staff do
    # Courses
    get 'courses/:id/remove', to: 'courses#remove', as: 'course_remove'
    resources :courses

    # Categories
    get 'categories/:id/remove', to: 'categories#remove', as: 'category_remove'
    resources :categories

    # Colleges
    get 'colleges/:id/clearance', to: 'colleges#clearance', as: 'college_clearance'
    post 'colleges/:id/clearance', to: 'colleges#clearance_update', as: 'college_clearance_update'
    get 'colleges/:id/remove', to: 'colleges#remove', as: 'college_remove'
    resources :colleges

    # Members
    get 'members/:id/permissions', to: 'members#permissions', as: 'member_permissions'
    post 'members/:id/permissions', to: 'members#permissions_update', as: 'member_permissions_update'
    post 'members/:id/promote_admin', to: 'members#promote_admin', as: 'member_promote_admin'
    post 'members/:id/demote_admin', to: 'members#demote_admin', as: 'member_demote_admin'
    get 'members/:id/remove', to: 'members#remove', as: 'member_remove'
    resources :members

    get 'students/:id/remove', to: 'students#remove', as: 'student_remove'
    get 'students/search', to: 'students#search', as: 'students_search'
    resources :students

    # Applications
    get 'applications/:id/full', to: 'applications#full', as: 'application_full'
    resources :applications

    # Reports
    get 'reports', to: 'reports#index', as: 'reports'
    get 'reports/colleges/:id', to: 'reports#college', as: 'reports_college'
    get 'reports/colleges/:id/show', to: 'reports#show_college', as: 'reports_show_college'
    get 'reports/courses/:id/show', to: 'reports#show_course', as: 'reports_show_course'

    # Reports Json Routes
    get 'reports/courses/:id/course_applications_by_week', to: 'reports#course_applications_by_week', as: 'reports_course_applications_by_week'
    get 'reports/courses/:id/course_offers', to: 'reports#course_offers', as: 'reports_course_offers'
    get 'reports/courses/:id/course_replies', to: 'reports#course_replies', as: 'reports_course_replies'
    get 'reports/courses/:id/course_schools', to: 'reports#course_schools', as: 'reports_course_schools'
    get 'reports/courses/:id/course_ages', to: 'reports#course_ages', as: 'reports_course_ages'
    get 'reports/courses/:id/course_genders', to: 'reports#course_genders', as: 'reports_course_genders'
    get 'reports/colleges/:id/course_applicants', to: 'reports#college_course_applicants', as: 'reports_college_course_applicants'
    get 'reports/colleges/:id/categories', to: 'reports#college_categories', as: 'reports_college_categories'
    get 'reports/colleges/:id/offers', to: 'reports#college_offers', as: 'reports_college_offers'
    get 'reports/colleges/:id/choices', to: 'reports#college_choices', as: 'reports_college_choices'
    get 'reports/colleges/:id/genders', to: 'reports#college_genders', as: 'reports_college_genders'
    get 'reports/colleges/:id/ages', to: 'reports#college_ages', as: 'reports_college_ages'
    get 'reports/colleges/:id/schools', to: 'reports#college_schools', as: 'reports_college_schools'
    get 'reports/colleges/:id/applications_by_week', to: 'reports#college_applications_by_week', as: 'reports_college_applications_by_week'

  end

  # Application routes
  post 'applications', to: 'new_applications#create', as: 'applications_create'
  get 'applications', to: 'new_applications#index', as: 'applications'
  get 'applications/continue', to: 'new_applications#continue', as: 'applications_continue'
  get 'applications/intro', to: 'new_applications#intro', as: 'applications_intro'

  get 'applications/profile', to: 'new_applications#profile', as: 'applications_profile'
  post 'applications/profile', to: 'new_applications#profile_next', as: 'applications_profile_next'

  get 'applications/education', to: 'new_applications#education', as: 'applications_education'
  post 'applications/education', to: 'new_applications#education_add', as: 'applications_education_add'
  delete 'applications/education/:id', to: 'new_applications#education_remove', as: 'applications_education_remove'
  post 'applications/education/next', to: 'new_applications#education_next', as: 'applications_education_next'
  get 'applications/education/:id/edit/', to: 'new_applications#education_edit', as: 'applications_education_edit'
  patch 'applications/education/:id', to: 'new_applications#education_update', as: 'applications_education_update'
  get 'applications/education/search', to: 'new_applications#education_search', as: 'applications_education_search'

  get 'applications/qualifications/:id', to: 'new_applications#qualifications', as: 'applications_qualifications'
  post 'applications/qualifications/:id', to: 'new_applications#qualifications_add', as: 'applications_qualifications_add'
  delete 'applications/qualifications/:id', to: 'new_applications#qualifications_remove', as: 'applications_qualifications_remove'

  get 'applications/employment', to: 'new_applications#employment', as: 'applications_employment'
  post 'applications/employment', to: 'new_applications#employment_add', as: 'applications_employment_add'
  delete 'applications/employment/:id', to: 'new_applications#employment_remove', as: 'applications_employment_remove'
  post 'applications/employment/next', to: 'new_applications#employment_next', as: 'applications_employment_next'
  get 'applications/employment/:id/edit', to: 'new_applications#employment_edit', as: 'applications_employment_edit'
  patch 'applications/employment/:id', to: 'new_applications#employment_update', as: 'applications_employment_update'
  get 'applications/employment/search', to: 'new_applications#employment_search', as: 'applications_employment_search'

  get 'applications/references', to: 'new_applications#references', as: 'applications_references'
  post 'applications/references', to: 'new_applications#references_next', as: 'applications_references_next'

  get 'applications/statement', to: 'new_applications#statement', as: 'applications_statement'
  post 'applications/statement', to: 'new_applications#statement_next', as: 'applications_statement_next'

  get 'applications/courses', to: 'new_applications#courses', as: 'applications_courses'
  post 'applications/courses', to: 'new_applications#courses_add', as: 'applications_courses_add'
  delete 'applications/courses/:id', to: 'new_applications#courses_remove', as: 'applications_courses_remove'
  post 'applications/courses/next', to: 'new_applications#courses_next', as: 'applications_courses_next'

  get 'applications/submit', to: 'new_applications#submit', as: 'applications_submit'
  post 'applications/submit', to: 'new_applications#submit_next', as: 'applications_submit_next'
  get 'applications/completed', to: 'new_applications#completed', as: 'applications_completed'
  get 'applications/:id', to: 'new_applications#show', as: 'application'
  post 'applications/clearance', to: 'new_applications#clearance', as: 'applications_clearance'

  # Courses
  get 'courses/search', to: 'courses#search', as: 'courses_search'
  # get 'courses/category/:id', to: 'courses#category', as: 'courses_category'
  resources :courses

  # Clearance
  post 'clearance/:id/create', to: 'clearance#create', as: 'create_clearance'
  get 'clearance/:id/new', to: 'clearance#new', as: 'new_clearance'
  get 'clearance/:id', to: 'clearance#show', as: 'clearance_show'
  get 'clearance', to: 'clearance#index'

  # Colleges
  resources :colleges

  # Decisions
  get 'decisions', to: 'decisions#index', as: 'decisions'
  get 'decisions/firm', to: 'decisions#firm', as: 'decisions_firm'
  post 'decisions/firm', to: 'decisions#firm_post', as: 'decisions_firm_post'
  get 'decisions/insurance', to: 'decisions#insurance', as: 'decisions_insurance'
  post 'decisions/insurance', to: 'decisions#insurance_post', as: 'decisions_insurance_post'
  post 'decisions/decline', to: 'decisions#decline', as: 'decisions_decline'
  get 'decisions/review', to: 'decisions#review', as: 'decisions_review'
  post 'decisions/review', to: 'decisions#review_post', as: 'decisions_review_post'
  get 'decisions/completed', to: 'decisions#completed', as: 'decisions_completed'

  # Root
  get 'home/index'
  root to: 'home#index'
end




