roles = Role.all

def add_roles(roles, staff)
  roles.each do |role|
    staff.add_role(role.name)
  end
end

admin = Staff.create! first_name: 'Admin', family_name: 'McAdmin', email: 'admin@admin.com', job_title: 'Admin', college_id: 1, password: 'admin1', password_confirmation: 'admin1', confirmed_at: DateTime.now
add_roles roles, admin

staff = Staff.create! first_name: 'Bonnie', family_name: 'Snyder', email: 'bsnyder0@hc360.com', job_title: 'Compensation Analyst', college_id: 1, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(2), staff
staff = Staff.create! first_name: 'Albert', family_name: 'Stephens', email: 'astephens1@shutterfly.com', job_title: 'Assistant Professor', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(3), staff
staff = Staff.create! first_name: 'Michelle', family_name: 'Woods', email: 'mwoods2@techcrunch.com', job_title: 'Help Desk Technician', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(4), staff
staff = Staff.create! first_name: 'Timothy', family_name: 'Hill', email: 'thill3@ameblo.jp', job_title: 'VP Sales', college_id: 3, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(1), staff
staff = Staff.create! first_name: 'Clarence', family_name: 'Rodriguez', email: 'crodriguez4@cafepress.com', job_title: 'Food Chemist', college_id: 1, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(5), staff
staff = Staff.create! first_name: 'Arthur', family_name: 'Morales', email: 'amorales5@domainmarket.com', job_title: 'Research Nurse', college_id: 3, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(3), staff
staff = Staff.create! first_name: 'Maria', family_name: 'Gordon', email: 'mgordon6@lycos.com', job_title: 'Speech Pathologist', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(3), staff
staff = Staff.create! first_name: 'Steven', family_name: 'Nelson', email: 'snelson7@rakuten.co.jp', job_title: 'Budget/Accounting Analyst I', college_id: 1, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(2), staff
staff = Staff.create! first_name: 'Dennis', family_name: 'Turner', email: 'dturner8@hhs.gov', job_title: 'Senior Quality Engineer', college_id: 3, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(4), staff
staff = Staff.create! first_name: 'Arthur', family_name: 'Anderson', email: 'aanderson9@theglobeandmail.com', job_title: 'Statistician III', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(5), staff
staff = Staff.create! first_name: 'Jose', family_name: 'Owens', email: 'jowensa@ed.gov', job_title: 'Assistant Professor', college_id: 3, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(1), staff
staff = Staff.create! first_name: 'Deborah', family_name: 'Foster', email: 'dfosterb@archive.org', job_title: 'Business Systems Analyst', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(3), staff
staff = Staff.create! first_name: 'Sara', family_name: 'Hunt', email: 'shuntc@google.com.hk', job_title: 'VP Sales', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(2), staff
staff = Staff.create! first_name: 'Angela', family_name: 'Owens', email: 'aowensd@dedecms.com', job_title: 'Staff Scientist', college_id: 1, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(3), staff
staff = Staff.create! first_name: 'Nicholas', family_name: 'Brooks', email: 'nbrookse@1und1.de', job_title: 'Data Coordiator', college_id: 3, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(4), staff
staff = Staff.create! first_name: 'Amy', family_name: 'Thompson', email: 'athompsonf@ameblo.jp', job_title: 'Analog Circuit Design manager', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(2), staff
staff = Staff.create! first_name: 'Victor', family_name: 'Owens', email: 'vowensg@icio.us', job_title: 'Clinical Specialist', college_id: 1, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(5), staff
staff = Staff.create! first_name: 'Bonnie', family_name: 'Ray', email: 'brayh@phoca.cz', job_title: 'Nuclear Power Engineer', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(4), staff
staff = Staff.create! first_name: 'Eric', family_name: 'Wright', email: 'ewrighti@facebook.com', job_title: 'Senior Financial Analyst', college_id: 2, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(3), staff
staff = Staff.create! first_name: 'Marilyn', family_name: 'Payne', email: 'mpaynej@ifeng.com', job_title: 'General Manager', college_id: 1, password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
add_roles roles.sample(3), staff

