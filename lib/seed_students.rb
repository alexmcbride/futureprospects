student = Student.new
student.first_name = 'Mary'
student.family_name = 'Morrison'
student.email = 'vmorrison0@merriam-webster.com'
student.scottish_candidate_number = '171583268'
student.national_insurance_number = 'NJ336807A'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Mrs'
app.middle_name = 'Virginia'
app.gender = :female
app.telephone = '44-(435)280-3879'
app.mobile = '44-(889)134-2200'
app.email = 'vmorrison0@merriam-webster.com'
app.personal_statement = 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
app.permanent_house_number = '5'
app.permanent_address_1 = 'Sachs Way'
app.permanent_address_2 = 'Twyford'
app.permanent_postcode = 'LE14 2GR'
app.permanent_country = 'United Kingdom'
app.correspondence_house_number = '6'
app.correspondence_address_1 = 'Stang Park'
app.correspondence_address_2 = 'Mrs'
app.correspondence_postcode = 'OX7 2GR'
app.correspondence_country = 'United Kingdom'
app.status = :submitting
app.current_stage = :profile_stage
app.save! validate: false

school = School.new application: app
school.name = 'Falmouth University'
school.address_1 = '6 Loftsgordon Plaza'
school.address_2 = 'Denton'
school.country = 'United Kingdom'
school.postcode = 'M34 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Oxford Brookes University'
school.address_1 = '291 Northland Parkway'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'SW1E 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Cogibox'
job.address_1 = '0 Clyde Gallagher Place'
job.address_2 = 'London'
job.postcode = 'SW1E'
job.country = 'United Kingdom'
job.job_title = 'Social Worker'
job.duties = 'De-engineered intermediate model'
job.start_date = Date.parse('2012-07-02')
job.end_date = Date.parse('2015-03-14')
job.save! validate: false

job = Job.new application: app
job.employer = 'Meemm'
job.address_1 = '0 Claremont Terrace'
job.address_2 = 'Milton'
job.postcode = 'AB56'
job.country = 'United Kingdom'
job.job_title = 'Structural Engineer'
job.duties = 'Future-proofed tangible synergy'
job.start_date = Date.parse('2011-06-14')
job.end_date = Date.parse('2013-04-16')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Edward George'
ref.reference_1_email = 'egeorge0@hao123.com'
ref.reference_1_occupation = 'Executive Secretary'
ref.reference_1_address_1 = '98 Lukken '
ref.reference_1_address_2 = 'Belfast'
ref.reference_1_postcode = 'BT2 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'Face to face'
ref.reference_1_telephone = '44-(487)436-7779'
ref.reference_2_full_name = 'Stephen Lane'
ref.reference_2_email = 'slane1@whitehouse.gov'
ref.reference_2_occupation = 'Information Systems Manager'
ref.reference_2_address_1 = '6 8th '
ref.reference_2_address_2 = 'Leeds'
ref.reference_2_postcode = 'LS6 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Adaptive'
ref.reference_2_telephone = '44-(500)939-8365'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 97
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 101
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 36
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 132
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 65
course.save! validate: false

Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Mary Morrison', created_at: '2016-12-18T10:13:56+01:00', updated_at: '2016-12-18T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Mary Morrison', last_four_digits: '0004', created_at: '2016-11-01T10:13:56+01:00', updated_at: '2016-11-01T10:13:56+01:00'


student = Student.new
student.first_name = 'Brian'
student.family_name = 'Owens'
student.email = 'jowens1@altervista.org'
student.scottish_candidate_number = '172823785'
student.national_insurance_number = 'NJ425827B'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Dr'
app.middle_name = 'Joseph'
app.gender = :male
app.telephone = '44-(792)155-0445'
app.mobile = '44-(906)773-4423'
app.email = 'jowens1@altervista.org'
app.disability = 'Persistent neutral emulation. Sed ante. Vivamus tortor. Duis mattis egestas metus.'
app.personal_statement = '429'
app.permanent_house_number = '272'
app.permanent_address_1 = 'Service Lane'
app.permanent_postcode = 'LS6 2GR'
app.permanent_country = 'United Kingdom'
app.correspondence_house_number = 'Mcbride'
app.correspondence_address_1 = 'Parkway Leeds'
app.correspondence_address_2 = 'Dr'
app.correspondence_postcode = ' 2GR'
app.correspondence_country = 'SY4'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Open University'
school.address_1 = '3065 Mockingbird Trail'
school.address_2 = 'Upton'
school.country = 'United Kingdom'
school.postcode = 'DN21 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Higher'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'United Medical and Dental Schools'
school.address_1 = '7241 Tennyson Avenue'
school.address_2 = 'Walton'
school.country = 'United Kingdom'
school.postcode = 'CV35 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Jaxnation'
job.address_1 = '9 Fordem Drive'
job.address_2 = 'London'
job.postcode = 'SW1E'
job.country = 'United Kingdom'
job.job_title = 'Help Desk Technician'
job.duties = 'Distributed tertiary analyzer'
job.start_date = Date.parse('2012-03-18')
job.end_date = Date.parse('2016-05-09')
job.save! validate: false

job = Job.new application: app
job.employer = 'Yakijo'
job.address_1 = '865 Ridgeway Place'
job.address_2 = 'Buckland'
job.postcode = 'CT16'
job.country = 'United Kingdom'
job.job_title = 'Software Test Engineer II'
job.duties = 'Synchronised contextually-based framework'
job.start_date = Date.parse('2012-07-21')
job.end_date = Date.parse('2016-03-17')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'David Edwards'
ref.reference_1_email = 'dedwards2@yellowbook.com'
ref.reference_1_occupation = 'Help Desk Operator'
ref.reference_1_address_1 = '0369 Gateway '
ref.reference_1_address_2 = 'London'
ref.reference_1_postcode = 'SW1E 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'artificial intelligence'
ref.reference_1_telephone = '44-(371)486-4628'
ref.reference_2_full_name = 'Gerald Rice'
ref.reference_2_email = 'grice3@latimes.com'
ref.reference_2_occupation = 'Design Engineer'
ref.reference_2_address_1 = '401 Portage '
ref.reference_2_address_2 = 'Whitchurch'
ref.reference_2_postcode = 'BS14 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Compatible'
ref.reference_2_telephone = '44-(323)158-3111'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 22
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 134
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 11
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 143
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 49
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Brian Owens', last_four_digits: '0004', created_at: '2016-12-19T10:13:56+01:00', updated_at: '2016-12-19T10:13:56+01:00'
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :authorized, card_holder: 'Brian Owens', created_at: '2016-12-21T10:13:56+01:00', updated_at: '2016-12-21T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Brian Owens', last_four_digits: '0004', created_at: '2016-11-12T10:13:56+01:00', updated_at: '2016-11-12T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Antonio'
student.family_name = 'Sims'
student.email = 'bsims2@utexas.edu'
student.scottish_candidate_number = '176315873'
student.national_insurance_number = 'NJ559871A'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Honorable'
app.middle_name = 'Brandon'
app.gender = :male
app.telephone = '44-(444)545-1963'
app.mobile = '44-(600)764-3303'
app.email = 'bsims2@utexas.edu'
app.personal_statement = 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio elementum eu interdum eu tincidunt in leo. Maecenas pulvinar lobortis est."'
app.permanent_house_number = '25243'
app.permanent_address_1 = 'Merchant Terrace'
app.permanent_postcode = 'GL54 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'The Robert Gordon University'
school.address_1 = '9657 Chive Center'
school.address_2 = 'Sutton'
school.country = 'United Kingdom'
school.postcode = 'RH5 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Higher'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Courtauld Institute of Art'
school.address_1 = '5411 Badeau Center'
school.address_2 = 'Linton'
school.country = 'United Kingdom'
school.postcode = 'BD23 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Trilith'
job.address_1 = '2087 Gerald Alley'
job.address_2 = 'Newtown'
job.postcode = 'RG20'
job.country = 'United Kingdom'
job.job_title = 'Geological Engineer'
job.duties = 'Vision-oriented secondary framework'
job.start_date = Date.parse('2011-04-12')
job.end_date = Date.parse('2015-06-26')
job.save! validate: false

job = Job.new application: app
job.employer = 'Devpoint'
job.address_1 = '4 Gerald Terrace'
job.address_2 = 'Wirral'
job.postcode = 'CH48'
job.country = 'United Kingdom'
job.job_title = 'Office Assistant I'
job.duties = 'Sharable even-keeled portal'
job.start_date = Date.parse('2012-09-08')
job.end_date = Date.parse('2017-02-22')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Rebecca Chavez'
ref.reference_1_email = 'rchavez4@cbc.ca'
ref.reference_1_occupation = 'Pharmacist'
ref.reference_1_address_1 = '271 Center '
ref.reference_1_address_2 = 'London'
ref.reference_1_postcode = 'WC1B 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'Upgradable'
ref.reference_1_telephone = '44-(115)907-0679'
ref.reference_2_full_name = 'Deborah Cook'
ref.reference_2_email = 'dcook5@sina.com.cn'
ref.reference_2_occupation = 'Business Systems Development Analyst'
ref.reference_2_address_1 = '59377 Manley '
ref.reference_2_address_2 = 'Wootton'
ref.reference_2_postcode = 'NN4 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'background'
ref.reference_2_telephone = '44-(605)194-9501'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 74
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 93
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 140
course.save! validate: false

auth = :payment_failed
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :authorized, card_holder: 'Antonio Sims', created_at: '2017-03-24T10:13:56+01:00', updated_at: '2017-03-24T10:13:56+01:00'
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Antonio Sims', created_at: '2017-02-24T10:13:56+01:00', updated_at: '2017-02-24T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Antonio Sims', last_four_digits: '0004', created_at: '2016-11-24T10:13:56+01:00', updated_at: '2016-11-24T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Beverly'
student.family_name = 'Ferguson'
student.email = 'tferguson3@twitter.com'
student.scottish_candidate_number = '172069444'
student.national_insurance_number = 'NJ451543A'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Honorable'
app.middle_name = 'Tammy'
app.gender = :female
app.telephone = '44-(864)540-5939'
app.mobile = '44-(272)514-0520'
app.email = 'tferguson3@twitter.com'
app.personal_statement = 'In congue. Etiam justo. Etiam pretium iaculis justo.'
app.permanent_house_number = '50'
app.permanent_address_1 = 'Canary Crossing'
app.permanent_postcode = 'BD23 2GR'
app.permanent_country = 'United Kingdom'
app.correspondence_house_number = '5401'
app.correspondence_address_1 = 'Johnson Terrace'
app.correspondence_address_2 = 'Honorable'
app.correspondence_postcode = 'NN11 2GR'
app.correspondence_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Royal College of Music'
school.address_1 = '1 Sunnyside Terrace'
school.address_2 = 'Manchester'
school.country = 'United Kingdom'
school.postcode = 'M14 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'Higher'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Warnborough University'
school.address_1 = '408 Manufacturers Circle'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'WC1B 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'LiveZ'
job.address_1 = '65 Vahlen Point'
job.address_2 = 'Horton'
job.postcode = 'BS37'
job.country = 'United Kingdom'
job.job_title = 'Systems Administrator II'
job.duties = 'Programmable global model'
job.start_date = Date.parse('2010-06-25')
job.end_date = Date.parse('2016-02-01')
job.save! validate: false

job = Job.new application: app
job.employer = 'Fiveclub'
job.address_1 = '811 Tennyson Lane'
job.address_2 = 'London'
job.postcode = 'EC3M'
job.country = 'United Kingdom'
job.job_title = 'Systems Administrator III'
job.duties = 'Enhanced bi-directional knowledge base'
job.start_date = Date.parse('2011-12-25')
job.end_date = Date.parse('2014-09-02')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'William Meyer'
ref.reference_1_email = 'wmeyer6@smugmug.com'
ref.reference_1_occupation = 'Administrative Assistant I'
ref.reference_1_address_1 = '24375 Clyde Gallagher '
ref.reference_1_address_2 = 'Kirkton'
ref.reference_1_postcode = 'KW10 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'Customer-focused'
ref.reference_1_telephone = '44-(440)209-3368'
ref.reference_2_full_name = 'Anna Cook'
ref.reference_2_email = 'acook7@yahoo.com'
ref.reference_2_occupation = 'Geological Engineer'
ref.reference_2_address_1 = '74366 Ridgeway '
ref.reference_2_address_2 = 'London'
ref.reference_2_postcode = 'WC1B 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'User-friendly'
ref.reference_2_telephone = '44-(178)717-3351'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 150
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 79
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 152
course.save! validate: false

auth = :payment_failed
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :authorized, card_holder: 'Beverly Ferguson', created_at: '2017-04-11T10:13:56+01:00', updated_at: '2017-04-11T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Beverly Ferguson', last_four_digits: '0004', created_at: '2016-12-06T10:13:56+01:00', updated_at: '2016-12-06T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Marilyn'
student.family_name = 'Sullivan'
student.email = 'wsullivan4@yellowbook.com'
student.scottish_candidate_number = '178591606'
student.national_insurance_number = 'NJ389054B'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Mr'
app.middle_name = 'Wanda'
app.previous_name = 'Wanda Sullivan'
app.gender = :female
app.telephone = '44-(667)982-7510'
app.mobile = '44-(277)380-2128'
app.email = 'wsullivan4@yellowbook.com'
app.disability = 'Team-oriented modular infrastructure'
app.personal_statement = 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'
app.permanent_house_number = '3516'
app.permanent_address_1 = 'Marcy Place'
app.permanent_postcode = 'TF6 2GR'
app.permanent_country = 'United Kingdom'
app.correspondence_house_number = '28'
app.correspondence_address_1 = 'Chive Terrace'
app.correspondence_address_2 = 'Mr'
app.correspondence_postcode = 'SY4 2GR'
app.correspondence_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'University of Ulster'
school.address_1 = '271 Garrison Junction'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'EC1V 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Standard'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Royal Free Hospital School of Medicine'
school.address_1 = '116 Valley Edge Alley'
school.address_2 = 'Aston'
school.country = 'United Kingdom'
school.postcode = 'TF6 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Standard'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HND'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Quamba'
job.address_1 = '684 Hollow Ridge Place'
job.address_2 = 'Bradford'
job.postcode = 'BD7'
job.country = 'United Kingdom'
job.job_title = 'Assistant Media Planner'
job.duties = 'Front-line analyzing pricing structure'
job.start_date = Date.parse('2010-07-20')
job.end_date = Date.parse('2016-09-24')
job.save! validate: false

job = Job.new application: app
job.employer = 'Jaxworks'
job.address_1 = '109 3rd Alley'
job.address_2 = 'Preston'
job.postcode = 'PR1'
job.country = 'United Kingdom'
job.job_title = 'Administrative Officer'
job.duties = 'Open-architected even-keeled complexity'
job.start_date = Date.parse('2012-03-10')
job.end_date = Date.parse('2014-03-16')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'George Berry'
ref.reference_1_email = 'gberry8@reuters.com'
ref.reference_1_occupation = 'Web Designer III'
ref.reference_1_address_1 = '50837 Twin Pines Plaza'
ref.reference_1_address_2 = 'Liverpool'
ref.reference_1_postcode = 'L33 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'encryption'
ref.reference_1_telephone = '44-(425)148-3128'
ref.reference_2_full_name = 'Maria Stewart'
ref.reference_2_email = 'mstewart9@liveinternet.ru'
ref.reference_2_occupation = 'Account Executive'
ref.reference_2_address_1 = '73 Pawling Hill'
ref.reference_2_address_2 = 'Sheffield'
ref.reference_2_postcode = 'S1 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'knowledge user'
ref.reference_2_telephone = '44-(235)596-1647'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 34
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 1000, status: :failed, card_holder: 'Marilyn Sullivan', last_four_digits: '0004', created_at: '2016-10-29T10:13:56+01:00', updated_at: '2016-10-29T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 1000, status: :failed, card_holder: 'Marilyn Sullivan', last_four_digits: '0004', created_at: '2017-02-17T10:13:56+01:00', updated_at: '2017-02-17T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Judith'
student.family_name = 'Matthews'
student.email = 'mmatthews5@china.com.cn'
student.scottish_candidate_number = '179442248'
student.national_insurance_number = 'NJ826251A'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Ms'
app.middle_name = 'Marie'
app.gender = :female
app.telephone = '44-(901)977-0444'
app.mobile = '44-(106)722-7435'
app.email = 'mmatthews5@china.com.cn'
app.disability = 'Advanced mobile migration'
app.personal_statement = 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'
app.permanent_house_number = '23'
app.permanent_address_1 = 'Tennessee Point'
app.permanent_postcode = 'BS37 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Chelsea College of Art and Design'
school.address_1 = '37 Orin Avenue'
school.address_2 = 'Leeds'
school.country = 'United Kingdom'
school.postcode = 'LS6 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Standard'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Warwick'
school.address_1 = '5 Hanover Lane'
school.address_2 = 'Langley'
school.country = 'United Kingdom'
school.postcode = 'SG4 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Yodel'
job.address_1 = '3568 Kinsman Pass'
job.address_2 = 'London'
job.postcode = 'W1F'
job.country = 'United Kingdom'
job.job_title = 'Health Coach III'
job.duties = 'Operative actuating strategy'
job.start_date = Date.parse('2012-11-29')
job.end_date = Date.parse('2015-04-19')
job.save! validate: false

job = Job.new application: app
job.employer = 'Dazzlesphere'
job.address_1 = '52 Sage Center'
job.address_2 = 'Stapleford'
job.postcode = 'LN6'
job.country = 'United Kingdom'
job.job_title = 'Mechanical Systems Engineer'
job.duties = 'Extended global forecast'
job.start_date = Date.parse('2011-03-06')
job.end_date = Date.parse('2017-02-02')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Jesse Reid'
ref.reference_1_email = 'jreida@pagesperso-orange.fr'
ref.reference_1_occupation = 'VP Product Management'
ref.reference_1_address_1 = '3 Golf Course '
ref.reference_1_address_2 = 'Charlton'
ref.reference_1_postcode = 'OX12 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'Fundamental'
ref.reference_1_telephone = '44-(464)899-2391'
ref.reference_2_full_name = 'Rachel Ellis'
ref.reference_2_email = 'rellisb@mozilla.com'
ref.reference_2_occupation = 'Sales Associate'
ref.reference_2_address_1 = '4483 Laurel '
ref.reference_2_address_2 = 'Langley'
ref.reference_2_postcode = 'SG4 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Enterprise-wide'
ref.reference_2_telephone = '44-(855)623-4558'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 156
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 73
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 56
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 99
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 12
course.save! validate: false

auth = :payment_failed

app.status = auth
app.save!

student = Student.new
student.first_name = 'Chris'
student.family_name = 'Duncan'
student.email = 'rduncan6@blogger.com'
student.scottish_candidate_number = '178182234'
student.national_insurance_number = 'NJ821242C'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Honorable'
app.middle_name = ''
app.previous_name = 'Russell Duncan'
app.gender = :male
app.telephone = '44-(934)386-9105'
app.email = 'rduncan6@blogger.com'
app.personal_statement = 'In hac habitasse platea dictumst. Morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante. Nulla justo."'
app.permanent_house_number = '1'
app.permanent_address_1 = 'Darwin Avenue'
app.permanent_address_2 = 'Craigavon'
app.permanent_postcode = 'BT66 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Aston University'
school.address_1 = '69171 Scoville Place'
school.address_2 = 'Buckland'
school.country = 'United Kingdom'
school.postcode = 'CT16 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'NQ'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'Standard'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Warnborough University'
school.address_1 = '41942 Warrior Court'
school.address_2 = 'Walton'
school.country = 'United Kingdom'
school.postcode = 'CV35 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'HND'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Roombo'
job.address_1 = '9 Eagan Terrace'
job.address_2 = 'Newton'
job.postcode = 'IV1'
job.country = 'United Kingdom'
job.job_title = 'Environmental Tech'
job.duties = 'Devolved 4th generation concept'
job.start_date = Date.parse('2011-10-11')
job.end_date = Date.parse('2016-06-03')
job.save! validate: false

job = Job.new application: app
job.employer = 'Meetz'
job.address_1 = '60423 Portage Way'
job.address_2 = 'Newton'
job.postcode = 'IV1'
job.country = 'United Kingdom'
job.job_title = 'Help Desk Operator'
job.duties = 'Operative mobile throughput'
job.start_date = Date.parse('2010-09-14')
job.end_date = Date.parse('2014-07-26')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Betty Mills'
ref.reference_1_email = 'bmillsc@nasa.gov'
ref.reference_1_occupation = 'Nurse'
ref.reference_1_address_1 = '11571 Maryland '
ref.reference_1_address_2 = 'Wootton'
ref.reference_1_postcode = 'NN4 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'grid-enabled'
ref.reference_1_telephone = '44-(281)224-2795'
ref.reference_2_full_name = 'Ashley Thompson'
ref.reference_2_email = 'athompsond@vistaprint.com'
ref.reference_2_occupation = 'Physical Therapy Assistant'
ref.reference_2_address_1 = '63278 Old Gate '
ref.reference_2_address_2 = 'Buckland'
ref.reference_2_postcode = 'CT16 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'composite'
ref.reference_2_telephone = '44-(572)482-6969'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 71
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 70
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 26
course.save! validate: false

auth = :payment_failed

app.status = auth
app.save!

student = Student.new
student.first_name = 'Patrick'
student.family_name = 'Carr'
student.email = 'rcarr7@soup.io'
student.scottish_candidate_number = '173818491'
student.national_insurance_number = 'NJ803986B'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Mr'
app.middle_name = 'Roger'
app.previous_name = 'Roger Carr'
app.gender = :male
app.telephone = '44-(112)290-3116'
app.mobile = '44-(376)145-0062'
app.email = 'rcarr7@soup.io'
app.personal_statement = 'Proin eu mi. Nulla ac enim. In tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem."'
app.permanent_house_number = '32'
app.permanent_address_1 = 'Maple Court'
app.permanent_address_2 = 'Ford'
app.permanent_postcode = 'GL54 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'University of East London'
school.address_1 = '45 Florence Street'
school.address_2 = 'Belfast'
school.country = 'United Kingdom'
school.postcode = 'BT2 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'NQ'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Institute of Germanic Studies'
school.address_1 = '4467 Redwing Parkway'
school.address_2 = 'Swindon'
school.country = 'United Kingdom'
school.postcode = 'SN1 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Babblestorm'
job.address_1 = '0 Independence Plaza'
job.address_2 = 'Marston'
job.postcode = 'ST20'
job.country = 'United Kingdom'
job.job_title = 'Cost Accountant'
job.duties = 'Ameliorated bottom-line analyzer'
job.start_date = Date.parse('2010-11-09')
job.end_date = Date.parse('2013-08-03')
job.save! validate: false

job = Job.new application: app
job.employer = 'Innojam'
job.address_1 = '75 Alpine Center'
job.address_2 = 'Upton'
job.postcode = 'WF9'
job.country = 'United Kingdom'
job.job_title = 'Actuary'
job.duties = 'Progressive multi-state strategy'
job.start_date = Date.parse('2012-10-11')
job.end_date = Date.parse('2016-03-18')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Billy Oliver'
ref.reference_1_email = 'bolivere@usda.gov'
ref.reference_1_occupation = 'Budget/Accounting Analyst IV'
ref.reference_1_address_1 = '3 Commercial Avenue'
ref.reference_1_address_2 = 'Stapleford'
ref.reference_1_postcode = 'LN6 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'groupware'
ref.reference_1_telephone = '44-(467)719-8491'
ref.reference_2_full_name = 'Jesse Carroll'
ref.reference_2_email = 'jcarrollf@ibm.com'
ref.reference_2_occupation = 'Assistant Professor'
ref.reference_2_address_1 = '751 Quincy Plaza'
ref.reference_2_address_2 = 'Linton'
ref.reference_2_postcode = 'BD23 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Graphical User Interface'
ref.reference_2_telephone = '44-(404)908-1556'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 148
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 1000, status: :failed, card_holder: 'Patrick Carr', last_four_digits: '0004', created_at: '2017-03-04T10:13:56+01:00', updated_at: '2017-03-04T10:13:56+01:00'
Payment.create! application: app, payment_type: :paypal, amount: 1000, status: :failed, card_holder: 'Patrick Carr', created_at: '2017-01-08T10:13:56+01:00', updated_at: '2017-01-08T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Diane'
student.family_name = 'Myers'
student.email = 'amyers8@zdnet.com'
student.scottish_candidate_number = '172150748'
student.national_insurance_number = 'NJ906461C'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Honorable'
app.middle_name = 'Annie'
app.gender = :female
app.telephone = '44-(232)369-6218'
app.mobile = '44-(672)883-5637'
app.email = 'amyers8@zdnet.com'
app.disability = 'Face to face contextually-based toolset'
app.personal_statement = 'In congue. Etiam justo. Etiam pretium iaculis justo.'
app.permanent_house_number = '8868'
app.permanent_address_1 = 'Eastlawn Street'
app.permanent_postcode = 'N3 2GR'
app.permanent_country = 'United Kingdom'
app.correspondence_house_number = '649'
app.correspondence_address_1 = 'Summit Parkway'
app.correspondence_address_2 = 'Honorable'
app.correspondence_postcode = 'S8 2GR'
app.correspondence_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Camberwell College of Arts'
school.address_1 = '7071 Forest Road'
school.address_2 = 'Leeds'
school.country = 'United Kingdom'
school.postcode = 'LS6 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Wales Institute'
school.address_1 = '97 Shoshone Lane'
school.address_2 = 'Buckland'
school.country = 'United Kingdom'
school.postcode = 'CT16 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'Higher'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Zoovu'
job.address_1 = '4681 Gateway Street'
job.address_2 = 'Langley'
job.postcode = 'SG4'
job.country = 'United Kingdom'
job.job_title = 'Payment Adjustment Coordinator'
job.duties = 'Total 24 hour service-desk'
job.start_date = Date.parse('2011-07-26')
job.end_date = Date.parse('2016-10-14')
job.save! validate: false

job = Job.new application: app
job.employer = 'Rhynoodle'
job.address_1 = '0452 Red Cloud Center'
job.address_2 = 'Belfast'
job.postcode = 'BT2'
job.country = 'United Kingdom'
job.job_title = 'Physical Therapy Assistant'
job.duties = 'Self-enabling 24 hour migration'
job.start_date = Date.parse('2011-01-25')
job.end_date = Date.parse('2015-02-10')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Deborah Myers'
ref.reference_1_email = 'dmyersg@mozilla.com'
ref.reference_1_occupation = 'Project Manager'
ref.reference_1_address_1 = '90617 Columbus '
ref.reference_1_address_2 = 'Dean'
ref.reference_1_postcode = 'OX7 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'extranet'
ref.reference_1_telephone = '44-(907)668-4435'
ref.reference_2_full_name = 'Kelly Riley'
ref.reference_2_email = 'krileyh@netlog.com'
ref.reference_2_occupation = 'Junior Executive'
ref.reference_2_address_1 = '0145 Melody '
ref.reference_2_address_2 = 'Tullich'
ref.reference_2_postcode = 'AB55 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Mandatory'
ref.reference_2_telephone = '44-(860)595-0211'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 54
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 37
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 69
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 38
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 51
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Diane Myers', created_at: '2017-01-31T10:13:56+01:00', updated_at: '2017-01-31T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Sharon'
student.family_name = 'Murphy'
student.email = 'dmurphy9@hibu.com'
student.scottish_candidate_number = '177067040'
student.national_insurance_number = 'NJ186532D'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Dr'
app.middle_name = 'Doris'
app.gender = :female
app.telephone = '44-(839)643-9246'
app.mobile = '44-(966)723-6164'
app.email = 'dmurphy9@hibu.com'
app.disability = 'Business-focused solution-oriented infrastructure'
app.personal_statement = 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl.'
app.permanent_house_number = '30367'
app.permanent_address_1 = 'Towne Trail'
app.permanent_address_2 = 'Denton'
app.permanent_postcode = 'M34 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Canterbury Christ Church University'
school.address_1 = '17182 Melvin Junction'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'EC3M 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Standard'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Chelsea College of Art and Design'
school.address_1 = '3 Dottie Trail'
school.address_2 = 'Newton'
school.country = 'United Kingdom'
school.postcode = 'NG34 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Skipstorm'
job.address_1 = '680 Brentwood Hill'
job.address_2 = 'Sheffield'
job.postcode = 'S33'
job.country = 'United Kingdom'
job.job_title = 'Community Outreach Specialist'
job.duties = 'Sharable client-server framework'
job.start_date = Date.parse('2010-04-22')
job.end_date = Date.parse('2014-04-27')
job.save! validate: false

job = Job.new application: app
job.employer = 'Tavu'
job.address_1 = '90 Victoria Pass'
job.address_2 = 'Manchester'
job.postcode = 'M14'
job.country = 'United Kingdom'
job.job_title = 'Developer II'
job.duties = 'Multi-channelled client-server benchmark'
job.start_date = Date.parse('2012-09-04')
job.end_date = Date.parse('2014-06-30')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Heather Payne'
ref.reference_1_email = 'hpaynei@tripadvisor.com'
ref.reference_1_occupation = 'Structural Analysis Engineer'
ref.reference_1_address_1 = '30 Dorton '
ref.reference_1_address_2 = 'London'
ref.reference_1_postcode = 'SW1E 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'website'
ref.reference_1_telephone = '44-(406)885-9983'
ref.reference_2_full_name = 'Joan Black'
ref.reference_2_email = 'jblackj@netlog.com'
ref.reference_2_occupation = 'Senior Sales Associate'
ref.reference_2_address_1 = '2564 Springs '
ref.reference_2_address_2 = 'Leeds'
ref.reference_2_postcode = 'LS6 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Configurable'
ref.reference_2_telephone = '44-(114)854-5865'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 31
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 32
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 99
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 59
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 146
course.save! validate: false

auth = :payment_failed
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :authorized, card_holder: 'Sharon Murphy', created_at: '2017-03-10T10:13:56+01:00', updated_at: '2017-03-10T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Sharon Murphy', last_four_digits: '0004', created_at: '2017-01-27T10:13:56+01:00', updated_at: '2017-01-27T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Sharon Murphy', last_four_digits: '0004', created_at: '2017-03-01T10:13:56+01:00', updated_at: '2017-03-01T10:13:56+01:00'
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Sharon Murphy', created_at: '2017-02-26T10:13:56+01:00', updated_at: '2017-02-26T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Terry'
student.family_name = 'Johnson'
student.email = 'sjohnsona@java.com'
student.scottish_candidate_number = '177530514'
student.national_insurance_number = 'NJ689256C'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Mr'
app.middle_name = 'Steven'
app.gender = :male
app.telephone = '44-(325)563-4933'
app.mobile = '44-(601)111-2256'
app.email = 'sjohnsona@java.com'
app.disability = 'Ameliorated scalable capacity'
app.personal_statement = 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
app.permanent_house_number = '16801'
app.permanent_address_1 = 'Jackson Court'
app.permanent_postcode = 'SN13 2GR'
app.permanent_country = 'United Kingdom'
app.correspondence_house_number = '6207'
app.correspondence_address_1 = 'Oak Way'
app.correspondence_address_2 = 'Mr'
app.correspondence_postcode = 'B40 2GR'
app.correspondence_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'University of Hertfordshire'
school.address_1 = '39133 Forster Drive'
school.address_2 = 'Sheffield'
school.country = 'United Kingdom'
school.postcode = 'S1 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'NQ'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Schiller International University'
school.address_1 = '872 Dixon Road'
school.address_2 = 'Merton'
school.country = 'United Kingdom'
school.postcode = 'SW19 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'Higher'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Cogibox'
job.address_1 = '34 Mendota Terrace'
job.address_2 = 'Sutton'
job.postcode = 'CT15'
job.country = 'United Kingdom'
job.job_title = 'Paralegal'
job.duties = 'Centralized disintermediate help-desk'
job.start_date = Date.parse('2010-11-04')
job.end_date = Date.parse('2013-12-22')
job.save! validate: false

job = Job.new application: app
job.employer = 'Innotype'
job.address_1 = '042 Elka Lane'
job.address_2 = 'Church End'
job.postcode = 'N3'
job.country = 'United Kingdom'
job.job_title = 'Occupational Therapist'
job.duties = 'Centralized clear-thinking policy'
job.start_date = Date.parse('2012-07-09')
job.end_date = Date.parse('2014-02-18')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Carol Garcia'
ref.reference_1_email = 'cgarciak@ustream.tv'
ref.reference_1_occupation = 'Nurse Practicioner'
ref.reference_1_address_1 = '479 Toban '
ref.reference_1_address_2 = 'London'
ref.reference_1_postcode = 'EC1V 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'solution-oriented'
ref.reference_1_telephone = '44-(992)627-5685'
ref.reference_2_full_name = 'Kathryn Griffin'
ref.reference_2_email = 'kgriffinl@feedburner.com'
ref.reference_2_occupation = 'Account Coordinator'
ref.reference_2_address_1 = '99298 Hovde '
ref.reference_2_address_2 = 'Leeds'
ref.reference_2_postcode = 'LS6 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'service-desk'
ref.reference_2_telephone = '44-(170)511-1742'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 146
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 118
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 27
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 84
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 149
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Terry Johnson', last_four_digits: '0004', created_at: '2016-11-04T10:13:56+01:00', updated_at: '2016-11-04T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Terry Johnson', last_four_digits: '0004', created_at: '2017-01-28T10:13:56+01:00', updated_at: '2017-01-28T10:13:56+01:00'
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :authorized, card_holder: 'Terry Johnson', created_at: '2017-02-05T10:13:56+01:00', updated_at: '2017-02-05T10:13:56+01:00'
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Terry Johnson', created_at: '2016-12-21T10:13:56+01:00', updated_at: '2016-12-21T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Bruce'
student.family_name = 'Hill'
student.email = 'bhillb@quantcast.com'
student.scottish_candidate_number = '170394046'
student.national_insurance_number = 'NJ334835D'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Honorable'
app.middle_name = 'Brandon'
app.gender = :male
app.telephone = '44-(777)417-6412'
app.mobile = '44-(878)803-6920'
app.email = 'bhillb@quantcast.com'
app.disability = 'Down-sized value-added parallelism'
app.personal_statement = 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'
app.permanent_house_number = '7350'
app.permanent_address_1 = 'Autumn Leaf Avenue'
app.permanent_postcode = 'NN11 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Trinity College Carmarthen'
school.address_1 = '436 Lake View Plaza'
school.address_2 = 'Sutton'
school.country = 'United Kingdom'
school.postcode = 'RH5 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Chelsea College of Art and Design'
school.address_1 = '62 Jay Crossing'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'W1F 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Standard'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Flashpoint'
job.address_1 = '92878 Buell Terrace'
job.address_2 = 'Church End'
job.postcode = 'CB4'
job.country = 'United Kingdom'
job.job_title = 'Compensation Analyst'
job.duties = 'Function-based multi-state interface'
job.start_date = Date.parse('2012-06-13')
job.end_date = Date.parse('2016-09-17')
job.save! validate: false

job = Job.new application: app
job.employer = 'Edgeclub'
job.address_1 = '6 Lakewood Gardens Crossing'
job.address_2 = 'Weston'
job.postcode = 'GU32'
job.country = 'United Kingdom'
job.job_title = 'Dental Hygienist'
job.duties = 'Compatible asynchronous paradigm'
job.start_date = Date.parse('2012-12-27')
job.end_date = Date.parse('2016-09-30')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Brandon Morrison'
ref.reference_1_email = 'bmorrisonm@cpanel.net'
ref.reference_1_occupation = 'Sales Associate'
ref.reference_1_address_1 = '1 Prairie Rose '
ref.reference_1_address_2 = 'London'
ref.reference_1_postcode = 'WC1B 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'benchmark'
ref.reference_1_telephone = '44-(613)688-2932'
ref.reference_2_full_name = 'Virginia Grant'
ref.reference_2_email = 'vgrantn@imdb.com'
ref.reference_2_occupation = 'Editor'
ref.reference_2_address_1 = '95793 Dryden Alley'
ref.reference_2_address_2 = 'Milton'
ref.reference_2_postcode = 'NG22 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Devolved'
ref.reference_2_telephone = '44-(120)704-2170'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 63
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 22
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 45
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 91
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Bruce Hill', last_four_digits: '0004', created_at: '2016-12-05T10:13:56+01:00', updated_at: '2016-12-05T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Douglas'
student.family_name = 'Phillips'
student.email = 'gphillipsc@biblegateway.com'
student.scottish_candidate_number = '179332353'
student.national_insurance_number = 'NJ268096D'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Honorable'
app.middle_name = 'George'
app.gender = :male
app.telephone = '44-(208)559-7831'
app.mobile = '44-(424)133-4631'
app.email = 'gphillipsc@biblegateway.com'
app.disability = 'Public-key web-enabled projection'
app.personal_statement = 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl.'
app.permanent_house_number = '07'
app.permanent_address_1 = 'Canary Road'
app.permanent_postcode = 'CT15 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Courtauld Institute of Art'
school.address_1 = '13 Maple Place'
school.address_2 = 'Seaton'
school.country = 'United Kingdom'
school.postcode = 'LE15 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'United Medical and Dental Schools'
school.address_1 = '2 Evergreen Trail'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'EC3M 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Jetpulse'
job.address_1 = '169 Independence Hill'
job.address_2 = 'Halton'
job.postcode = 'LS9'
job.country = 'United Kingdom'
job.job_title = 'VP Accounting'
job.duties = 'Persistent radical success'
job.start_date = Date.parse('2012-11-24')
job.end_date = Date.parse('2016-12-29')
job.save! validate: false

job = Job.new application: app
job.employer = 'Dabjam'
job.address_1 = '99 Forest Dale Pass'
job.address_2 = 'Kingston'
job.postcode = 'DT10'
job.country = 'United Kingdom'
job.job_title = 'Associate Professor'
job.duties = 'Down-sized zero administration hardware'
job.start_date = Date.parse('2012-01-13')
job.end_date = Date.parse('2013-12-12')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Catherine Rogers'
ref.reference_1_email = 'crogerso@npr.org'
ref.reference_1_occupation = 'Associate Professor'
ref.reference_1_address_1 = '161 Huxley Court'
ref.reference_1_address_2 = 'Walton'
ref.reference_1_postcode = 'CV35 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'structure'
ref.reference_1_telephone = '44-(169)666-7597'
ref.reference_2_full_name = 'Evelyn Fuller'
ref.reference_2_email = 'efullerp@booking.com'
ref.reference_2_occupation = 'Web Designer II'
ref.reference_2_address_1 = '7491 Merchant Lane'
ref.reference_2_address_2 = 'Brampton'
ref.reference_2_postcode = 'NR34 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Mandatory'
ref.reference_2_telephone = '44-(744)835-3534'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 71
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 141
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Douglas Phillips', created_at: '2016-12-05T10:13:56+01:00', updated_at: '2016-12-05T10:13:56+01:00'
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :authorized, card_holder: 'Douglas Phillips', created_at: '2017-03-30T10:13:56+01:00', updated_at: '2017-03-30T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Douglas Phillips', last_four_digits: '0004', created_at: '2016-12-12T10:13:56+01:00', updated_at: '2016-12-12T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Douglas Phillips', last_four_digits: '0004', created_at: '2016-11-26T10:13:56+01:00', updated_at: '2016-11-26T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Irene'
student.family_name = 'Freeman'
student.email = 'dfreemand@thetimes.co.uk'
student.scottish_candidate_number = '171762677'
student.national_insurance_number = 'NJ194015C'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Honorable'
app.middle_name = ''
app.gender = :female
app.telephone = '44-(586)204-9916'
app.email = 'dfreemand@thetimes.co.uk'
app.personal_statement = 'Maecenas tristique est et tempus semper. Est quam pharetra magna ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'
app.permanent_house_number = '70709'
app.permanent_address_1 = 'Pierstorff Point'
app.permanent_address_2 = 'Milton'
app.permanent_postcode = 'NG22 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Heriot-Watt University'
school.address_1 = '75 Petterle Alley'
school.address_2 = 'Newtown'
school.country = 'United Kingdom'
school.postcode = 'RG20 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'South Bank University'
school.address_1 = '69406 Badeau Hill'
school.address_2 = 'East End'
school.country = 'United Kingdom'
school.postcode = 'BH21 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'NQ'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Standard'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Gabtune'
job.address_1 = '829 Moland Road'
job.address_2 = 'West End'
job.postcode = 'DN36'
job.country = 'United Kingdom'
job.job_title = 'Safety Technician II'
job.duties = 'Upgradable fresh-thinking monitoring'
job.start_date = Date.parse('2013-02-11')
job.end_date = Date.parse('2016-10-28')
job.save! validate: false

job = Job.new application: app
job.employer = 'Realcube'
job.address_1 = '74423 Caliangt Point'
job.address_2 = 'Bristol'
job.postcode = 'BS41'
job.country = 'United Kingdom'
job.job_title = 'Systems Administrator IV'
job.duties = 'Robust didactic product'
job.start_date = Date.parse('2010-06-11')
job.end_date = Date.parse('2014-12-26')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Karen Phillips'
ref.reference_1_email = 'kphillipsq@forbes.com'
ref.reference_1_occupation = 'Senior Sales Associate'
ref.reference_1_address_1 = '0595 Mosinee Avenue'
ref.reference_1_address_2 = 'London'
ref.reference_1_postcode = 'EC1V 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'artificial intelligence'
ref.reference_1_telephone = '44-(346)219-2735'
ref.reference_2_full_name = 'Timothy Gutierrez'
ref.reference_2_email = 'tgutierrezr@cisco.com'
ref.reference_2_occupation = 'Quality Control Specialist'
ref.reference_2_address_1 = '1045 North Parkway'
ref.reference_2_address_2 = 'Denton'
ref.reference_2_postcode = 'M34 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'actuating'
ref.reference_2_telephone = '44-(551)706-9879'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 29
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 20
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 119
course.save! validate: false

auth = :payment_failed

app.status = auth
app.save!

student = Student.new
student.first_name = 'Phyllis'
student.family_name = 'Harvey'
student.email = 'dharveye@ehow.com'
student.scottish_candidate_number = '173663145'
student.national_insurance_number = 'NJ827375D'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Ms'
app.middle_name = 'Diana'
app.gender = :female
app.telephone = '44-(146)514-3203'
app.mobile = '44-(611)225-4123'
app.email = 'dharveye@ehow.com'
app.disability = 'Innovative zero defect database'
app.personal_statement = 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'
app.permanent_house_number = '1164'
app.permanent_address_1 = 'Nelson Pass'
app.permanent_address_2 = 'Edinburgh'
app.permanent_postcode = 'EH9 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'University of Portsmouth'
school.address_1 = '23 Cody Park'
school.address_2 = 'Preston'
school.country = 'United Kingdom'
school.postcode = 'PR1 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'The Manchester Metropolitan University'
school.address_1 = '049 Quincy Pass'
school.address_2 = 'Norton'
school.country = 'United Kingdom'
school.postcode = 'S8 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Eamia'
job.address_1 = '58 Upham Road'
job.address_2 = 'Carlton'
job.postcode = 'DL8'
job.country = 'United Kingdom'
job.job_title = 'Editor'
job.duties = 'Fundamental leading edge help-desk'
job.start_date = Date.parse('2012-10-13')
job.end_date = Date.parse('2015-08-18')
job.save! validate: false

job = Job.new application: app
job.employer = 'Jabberstorm'
job.address_1 = '9 Swallow Crossing'
job.address_2 = 'Kinloch'
job.postcode = 'PH43'
job.country = 'United Kingdom'
job.job_title = 'Actuary'
job.duties = 'Progressive tertiary structure'
job.start_date = Date.parse('2012-12-26')
job.end_date = Date.parse('2016-11-05')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Jacqueline Lewis'
ref.reference_1_email = 'jlewiss@php.net'
ref.reference_1_occupation = 'Junior Executive'
ref.reference_1_address_1 = '252 Beilfuss Crossing'
ref.reference_1_address_2 = 'Eaton'
ref.reference_1_postcode = 'DN22 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'time-frame'
ref.reference_1_telephone = '44-(394)246-0959'
ref.reference_2_full_name = 'Martha Grant'
ref.reference_2_email = 'mgrantt@hhs.gov'
ref.reference_2_occupation = 'Geological Engineer'
ref.reference_2_address_1 = '40210 Springs Court'
ref.reference_2_address_2 = 'Buckland'
ref.reference_2_postcode = 'CT16 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Adaptive'
ref.reference_2_telephone = '44-(251)612-1118'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 142
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 1000, status: :failed, card_holder: 'Phyllis Harvey', last_four_digits: '0004', created_at: '2016-12-05T10:13:56+01:00', updated_at: '2016-12-05T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 1000, status: :failed, card_holder: 'Phyllis Harvey', last_four_digits: '0004', created_at: '2017-01-28T10:13:56+01:00', updated_at: '2017-01-28T10:13:56+01:00'
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 1000, status: :authorized, card_holder: 'Phyllis Harvey', created_at: '2017-04-16T10:13:56+01:00', updated_at: '2017-04-16T10:13:56+01:00'
Payment.create! application: app, payment_type: :paypal, amount: 1000, status: :failed, card_holder: 'Phyllis Harvey', created_at: '2016-12-08T10:13:56+01:00', updated_at: '2016-12-08T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Shirley'
student.family_name = 'Henry'
student.email = 'ahenryf@360.cn'
student.scottish_candidate_number = '171377196'
student.national_insurance_number = 'NJ463541B'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Ms'
app.middle_name = 'Anne'
app.previous_name = 'Anne Henry'
app.gender = :female
app.telephone = '44-(741)548-1274'
app.mobile = '44-(801)248-8980'
app.email = 'ahenryf@360.cn'
app.personal_statement = 'Quisque porta volutpat erat. Quisque erat eros viverra eget congue eget. Semper rutrum nulla. Nunc purus.'
app.permanent_house_number = '15433'
app.permanent_address_1 = 'Cascade Crossing'
app.permanent_postcode = 'PR1 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'University of Wales'
school.address_1 = '2 Anzinger Park'
school.address_2 = 'Edinburgh'
school.country = 'United Kingdom'
school.postcode = 'EH9 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Staffordshire University'
school.address_1 = '2 Express Drive'
school.address_2 = 'Norton'
school.country = 'United Kingdom'
school.postcode = 'NN11 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Higher'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Mydeo'
job.address_1 = '6728 Blue Bill Park Point'
job.address_2 = 'Bradford'
job.postcode = 'BD7'
job.country = 'United Kingdom'
job.job_title = 'Compensation Analyst'
job.duties = 'Virtual national orchestration'
job.start_date = Date.parse('2012-09-06')
job.end_date = Date.parse('2016-09-08')
job.save! validate: false

job = Job.new application: app
job.employer = 'Topdrive'
job.address_1 = '73981 Fuller Junction'
job.address_2 = 'Glasgow'
job.postcode = 'G4'
job.country = 'United Kingdom'
job.job_title = 'Biostatistician II'
job.duties = 'Fully-configurable explicit data-warehouse'
job.start_date = Date.parse('2012-04-09')
job.end_date = Date.parse('2013-12-01')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Ruby Ramos'
ref.reference_1_email = 'rramosu@issuu.com'
ref.reference_1_occupation = 'Nurse'
ref.reference_1_address_1 = '8 Morningstar '
ref.reference_1_address_2 = 'London'
ref.reference_1_postcode = 'WC2H 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'model'
ref.reference_1_telephone = '44-(864)894-0215'
ref.reference_2_full_name = 'Kathy Parker'
ref.reference_2_email = 'kparkerv@barnesandnoble.com'
ref.reference_2_occupation = 'Teacher'
ref.reference_2_address_1 = '250 4th '
ref.reference_2_address_2 = 'Edinburgh'
ref.reference_2_postcode = 'EH9 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'parallelism'
ref.reference_2_telephone = '44-(351)167-5329'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 64
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 14
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 108
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 53
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Shirley Henry', last_four_digits: '0004', created_at: '2017-01-08T10:13:56+01:00', updated_at: '2017-01-08T10:13:56+01:00'
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Shirley Henry', created_at: '2016-12-26T10:13:56+01:00', updated_at: '2016-12-26T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Joshua'
student.family_name = 'Reyes'
student.email = 'creyesg@noaa.gov'
student.scottish_candidate_number = '176101504'
student.national_insurance_number = 'NJ868330D'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Mr'
app.middle_name = 'Craig'
app.gender = :male
app.telephone = '44-(143)333-3096'
app.mobile = '44-(167)858-3082'
app.email = 'creyesg@noaa.gov'
app.personal_statement = 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'
app.permanent_house_number = '102'
app.permanent_address_1 = 'Green Ridge Park'
app.permanent_postcode = 'ST20 2GR'
app.permanent_country = 'United Kingdom'
app.correspondence_house_number = '8395'
app.correspondence_address_1 = 'Hermina Junction'
app.correspondence_address_2 = 'Mr'
app.correspondence_postcode = 'CT16 2GR'
app.correspondence_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Wimbledon School of Art'
school.address_1 = '476 Sunfield Point'
school.address_2 = 'East End'
school.country = 'United Kingdom'
school.postcode = 'BH21 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'Standard'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of St. Andrews'
school.address_1 = '670 Corscot Terrace'
school.address_2 = 'Bristol'
school.country = 'United Kingdom'
school.postcode = 'BS41 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Thoughtworks'
job.address_1 = '86217 Green Alley'
job.address_2 = 'Thorpe'
job.postcode = 'BD23'
job.country = 'United Kingdom'
job.job_title = 'Human Resources Assistant III'
job.duties = 'Profound bifurcated software'
job.start_date = Date.parse('2010-12-04')
job.end_date = Date.parse('2014-01-11')
job.save! validate: false

job = Job.new application: app
job.employer = 'Flashpoint'
job.address_1 = '408 Roxbury Plaza'
job.address_2 = 'Wirral'
job.postcode = 'CH48'
job.country = 'United Kingdom'
job.job_title = 'Professor'
job.duties = 'Focused dedicated internet solution'
job.start_date = Date.parse('2010-10-21')
job.end_date = Date.parse('2016-12-06')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Wanda White'
ref.reference_1_email = 'wwhitew@vkontakte.ru'
ref.reference_1_occupation = 'Nurse Practicioner'
ref.reference_1_address_1 = '5541 Monument Park'
ref.reference_1_address_2 = 'Normanton'
ref.reference_1_postcode = 'LE15 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'artificial intelligence'
ref.reference_1_telephone = '44-(686)422-8426'
ref.reference_2_full_name = 'Gloria Lawrence'
ref.reference_2_email = 'glawrencex@ucoz.ru'
ref.reference_2_occupation = 'Internal Auditor'
ref.reference_2_address_1 = '5938 Randy '
ref.reference_2_address_2 = 'Craigavon'
ref.reference_2_postcode = 'BT66 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = '24/7'
ref.reference_2_telephone = '44-(240)678-3099'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 41
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 105
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 5
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 80
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 112
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Joshua Reyes', last_four_digits: '0004', created_at: '2016-12-22T10:13:56+01:00', updated_at: '2016-12-22T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Joshua Reyes', last_four_digits: '0004', created_at: '2017-04-01T10:13:56+01:00', updated_at: '2017-04-01T10:13:56+01:00'
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :authorized, card_holder: 'Joshua Reyes', created_at: '2017-04-20T10:13:56+01:00', updated_at: '2017-04-20T10:13:56+01:00'
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Joshua Reyes', created_at: '2017-03-03T10:13:56+01:00', updated_at: '2017-03-03T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Jane'
student.family_name = 'Hughes'
student.email = 'jhughesh@gov.uk'
student.scottish_candidate_number = '171155851'
student.national_insurance_number = 'NJ445413D'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Rev'
app.middle_name = 'Judy'
app.gender = :female
app.telephone = '44-(475)167-8103'
app.mobile = '44-(129)184-0157'
app.email = 'jhughesh@gov.uk'
app.personal_statement = 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'
app.permanent_house_number = '2450'
app.permanent_address_1 = 'Portage Plaza'
app.permanent_address_2 = 'Newtown'
app.permanent_postcode = 'RG20 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'University of Aberdeen'
school.address_1 = '4 Susan Place'
school.address_2 = 'Whitchurch'
school.country = 'United Kingdom'
school.postcode = 'BS14 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Middlesex University'
school.address_1 = '3 Scott Avenue'
school.address_2 = 'Leeds'
school.country = 'United Kingdom'
school.postcode = 'LS6 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Skajo'
job.address_1 = '84015 Hayes Court'
job.address_2 = 'Middleton'
job.postcode = 'LE16'
job.country = 'United Kingdom'
job.job_title = 'Senior Developer'
job.duties = 'Profit-focused modular parallelism'
job.start_date = Date.parse('2012-05-19')
job.end_date = Date.parse('2015-08-09')
job.save! validate: false

job = Job.new application: app
job.employer = 'Zooveo'
job.address_1 = '99 Nelson Junction'
job.address_2 = 'Dean'
job.postcode = 'OX7'
job.country = 'United Kingdom'
job.job_title = 'Desktop Support Technician'
job.duties = 'Implemented bandwidth-monitored conglomeration'
job.start_date = Date.parse('2012-06-03')
job.end_date = Date.parse('2014-04-11')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Terry Banks'
ref.reference_1_email = 'tbanksy@histats.com'
ref.reference_1_occupation = 'Database Administrator I'
ref.reference_1_address_1 = '04 Weeping Birch '
ref.reference_1_address_2 = 'Kinloch'
ref.reference_1_postcode = 'PH43 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'approach'
ref.reference_1_telephone = '44-(771)429-7912'
ref.reference_2_full_name = 'Phyllis Larson'
ref.reference_2_email = 'plarsonz@github.com'
ref.reference_2_occupation = 'Help Desk Technician'
ref.reference_2_address_1 = '775 Hanover Junction'
ref.reference_2_address_2 = 'Whitchurch'
ref.reference_2_postcode = 'BS14 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Exclusive'
ref.reference_2_telephone = '44-(995)797-4055'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 90
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 76
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 9
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 17
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Jane Hughes', created_at: '2016-12-31T10:13:56+01:00', updated_at: '2016-12-31T10:13:56+01:00'
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Jane Hughes', last_four_digits: '0004', created_at: '2017-03-03T10:13:56+01:00', updated_at: '2017-03-03T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Gregory'
student.family_name = 'Reid'
student.email = 'jreidi@zdnet.com'
student.scottish_candidate_number = '176647205'
student.national_insurance_number = 'NJ774252A'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Rev'
app.middle_name = ''
app.previous_name = 'Jesse Reid'
app.gender = :male
app.telephone = '44-(755)660-8170'
app.email = 'jreidi@zdnet.com'
app.personal_statement = 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
app.permanent_house_number = '148'
app.permanent_address_1 = 'Cardinal Terrace'
app.permanent_postcode = 'AB39 2GR'
app.permanent_country = 'United Kingdom'
app.correspondence_house_number = '005'
app.correspondence_address_1 = 'Carberry Street'
app.correspondence_address_2 = 'Rev'
app.correspondence_postcode = 'NG34 2GR'
app.correspondence_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'University of Aberdeen'
school.address_1 = '725 Anderson Drive'
school.address_2 = 'Ashley'
school.country = 'United Kingdom'
school.postcode = 'SN13 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Central Lancashire'
school.address_1 = '9229 Transport Street'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'EC3M 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Dabshots'
job.address_1 = '2 Sloan Court'
job.address_2 = 'Belfast'
job.postcode = 'BT2'
job.country = 'United Kingdom'
job.job_title = 'Database Administrator I'
job.duties = 'Reverse-engineered zero defect focus group'
job.start_date = Date.parse('2010-05-02')
job.end_date = Date.parse('2016-03-17')
job.save! validate: false

job = Job.new application: app
job.employer = 'Buzzbean'
job.address_1 = '0917 Briar Crest Avenue'
job.address_2 = 'Bristol'
job.postcode = 'BS41'
job.country = 'United Kingdom'
job.job_title = 'Accounting Assistant IV'
job.duties = 'Multi-channelled bi-directional focus group'
job.start_date = Date.parse('2010-09-16')
job.end_date = Date.parse('2016-05-01')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Willie Murray'
ref.reference_1_email = 'wmurray10@xing.com'
ref.reference_1_occupation = 'Food Chemist'
ref.reference_1_address_1 = '7805 Pond Lane'
ref.reference_1_address_2 = 'Swindon'
ref.reference_1_postcode = 'SN1 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'emulation'
ref.reference_1_telephone = '44-(720)490-0283'
ref.reference_2_full_name = 'Patrick Williams'
ref.reference_2_email = 'pwilliams11@yellowpages.com'
ref.reference_2_occupation = 'Design Engineer'
ref.reference_2_address_1 = '784 Holy Cross Avenue'
ref.reference_2_address_2 = 'Denton'
ref.reference_2_postcode = 'M34 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'encryption'
ref.reference_2_telephone = '44-(859)845-9504'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 68
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 93
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 60
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :credit_card, amount: 2000, status: :failed, card_holder: 'Gregory Reid', last_four_digits: '0004', created_at: '2016-11-19T10:13:56+01:00', updated_at: '2016-11-19T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Antonio'
student.family_name = 'Richardson'
student.email = 'drichardsonj@google.co.uk'
student.scottish_candidate_number = '172403239'
student.national_insurance_number = 'NJ378359A'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Rev'
app.middle_name = 'Dennis'
app.previous_name = 'Dennis Richardson'
app.gender = :male
app.telephone = '44-(250)929-4363'
app.mobile = '44-(860)877-2080'
app.email = 'drichardsonj@google.co.uk'
app.personal_statement = 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem.'
app.permanent_house_number = '67870'
app.permanent_address_1 = 'Bashford Lane'
app.permanent_postcode = 'BS14 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Trinity College Carmarthen'
school.address_1 = '2258 Gerald Pass'
school.address_2 = 'Upton'
school.country = 'United Kingdom'
school.postcode = 'WF9 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of East Anglia'
school.address_1 = '01016 Montana Alley'
school.address_2 = 'Whitwell'
school.country = 'United Kingdom'
school.postcode = 'DL10 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Higher'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Quimm'
job.address_1 = '590 Ridgeway Plaza'
job.address_2 = 'Denton'
job.postcode = 'M34'
job.country = 'United Kingdom'
job.job_title = 'Research Nurse'
job.duties = 'Re-engineered encompassing solution'
job.start_date = Date.parse('2010-04-13')
job.end_date = Date.parse('2013-11-27')
job.save! validate: false

job = Job.new application: app
job.employer = 'Jatri'
job.address_1 = '317 Dottie Hill'
job.address_2 = 'Norton'
job.postcode = 'NN11'
job.country = 'United Kingdom'
job.job_title = 'Web Designer IV'
job.duties = 'Object-based value-added policy'
job.start_date = Date.parse('2010-05-17')
job.end_date = Date.parse('2014-01-10')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Karen Collins'
ref.reference_1_email = 'kcollins12@yahoo.com'
ref.reference_1_occupation = 'Junior Executive'
ref.reference_1_address_1 = '081 Boyd Trail'
ref.reference_1_address_2 = 'Preston'
ref.reference_1_postcode = 'PR1 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'Profound'
ref.reference_1_telephone = '44-(345)429-3166'
ref.reference_2_full_name = 'Alan Sullivan'
ref.reference_2_email = 'asullivan13@canalblog.com'
ref.reference_2_occupation = 'Cost Accountant'
ref.reference_2_address_1 = '841 Kedzie Lane'
ref.reference_2_address_2 = 'Burnside'
ref.reference_2_postcode = 'EH52 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'instruction set'
ref.reference_2_telephone = '44-(590)169-0449'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 10
course.save! validate: false

auth = :payment_failed

app.status = auth
app.save!

student = Student.new
student.first_name = 'Beverly'
student.family_name = 'Kelly'
student.email = 'kkellyk@usnews.com'
student.scottish_candidate_number = '175751149'
student.national_insurance_number = 'NJ748718B'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Dr'
app.middle_name = 'Kelly'
app.gender = :female
app.telephone = '44-(933)888-5582'
app.mobile = '44-(251)702-9828'
app.email = 'kkellyk@usnews.com'
app.personal_statement = 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'
app.permanent_house_number = '4'
app.permanent_address_1 = 'Fremont Parkway'
app.permanent_address_2 = 'Eaton'
app.permanent_postcode = 'DN22 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'Courtauld Institute of Art'
school.address_1 = '66836 Bayside Avenue'
school.address_2 = 'Newton'
school.country = 'United Kingdom'
school.postcode = 'IV1 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Halifax'
school.address_1 = '3 Del Mar Lane'
school.address_2 = 'Ford'
school.country = 'United Kingdom'
school.postcode = 'GL54 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Vitz'
job.address_1 = '79 Sutteridge Park'
job.address_2 = 'Eaton'
job.postcode = 'DN22'
job.country = 'United Kingdom'
job.job_title = 'Budget/Accounting Analyst III'
job.duties = 'Reactive stable process improvement'
job.start_date = Date.parse('2013-03-01')
job.end_date = Date.parse('2016-02-14')
job.save! validate: false

job = Job.new application: app
job.employer = 'Oloo'
job.address_1 = '40 Gerald Way'
job.address_2 = 'Langley'
job.postcode = 'SG4'
job.country = 'United Kingdom'
job.job_title = 'Chief Design Engineer'
job.duties = 'Integrated scalable workforce'
job.start_date = Date.parse('2010-10-18')
job.end_date = Date.parse('2015-02-16')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Adam Smith'
ref.reference_1_email = 'asmith14@intel.com'
ref.reference_1_occupation = 'Dental Hygienist'
ref.reference_1_address_1 = '9 Mifflin '
ref.reference_1_address_2 = 'Norton'
ref.reference_1_postcode = 'NN11 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'Vision-oriented'
ref.reference_1_telephone = '44-(104)407-6867'
ref.reference_2_full_name = 'Jeffrey Lewis'
ref.reference_2_email = 'jlewis15@amazon.de'
ref.reference_2_occupation = 'Chief Design Engineer'
ref.reference_2_address_1 = '296 Harper '
ref.reference_2_address_2 = 'Newtown'
ref.reference_2_postcode = 'RG20 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Expanded'
ref.reference_2_telephone = '44-(953)973-0689'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 102
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 53
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 11
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 86
course.save! validate: false

auth = :payment_failed

app.status = auth
app.save!

student = Student.new
student.first_name = 'Jeremy'
student.family_name = 'Hill'
student.email = 'philll@tuttocitta.it'
student.scottish_candidate_number = '172671594'
student.national_insurance_number = 'NJ195872D'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Dr'
app.middle_name = 'Phillip'
app.gender = :male
app.telephone = '44-(706)749-5875'
app.mobile = '44-(118)561-1745'
app.email = 'philll@tuttocitta.it'
app.personal_statement = 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
app.permanent_house_number = '4555'
app.permanent_address_1 = 'Gina Avenue'
app.permanent_postcode = 'NR34 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'University of Worcester'
school.address_1 = '5172 Pierstorff Terrace'
school.address_2 = 'Birmingham'
school.country = 'United Kingdom'
school.postcode = 'B12 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'NQ'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Sheffield'
school.address_1 = '8089 Corben Circle'
school.address_2 = 'Liverpool'
school.country = 'United Kingdom'
school.postcode = 'L74 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Avaveo'
job.address_1 = '7547 Huxley Way'
job.address_2 = 'Whitchurch'
job.postcode = 'BS14'
job.country = 'United Kingdom'
job.job_title = 'VP Accounting'
job.duties = 'User-centric 5th generation circuit'
job.start_date = Date.parse('2010-10-08')
job.end_date = Date.parse('2014-04-06')
job.save! validate: false

job = Job.new application: app
job.employer = 'Voonte'
job.address_1 = '559 Talisman Crossing'
job.address_2 = 'Bristol'
job.postcode = 'BS41'
job.country = 'United Kingdom'
job.job_title = 'Web Developer I'
job.duties = 'Reactive heuristic superstructure'
job.start_date = Date.parse('2012-06-25')
job.end_date = Date.parse('2016-11-01')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Jesse Boyd'
ref.reference_1_email = 'jboyd16@shop-pro.jp'
ref.reference_1_occupation = 'Mechanical Systems Engineer'
ref.reference_1_address_1 = '07 Bashford Way'
ref.reference_1_address_2 = 'Whitchurch'
ref.reference_1_postcode = 'BS14 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'Exclusive'
ref.reference_1_telephone = '44-(531)807-5964'
ref.reference_2_full_name = 'Fred Martinez'
ref.reference_2_email = 'fmartinez17@lycos.com'
ref.reference_2_occupation = 'Speech Pathologist'
ref.reference_2_address_1 = '8 Anthes '
ref.reference_2_address_2 = 'Preston'
ref.reference_2_postcode = 'PR1 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'leading edge'
ref.reference_2_telephone = '44-(451)545-3693'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 104
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 105
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 41
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 6
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 61
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Jeremy Hill', created_at: '2016-12-12T10:13:56+01:00', updated_at: '2016-12-12T10:13:56+01:00'

app.status = auth
app.save!

student = Student.new
student.first_name = 'Aaron'
student.family_name = 'Chapman'
student.email = 'cchapmanm@naver.com'
student.scottish_candidate_number = '175423036'
student.national_insurance_number = 'NJ932744A'
student.password = 'secret'
student.password_confirmation = 'secret'
student.confirmed_at = DateTime.now
student.save! validate: false

app = student.create_application
app.title = 'Rev'
app.middle_name = 'Charles'
app.gender = :male
app.telephone = '44-(154)162-9552'
app.mobile = '44-(409)676-5213'
app.email = 'cchapmanm@naver.com'
app.personal_statement = 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'
app.permanent_house_number = '25714'
app.permanent_address_1 = 'Pine View Drive'
app.permanent_address_2 = 'Sheffield'
app.permanent_postcode = 'S1 2GR'
app.permanent_country = 'United Kingdom'
app.status = :submitted
app.current_stage = :submit_stage
app.save! validate: false

school = School.new application: app
school.name = 'The Robert Gordon University'
school.address_1 = '937 Bunker Hill Point'
school.address_2 = 'Halton'
school.country = 'United Kingdom'
school.postcode = 'LS9 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'Standard'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'London School of Jewish Studies'
school.address_1 = '99 Claremont Circle'
school.address_2 = 'Whitwell'
school.country = 'United Kingdom'
school.postcode = 'DL10 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

job = Job.new application: app
job.employer = 'Photobean'
job.address_1 = '0 Surrey Pass'
job.address_2 = 'Horton'
job.postcode = 'BS37'
job.country = 'United Kingdom'
job.job_title = 'Occupational Therapist'
job.duties = 'Implemented composite extranet'
job.start_date = Date.parse('2010-06-03')
job.end_date = Date.parse('2014-06-23')
job.save! validate: false

job = Job.new application: app
job.employer = 'Meevee'
job.address_1 = '4 Myrtle Avenue'
job.address_2 = 'Sheffield'
job.postcode = 'S33'
job.country = 'United Kingdom'
job.job_title = 'Senior Quality Engineer'
job.duties = 'Synergistic systematic middleware'
job.start_date = Date.parse('2010-04-21')
job.end_date = Date.parse('2016-08-13')
job.save! validate: false

ref = Reference.new application: app
ref.reference_1_full_name = 'Todd Ramirez'
ref.reference_1_email = 'tramirez18@google.ru'
ref.reference_1_occupation = 'Staff Scientist'
ref.reference_1_address_1 = '432 Summerview '
ref.reference_1_address_2 = 'Liverpool'
ref.reference_1_postcode = 'L33 7QW'
ref.reference_1_country = 'United Kingdom'
ref.reference_1_relationship = 'De-engineered'
ref.reference_1_telephone = '44-(180)296-6706'
ref.reference_2_full_name = 'Charles Peters'
ref.reference_2_email = 'cpeters19@gizmodo.com'
ref.reference_2_occupation = 'Chief Design Engineer'
ref.reference_2_address_1 = '58126 Hoard '
ref.reference_2_address_2 = 'Church End'
ref.reference_2_postcode = 'CB4 3TR'
ref.reference_2_country = 'United Kingdom'
ref.reference_2_relationship = 'Enhanced'
ref.reference_2_telephone = '44-(267)656-2487'
ref.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 24
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 111
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 129
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 107
course.save! validate: false

auth = :payment_failed
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :failed, card_holder: 'Aaron Chapman', created_at: '2017-03-03T10:13:56+01:00', updated_at: '2017-03-03T10:13:56+01:00'
auth = :paid
Payment.create! application: app, payment_type: :paypal, amount: 2000, status: :authorized, card_holder: 'Aaron Chapman', created_at: '2017-03-23T10:13:56+01:00', updated_at: '2017-03-23T10:13:56+01:00'

app.status = auth
app.save!

