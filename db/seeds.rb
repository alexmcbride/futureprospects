# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed students (generate a new SCN with Student.generate_scn)
# john = Student.create first_name: 'John', family_name: 'Smith', email: 'johnsmith@email.com',
#                       scottish_candidate_number: '173515731', national_insurance_number: 'NR672354B',
#                       password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
#
# steve = Student.create first_name: 'Steve', family_name: 'Purchase', email: 'stevepurchase@email.com',
#                        scottish_candidate_number: '172105955', national_insurance_number: 'NR622454B',
#                        password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
#
# gemma = Student.create first_name: 'Gemma', family_name: 'McNiel', email: 'gemmamcniel@email.com',
#                        scottish_candidate_number: '176266201', national_insurance_number: 'NR627454B',
#                        password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now
#
# susan = Student.create first_name: 'Susan', family_name: 'Mitchell', email: 'susanmitchell@email.com',
#                        scottish_candidate_number: '172205100', national_insurance_number: 'NR724454B',
#                        password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now


# Seed colleges
cogc = College.new
cogc.name = 'City of Glasgow College'
cogc.description = 'This is a truly exciting time to join City of Glasgow College.

Since our merger in 2010, we have transformed the delivery of college education in terms of our physical estate, our performance levels and our reach. The quality of our learning and teaching is sector leading and our new twin site super campus development is heralding a new era in college education.

We are in the top two in the UK for WorldSkills and composite overall number one in the Scottish sector for success in student attainment in combined Further and Higher Education.

City of Glasgow College, like Scotland as a nation, is a real melting pot of diversity, equality and excellence. Our innovative approaches to teaching and learning enable personalised development for all our 27,000 students across a range of nearly 2,000 courses from Access Level to Masters.

To date we have delivered 420 modern apprenticeships; 3162 work experience placements; 3467 work-based learning projects and we work directly with 1500 industry partners.

So, whether it’s full-time, part-time or distance learning, we’ll help find you a course that suits you and equips you to succeed.'
cogc.address = 'City Campus
190 Cathedral Street'
cogc.postcode = 'G4 0RF'
cogc.telephone = '0141 375 5555'
cogc.email = 'enquiries@cityofglasgowcollege.ac.uk'
cogc.website = 'https://www.cityofglasgowcollege.ac.uk'
cogc.image = Rails.root.join('app/assets/images/seed_images/college-cogc.jpg').open
cogc.save



kelvin = College.new
kelvin.name = 'Glasgow Kelvin College'
kelvin.description = 'Glasgow Kelvin College is the newest of Glasgow’s three regional further education colleges.  Formed by the merger of John Wheatley, North Glasgow and Stow colleges in November 2013, Glasgow Kelvin has all the expertise, facilities and resources to ensure that students receive a high quality learning experience that will provide them with the skills and knowledge to enable them to compete in today’s challenging jobs market, or to move on to further, more advanced learning.

The range of courses available at Glasgow Kelvin is designed to meet the needs of learners of all ages and all levels of ability from introductory tasters and National Qualifications, through Higher Nationals, right up to degree level qualifications.

We welcome enquiries and applications from individuals from all backgrounds and abilities.  So whatever your plans and career aspirations, Glasgow Kelvin is uniquely positioned to help you achieve your potential and realise your ambitions.  Please take a good look at the exciting range of learning opportunities we have and think about how a course at Glasgow Kelvin could start you on the road to success.'
kelvin.address = '123 Flemington St
Glasgow'
kelvin.postcode = 'G21 4TD'
kelvin.telephone = '0141 630 5000'
kelvin.email = 'info@glasgowkelvin.ac.uk'
kelvin.website = 'http://www.glasgowkelvin.ac.uk/'
kelvin.image = Rails.root.join('app/assets/images/seed_images/college-kelvin.jpg').open
kelvin.save




clyde = College.new
clyde.name = 'Glasgow Clyde College'
clyde.description = 'Glasgow Clyde College is one of the largest further education institutions in Scotland.

Situated in the thriving city of Glasgow, the multi-campus college offers a wide array of educational and career opportunities across its three locations. Sites are conveniently located across the expanse of the city, composed of three key campuses - Anniesland, Cardonald and Langside - following the merger of each individual college in August, 2013.

Glasgow Clyde College is assigned to the Glasgow Colleges\' Regional Board.

**Why Glasgow Clyde College?**

Today, Glasgow Clyde College is home to over 7,000 full-time students and 20,000 part-time students. Join us and benefit from years of industry experience and exceptional teaching standards, all delivered in modern facilities.

Whether you are looking to return to education, enhance your professional skills or take up a new hobby, our innovative student-led approach means you’ll walk away equipped with not just the knowledge needed to reach your objectives, but the essential life skills needed to thrive in the real world.

We’re champions of developing the local and national economy, so no matter your goals, our experienced teaching staff will be on hand to help you succeed, whether it’s taking your first steps into a new career, or overcoming your own personal challenges. Glasgow Clyde College sees your potential.

We understand in a modern-day world real experience is critical to career progression. That’s why we’ll help you to gain practical hands-on experience through our exclusive employer partnerships and mentorship from industry experts.'
clyde.address = 'Anniesland Campus
Hatfield Drive
Glasgow'
clyde.postcode = 'G12 0YE'
clyde.telephone = '0141 272 9000'
clyde.email = 'admissions@slc.ac.uk'
clyde.website = 'http://www.glasgowclyde.ac.uk'
clyde.image = Rails.root.join('app/assets/images/seed_images/college-clyde.jpg').open
clyde.save



lanark = College.new
lanark.name = 'South Lanarkshire College'
lanark.description = 'SLC is a bright, modern and forward thinking college where we put our students and partners at the heart of everything we do. At our state-of-the-art campus in East Kilbride we offer excellent programmes in outstanding facilities, delivered by well qualified, highly trained staff. We collaborate with employers and local businesses to make sure that we provide relevant, up-to-date courses that are really of benefit to our students when they go out into the world of work.

We have a fantastic portfolio of courses across a variety of different areas which can be studied on a full time, part time, day release and evening basis so there’s something to suit everyone. Of course, if there’s anything we can advise you on please get in touch and we’ll be happy to help.

We really believe that now is your time to be successful and we’re looking forward to working with you to help you achieve your goals. For many of our students, success in their chosen course of study means an assured future in employment or higher education. We hope that you’ll join us and open the door to a brighter future for you.'
lanark.address = 'Scottish Enterprise Technology Park
College Way
East Kilbride'
lanark.postcode = 'G75 0NE'
lanark.telephone = '01355 807780'
lanark.email = 'info@glasgowclyde.ac.uk'
lanark.website = 'http://www.south-lanarkshire-college.ac.uk'
lanark.image = Rails.root.join('app/assets/images/seed_images/college-lanark.jpg').open
lanark.save





west = College.new
west.name = 'West College Scotland'
west.description = 'West College Scotland is modern, ambitious and innovative.

Created on 1 August 2013 by the merger of Clydebank College, Reid Kerr College in Paisley and James Watt College in Greenock, the College has 30,000 students and 1,200 staff, making it one of the biggest educational institutions in the country.

This large scale allows us to provide greater choice to students, better facilities and enhanced services.

We play a key role in supporting our local communities, providing courses to more than 3,000 senior-phase school pupils in College, in school and online.

We also provide training for a huge range of business partners, from small- and medium-sized local companies to some of the biggest companies in the world.

And we are also an enterprising college, with partners from across the globe, including China, Vietnam, Finland and Brazil.

We offer a huge range of courses – full-time, part-time, evening and distance learning -- all designed to help our students get a job, keep a job or get a better job and to help businesses with their training needs.

So, please have a look at what’s on offer.'
west.address = 'Clydebank Campus
Queens\' Quay'
west.postcode = 'G81 1BF'
west.telephone = '0300 600 60 60'
west.email = 'info@wcs.ac.uk'
west.website = 'http://www.westcollegescotland.ac.uk'
west.image = Rails.root.join('app/assets/images/seed_images/college-west.jpg').open
west.save





# Seed categories
category_names = 'Accounting
Administration, Human Resources & Law
Applied Computing & Digital Technologies
Built Environment
Business & Procurement
Construction Crafts
Design Crafts & Graphic Arts
Drama & Creative Writing
Engineering, Energy & Gas
English as a Second Language (ESOL)
Fine Arts & Photography
First Aid, Hygiene & Safety
Food, Events, Hospitality & Tourism
Hair & Beauty
Health, Social Care & Early Education
Languages
Licensing & Security
Marketing & Retail
Media
Nautical Studies & Marine Engineering
Social Sciences
Sport & Fitness
Teacher and Training Development
Trade Union Education'

# Save categories to DB and store ids in map
categories = {}
category_names.split(/\n/).each do |line|
  category = Category.create name: line
  categories[line] = category.id
end

def course_spaces
  [15, 30, 45, 60].sample
end

# Seed courses
course = Course.new
course.category_id = categories['Accounting']
course.college = cogc
course.title = 'Accounting HNC'
course.description = 'The HNC Accounting Award has been designed to meet the demands and requirements of the Accounting Industry.

Opportunities are provided to develop your skills, knowledge and understanding in preparation for employment, or for progression to courses such as AAT level 8, or HND Accounting.

You\'ll be assessed throughout this course with the assessments taking the form of practical assessments, assignment and case studies. Towards the end of your course you\'ll undertake a Graded Unit examination, which is designed to assess your ability to integrate the knowledge and skills gained through the mandatory units.

Throughout the course you\'ll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience.

You\'ll be required to attend college on 4 days every week from 9 am to 5 pm for one academic year.

The course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements = "* One relevant\* Higher at grade C or above; OR
* Three relevant National 5 courses at grade A; OR
* Successful completion of an NC/NQ\*\* containing more than one unit at SCQF level 6; OR
* Relevant work experience will be considered where employer referee details have been supplied.
* Equivalent qualifications will be considered.

Qualifications cannot include any from the following list: *Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL*.

\*\*Internal applicants must complete all 16 credits undertaken in the NC qualification.

You'll be invited to attend a compulsory interview. The interview dates are:

* Thursday 30 March 2017 at 9.30 am
* Thursday 27 April 2017 at 1.30 pm

The interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You'll be given the opportunity to ask questions. You must bring a copy of qualification certificates."
course.career_prospects = 'This course prepares you for a career in:

* Bookkeeping.
* Financial and/or Management Accounting.
* Accounts Technician.
* Assistant Accountant.
* Accounts Supervisor.
* Financial Reporting.
* Taxation.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 7'
course.image = Rails.root.join('app/assets/images/seed_images/accounting-hnc.jpg').open
course.spaces = course_spaces
course.save!







course = Course.new
course.category_id = categories['Accounting']
course.college = cogc
course.title = 'Accounting NC'
course.description = 'This course provides an introduction to both Financial and Management Accounting and gives sufficient training in accounting procedures and techniques to enable you to progress further academically, or to be equipped sufficiently to attempt clerical level types of employment in an accounting environment.

You\'ll be assessed continuously throughout this course with the assessments taking the form of practical assessments, assignment and case studies. There is no final examination.

You\'ll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience.

You\'ll be required to attend college on 4 days every week from 9 am to 5 pm for one academic year.
This course is placed on the Scottish Credit Qualifications Framework at Level 5/6. For more information on the framework visit www.scqf.org.uk/the-framework/.'
course.entry_requirements = '* Three relevant\* courses at National 4 and National 5\*\* level at grade C or above, or equivalent qualifications;
* Relevant work experience will be considered where employer referee details have been supplied.

*\*Qualifications can include a maximum of one from the following list: Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL.*

*\*\* A minimum of one qualification must be at National 5 level.*

You\'ll be invited to attend a compulsory interview. The interview dates are:

* Thursday 23 March 2017 at  4.15 pm
* Tuesday 25 April 2017 at  4.15 pm

The interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You\'ll be given the opportunity to ask questions. You must bring a copy of qualification certificates.'
course.career_prospects = 'You can apply for administrative, or technical level employment in accounting, or business.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 5'
course.image = Rails.root.join('app/assets/images/seed_images/accounting-nc.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Accounting']
course.college = cogc
course.title = 'Accounting HND'
course.description = 'The HND Accounting Award has been designed to meet the demands and requirements of the accounting industry. Opportunities are provided to develop your skills, knowledge and understanding in preparation for employment or for progression to further study at university, or for courses run by professional accounting organisations like ACCA, CIPFA and CIMA.

You\'ll be assessed throughout this course with the assessments taking the form of practical assessments, assignment and case studies. Towards the end of the first year of the course you\'ll undertake a Graded Unit examination, which is designed to assess your ability to integrate the knowledge and skills gained through the mandatory units. There are a further 2 Graded Units in the second year of the HND – a project based Graded Unit and a Graded Unit examination.

Throughout the course you\'ll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience.

You\'ll be required to attend college on 4 days every week from 9 am to 5 pm for two academic years.

This course accepts year two direct entrants only for applicants who have already attained HNC Accounting.

The course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements = "**Year One**

* Two relevant\* Highers at grade C or above; OR
* Successful completion of an NC/NQ\*\* with a minimum of 2 units at SCQF level 6; OR
* Relevant work experience will be considered where employer referee details have been supplied.
* Equivalent qualifications will be considered.

*\*Qualifications cannot include any from the following list: Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL.*

*\*\*Internal applicants must complete all 16 credits undertaken in the NC qualification.*

**Year 2**

* Successful completion of a full time HNC Accounting course with 15 credits, with a Grade A in the graded unit and all mandatory units, OR
* Successful completion of a part time HNC Accounting course with 12 credits, with a Grade A in the graded unit and all mandatory units.

Applications for HND Accounting year 2 will not be processed until June 2017.

You'll be invited to attend a compulsory interview. The interview dates are:

* Thursday 30 March 2017 at 1.30pm
* Thursday 27 April 2017 at 9.30am

The interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You will be given the opportunity to ask questions. You must bring a copy of qualification certificates."
course.career_prospects = 'This course prepares you for a career in:

* Bookkeeping.
* Financial and/or Management Accounting.
* Accounts Technician.
* Assistant Accountant.
* Accounts Supervisor.
* Financial Reporting.
* Management Accounting.
* Taxation.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/accounting-hnd.jpg').open
course.spaces = course_spaces
course.save!




course = Course.new
course.category_id = categories['Administration, Human Resources & Law']
course.college = cogc
course.title = 'Administration and Information Technology HNC'
course.description = "This course will provide you with a broad range of office-based skills and knowledge required for a career in office administration. This is a challenging course, where you'll develop specialist skills in IT, desktop publishing, communication, research and planning.

Your stimulating programme will be delivered by our highly professional teaching staff with significant experience in office administration and a proven track record of bringing out the best in their students.

This course accepts year two direct entrants (you must have a completed HNC Administration, please see further information in direct entry section)

This course is placed on the Scottish Credit Qualifications Framework at Level 7 (year 1) and Level 8 (year 2).  For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements ="* Two Highers in a relevant\* academic subject OR
* Relevant Work experience may be considered.

\* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.

You'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course.career_prospects = "This course prepares you for a career as a Personal Assistant or Administrator in both the public and private sector. The HND can provide progression into employment in a general administrative role within small to medium enterprises. It'll also provide opportunities to develop the skills and knowledge required for more specialist posts demanded by larger organisations.

The qualification will allow you to develop:

* Technical and administrative knowledge relevant to current practice.
* Interpersonal skills relevant to an administrative role.
* Personal effectiveness.
* Communication.
* Presentation techniques."
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/admin-hnc.jpg').open
course.spaces = course_spaces
course.save!




course = Course.new
course.category_id = categories['Administration, Human Resources & Law']
course.college = cogc
course.title = 'Legal Services HND (Year 2)'
course.description = "The course is recommended for you if you're planning a professional career in the legal field, progressing to study law in depth following the HND, or if you might be interested in consolidating your career in a related field.

The course will consist of lectures, tutorials, practical based tasks such as mock trials and the presentation of evidence under court conditions. You'll consider numerous common aspects of life and how the law affects individuals every day when facing problems in business, relationships, employment and the courts.

Emphasis is placed on developing both your academic and vocational skills to equip you to progress into employment or further study. You'll be introduced to notions of equality, society, discrimination, prejudice and the rule of law.

The HND in Legal services is an excellent foundation course in law which provides a recognised professional qualification for an application to enter the Scottish paralegal profession.

The course is full-time covering at least 4 days per week and addresses a broad range of legal topics including business law, private and public law, employment law, criminal law, Sheriff Court procedure and corporate law.

This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Legal Services; OR
* First year HND Legal Services.

You'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = 'On successful completion of your HND you may enter a related field, working as a trainee paralegal or as part of an in-house legal team. You can find employment with local authorities, the Sheriff Court, or Procurator Fiscal office.

There are also opportunities for you in the Banking and Insurance Sectors, and a number of graduates have joined Police Scotland.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/legal-hnd.jpg').open
course.spaces = course_spaces
course.save!




course = Course.new
course.category_id = categories['Administration, Human Resources & Law']
course.college = cogc
course.title = 'Administration NC'
course.description = "This course gives you the skills and knowledge required for making the first step into a career in administration in a business environment (please see the \"What you Study\" section, below, to find out more).

You'll be taught by highly qualified lecturers who have a wealth of experience within the industry. Assessments during the course are ongoing and involve theory and practical based elements.

After successful completion of the course, you'll be awarded with an NC Administration. This course is placed on the Scottish Credit Qualifications Framework at Level 5. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Three or more National 4 qualifications and a minimum of 1 National 5 qualification in a relevant subject (or equivalent qualifications)
* Relevant work experience will be considered

Relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.

You'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course.career_prospects = 'This course prepares you for a career in administration in a range of businesses.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 5'
course.image = Rails.root.join('app/assets/images/seed_images/admin-digital-hnc.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Applied Computing & Digital Technologies']
course.college = cogc
course.title = 'Information Technology HNC'
course.description = 'This computing course provides the entry level knowledge and IT skills you need to work in computing. The course will provide you with an opportunity to undertake a variety of practical and theoretical activities and assessments, which will prepare you for higher learning, or entry into the job market.

If you successfully complete the course, you can apply for entry to the second year HND program where you\'ll have the opportunity to further enhance your knowledge and skills by building e-commerce applications using the Microsoft.Net framework and undertaking the Industry recognised Oracle Database Design and Programming vendor qualification.

This course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements = '* One appropriate Higher and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR
* One Higher and three Standard Grades at Credit level; OR
* One Higher and three National 5 qualifications; OR
* A national qualification at SCQF Level 5/6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR
* Other equivalent qualifications or experience.

You\'ll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject.'
course.career_prospects = 'The course will develop your core and employability skills and make you more attractive to prospective employers.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 7'
course.image = Rails.root.join('app/assets/images/seed_images/info-tech-hnc.jpg').open
course.spaces = course_spaces
course.save!








course = Course.new
course.category_id = categories['Applied Computing & Digital Technologies']
course.college = cogc
course.title = 'Information Technology HND'
course.description = 'The HND Information Technology computing qualification is designed to give you a solid technical understanding of information systems and technologies used by both small and large scale businesses.

You\'ll gain an understanding of how data is transformed into usable information through the theory and practice of relational database technologies. You\'ll also undertake units in web design and development, e-commerce, applications programming, operating systems and project management.

As part of the second year program you\'ll also undertake the Oracle Database Design and Programming using SQL vendor qualification, which is a worldwide recognised qualification that prepares the student to undertake external Oracle exams.

This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements='* Two Higher and three Standard Grades at Credit level (including Computing or Information Systems); OR
* Two Higher and three National 5 level qualifications (including Computing or Information Systems); OR
* A national qualification at SCQF Level 6 in a related subject such as Digital Media Computing, NQ Computing.

You\'ll be invited for a group and/or individual interview where you can find out more about the course and tell us why you\'re interested in this subject.'
course.career_prospects = 'After completing the HND you may pursue a career in business intelligence analysis, information management, database administration, trainer/teacher, hardware and software support, or web development.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/info-tech-hnd.jpg').open
course.spaces = course_spaces
course.save!







course = Course.new
course.category_id = categories['Applied Computing & Digital Technologies']
course.college = cogc
course.title = 'Web Development HND'
course.description = 'On this two year course, you\'ll gain skills to start or advance a career as a web designer/developer. You\'ll learn to build both static and dynamic websites that deliver content in a variety of formats for computers, smartphones and tablets. You\'ll have access to current smartphones and tablets for testing your responsive websites.

Beginning with the fundamentals of website development, you\'ll build on a foundation of client side technologies (HTML5, CSS and web optimisation) through to more advanced study on JavaScript and CSS3 animation.

Year 2 explores these subjects in more detail and introduces current web development technologies such as portable Apache server, PHP, MYSQL and XML. You\'ll understand how to create databases and how to deliver database content to web interface components.

The course also provides opportunities to use industry standard reusable web templates where you\'ll develop platform/browser compliant and consistent web based content. Currently we use Bootstrap for responsive web design. Content Management Systems such as WordPress are also explored as a means to deliver content.

The course introduces both client and server side technologies with opportunities to prepare and develop web interfaces and multimedia rich content incorporating Photoshop and Illustrator and a range of other Adobe products. The faculty has access to the full Adobe suite which can be utilised to produce creative and engaging media content for inclusion within your websites.

This course is designed to prepare you for progression to University or employment as a web developer/ designer at junior level.

This course may incorporate live industry related web development projects. You may gain internships and real live external work whilst studying at the college.

The course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements='* Two Higher and three Intermediate 2 courses (including Computing, Graphic Design or Information Systems); OR
* Two Higher and three Standard Grades at Credit level or above (including Computing, Graphic Design or Information Systems); OR
* Two Higher and three National 5 qualifications or above (including Computing, Graphic Design or Information Systems); OR
* A national qualification at SCQF Level 5 or 6 in a related subject such as Digital Media Computing, NQ Computing,  Computing: Technical Support or Software Development.

You\'ll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you\'re interested in this subject area. It is important that you prepare a personal statement which reflects your desire to study on this course.'
course.career_prospects = 'Apply for various job vacancies, such as a junior web developer/designer.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/web-dev-hnd.jpg').open
course.spaces = course_spaces
course.save!





#Built Environment
course = Course.new
course.category_id = categories['Built Environment']
course.college = cogc
course.title = 'Architectural Technology HND'
course.description = "This course gives you a technician level qualification, combining a broad first year curriculum with a specialist second year curriculum. It'll give you the skills required for employment in this high demand industry sector.

You'll also have the opportunity to go on site visits around the West of Scotland, to give you an understanding of contemporary relevance.

This is a two-year HND which accepts direct entrants to year two.

This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements="**Year one**

* Two Higher Grade passes, preferably including Mathematics or a science, OR
* A National Certificate in Built Environment or equivalent qualification at SCQF level 6, OR
* Relevant experience and the ability to show the commitment and capacity required to cope with the academic content of the course.

**Year two**

* HNC in Construction.

It may also be possible to gain entry with an HNC in Architectural Technology. This will depend on the units that have been covered in the HNC. Students who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.

You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = 'This course prepares you for a career as an Architectural Technician, or Architectural Technologist in a variety of sectors including:

* Built Environment.
* Construction.
* Property.
* Private consultant practices (architects and surveyors).
* Design and build services divisions of construction contractors.
* Local authorities.
* Health trusts.
* Housing associations.
* Building component manufacturers.
* Government organisations.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/archi-tech-hnd.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Built Environment']
course.college = cogc
course.title = 'Built Environment NC'
course.description = "Would you like to work in the construction industry in roles such as a Quantity surveying or Architectural technician? This stimulating course offers a nationally recognised qualification that prepares you for an entry level technician position in the Construction Industry, or paves the way for further study (read the ‘After The Course” section below to find out more).

Although mainly theory-based, the course offers practical site visits to help you place your learning in context, with opportunities found within Glasgow wherever possible. During the course you'll receive all the basic knowledge and skills you need, delivered by staff with first-hand industry experience.

This means that the NC Built Environment course is a great launch pad for a career in the Construction Industry as well as an ideal starting point if you:

Want to build your confidence about engaging in academic learning.
Have previously failed to achieve the results that demonstrate your full potential.
Are returning to learning after a break.
Find useful resources and case studies on the Built Environment Forum Scotland website."
course.entry_requirements="* Relevant group of units or courses at Intermediate Level 1 or 2; OR
* Three Standard Grade passes at Credit Level, preferably with maths, English and a science;OR
* Three National 5 qualifications, preferably with maths, English and a science; OR
* Relevant construction industry experience and the commitment and capacity to cope with the academic content of the course.

You'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = 'This course prepares you for a career as a:

* Quantity surveying technician.
* Building control technician.
* Architectural technician.
* Building technician.
* Building site supervisor.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 6'
course.image = Rails.root.join('app/assets/images/seed_images/built-env-nc.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Built Environment']
course.college = cogc
course.title = 'Quantity Surveying HND'
course.description = "Quantity Surveyors (also known as a Construction Cost Consultants or Commercial Managers) manage all costs relating to building and civil engineering projects, from the early design plans, through to completion. Quantity Surveyors seek to minimise the costs of a project and enhance value, while still achieving the required standards and quality. Many of these are specified by statutory building regulations, which the surveyor needs to understand and adhere to.

The HND in Quantity Surveying is a technician level qualification that combines a construction industry specific first year curriculum with a more specialist second year curriculum that equips you with the skills required for employment in this specialist industry sector.

You'll be taught by staff with significant Construction Industry experience and a proven track record of bringing out the best in their students."
course.entry_requirements="* Two Higher Grade passes, preferably including Mathematics or a Science; OR
* A National Certificate in Built Environment or equivalent qualification at SCQF level 6; OR
* Relevant construction industry experience and the ability to evidence the commitment and capacity required to cope with the academic content of the course.

You'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = 'This course prepares you for a career in private practice QS consultancies, contracting organisations, property companies, financial institutions, local and central government, commercial clients, and housing associations.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/build-surv-hnd.jpg').open
course.spaces = course_spaces
course.save!



course = Course.new
course.category_id = categories['Business & Procurement']
course.college = cogc
course.title = 'Business HNC'
course.description = "Are you looking for a career in banking, insurance, civil service, local government or distribution? This course gives you the skills and knowledge necessary to succeed, with excellent career opportunities and progression routes.

You'll be taught by staff with relevant industry experience and a proven track record of bringing out the best in their students.

Today, the internet is an important part of business, so we've updated the course to include analysing and using information for strategic purposes.

This course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements="* One Higher pass in a relevant\* academic subject OR
* National Certificate in Business (with at least 3 units at level 6) OR
* Other appropriate and relevant National Certificate courses (with at least 3 units at level 6) may be considered.
* Relevant Work experience may be considered.

\*Relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.

You'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course.career_prospects = 'You could expect to apply for a trainee management position and/or a team leader in industry or commerce.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 7'
course.image = Rails.root.join('app/assets/images/seed_images/business-hnc.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Business & Procurement']
course.college = cogc
course.title = 'Supply Chain Management HND'
course.description = "This course will provide you with the knowledge and skills you need to work within the operational supply chains of a business organisation.

The course is delivered by highly qualified lecturers who have a wealth of experience within the industry. You'll gain insight, learning and transferable skills across all core operational areas of supply chain management, procurement, logistics, storage and operations.

Career prospects and employment opportunities are excellent with many of our students progressing to degree level study and careers within supply chain management or international logistics.

This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework: visit www.scqf.org.uk/the-framework/."
course.entry_requirements="* Two Higher Grade passes at grade C or above including English (Modern Studies, Economics, History or Business); OR
* Adult learners with some relevant experience, or who hope to move into this area, may be accepted subject to interview.

You'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = 'This course prepares you for a career in supply chain management, procurement, and international Logistics across all  major industry sectors'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/supply-chain-hnd.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Business & Procurement']
course.college = cogc
course.title = 'Business Diploma of Higher Education'
course.description = 'This course is designed to give you direct entry into the third year of the BA degree programme in Business at Strathclyde Business School, a qualification highly regarded by employers. It is run as a collaboration between City of Glasgow College and the University of Strathclyde, Glasgow.

This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements="* A minimum of three Higher Grade passes, 2 at Grade B and 1 at grade C in suitable academic subjects\*, one of which must be English (or equivalent).  AND
* Two other passes at National 5 (or equivalent) including Mathematics.

\*Relevant academic subjects include Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or Natural Sciences.

You'll be invited to attend a group presentation and interview session. The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course.career_prospects = 'This course prepares you for a career in marketing, legal services, management, human resources, administration in industrial and commercial sectors, teaching, public sector employment or research.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/buisness-diplo.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Construction Crafts']
course.college = cogc
course.title = 'Construction Crafts NQ'
course.description = 'This course offers you practical, transferable skills and theoretical knowledge of the Construction Industry to help you find a job.

This course is placed on the Scottish Credit Qualifications Framework at Level 6. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements="* One National 5 qualification; OR
* Completion of NPA Construction course.

You'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in the subject."
course.career_prospects = 'This course prepares you for a career within the Construction Industry.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 6'
course.image = Rails.root.join('app/assets/images/seed_images/con-craft-nq.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Construction Crafts']
course.college = cogc
course.title = 'Carpentry and Joinery City and Guilds'
course.description = 'This course is suited to those who have previous experience in Carpentry and Joinery and would like to develop their skills further.

The course runs for 6 months from January - June.

On successful completion of this course candidates will receive a Diploma in Painting and Decorating at SCQF Level 5.'
course.entry_requirements='* City and Guilds Diploma in Carpentry and Joinery at SCQF Level 4 or equivalent; OR
* Relevant qualifications at National 4 (technical); OR
* Relevant industrial experience.

You will be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject.'
course.career_prospects = 'On successful completion of the course learners will be better placed to progress to a career in the construction industry.'
course.start_date = Date.new 2018, 1, 8
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 5'
course.image = Rails.root.join('app/assets/images/seed_images/car-join-cag.jpg').open
course.spaces = course_spaces
course.save!




course = Course.new
course.category_id = categories['Construction Crafts']
course.college = cogc
course.title = 'Painting and Decorating City and Guilds'
course.description = 'This course is suited to those who have previous experience in painting and decorating and would like to develop their skills further.

On successful completion of this course candidates will receive a Diploma in Painting and Decorating at SCQF Level 5.

This course runs for 6 months from January - June.'
course.entry_requirements='* City and Guilds Diploma in Painting and Decorating at SCQF Level 4 or equivalent; OR
* Relevant qualifications at National 4 (technical); OR
* Relevant industrial experience.

You will be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject.'
course.career_prospects = 'On successful completion of the course learners will be better placed to progress to a career in the construction industry.'
course.start_date = Date.new 2018, 1, 8
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 5'
course.image = Rails.root.join('app/assets/images/seed_images/paint-dec-cag.jpg').open
course.spaces = course_spaces
course.save!





course = Course.new
course.category_id = categories['Design Crafts & Graphic Arts']
course.college = cogc
course.title = '3D Design: Interior Design HND'
course.description = "This course will enable you to develop the creative, analytical and technical skills for a career in interior design. It's a two year course that can lead to direct entry to the third year of a degree programme.

This course also accepts year two direct entrants.

The course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements="* NC Interior Design or related subject, OR
* Higher Art and Design, and English at minimum Intermediate 2, OR
* Higher Art and Design, and English at National 5 level.

You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = 'This course may lead to a variety of careers in interior design and architectural practices, such as space planning, property development – shop and office fitting, and museum and exhibition design.

Continuing Study

After successfully completing the HND course, you can apply for direct entry to 3rd year BA (Hons) Interior Design program at a choice of universities such as: Glasgow School of Art, Edinburgh College of Art, Duncan of Jordonstone College of Art or Heriot Watt University.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/art-and-design-nc.jpg').open
course.spaces = course_spaces
course.save!




course = Course.new
course.category_id = categories['Design Crafts & Graphic Arts']
course.college = cogc
course.title = 'Art and Design: Interior Design NC'
course.description = "This course offers you an ideal first step into the Interior Design Industry, providing you with the theoretical and practical knowledge and skills required to begin your career journey.

You'll learn the knowledge and skills necessary to work on projects - from initial conceptual ideas to a fully functional interior design scheme you could present to a commercial client (please see further information in the 'what you study' section below).

Your programme will be delivered by our highly professional teaching staff with significant Interior Design experience and a proven track record of bringing out the best in their students.

This course is placed on the Scottish Credit Qualifications Framework at Level 6. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements='* Two Standard Grades at Credit Level in Art and Design and English; OR
* Two National 5 qualifications in Art and Design and English.

* Two Standard Grades at Credit Level in Art and Design, and English; OR
* Two National 5 qualifications in Art and Design, and English.'
course.career_prospects = 'You could work in interior design in retail outlets, space planning consultants or property development where an HND or degree is not essential.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 6'
course.image = Rails.root.join('app/assets/images/seed_images/ed-interior-hnd.jpg').open
course.spaces = course_spaces
course.save!



course = Course.new
course.category_id = categories['Design Crafts & Graphic Arts']
course.college = cogc
course.title = '3D Design: Model Making for the Creative Industries HND (Year 2)'
course.description = 'This course will help you develop multiple skills and knowledge of materials and processes relevant to the Model Making Industry, whether for film/TV props, miniatures, prototyping, engineering, architecture, or exhibition models.

As part of the course, previous students have had the opportunity to work with live clients throughout the UK and Europe and have made industry visits to London, Liverpool, Manchester, Barcelona and beyond.

This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements="* HNC 3D Design: Model Making for the Creative Industries; OR
* First year HND 3D Design: Model Making for the Creative Industries.

You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you're asked to bring your best examples of both 2D and 3D art and design work, in original, photographic or portfolio form."
course.career_prospects = 'Many graduates work as model makers all over the world, including New Zealand, Dubai and Australia.

Previous students have gone directly into second year at university to study Model Making Design and a range of related courses at BA (Hons) level.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/3d-model-hnd-y2.jpg').open
course.spaces = course_spaces
course.save!


#Drama & Creative Writing
course = Course.new
course.category_id = categories['Drama & Creative Writing']
course.college = cogc
course.title = 'Creative Industries: Professional Writing Skills HNC'
course.description = "This course is for you, if you are looking for a career in writing. It will help you to develop the skills you'll need to work in a variety of fields. We cover scripting for TV and radio, short story writing, poetry and journalism, as well as vital freelance skills and industry knowledge.

This stimulating, learner-focused course is delivered by highly professional teaching staff, with significant Communications Industry experience and a proven track record of bringing out the best in their students.

Previous students on this course have had scripts produced, novels and poetry published, or worked professionally in a range of relevant disciplines. Others have gone on to complete degree and postgraduate courses.

This course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements="* A Higher in English at minimum B or above or relevant group of units (e.g. Literature 1, Communication 4); OR
* Relevant experience.

You'll be invited for a group pre-entry guidance session and individual interview where you can find out more about the course and tell us why you are interested in this subject.

At interview you'll be asked to write a short factual piece and provide a folio of three or four typed pieces of work. This may include poetry collections, short stories or prose extracts, script extracts, or journalism articles.

Please note that school essays are not suitable."
course.career_prospects = 'This course prepares you for a career in creative writing, freelance writing, journalism, script editing, scriptwriting or broadcasting. Previous students have gone on to work in publishing, script tutoring, ghost writing, and speech writing.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 7'
course.image = Rails.root.join('app/assets/images/seed_images/creative-writing-hnc.jpg').open
course.spaces = course_spaces
course.save!



course = Course.new
course.category_id = categories['Drama & Creative Writing']
course.college = cogc
course.title = 'Creative Industries: Radio HND (Year 2)'
course.description = "This course builds on the skills you developed in the HNC. The focus is still on programme making, but goes beyond radio and develops a more sophisticated skillset – technical, production and creative. This course is an excellent opportunity for you to study and train for a career in radio production, with excellent career opportunities and progression routes.

The course is delivered by highly qualified lecturers who have a wealth of experience within the radio industry and have well established industry contacts.

After successful completion of the course, you'll be awarded with an HND Creative Industries: Radio.

This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements='* HNC Creative Industries: Radio, including A or B in graded unit one.'
course.career_prospects = 'There are opportunities in radio for those with a variety of up to date skills, broadcasting knowledge and experience.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
course.image = Rails.root.join('app/assets/images/seed_images/radio-hnd.jpg').open
course.spaces = course_spaces
course.save!




course = Course.new
course.category_id = categories['Drama & Creative Writing']
course.college = cogc
course.title = 'Acting and Performance HNC'
course.description = "This course develops the skills you require for acting and performance. It is designed to focus on the practical skills required by the actor, while also supporting the practical experiences with knowledge of theatre and performance.

This creative, learner-focused course is delivered by highly professional teaching staff, with significant acting and performance experience and a proven track record of bringing out the best in their students.

On completion of the course, you'll be awarded a HNC Acting and Performance and you may be eligible for direct entry into the second year of HND Acting and Performance.

This course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements="* Two Higher Grades, including English; OR
* NQ Drama; OR
* Equivalent qualification.

You'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject.

If your application is successful, you'll also be asked to audition where you will perform a monologue."
course.career_prospects = 'There are a wide range of career opportunities which include working in theatre, television, community drama, and theatre production.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 7'
course.image = Rails.root.join('app/assets/images/seed_images/performance-hnc.jpg').open
course.spaces = course_spaces
course.save!



# STUDENTS

student1 = Student.new
student1.first_name = 'Mary'
student1.family_name = 'Morrison'
student1.email = 'vmorrison0@merriam-webster.com'
student1.scottish_candidate_number = '171402573'
student1.national_insurance_number = 'NJ170278A'
student1.password = 'secret'
student1.password_confirmation = 'secret'
student1.confirmed_at = DateTime.now
student1.save!

app1 = student1.create_application
app1.title = 'Mrs'
app1.middle_name = 'Virginia'
app1.gender = :female
app1.telephone = '44-(435)280-3879'
app1.mobile = '44-(889)134-2200'
app1.email = 'vmorrison0@merriam-webster.com'
app1.personal_statement = 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
app1.permanent_house_number = '5'
app1.permanent_address_1 = 'Sachs Way'
app1.permanent_address_2 = 'Twyford'
app1.permanent_postcode = 'LE14 2GR'
app1.permanent_country = 'United Kingdom'
app1.correspondence_house_number = '6'
app1.correspondence_address_1 = 'Stang Park'
app1.correspondence_address_2 = 'Mrs'
app1.correspondence_postcode = 'OX7 2GR'
app1.correspondence_country = 'United Kingdom'
app1.state = :completed
app1.save!

school1 = School.new application: app1
school1.name = 'Falmouth University'
school1.address_1 = '6 Loftsgordon Plaza'
school1.address_2 = 'Denton'
school1.country = 'United Kingdom'
school1.postcode = 'M34 3FB'
school1.save!

qualification1 = Qualification.new school: school1
qualification1.subject = 'Computing'
qualification1.award = 'Standard'
qualification1.grade = 'B'
qualification1.start_date = Date.new(2013, 8, 23)
qualification1.end_date = Date.new(2014, 6, 8)
qualification1.save!

qualification2 = Qualification.new school: school1
qualification2.subject = 'Art'
qualification2.award = 'HNC'
qualification2.grade = 'Pass'
qualification2.start_date = Date.new(2014, 8, 23)
qualification2.end_date = Date.new(2014, 6, 8)
qualification2.save!

qualification3 = Qualification.new school: school1
qualification3.subject = 'Geography'
qualification3.award = 'HNC'
qualification3.grade = 'A'
qualification3.start_date = Date.new(2015, 8, 23)
qualification3.end_date = Date.new(2015, 6, 8)
qualification3.save!

school2 = School.new application: app1
school2.name = 'Oxford Brookes University'
school2.address_1 = '291 Northland Parkway'
school2.address_2 = 'London'
school2.country = 'United Kingdom'
school2.postcode = 'SW1E 3FB'
school2.save!

qualification4 = Qualification.new school: school2
qualification4.subject = 'Chemistry'
qualification4.award = 'Higher'
qualification4.grade = 'C'
qualification4.start_date = Date.new(2015, 8, 23)
qualification4.end_date = Date.new(2014, 6, 8)
qualification4.save!

qualification5 = Qualification.new school: school2
qualification5.subject = 'PE'
qualification5.award = 'Higher'
qualification5.grade = 'B'
qualification5.start_date = Date.new(2013, 8, 23)
qualification5.end_date = Date.new(2014, 6, 8)
qualification5.save!

qualification6 = Qualification.new school: school2
qualification6.subject = 'Woodworking'
qualification6.award = 'HNC'
qualification6.grade = 'B'
qualification6.start_date = Date.new(2015, 8, 23)
qualification6.end_date = Date.new(2016, 6, 8)
qualification6.save!

job1 = Job.new application: app1
job1.employer = 'Cogibox'
job1.address_1 = '0 Clyde Gallagher Place'
job1.address_2 = 'London'
job1.postcode = 'SW1E'
job1.country = 'United Kingdom'
job1.job_title = 'Social Worker'
job1.duties = 'De-engineered intermediate model'
job1.start_date = Date.parse('2012-07-02')
job1.end_date = Date.parse('2015-03-14')
job1.save!

job2 = Job.new application: app1
job2.employer = 'Meemm'
job2.address_1 = '0 Claremont Terrace'
job2.address_2 = 'Milton'
job2.postcode = 'AB56'
job2.country = 'United Kingdom'
job2.job_title = 'Structural Engineer'
job2.duties = 'Future-proofed tangible synergy'
job2.start_date = Date.parse('2011-06-14')
job2.end_date = Date.parse('2013-04-16')
job2.save!

ref1 = Reference.new application: app1
ref1.reference_1_full_name = 'Edward George'
ref1.reference_1_email = 'egeorge0@hao123.com'
ref1.reference_1_occupation = 'Executive Secretary'
ref1.reference_1_address_1 = '98 Lukken '
ref1.reference_1_address_2 = 'Belfast'
ref1.reference_1_postcode = 'BT2 7QW'
ref1.reference_1_country = 'United Kingdom'
ref1.reference_1_relationship = 'Face to face'
ref1.reference_1_telephone = '44-(487)436-7779'
ref1.reference_2_full_name = 'Stephen Lane'
ref1.reference_2_email = 'slane1@whitehouse.gov'
ref1.reference_2_occupation = 'Information Systems Manager'
ref1.reference_2_address_1 = '6 8th '
ref1.reference_2_address_2 = 'Leeds'
ref1.reference_2_postcode = 'LS6 3TR'
ref1.reference_2_country = 'United Kingdom'
ref1.reference_2_relationship = 'Adaptive'
ref1.reference_2_telephone = '44-(500)939-8365'
ref1.save!

course1 = CourseSelection.new application_id: app1.id, course_id: 20
course1.save!

course2 = CourseSelection.new application_id: app1.id, course_id: 11
course2.save!

course3 = CourseSelection.new application_id: app1.id, course_id: 19
course3.save!

student2 = Student.new
student2.first_name = 'Brian'
student2.family_name = 'Owens'
student2.email = 'jowens1@altervista.org'
student2.scottish_candidate_number = '177571245'
student2.national_insurance_number = 'NJ241976A'
student2.password = 'secret'
student2.password_confirmation = 'secret'
student2.confirmed_at = DateTime.now
student2.save!

app2 = student2.create_application
app2.title = 'Dr'
app2.middle_name = 'Joseph'
app2.gender = :male
app2.telephone = '44-(792)155-0445'
app2.mobile = '44-(906)773-4423'
app2.email = 'jowens1@altervista.org'
app2.disability = 'Persistent neutral emulation. Sed ante. Vivamus tortor. Duis mattis egestas metus.'
app2.personal_statement = '429'
app2.permanent_house_number = '272'
app2.permanent_address_1 = 'Service Lane'
app2.permanent_postcode = 'LS6 2GR'
app2.permanent_country = 'United Kingdom'
app2.correspondence_house_number = 'Mcbride'
app2.correspondence_address_1 = 'Parkway Leeds'
app2.correspondence_address_2 = 'Dr'
app2.correspondence_postcode = ' 2GR'
app2.correspondence_country = 'SY4'
app2.state = :completed
app2.save!

school3 = School.new application: app2
school3.name = 'Open University'
school3.address_1 = '3065 Mockingbird Trail'
school3.address_2 = 'Upton'
school3.country = 'United Kingdom'
school3.postcode = 'DN21 3FB'
school3.save!

qualification7 = Qualification.new school: school3
qualification7.subject = 'English'
qualification7.award = 'Standard'
qualification7.grade = 'C'
qualification7.start_date = Date.new(2013, 8, 23)
qualification7.end_date = Date.new(2013, 6, 8)
qualification7.save!

qualification8 = Qualification.new school: school3
qualification8.subject = 'Woodworking'
qualification8.award = 'Standard'
qualification8.grade = 'C'
qualification8.start_date = Date.new(2014, 8, 23)
qualification8.end_date = Date.new(2015, 6, 8)
qualification8.save!

qualification9 = Qualification.new school: school3
qualification9.subject = 'Geography'
qualification9.award = 'NQ'
qualification9.grade = 'B'
qualification9.start_date = Date.new(2014, 8, 23)
qualification9.end_date = Date.new(2013, 6, 8)
qualification9.save!

school4 = School.new application: app2
school4.name = 'United Medical and Dental Schools'
school4.address_1 = '7241 Tennyson Avenue'
school4.address_2 = 'Walton'
school4.country = 'United Kingdom'
school4.postcode = 'CV35 3FB'
school4.save!

qualification10 = Qualification.new school: school4
qualification10.subject = 'Physics'
qualification10.award = 'Standard'
qualification10.grade = 'Pass'
qualification10.start_date = Date.new(2014, 8, 23)
qualification10.end_date = Date.new(2013, 6, 8)
qualification10.save!

qualification11 = Qualification.new school: school4
qualification11.subject = 'Biology'
qualification11.award = 'HND'
qualification11.grade = 'Pass'
qualification11.start_date = Date.new(2014, 8, 23)
qualification11.end_date = Date.new(2016, 6, 8)
qualification11.save!

qualification12 = Qualification.new school: school4
qualification12.subject = 'Physics'
qualification12.award = 'HNC'
qualification12.grade = 'A'
qualification12.start_date = Date.new(2015, 8, 23)
qualification12.end_date = Date.new(2013, 6, 8)
qualification12.save!

job3 = Job.new application: app2
job3.employer = 'Jaxnation'
job3.address_1 = '9 Fordem Drive'
job3.address_2 = 'London'
job3.postcode = 'SW1E'
job3.country = 'United Kingdom'
job3.job_title = 'Help Desk Technician'
job3.duties = 'Distributed tertiary analyzer'
job3.start_date = Date.parse('2012-03-18')
job3.end_date = Date.parse('2016-05-09')
job3.save!

job4 = Job.new application: app2
job4.employer = 'Yakijo'
job4.address_1 = '865 Ridgeway Place'
job4.address_2 = 'Buckland'
job4.postcode = 'CT16'
job4.country = 'United Kingdom'
job4.job_title = 'Software Test Engineer II'
job4.duties = 'Synchronised contextually-based framework'
job4.start_date = Date.parse('2012-07-21')
job4.end_date = Date.parse('2016-03-17')
job4.save!

ref3 = Reference.new application: app2
ref3.reference_1_full_name = 'David Edwards'
ref3.reference_1_email = 'dedwards2@yellowbook.com'
ref3.reference_1_occupation = 'Help Desk Operator'
ref3.reference_1_address_1 = '0369 Gateway '
ref3.reference_1_address_2 = 'London'
ref3.reference_1_postcode = 'SW1E 7QW'
ref3.reference_1_country = 'United Kingdom'
ref3.reference_1_relationship = 'artificial intelligence'
ref3.reference_1_telephone = '44-(371)486-4628'
ref3.reference_2_full_name = 'Gerald Rice'
ref3.reference_2_email = 'grice3@latimes.com'
ref3.reference_2_occupation = 'Design Engineer'
ref3.reference_2_address_1 = '401 Portage '
ref3.reference_2_address_2 = 'Whitchurch'
ref3.reference_2_postcode = 'BS14 3TR'
ref3.reference_2_country = 'United Kingdom'
ref3.reference_2_relationship = 'Compatible'
ref3.reference_2_telephone = '44-(323)158-3111'
ref3.save!

course4 = CourseSelection.new application_id: app2.id, course_id: 15
course4.save!

course5 = CourseSelection.new application_id: app2.id, course_id: 20
course5.save!

course6 = CourseSelection.new application_id: app2.id, course_id: 1
course6.save!

student3 = Student.new
student3.first_name = 'Antonio'
student3.family_name = 'Sims'
student3.email = 'bsims2@utexas.edu'
student3.scottish_candidate_number = '179331993'
student3.national_insurance_number = 'NJ859147D'
student3.password = 'secret'
student3.password_confirmation = 'secret'
student3.confirmed_at = DateTime.now
student3.save!

app3 = student3.create_application
app3.title = 'Honorable'
app3.middle_name = 'Brandon'
app3.gender = :male
app3.telephone = '44-(444)545-1963'
app3.mobile = '44-(600)764-3303'
app3.email = 'bsims2@utexas.edu'
app3.personal_statement = 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio elementum eu interdum eu tincidunt in leo. Maecenas pulvinar lobortis est."'
app3.permanent_house_number = '25243'
app3.permanent_address_1 = 'Merchant Terrace'
app3.permanent_postcode = 'GL54 2GR'
app3.permanent_country = 'United Kingdom'
app3.state = :completed
app3.save!

school5 = School.new application: app3
school5.name = 'The Robert Gordon University'
school5.address_1 = '9657 Chive Center'
school5.address_2 = 'Sutton'
school5.country = 'United Kingdom'
school5.postcode = 'RH5 3FB'
school5.save!

qualification13 = Qualification.new school: school5
qualification13.subject = 'Art'
qualification13.award = 'Standard'
qualification13.grade = 'B'
qualification13.start_date = Date.new(2013, 8, 23)
qualification13.end_date = Date.new(2014, 6, 8)
qualification13.save!

qualification14 = Qualification.new school: school5
qualification14.subject = 'Computing'
qualification14.award = 'HND'
qualification14.grade = 'B'
qualification14.start_date = Date.new(2015, 8, 23)
qualification14.end_date = Date.new(2015, 6, 8)
qualification14.save!

qualification15 = Qualification.new school: school5
qualification15.subject = 'Maths'
qualification15.award = 'HND'
qualification15.grade = 'A'
qualification15.start_date = Date.new(2013, 8, 23)
qualification15.end_date = Date.new(2014, 6, 8)
qualification15.save!

school6 = School.new application: app3
school6.name = 'Courtauld Institute of Art'
school6.address_1 = '5411 Badeau Center'
school6.address_2 = 'Linton'
school6.country = 'United Kingdom'
school6.postcode = 'BD23 3FB'
school6.save!

qualification16 = Qualification.new school: school6
qualification16.subject = 'English'
qualification16.award = 'HNC'
qualification16.grade = 'C'
qualification16.start_date = Date.new(2013, 8, 23)
qualification16.end_date = Date.new(2015, 6, 8)
qualification16.save!

qualification17 = Qualification.new school: school6
qualification17.subject = 'Art'
qualification17.award = 'NQ'
qualification17.grade = 'B'
qualification17.start_date = Date.new(2012, 8, 23)
qualification17.end_date = Date.new(2013, 6, 8)
qualification17.save!

qualification18 = Qualification.new school: school6
qualification18.subject = 'English'
qualification18.award = 'Higher'
qualification18.grade = 'A'
qualification18.start_date = Date.new(2015, 8, 23)
qualification18.end_date = Date.new(2016, 6, 8)
qualification18.save!

job5 = Job.new application: app3
job5.employer = 'Trilith'
job5.address_1 = '2087 Gerald Alley'
job5.address_2 = 'Newtown'
job5.postcode = 'RG20'
job5.country = 'United Kingdom'
job5.job_title = 'Geological Engineer'
job5.duties = 'Vision-oriented secondary framework'
job5.start_date = Date.parse('2011-04-12')
job5.end_date = Date.parse('2015-06-26')
job5.save!

job6 = Job.new application: app3
job6.employer = 'Devpoint'
job6.address_1 = '4 Gerald Terrace'
job6.address_2 = 'Wirral'
job6.postcode = 'CH48'
job6.country = 'United Kingdom'
job6.job_title = 'Office Assistant I'
job6.duties = 'Sharable even-keeled portal'
job6.start_date = Date.parse('2012-09-08')
job6.end_date = Date.parse('2017-02-22')
job6.save!

ref5 = Reference.new application: app3
ref5.reference_1_full_name = 'Rebecca Chavez'
ref5.reference_1_email = 'rchavez4@cbc.ca'
ref5.reference_1_occupation = 'Pharmacist'
ref5.reference_1_address_1 = '271 Center '
ref5.reference_1_address_2 = 'London'
ref5.reference_1_postcode = 'WC1B 7QW'
ref5.reference_1_country = 'United Kingdom'
ref5.reference_1_relationship = 'Upgradable'
ref5.reference_1_telephone = '44-(115)907-0679'
ref5.reference_2_full_name = 'Deborah Cook'
ref5.reference_2_email = 'dcook5@sina.com.cn'
ref5.reference_2_occupation = 'Business Systems Development Analyst'
ref5.reference_2_address_1 = '59377 Manley '
ref5.reference_2_address_2 = 'Wootton'
ref5.reference_2_postcode = 'NN4 3TR'
ref5.reference_2_country = 'United Kingdom'
ref5.reference_2_relationship = 'background'
ref5.reference_2_telephone = '44-(605)194-9501'
ref5.save!

course7 = CourseSelection.new application_id: app3.id, course_id: 3
course7.save!

course8 = CourseSelection.new application_id: app3.id, course_id: 8
course8.save!

course9 = CourseSelection.new application_id: app3.id, course_id: 5
course9.save!

course10 = CourseSelection.new application_id: app3.id, course_id: 7
course10.save!

course11 = CourseSelection.new application_id: app3.id, course_id: 16
course11.save!

student4 = Student.new
student4.first_name = 'Beverly'
student4.family_name = 'Ferguson'
student4.email = 'tferguson3@twitter.com'
student4.scottish_candidate_number = '171892678'
student4.national_insurance_number = 'NJ684151C'
student4.password = 'secret'
student4.password_confirmation = 'secret'
student4.confirmed_at = DateTime.now
student4.save!

app4 = student4.create_application
app4.title = 'Honorable'
app4.middle_name = 'Tammy'
app4.gender = :female
app4.telephone = '44-(864)540-5939'
app4.mobile = '44-(272)514-0520'
app4.email = 'tferguson3@twitter.com'
app4.personal_statement = 'In congue. Etiam justo. Etiam pretium iaculis justo.'
app4.permanent_house_number = '50'
app4.permanent_address_1 = 'Canary Crossing'
app4.permanent_postcode = 'BD23 2GR'
app4.permanent_country = 'United Kingdom'
app4.correspondence_house_number = '5401'
app4.correspondence_address_1 = 'Johnson Terrace'
app4.correspondence_address_2 = 'Honorable'
app4.correspondence_postcode = 'NN11 2GR'
app4.correspondence_country = 'United Kingdom'
app4.state = :completed
app4.save!

school7 = School.new application: app4
school7.name = 'Royal College of Music'
school7.address_1 = '1 Sunnyside Terrace'
school7.address_2 = 'Manchester'
school7.country = 'United Kingdom'
school7.postcode = 'M14 3FB'
school7.save!

qualification19 = Qualification.new school: school7
qualification19.subject = 'Biology'
qualification19.award = 'NQ'
qualification19.grade = 'B'
qualification19.start_date = Date.new(2012, 8, 23)
qualification19.end_date = Date.new(2013, 6, 8)
qualification19.save!

qualification20 = Qualification.new school: school7
qualification20.subject = 'Woodworking'
qualification20.award = 'HND'
qualification20.grade = 'D'
qualification20.start_date = Date.new(2013, 8, 23)
qualification20.end_date = Date.new(2014, 6, 8)
qualification20.save!

qualification21 = Qualification.new school: school7
qualification21.subject = 'Art'
qualification21.award = 'Higher'
qualification21.grade = 'B'
qualification21.start_date = Date.new(2012, 8, 23)
qualification21.end_date = Date.new(2014, 6, 8)
qualification21.save!

school8 = School.new application: app4
school8.name = 'Warnborough University'
school8.address_1 = '408 Manufacturers Circle'
school8.address_2 = 'London'
school8.country = 'United Kingdom'
school8.postcode = 'WC1B 3FB'
school8.save!

qualification22 = Qualification.new school: school8
qualification22.subject = 'Art'
qualification22.award = 'HND'
qualification22.grade = 'Pass'
qualification22.start_date = Date.new(2012, 8, 23)
qualification22.end_date = Date.new(2014, 6, 8)
qualification22.save!

qualification23 = Qualification.new school: school8
qualification23.subject = 'Woodworking'
qualification23.award = 'NQ'
qualification23.grade = 'C'
qualification23.start_date = Date.new(2013, 8, 23)
qualification23.end_date = Date.new(2014, 6, 8)
qualification23.save!

qualification24 = Qualification.new school: school8
qualification24.subject = 'Physics'
qualification24.award = 'HND'
qualification24.grade = 'D'
qualification24.start_date = Date.new(2015, 8, 23)
qualification24.end_date = Date.new(2014, 6, 8)
qualification24.save!

job7 = Job.new application: app4
job7.employer = 'LiveZ'
job7.address_1 = '65 Vahlen Point'
job7.address_2 = 'Horton'
job7.postcode = 'BS37'
job7.country = 'United Kingdom'
job7.job_title = 'Systems Administrator II'
job7.duties = 'Programmable global model'
job7.start_date = Date.parse('2010-06-25')
job7.end_date = Date.parse('2016-02-01')
job7.save!

job8 = Job.new application: app4
job8.employer = 'Fiveclub'
job8.address_1 = '811 Tennyson Lane'
job8.address_2 = 'London'
job8.postcode = 'EC3M'
job8.country = 'United Kingdom'
job8.job_title = 'Systems Administrator III'
job8.duties = 'Enhanced bi-directional knowledge base'
job8.start_date = Date.parse('2011-12-25')
job8.end_date = Date.parse('2014-09-02')
job8.save!

ref7 = Reference.new application: app4
ref7.reference_1_full_name = 'William Meyer'
ref7.reference_1_email = 'wmeyer6@smugmug.com'
ref7.reference_1_occupation = 'Administrative Assistant I'
ref7.reference_1_address_1 = '24375 Clyde Gallagher '
ref7.reference_1_address_2 = 'Kirkton'
ref7.reference_1_postcode = 'KW10 7QW'
ref7.reference_1_country = 'United Kingdom'
ref7.reference_1_relationship = 'Customer-focused'
ref7.reference_1_telephone = '44-(440)209-3368'
ref7.reference_2_full_name = 'Anna Cook'
ref7.reference_2_email = 'acook7@yahoo.com'
ref7.reference_2_occupation = 'Geological Engineer'
ref7.reference_2_address_1 = '74366 Ridgeway '
ref7.reference_2_address_2 = 'London'
ref7.reference_2_postcode = 'WC1B 3TR'
ref7.reference_2_country = 'United Kingdom'
ref7.reference_2_relationship = 'User-friendly'
ref7.reference_2_telephone = '44-(178)717-3351'
ref7.save!

course12 = CourseSelection.new application_id: app4.id, course_id: 24
course12.save!

course13 = CourseSelection.new application_id: app4.id, course_id: 5
course13.save!

student5 = Student.new
student5.first_name = 'Marilyn'
student5.family_name = 'Sullivan'
student5.email = 'wsullivan4@yellowbook.com'
student5.scottish_candidate_number = '171002346'
student5.national_insurance_number = 'NJ111239C'
student5.password = 'secret'
student5.password_confirmation = 'secret'
student5.confirmed_at = DateTime.now
student5.save!

app5 = student5.create_application
app5.title = 'Mr'
app5.middle_name = 'Wanda'
app5.previous_name = 'Wanda Sullivan'
app5.gender = :female
app5.telephone = '44-(667)982-7510'
app5.mobile = '44-(277)380-2128'
app5.email = 'wsullivan4@yellowbook.com'
app5.disability = 'Team-oriented modular infrastructure'
app5.personal_statement = 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'
app5.permanent_house_number = '3516'
app5.permanent_address_1 = 'Marcy Place'
app5.permanent_postcode = 'TF6 2GR'
app5.permanent_country = 'United Kingdom'
app5.correspondence_house_number = '28'
app5.correspondence_address_1 = 'Chive Terrace'
app5.correspondence_address_2 = 'Mr'
app5.correspondence_postcode = 'SY4 2GR'
app5.correspondence_country = 'United Kingdom'
app5.state = :completed
app5.save!

school9 = School.new application: app5
school9.name = 'University of Ulster'
school9.address_1 = '271 Garrison Junction'
school9.address_2 = 'London'
school9.country = 'United Kingdom'
school9.postcode = 'EC1V 3FB'
school9.save!

qualification25 = Qualification.new school: school9
qualification25.subject = 'PE'
qualification25.award = 'Higher'
qualification25.grade = 'D'
qualification25.start_date = Date.new(2013, 8, 23)
qualification25.end_date = Date.new(2013, 6, 8)
qualification25.save!

qualification26 = Qualification.new school: school9
qualification26.subject = 'Physics'
qualification26.award = 'HNC'
qualification26.grade = 'C'
qualification26.start_date = Date.new(2012, 8, 23)
qualification26.end_date = Date.new(2014, 6, 8)
qualification26.save!

qualification27 = Qualification.new school: school9
qualification27.subject = 'Physics'
qualification27.award = 'Higher'
qualification27.grade = 'Pass'
qualification27.start_date = Date.new(2015, 8, 23)
qualification27.end_date = Date.new(2016, 6, 8)
qualification27.save!

school10 = School.new application: app5
school10.name = 'Royal Free Hospital School of Medicine'
school10.address_1 = '116 Valley Edge Alley'
school10.address_2 = 'Aston'
school10.country = 'United Kingdom'
school10.postcode = 'TF6 3FB'
school10.save!

qualification28 = Qualification.new school: school10
qualification28.subject = 'PE'
qualification28.award = 'Higher'
qualification28.grade = 'B'
qualification28.start_date = Date.new(2013, 8, 23)
qualification28.end_date = Date.new(2013, 6, 8)
qualification28.save!

qualification29 = Qualification.new school: school10
qualification29.subject = 'Physics'
qualification29.award = 'HND'
qualification29.grade = 'A'
qualification29.start_date = Date.new(2013, 8, 23)
qualification29.end_date = Date.new(2015, 6, 8)
qualification29.save!

qualification30 = Qualification.new school: school10
qualification30.subject = 'Geography'
qualification30.award = 'Higher'
qualification30.grade = 'D'
qualification30.start_date = Date.new(2012, 8, 23)
qualification30.end_date = Date.new(2016, 6, 8)
qualification30.save!

job9 = Job.new application: app5
job9.employer = 'Quamba'
job9.address_1 = '684 Hollow Ridge Place'
job9.address_2 = 'Bradford'
job9.postcode = 'BD7'
job9.country = 'United Kingdom'
job9.job_title = 'Assistant Media Planner'
job9.duties = 'Front-line analyzing pricing structure'
job9.start_date = Date.parse('2010-07-20')
job9.end_date = Date.parse('2016-09-24')
job9.save!

job10 = Job.new application: app5
job10.employer = 'Jaxworks'
job10.address_1 = '109 3rd Alley'
job10.address_2 = 'Preston'
job10.postcode = 'PR1'
job10.country = 'United Kingdom'
job10.job_title = 'Administrative Officer'
job10.duties = 'Open-architected even-keeled complexity'
job10.start_date = Date.parse('2012-03-10')
job10.end_date = Date.parse('2014-03-16')
job10.save!

ref9 = Reference.new application: app5
ref9.reference_1_full_name = 'George Berry'
ref9.reference_1_email = 'gberry8@reuters.com'
ref9.reference_1_occupation = 'Web Designer III'
ref9.reference_1_address_1 = '50837 Twin Pines Plaza'
ref9.reference_1_address_2 = 'Liverpool'
ref9.reference_1_postcode = 'L33 7QW'
ref9.reference_1_country = 'United Kingdom'
ref9.reference_1_relationship = 'encryption'
ref9.reference_1_telephone = '44-(425)148-3128'
ref9.reference_2_full_name = 'Maria Stewart'
ref9.reference_2_email = 'mstewart9@liveinternet.ru'
ref9.reference_2_occupation = 'Account Executive'
ref9.reference_2_address_1 = '73 Pawling Hill'
ref9.reference_2_address_2 = 'Sheffield'
ref9.reference_2_postcode = 'S1 3TR'
ref9.reference_2_country = 'United Kingdom'
ref9.reference_2_relationship = 'knowledge user'
ref9.reference_2_telephone = '44-(235)596-1647'
ref9.save!

course14 = CourseSelection.new application_id: app5.id, course_id: 21
course14.save!

course15 = CourseSelection.new application_id: app5.id, course_id: 13
course15.save!

course16 = CourseSelection.new application_id: app5.id, course_id: 2
course16.save!

course17 = CourseSelection.new application_id: app5.id, course_id: 1
course17.save!

student6 = Student.new
student6.first_name = 'Judith'
student6.family_name = 'Matthews'
student6.email = 'mmatthews5@china.com.cn'
student6.scottish_candidate_number = '177000922'
student6.national_insurance_number = 'NJ878282A'
student6.password = 'secret'
student6.password_confirmation = 'secret'
student6.confirmed_at = DateTime.now
student6.save!

app6 = student6.create_application
app6.title = 'Ms'
app6.middle_name = 'Marie'
app6.gender = :female
app6.telephone = '44-(901)977-0444'
app6.mobile = '44-(106)722-7435'
app6.email = 'mmatthews5@china.com.cn'
app6.disability = 'Advanced mobile migration'
app6.personal_statement = 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'
app6.permanent_house_number = '23'
app6.permanent_address_1 = 'Tennessee Point'
app6.permanent_postcode = 'BS37 2GR'
app6.permanent_country = 'United Kingdom'
app6.state = :completed
app6.save!

school11 = School.new application: app6
school11.name = 'Chelsea College of Art and Design'
school11.address_1 = '37 Orin Avenue'
school11.address_2 = 'Leeds'
school11.country = 'United Kingdom'
school11.postcode = 'LS6 3FB'
school11.save!

qualification31 = Qualification.new school: school11
qualification31.subject = 'Art'
qualification31.award = 'Higher'
qualification31.grade = 'Pass'
qualification31.start_date = Date.new(2014, 8, 23)
qualification31.end_date = Date.new(2016, 6, 8)
qualification31.save!

qualification32 = Qualification.new school: school11
qualification32.subject = 'Geography'
qualification32.award = 'NQ'
qualification32.grade = 'C'
qualification32.start_date = Date.new(2015, 8, 23)
qualification32.end_date = Date.new(2014, 6, 8)
qualification32.save!

qualification33 = Qualification.new school: school11
qualification33.subject = 'Chemistry'
qualification33.award = 'HND'
qualification33.grade = 'C'
qualification33.start_date = Date.new(2014, 8, 23)
qualification33.end_date = Date.new(2016, 6, 8)
qualification33.save!

school12 = School.new application: app6
school12.name = 'University of Warwick'
school12.address_1 = '5 Hanover Lane'
school12.address_2 = 'Langley'
school12.country = 'United Kingdom'
school12.postcode = 'SG4 3FB'
school12.save!

qualification34 = Qualification.new school: school12
qualification34.subject = 'Computing'
qualification34.award = 'HNC'
qualification34.grade = 'B'
qualification34.start_date = Date.new(2012, 8, 23)
qualification34.end_date = Date.new(2013, 6, 8)
qualification34.save!

qualification35 = Qualification.new school: school12
qualification35.subject = 'Maths'
qualification35.award = 'Higher'
qualification35.grade = 'C'
qualification35.start_date = Date.new(2013, 8, 23)
qualification35.end_date = Date.new(2016, 6, 8)
qualification35.save!

qualification36 = Qualification.new school: school12
qualification36.subject = 'Biology'
qualification36.award = 'HNC'
qualification36.grade = 'C'
qualification36.start_date = Date.new(2015, 8, 23)
qualification36.end_date = Date.new(2016, 6, 8)
qualification36.save!

job11 = Job.new application: app6
job11.employer = 'Yodel'
job11.address_1 = '3568 Kinsman Pass'
job11.address_2 = 'London'
job11.postcode = 'W1F'
job11.country = 'United Kingdom'
job11.job_title = 'Health Coach III'
job11.duties = 'Operative actuating strategy'
job11.start_date = Date.parse('2012-11-29')
job11.end_date = Date.parse('2015-04-19')
job11.save!

job12 = Job.new application: app6
job12.employer = 'Dazzlesphere'
job12.address_1 = '52 Sage Center'
job12.address_2 = 'Stapleford'
job12.postcode = 'LN6'
job12.country = 'United Kingdom'
job12.job_title = 'Mechanical Systems Engineer'
job12.duties = 'Extended global forecast'
job12.start_date = Date.parse('2011-03-06')
job12.end_date = Date.parse('2017-02-02')
job12.save!

ref11 = Reference.new application: app6
ref11.reference_1_full_name = 'Jesse Reid'
ref11.reference_1_email = 'jreida@pagesperso-orange.fr'
ref11.reference_1_occupation = 'VP Product Management'
ref11.reference_1_address_1 = '3 Golf Course '
ref11.reference_1_address_2 = 'Charlton'
ref11.reference_1_postcode = 'OX12 7QW'
ref11.reference_1_country = 'United Kingdom'
ref11.reference_1_relationship = 'Fundamental'
ref11.reference_1_telephone = '44-(464)899-2391'
ref11.reference_2_full_name = 'Rachel Ellis'
ref11.reference_2_email = 'rellisb@mozilla.com'
ref11.reference_2_occupation = 'Sales Associate'
ref11.reference_2_address_1 = '4483 Laurel '
ref11.reference_2_address_2 = 'Langley'
ref11.reference_2_postcode = 'SG4 3TR'
ref11.reference_2_country = 'United Kingdom'
ref11.reference_2_relationship = 'Enterprise-wide'
ref11.reference_2_telephone = '44-(855)623-4558'
ref11.save!

course18 = CourseSelection.new application_id: app6.id, course_id: 7
course18.save!

course19 = CourseSelection.new application_id: app6.id, course_id: 9
course19.save!

student7 = Student.new
student7.first_name = 'Chris'
student7.family_name = 'Duncan'
student7.email = 'rduncan6@blogger.com'
student7.scottish_candidate_number = '174749094'
student7.national_insurance_number = 'NJ692968C'
student7.password = 'secret'
student7.password_confirmation = 'secret'
student7.confirmed_at = DateTime.now
student7.save!

app7 = student7.create_application
app7.title = 'Honorable'
app7.middle_name = ''
app7.previous_name = 'Russell Duncan'
app7.gender = :male
app7.telephone = '44-(934)386-9105'
app7.email = 'rduncan6@blogger.com'
app7.personal_statement = 'In hac habitasse platea dictumst. Morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante. Nulla justo."'
app7.permanent_house_number = '1'
app7.permanent_address_1 = 'Darwin Avenue'
app7.permanent_address_2 = 'Craigavon'
app7.permanent_postcode = 'BT66 2GR'
app7.permanent_country = 'United Kingdom'
app7.state = :completed
app7.save!

school13 = School.new application: app7
school13.name = 'Aston University'
school13.address_1 = '69171 Scoville Place'
school13.address_2 = 'Buckland'
school13.country = 'United Kingdom'
school13.postcode = 'CT16 3FB'
school13.save!

qualification37 = Qualification.new school: school13
qualification37.subject = 'Maths'
qualification37.award = 'NQ'
qualification37.grade = 'Pass'
qualification37.start_date = Date.new(2015, 8, 23)
qualification37.end_date = Date.new(2014, 6, 8)
qualification37.save!

qualification38 = Qualification.new school: school13
qualification38.subject = 'Maths'
qualification38.award = 'NQ'
qualification38.grade = 'A'
qualification38.start_date = Date.new(2013, 8, 23)
qualification38.end_date = Date.new(2015, 6, 8)
qualification38.save!

qualification39 = Qualification.new school: school13
qualification39.subject = 'Biology'
qualification39.award = 'HND'
qualification39.grade = 'B'
qualification39.start_date = Date.new(2012, 8, 23)
qualification39.end_date = Date.new(2013, 6, 8)
qualification39.save!

school14 = School.new application: app7
school14.name = 'Warnborough University'
school14.address_1 = '41942 Warrior Court'
school14.address_2 = 'Walton'
school14.country = 'United Kingdom'
school14.postcode = 'CV35 3FB'
school14.save!

qualification40 = Qualification.new school: school14
qualification40.subject = 'PE'
qualification40.award = 'HNC'
qualification40.grade = 'D'
qualification40.start_date = Date.new(2012, 8, 23)
qualification40.end_date = Date.new(2015, 6, 8)
qualification40.save!

qualification41 = Qualification.new school: school14
qualification41.subject = 'Computing'
qualification41.award = 'Standard'
qualification41.grade = 'C'
qualification41.start_date = Date.new(2014, 8, 23)
qualification41.end_date = Date.new(2015, 6, 8)
qualification41.save!

qualification42 = Qualification.new school: school14
qualification42.subject = 'Technological Studies'
qualification42.award = 'HND'
qualification42.grade = 'A'
qualification42.start_date = Date.new(2013, 8, 23)
qualification42.end_date = Date.new(2016, 6, 8)
qualification42.save!

job13 = Job.new application: app7
job13.employer = 'Roombo'
job13.address_1 = '9 Eagan Terrace'
job13.address_2 = 'Newton'
job13.postcode = 'IV1'
job13.country = 'United Kingdom'
job13.job_title = 'Environmental Tech'
job13.duties = 'Devolved 4th generation concept'
job13.start_date = Date.parse('2011-10-11')
job13.end_date = Date.parse('2016-06-03')
job13.save!

job14 = Job.new application: app7
job14.employer = 'Meetz'
job14.address_1 = '60423 Portage Way'
job14.address_2 = 'Newton'
job14.postcode = 'IV1'
job14.country = 'United Kingdom'
job14.job_title = 'Help Desk Operator'
job14.duties = 'Operative mobile throughput'
job14.start_date = Date.parse('2010-09-14')
job14.end_date = Date.parse('2014-07-26')
job14.save!

ref13 = Reference.new application: app7
ref13.reference_1_full_name = 'Betty Mills'
ref13.reference_1_email = 'bmillsc@nasa.gov'
ref13.reference_1_occupation = 'Nurse'
ref13.reference_1_address_1 = '11571 Maryland '
ref13.reference_1_address_2 = 'Wootton'
ref13.reference_1_postcode = 'NN4 7QW'
ref13.reference_1_country = 'United Kingdom'
ref13.reference_1_relationship = 'grid-enabled'
ref13.reference_1_telephone = '44-(281)224-2795'
ref13.reference_2_full_name = 'Ashley Thompson'
ref13.reference_2_email = 'athompsond@vistaprint.com'
ref13.reference_2_occupation = 'Physical Therapy Assistant'
ref13.reference_2_address_1 = '63278 Old Gate '
ref13.reference_2_address_2 = 'Buckland'
ref13.reference_2_postcode = 'CT16 3TR'
ref13.reference_2_country = 'United Kingdom'
ref13.reference_2_relationship = 'composite'
ref13.reference_2_telephone = '44-(572)482-6969'
ref13.save!

course20 = CourseSelection.new application_id: app7.id, course_id: 9
course20.save!

course21 = CourseSelection.new application_id: app7.id, course_id: 4
course21.save!

course22 = CourseSelection.new application_id: app7.id, course_id: 24
course22.save!

student8 = Student.new
student8.first_name = 'Patrick'
student8.family_name = 'Carr'
student8.email = 'rcarr7@soup.io'
student8.scottish_candidate_number = '173747683'
student8.national_insurance_number = 'NJ431694A'
student8.password = 'secret'
student8.password_confirmation = 'secret'
student8.confirmed_at = DateTime.now
student8.save!

app8 = student8.create_application
app8.title = 'Mr'
app8.middle_name = 'Roger'
app8.previous_name = 'Roger Carr'
app8.gender = :male
app8.telephone = '44-(112)290-3116'
app8.mobile = '44-(376)145-0062'
app8.email = 'rcarr7@soup.io'
app8.personal_statement = 'Proin eu mi. Nulla ac enim. In tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem."'
app8.permanent_house_number = '32'
app8.permanent_address_1 = 'Maple Court'
app8.permanent_address_2 = 'Ford'
app8.permanent_postcode = 'GL54 2GR'
app8.permanent_country = 'United Kingdom'
app8.state = :completed
app8.save!

school15 = School.new application: app8
school15.name = 'University of East London'
school15.address_1 = '45 Florence Street'
school15.address_2 = 'Belfast'
school15.country = 'United Kingdom'
school15.postcode = 'BT2 3FB'
school15.save!

qualification43 = Qualification.new school: school15
qualification43.subject = 'Technological Studies'
qualification43.award = 'Higher'
qualification43.grade = 'Pass'
qualification43.start_date = Date.new(2015, 8, 23)
qualification43.end_date = Date.new(2015, 6, 8)
qualification43.save!

qualification44 = Qualification.new school: school15
qualification44.subject = 'English'
qualification44.award = 'NQ'
qualification44.grade = 'D'
qualification44.start_date = Date.new(2015, 8, 23)
qualification44.end_date = Date.new(2016, 6, 8)
qualification44.save!

qualification45 = Qualification.new school: school15
qualification45.subject = 'English'
qualification45.award = 'HND'
qualification45.grade = 'Pass'
qualification45.start_date = Date.new(2013, 8, 23)
qualification45.end_date = Date.new(2014, 6, 8)
qualification45.save!

school16 = School.new application: app8
school16.name = 'Institute of Germanic Studies'
school16.address_1 = '4467 Redwing Parkway'
school16.address_2 = 'Swindon'
school16.country = 'United Kingdom'
school16.postcode = 'SN1 3FB'
school16.save!

qualification46 = Qualification.new school: school16
qualification46.subject = 'Maths'
qualification46.award = 'HND'
qualification46.grade = 'Pass'
qualification46.start_date = Date.new(2014, 8, 23)
qualification46.end_date = Date.new(2014, 6, 8)
qualification46.save!

qualification47 = Qualification.new school: school16
qualification47.subject = 'Chemistry'
qualification47.award = 'Higher'
qualification47.grade = 'Pass'
qualification47.start_date = Date.new(2015, 8, 23)
qualification47.end_date = Date.new(2013, 6, 8)
qualification47.save!

qualification48 = Qualification.new school: school16
qualification48.subject = 'Art'
qualification48.award = 'NQ'
qualification48.grade = 'Pass'
qualification48.start_date = Date.new(2015, 8, 23)
qualification48.end_date = Date.new(2016, 6, 8)
qualification48.save!

job15 = Job.new application: app8
job15.employer = 'Babblestorm'
job15.address_1 = '0 Independence Plaza'
job15.address_2 = 'Marston'
job15.postcode = 'ST20'
job15.country = 'United Kingdom'
job15.job_title = 'Cost Accountant'
job15.duties = 'Ameliorated bottom-line analyzer'
job15.start_date = Date.parse('2010-11-09')
job15.end_date = Date.parse('2013-08-03')
job15.save!

job16 = Job.new application: app8
job16.employer = 'Innojam'
job16.address_1 = '75 Alpine Center'
job16.address_2 = 'Upton'
job16.postcode = 'WF9'
job16.country = 'United Kingdom'
job16.job_title = 'Actuary'
job16.duties = 'Progressive multi-state strategy'
job16.start_date = Date.parse('2012-10-11')
job16.end_date = Date.parse('2016-03-18')
job16.save!

ref15 = Reference.new application: app8
ref15.reference_1_full_name = 'Billy Oliver'
ref15.reference_1_email = 'bolivere@usda.gov'
ref15.reference_1_occupation = 'Budget/Accounting Analyst IV'
ref15.reference_1_address_1 = '3 Commercial Avenue'
ref15.reference_1_address_2 = 'Stapleford'
ref15.reference_1_postcode = 'LN6 7QW'
ref15.reference_1_country = 'United Kingdom'
ref15.reference_1_relationship = 'groupware'
ref15.reference_1_telephone = '44-(467)719-8491'
ref15.reference_2_full_name = 'Jesse Carroll'
ref15.reference_2_email = 'jcarrollf@ibm.com'
ref15.reference_2_occupation = 'Assistant Professor'
ref15.reference_2_address_1 = '751 Quincy Plaza'
ref15.reference_2_address_2 = 'Linton'
ref15.reference_2_postcode = 'BD23 3TR'
ref15.reference_2_country = 'United Kingdom'
ref15.reference_2_relationship = 'Graphical User Interface'
ref15.reference_2_telephone = '44-(404)908-1556'
ref15.save!

course23 = CourseSelection.new application_id: app8.id, course_id: 3
course23.save!

course24 = CourseSelection.new application_id: app8.id, course_id: 6
course24.save!

student9 = Student.new
student9.first_name = 'Diane'
student9.family_name = 'Myers'
student9.email = 'amyers8@zdnet.com'
student9.scottish_candidate_number = '173676468'
student9.national_insurance_number = 'NJ489158A'
student9.password = 'secret'
student9.password_confirmation = 'secret'
student9.confirmed_at = DateTime.now
student9.save!

app9 = student9.create_application
app9.title = 'Honorable'
app9.middle_name = 'Annie'
app9.gender = :female
app9.telephone = '44-(232)369-6218'
app9.mobile = '44-(672)883-5637'
app9.email = 'amyers8@zdnet.com'
app9.disability = 'Face to face contextually-based toolset'
app9.personal_statement = 'In congue. Etiam justo. Etiam pretium iaculis justo.'
app9.permanent_house_number = '8868'
app9.permanent_address_1 = 'Eastlawn Street'
app9.permanent_postcode = 'N3 2GR'
app9.permanent_country = 'United Kingdom'
app9.correspondence_house_number = '649'
app9.correspondence_address_1 = 'Summit Parkway'
app9.correspondence_address_2 = 'Honorable'
app9.correspondence_postcode = 'S8 2GR'
app9.correspondence_country = 'United Kingdom'
app9.state = :completed
app9.save!

school17 = School.new application: app9
school17.name = 'Camberwell College of Arts'
school17.address_1 = '7071 Forest Road'
school17.address_2 = 'Leeds'
school17.country = 'United Kingdom'
school17.postcode = 'LS6 3FB'
school17.save!

qualification49 = Qualification.new school: school17
qualification49.subject = 'English'
qualification49.award = 'Higher'
qualification49.grade = 'B'
qualification49.start_date = Date.new(2014, 8, 23)
qualification49.end_date = Date.new(2014, 6, 8)
qualification49.save!

qualification50 = Qualification.new school: school17
qualification50.subject = 'Geography'
qualification50.award = 'Standard'
qualification50.grade = 'D'
qualification50.start_date = Date.new(2014, 8, 23)
qualification50.end_date = Date.new(2014, 6, 8)
qualification50.save!

qualification51 = Qualification.new school: school17
qualification51.subject = 'Maths'
qualification51.award = 'Standard'
qualification51.grade = 'Pass'
qualification51.start_date = Date.new(2012, 8, 23)
qualification51.end_date = Date.new(2013, 6, 8)
qualification51.save!

school18 = School.new application: app9
school18.name = 'University of Wales Institute'
school18.address_1 = '97 Shoshone Lane'
school18.address_2 = 'Buckland'
school18.country = 'United Kingdom'
school18.postcode = 'CT16 3FB'
school18.save!

qualification52 = Qualification.new school: school18
qualification52.subject = 'Computing'
qualification52.award = 'HNC'
qualification52.grade = 'D'
qualification52.start_date = Date.new(2012, 8, 23)
qualification52.end_date = Date.new(2014, 6, 8)
qualification52.save!

qualification53 = Qualification.new school: school18
qualification53.subject = 'Biology'
qualification53.award = 'Standard'
qualification53.grade = 'Pass'
qualification53.start_date = Date.new(2014, 8, 23)
qualification53.end_date = Date.new(2014, 6, 8)
qualification53.save!

qualification54 = Qualification.new school: school18
qualification54.subject = 'PE'
qualification54.award = 'NQ'
qualification54.grade = 'Pass'
qualification54.start_date = Date.new(2015, 8, 23)
qualification54.end_date = Date.new(2013, 6, 8)
qualification54.save!

job17 = Job.new application: app9
job17.employer = 'Zoovu'
job17.address_1 = '4681 Gateway Street'
job17.address_2 = 'Langley'
job17.postcode = 'SG4'
job17.country = 'United Kingdom'
job17.job_title = 'Payment Adjustment Coordinator'
job17.duties = 'Total 24 hour service-desk'
job17.start_date = Date.parse('2011-07-26')
job17.end_date = Date.parse('2016-10-14')
job17.save!

job18 = Job.new application: app9
job18.employer = 'Rhynoodle'
job18.address_1 = '0452 Red Cloud Center'
job18.address_2 = 'Belfast'
job18.postcode = 'BT2'
job18.country = 'United Kingdom'
job18.job_title = 'Physical Therapy Assistant'
job18.duties = 'Self-enabling 24 hour migration'
job18.start_date = Date.parse('2011-01-25')
job18.end_date = Date.parse('2015-02-10')
job18.save!

ref17 = Reference.new application: app9
ref17.reference_1_full_name = 'Deborah Myers'
ref17.reference_1_email = 'dmyersg@mozilla.com'
ref17.reference_1_occupation = 'Project Manager'
ref17.reference_1_address_1 = '90617 Columbus '
ref17.reference_1_address_2 = 'Dean'
ref17.reference_1_postcode = 'OX7 7QW'
ref17.reference_1_country = 'United Kingdom'
ref17.reference_1_relationship = 'extranet'
ref17.reference_1_telephone = '44-(907)668-4435'
ref17.reference_2_full_name = 'Kelly Riley'
ref17.reference_2_email = 'krileyh@netlog.com'
ref17.reference_2_occupation = 'Junior Executive'
ref17.reference_2_address_1 = '0145 Melody '
ref17.reference_2_address_2 = 'Tullich'
ref17.reference_2_postcode = 'AB55 3TR'
ref17.reference_2_country = 'United Kingdom'
ref17.reference_2_relationship = 'Mandatory'
ref17.reference_2_telephone = '44-(860)595-0211'
ref17.save!

course25 = CourseSelection.new application_id: app9.id, course_id: 24
course25.save!

course26 = CourseSelection.new application_id: app9.id, course_id: 20
course26.save!

course27 = CourseSelection.new application_id: app9.id, course_id: 23
course27.save!

course28 = CourseSelection.new application_id: app9.id, course_id: 7
course28.save!

course29 = CourseSelection.new application_id: app9.id, course_id: 4
course29.save!

student10 = Student.new
student10.first_name = 'Sharon'
student10.family_name = 'Murphy'
student10.email = 'dmurphy9@hibu.com'
student10.scottish_candidate_number = '179652706'
student10.national_insurance_number = 'NJ628089A'
student10.password = 'secret'
student10.password_confirmation = 'secret'
student10.confirmed_at = DateTime.now
student10.save!

app10 = student10.create_application
app10.title = 'Dr'
app10.middle_name = 'Doris'
app10.gender = :female
app10.telephone = '44-(839)643-9246'
app10.mobile = '44-(966)723-6164'
app10.email = 'dmurphy9@hibu.com'
app10.disability = 'Business-focused solution-oriented infrastructure'
app10.personal_statement = 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl.'
app10.permanent_house_number = '30367'
app10.permanent_address_1 = 'Towne Trail'
app10.permanent_address_2 = 'Denton'
app10.permanent_postcode = 'M34 2GR'
app10.permanent_country = 'United Kingdom'
app10.state = :completed
app10.save!

school19 = School.new application: app10
school19.name = 'Canterbury Christ Church University'
school19.address_1 = '17182 Melvin Junction'
school19.address_2 = 'London'
school19.country = 'United Kingdom'
school19.postcode = 'EC3M 3FB'
school19.save!

qualification55 = Qualification.new school: school19
qualification55.subject = 'English'
qualification55.award = 'HND'
qualification55.grade = 'D'
qualification55.start_date = Date.new(2012, 8, 23)
qualification55.end_date = Date.new(2014, 6, 8)
qualification55.save!

qualification56 = Qualification.new school: school19
qualification56.subject = 'Physics'
qualification56.award = 'HNC'
qualification56.grade = 'A'
qualification56.start_date = Date.new(2012, 8, 23)
qualification56.end_date = Date.new(2015, 6, 8)
qualification56.save!

qualification57 = Qualification.new school: school19
qualification57.subject = 'Technological Studies'
qualification57.award = 'HNC'
qualification57.grade = 'A'
qualification57.start_date = Date.new(2014, 8, 23)
qualification57.end_date = Date.new(2015, 6, 8)
qualification57.save!

school20 = School.new application: app10
school20.name = 'Chelsea College of Art and Design'
school20.address_1 = '3 Dottie Trail'
school20.address_2 = 'Newton'
school20.country = 'United Kingdom'
school20.postcode = 'NG34 3FB'
school20.save!

qualification58 = Qualification.new school: school20
qualification58.subject = 'Art'
qualification58.award = 'Higher'
qualification58.grade = 'C'
qualification58.start_date = Date.new(2013, 8, 23)
qualification58.end_date = Date.new(2015, 6, 8)
qualification58.save!

qualification59 = Qualification.new school: school20
qualification59.subject = 'Physics'
qualification59.award = 'HND'
qualification59.grade = 'B'
qualification59.start_date = Date.new(2015, 8, 23)
qualification59.end_date = Date.new(2015, 6, 8)
qualification59.save!

qualification60 = Qualification.new school: school20
qualification60.subject = 'Geography'
qualification60.award = 'Higher'
qualification60.grade = 'A'
qualification60.start_date = Date.new(2015, 8, 23)
qualification60.end_date = Date.new(2013, 6, 8)
qualification60.save!

job19 = Job.new application: app10
job19.employer = 'Skipstorm'
job19.address_1 = '680 Brentwood Hill'
job19.address_2 = 'Sheffield'
job19.postcode = 'S33'
job19.country = 'United Kingdom'
job19.job_title = 'Community Outreach Specialist'
job19.duties = 'Sharable client-server framework'
job19.start_date = Date.parse('2010-04-22')
job19.end_date = Date.parse('2014-04-27')
job19.save!

job20 = Job.new application: app10
job20.employer = 'Tavu'
job20.address_1 = '90 Victoria Pass'
job20.address_2 = 'Manchester'
job20.postcode = 'M14'
job20.country = 'United Kingdom'
job20.job_title = 'Developer II'
job20.duties = 'Multi-channelled client-server benchmark'
job20.start_date = Date.parse('2012-09-04')
job20.end_date = Date.parse('2014-06-30')
job20.save!

ref19 = Reference.new application: app10
ref19.reference_1_full_name = 'Heather Payne'
ref19.reference_1_email = 'hpaynei@tripadvisor.com'
ref19.reference_1_occupation = 'Structural Analysis Engineer'
ref19.reference_1_address_1 = '30 Dorton '
ref19.reference_1_address_2 = 'London'
ref19.reference_1_postcode = 'SW1E 7QW'
ref19.reference_1_country = 'United Kingdom'
ref19.reference_1_relationship = 'website'
ref19.reference_1_telephone = '44-(406)885-9983'
ref19.reference_2_full_name = 'Joan Black'
ref19.reference_2_email = 'jblackj@netlog.com'
ref19.reference_2_occupation = 'Senior Sales Associate'
ref19.reference_2_address_1 = '2564 Springs '
ref19.reference_2_address_2 = 'Leeds'
ref19.reference_2_postcode = 'LS6 3TR'
ref19.reference_2_country = 'United Kingdom'
ref19.reference_2_relationship = 'Configurable'
ref19.reference_2_telephone = '44-(114)854-5865'
ref19.save!

course30 = CourseSelection.new application_id: app10.id, course_id: 11
course30.save!

student11 = Student.new
student11.first_name = 'Terry'
student11.family_name = 'Johnson'
student11.email = 'sjohnsona@java.com'
student11.scottish_candidate_number = '179638223'
student11.national_insurance_number = 'NJ802231D'
student11.password = 'secret'
student11.password_confirmation = 'secret'
student11.confirmed_at = DateTime.now
student11.save!

app11 = student11.create_application
app11.title = 'Mr'
app11.middle_name = 'Steven'
app11.gender = :male
app11.telephone = '44-(325)563-4933'
app11.mobile = '44-(601)111-2256'
app11.email = 'sjohnsona@java.com'
app11.disability = 'Ameliorated scalable capacity'
app11.personal_statement = 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
app11.permanent_house_number = '16801'
app11.permanent_address_1 = 'Jackson Court'
app11.permanent_postcode = 'SN13 2GR'
app11.permanent_country = 'United Kingdom'
app11.correspondence_house_number = '6207'
app11.correspondence_address_1 = 'Oak Way'
app11.correspondence_address_2 = 'Mr'
app11.correspondence_postcode = 'B40 2GR'
app11.correspondence_country = 'United Kingdom'
app11.state = :completed
app11.save!

school21 = School.new application: app11
school21.name = 'University of Hertfordshire'
school21.address_1 = '39133 Forster Drive'
school21.address_2 = 'Sheffield'
school21.country = 'United Kingdom'
school21.postcode = 'S1 3FB'
school21.save!

qualification61 = Qualification.new school: school21
qualification61.subject = 'English'
qualification61.award = 'Higher'
qualification61.grade = 'C'
qualification61.start_date = Date.new(2013, 8, 23)
qualification61.end_date = Date.new(2014, 6, 8)
qualification61.save!

qualification62 = Qualification.new school: school21
qualification62.subject = 'Biology'
qualification62.award = 'HND'
qualification62.grade = 'D'
qualification62.start_date = Date.new(2015, 8, 23)
qualification62.end_date = Date.new(2016, 6, 8)
qualification62.save!

qualification63 = Qualification.new school: school21
qualification63.subject = 'Computing'
qualification63.award = 'HND'
qualification63.grade = 'C'
qualification63.start_date = Date.new(2015, 8, 23)
qualification63.end_date = Date.new(2016, 6, 8)
qualification63.save!

school22 = School.new application: app11
school22.name = 'Schiller International University'
school22.address_1 = '872 Dixon Road'
school22.address_2 = 'Merton'
school22.country = 'United Kingdom'
school22.postcode = 'SW19 3FB'
school22.save!

qualification64 = Qualification.new school: school22
qualification64.subject = 'English'
qualification64.award = 'HND'
qualification64.grade = 'C'
qualification64.start_date = Date.new(2012, 8, 23)
qualification64.end_date = Date.new(2016, 6, 8)
qualification64.save!

qualification65 = Qualification.new school: school22
qualification65.subject = 'Woodworking'
qualification65.award = 'Higher'
qualification65.grade = 'D'
qualification65.start_date = Date.new(2012, 8, 23)
qualification65.end_date = Date.new(2013, 6, 8)
qualification65.save!

qualification66 = Qualification.new school: school22
qualification66.subject = 'PE'
qualification66.award = 'HND'
qualification66.grade = 'Pass'
qualification66.start_date = Date.new(2013, 8, 23)
qualification66.end_date = Date.new(2015, 6, 8)
qualification66.save!

job21 = Job.new application: app11
job21.employer = 'Cogibox'
job21.address_1 = '34 Mendota Terrace'
job21.address_2 = 'Sutton'
job21.postcode = 'CT15'
job21.country = 'United Kingdom'
job21.job_title = 'Paralegal'
job21.duties = 'Centralized disintermediate help-desk'
job21.start_date = Date.parse('2010-11-04')
job21.end_date = Date.parse('2013-12-22')
job21.save!

job22 = Job.new application: app11
job22.employer = 'Innotype'
job22.address_1 = '042 Elka Lane'
job22.address_2 = 'Church End'
job22.postcode = 'N3'
job22.country = 'United Kingdom'
job22.job_title = 'Occupational Therapist'
job22.duties = 'Centralized clear-thinking policy'
job22.start_date = Date.parse('2012-07-09')
job22.end_date = Date.parse('2014-02-18')
job22.save!

ref21 = Reference.new application: app11
ref21.reference_1_full_name = 'Carol Garcia'
ref21.reference_1_email = 'cgarciak@ustream.tv'
ref21.reference_1_occupation = 'Nurse Practicioner'
ref21.reference_1_address_1 = '479 Toban '
ref21.reference_1_address_2 = 'London'
ref21.reference_1_postcode = 'EC1V 7QW'
ref21.reference_1_country = 'United Kingdom'
ref21.reference_1_relationship = 'solution-oriented'
ref21.reference_1_telephone = '44-(992)627-5685'
ref21.reference_2_full_name = 'Kathryn Griffin'
ref21.reference_2_email = 'kgriffinl@feedburner.com'
ref21.reference_2_occupation = 'Account Coordinator'
ref21.reference_2_address_1 = '99298 Hovde '
ref21.reference_2_address_2 = 'Leeds'
ref21.reference_2_postcode = 'LS6 3TR'
ref21.reference_2_country = 'United Kingdom'
ref21.reference_2_relationship = 'service-desk'
ref21.reference_2_telephone = '44-(170)511-1742'
ref21.save!

course31 = CourseSelection.new application_id: app11.id, course_id: 5
course31.save!

course32 = CourseSelection.new application_id: app11.id, course_id: 20
course32.save!

student12 = Student.new
student12.first_name = 'Bruce'
student12.family_name = 'Hill'
student12.email = 'bhillb@quantcast.com'
student12.scottish_candidate_number = '179632039'
student12.national_insurance_number = 'NJ398142B'
student12.password = 'secret'
student12.password_confirmation = 'secret'
student12.confirmed_at = DateTime.now
student12.save!

app12 = student12.create_application
app12.title = 'Honorable'
app12.middle_name = 'Brandon'
app12.gender = :male
app12.telephone = '44-(777)417-6412'
app12.mobile = '44-(878)803-6920'
app12.email = 'bhillb@quantcast.com'
app12.disability = 'Down-sized value-added parallelism'
app12.personal_statement = 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'
app12.permanent_house_number = '7350'
app12.permanent_address_1 = 'Autumn Leaf Avenue'
app12.permanent_postcode = 'NN11 2GR'
app12.permanent_country = 'United Kingdom'
app12.state = :completed
app12.save!

school23 = School.new application: app12
school23.name = 'Trinity College Carmarthen'
school23.address_1 = '436 Lake View Plaza'
school23.address_2 = 'Sutton'
school23.country = 'United Kingdom'
school23.postcode = 'RH5 3FB'
school23.save!

qualification67 = Qualification.new school: school23
qualification67.subject = 'Woodworking'
qualification67.award = 'HNC'
qualification67.grade = 'D'
qualification67.start_date = Date.new(2013, 8, 23)
qualification67.end_date = Date.new(2013, 6, 8)
qualification67.save!

qualification68 = Qualification.new school: school23
qualification68.subject = 'English'
qualification68.award = 'HND'
qualification68.grade = 'Pass'
qualification68.start_date = Date.new(2015, 8, 23)
qualification68.end_date = Date.new(2015, 6, 8)
qualification68.save!

qualification69 = Qualification.new school: school23
qualification69.subject = 'Maths'
qualification69.award = 'NQ'
qualification69.grade = 'D'
qualification69.start_date = Date.new(2013, 8, 23)
qualification69.end_date = Date.new(2014, 6, 8)
qualification69.save!

school24 = School.new application: app12
school24.name = 'Chelsea College of Art and Design'
school24.address_1 = '62 Jay Crossing'
school24.address_2 = 'London'
school24.country = 'United Kingdom'
school24.postcode = 'W1F 3FB'
school24.save!

qualification70 = Qualification.new school: school24
qualification70.subject = 'Technological Studies'
qualification70.award = 'HND'
qualification70.grade = 'B'
qualification70.start_date = Date.new(2014, 8, 23)
qualification70.end_date = Date.new(2014, 6, 8)
qualification70.save!

qualification71 = Qualification.new school: school24
qualification71.subject = 'Geography'
qualification71.award = 'HNC'
qualification71.grade = 'B'
qualification71.start_date = Date.new(2013, 8, 23)
qualification71.end_date = Date.new(2016, 6, 8)
qualification71.save!

qualification72 = Qualification.new school: school24
qualification72.subject = 'Technological Studies'
qualification72.award = 'Standard'
qualification72.grade = 'D'
qualification72.start_date = Date.new(2013, 8, 23)
qualification72.end_date = Date.new(2016, 6, 8)
qualification72.save!

job23 = Job.new application: app12
job23.employer = 'Flashpoint'
job23.address_1 = '92878 Buell Terrace'
job23.address_2 = 'Church End'
job23.postcode = 'CB4'
job23.country = 'United Kingdom'
job23.job_title = 'Compensation Analyst'
job23.duties = 'Function-based multi-state interface'
job23.start_date = Date.parse('2012-06-13')
job23.end_date = Date.parse('2016-09-17')
job23.save!

job24 = Job.new application: app12
job24.employer = 'Edgeclub'
job24.address_1 = '6 Lakewood Gardens Crossing'
job24.address_2 = 'Weston'
job24.postcode = 'GU32'
job24.country = 'United Kingdom'
job24.job_title = 'Dental Hygienist'
job24.duties = 'Compatible asynchronous paradigm'
job24.start_date = Date.parse('2012-12-27')
job24.end_date = Date.parse('2016-09-30')
job24.save!

ref23 = Reference.new application: app12
ref23.reference_1_full_name = 'Brandon Morrison'
ref23.reference_1_email = 'bmorrisonm@cpanel.net'
ref23.reference_1_occupation = 'Sales Associate'
ref23.reference_1_address_1 = '1 Prairie Rose '
ref23.reference_1_address_2 = 'London'
ref23.reference_1_postcode = 'WC1B 7QW'
ref23.reference_1_country = 'United Kingdom'
ref23.reference_1_relationship = 'benchmark'
ref23.reference_1_telephone = '44-(613)688-2932'
ref23.reference_2_full_name = 'Virginia Grant'
ref23.reference_2_email = 'vgrantn@imdb.com'
ref23.reference_2_occupation = 'Editor'
ref23.reference_2_address_1 = '95793 Dryden Alley'
ref23.reference_2_address_2 = 'Milton'
ref23.reference_2_postcode = 'NG22 3TR'
ref23.reference_2_country = 'United Kingdom'
ref23.reference_2_relationship = 'Devolved'
ref23.reference_2_telephone = '44-(120)704-2170'
ref23.save!

course33 = CourseSelection.new application_id: app12.id, course_id: 23
course33.save!

course34 = CourseSelection.new application_id: app12.id, course_id: 6
course34.save!

course35 = CourseSelection.new application_id: app12.id, course_id: 18
course35.save!

course36 = CourseSelection.new application_id: app12.id, course_id: 4
course36.save!

course37 = CourseSelection.new application_id: app12.id, course_id: 2
course37.save!

student13 = Student.new
student13.first_name = 'Douglas'
student13.family_name = 'Phillips'
student13.email = 'gphillipsc@biblegateway.com'
student13.scottish_candidate_number = '173159072'
student13.national_insurance_number = 'NJ443296B'
student13.password = 'secret'
student13.password_confirmation = 'secret'
student13.confirmed_at = DateTime.now
student13.save!

app13 = student13.create_application
app13.title = 'Honorable'
app13.middle_name = 'George'
app13.gender = :male
app13.telephone = '44-(208)559-7831'
app13.mobile = '44-(424)133-4631'
app13.email = 'gphillipsc@biblegateway.com'
app13.disability = 'Public-key web-enabled projection'
app13.personal_statement = 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl.'
app13.permanent_house_number = '07'
app13.permanent_address_1 = 'Canary Road'
app13.permanent_postcode = 'CT15 2GR'
app13.permanent_country = 'United Kingdom'
app13.state = :completed
app13.save!

school25 = School.new application: app13
school25.name = 'Courtauld Institute of Art'
school25.address_1 = '13 Maple Place'
school25.address_2 = 'Seaton'
school25.country = 'United Kingdom'
school25.postcode = 'LE15 3FB'
school25.save!

qualification73 = Qualification.new school: school25
qualification73.subject = 'Computing'
qualification73.award = 'NQ'
qualification73.grade = 'Pass'
qualification73.start_date = Date.new(2014, 8, 23)
qualification73.end_date = Date.new(2013, 6, 8)
qualification73.save!

qualification74 = Qualification.new school: school25
qualification74.subject = 'Physics'
qualification74.award = 'NQ'
qualification74.grade = 'A'
qualification74.start_date = Date.new(2014, 8, 23)
qualification74.end_date = Date.new(2015, 6, 8)
qualification74.save!

qualification75 = Qualification.new school: school25
qualification75.subject = 'Maths'
qualification75.award = 'HNC'
qualification75.grade = 'C'
qualification75.start_date = Date.new(2014, 8, 23)
qualification75.end_date = Date.new(2013, 6, 8)
qualification75.save!

school26 = School.new application: app13
school26.name = 'United Medical and Dental Schools'
school26.address_1 = '2 Evergreen Trail'
school26.address_2 = 'London'
school26.country = 'United Kingdom'
school26.postcode = 'EC3M 3FB'
school26.save!

qualification76 = Qualification.new school: school26
qualification76.subject = 'Maths'
qualification76.award = 'Higher'
qualification76.grade = 'B'
qualification76.start_date = Date.new(2015, 8, 23)
qualification76.end_date = Date.new(2015, 6, 8)
qualification76.save!

qualification77 = Qualification.new school: school26
qualification77.subject = 'Maths'
qualification77.award = 'HND'
qualification77.grade = 'A'
qualification77.start_date = Date.new(2015, 8, 23)
qualification77.end_date = Date.new(2015, 6, 8)
qualification77.save!

qualification78 = Qualification.new school: school26
qualification78.subject = 'PE'
qualification78.award = 'Higher'
qualification78.grade = 'Pass'
qualification78.start_date = Date.new(2015, 8, 23)
qualification78.end_date = Date.new(2014, 6, 8)
qualification78.save!

job25 = Job.new application: app13
job25.employer = 'Jetpulse'
job25.address_1 = '169 Independence Hill'
job25.address_2 = 'Halton'
job25.postcode = 'LS9'
job25.country = 'United Kingdom'
job25.job_title = 'VP Accounting'
job25.duties = 'Persistent radical success'
job25.start_date = Date.parse('2012-11-24')
job25.end_date = Date.parse('2016-12-29')
job25.save!

job26 = Job.new application: app13
job26.employer = 'Dabjam'
job26.address_1 = '99 Forest Dale Pass'
job26.address_2 = 'Kingston'
job26.postcode = 'DT10'
job26.country = 'United Kingdom'
job26.job_title = 'Associate Professor'
job26.duties = 'Down-sized zero administration hardware'
job26.start_date = Date.parse('2012-01-13')
job26.end_date = Date.parse('2013-12-12')
job26.save!

ref25 = Reference.new application: app13
ref25.reference_1_full_name = 'Catherine Rogers'
ref25.reference_1_email = 'crogerso@npr.org'
ref25.reference_1_occupation = 'Associate Professor'
ref25.reference_1_address_1 = '161 Huxley Court'
ref25.reference_1_address_2 = 'Walton'
ref25.reference_1_postcode = 'CV35 7QW'
ref25.reference_1_country = 'United Kingdom'
ref25.reference_1_relationship = 'structure'
ref25.reference_1_telephone = '44-(169)666-7597'
ref25.reference_2_full_name = 'Evelyn Fuller'
ref25.reference_2_email = 'efullerp@booking.com'
ref25.reference_2_occupation = 'Web Designer II'
ref25.reference_2_address_1 = '7491 Merchant Lane'
ref25.reference_2_address_2 = 'Brampton'
ref25.reference_2_postcode = 'NR34 3TR'
ref25.reference_2_country = 'United Kingdom'
ref25.reference_2_relationship = 'Mandatory'
ref25.reference_2_telephone = '44-(744)835-3534'
ref25.save!

course38 = CourseSelection.new application_id: app13.id, course_id: 8
course38.save!

student14 = Student.new
student14.first_name = 'Irene'
student14.family_name = 'Freeman'
student14.email = 'dfreemand@thetimes.co.uk'
student14.scottish_candidate_number = '179777479'
student14.national_insurance_number = 'NJ163726B'
student14.password = 'secret'
student14.password_confirmation = 'secret'
student14.confirmed_at = DateTime.now
student14.save!

app14 = student14.create_application
app14.title = 'Honorable'
app14.middle_name = ''
app14.gender = :female
app14.telephone = '44-(586)204-9916'
app14.email = 'dfreemand@thetimes.co.uk'
app14.personal_statement = 'Maecenas tristique est et tempus semper. Est quam pharetra magna ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'
app14.permanent_house_number = '70709'
app14.permanent_address_1 = 'Pierstorff Point'
app14.permanent_address_2 = 'Milton'
app14.permanent_postcode = 'NG22 2GR'
app14.permanent_country = 'United Kingdom'
app14.state = :completed
app14.save!

school27 = School.new application: app14
school27.name = 'Heriot-Watt University'
school27.address_1 = '75 Petterle Alley'
school27.address_2 = 'Newtown'
school27.country = 'United Kingdom'
school27.postcode = 'RG20 3FB'
school27.save!

qualification79 = Qualification.new school: school27
qualification79.subject = 'English'
qualification79.award = 'HND'
qualification79.grade = 'B'
qualification79.start_date = Date.new(2013, 8, 23)
qualification79.end_date = Date.new(2013, 6, 8)
qualification79.save!

qualification80 = Qualification.new school: school27
qualification80.subject = 'Chemistry'
qualification80.award = 'HNC'
qualification80.grade = 'D'
qualification80.start_date = Date.new(2012, 8, 23)
qualification80.end_date = Date.new(2016, 6, 8)
qualification80.save!

qualification81 = Qualification.new school: school27
qualification81.subject = 'Art'
qualification81.award = 'Standard'
qualification81.grade = 'C'
qualification81.start_date = Date.new(2014, 8, 23)
qualification81.end_date = Date.new(2014, 6, 8)
qualification81.save!

school28 = School.new application: app14
school28.name = 'South Bank University'
school28.address_1 = '69406 Badeau Hill'
school28.address_2 = 'East End'
school28.country = 'United Kingdom'
school28.postcode = 'BH21 3FB'
school28.save!

qualification82 = Qualification.new school: school28
qualification82.subject = 'PE'
qualification82.award = 'HNC'
qualification82.grade = 'B'
qualification82.start_date = Date.new(2014, 8, 23)
qualification82.end_date = Date.new(2016, 6, 8)
qualification82.save!

qualification83 = Qualification.new school: school28
qualification83.subject = 'Art'
qualification83.award = 'HND'
qualification83.grade = 'A'
qualification83.start_date = Date.new(2014, 8, 23)
qualification83.end_date = Date.new(2014, 6, 8)
qualification83.save!

qualification84 = Qualification.new school: school28
qualification84.subject = 'Maths'
qualification84.award = 'HND'
qualification84.grade = 'A'
qualification84.start_date = Date.new(2012, 8, 23)
qualification84.end_date = Date.new(2015, 6, 8)
qualification84.save!

job27 = Job.new application: app14
job27.employer = 'Gabtune'
job27.address_1 = '829 Moland Road'
job27.address_2 = 'West End'
job27.postcode = 'DN36'
job27.country = 'United Kingdom'
job27.job_title = 'Safety Technician II'
job27.duties = 'Upgradable fresh-thinking monitoring'
job27.start_date = Date.parse('2013-02-11')
job27.end_date = Date.parse('2016-10-28')
job27.save!

job28 = Job.new application: app14
job28.employer = 'Realcube'
job28.address_1 = '74423 Caliangt Point'
job28.address_2 = 'Bristol'
job28.postcode = 'BS41'
job28.country = 'United Kingdom'
job28.job_title = 'Systems Administrator IV'
job28.duties = 'Robust didactic product'
job28.start_date = Date.parse('2010-06-11')
job28.end_date = Date.parse('2014-12-26')
job28.save!

ref27 = Reference.new application: app14
ref27.reference_1_full_name = 'Karen Phillips'
ref27.reference_1_email = 'kphillipsq@forbes.com'
ref27.reference_1_occupation = 'Senior Sales Associate'
ref27.reference_1_address_1 = '0595 Mosinee Avenue'
ref27.reference_1_address_2 = 'London'
ref27.reference_1_postcode = 'EC1V 7QW'
ref27.reference_1_country = 'United Kingdom'
ref27.reference_1_relationship = 'artificial intelligence'
ref27.reference_1_telephone = '44-(346)219-2735'
ref27.reference_2_full_name = 'Timothy Gutierrez'
ref27.reference_2_email = 'tgutierrezr@cisco.com'
ref27.reference_2_occupation = 'Quality Control Specialist'
ref27.reference_2_address_1 = '1045 North Parkway'
ref27.reference_2_address_2 = 'Denton'
ref27.reference_2_postcode = 'M34 3TR'
ref27.reference_2_country = 'United Kingdom'
ref27.reference_2_relationship = 'actuating'
ref27.reference_2_telephone = '44-(551)706-9879'
ref27.save!

course39 = CourseSelection.new application_id: app14.id, course_id: 22
course39.save!

course40 = CourseSelection.new application_id: app14.id, course_id: 12
course40.save!

student15 = Student.new
student15.first_name = 'Phyllis'
student15.family_name = 'Harvey'
student15.email = 'dharveye@ehow.com'
student15.scottish_candidate_number = '170608267'
student15.national_insurance_number = 'NJ164883C'
student15.password = 'secret'
student15.password_confirmation = 'secret'
student15.confirmed_at = DateTime.now
student15.save!

app15 = student15.create_application
app15.title = 'Ms'
app15.middle_name = 'Diana'
app15.gender = :female
app15.telephone = '44-(146)514-3203'
app15.mobile = '44-(611)225-4123'
app15.email = 'dharveye@ehow.com'
app15.disability = 'Innovative zero defect database'
app15.personal_statement = 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'
app15.permanent_house_number = '1164'
app15.permanent_address_1 = 'Nelson Pass'
app15.permanent_address_2 = 'Edinburgh'
app15.permanent_postcode = 'EH9 2GR'
app15.permanent_country = 'United Kingdom'
app15.state = :completed
app15.save!

school29 = School.new application: app15
school29.name = 'University of Portsmouth'
school29.address_1 = '23 Cody Park'
school29.address_2 = 'Preston'
school29.country = 'United Kingdom'
school29.postcode = 'PR1 3FB'
school29.save!

qualification85 = Qualification.new school: school29
qualification85.subject = 'Physics'
qualification85.award = 'Higher'
qualification85.grade = 'A'
qualification85.start_date = Date.new(2014, 8, 23)
qualification85.end_date = Date.new(2016, 6, 8)
qualification85.save!

qualification86 = Qualification.new school: school29
qualification86.subject = 'Art'
qualification86.award = 'Standard'
qualification86.grade = 'A'
qualification86.start_date = Date.new(2014, 8, 23)
qualification86.end_date = Date.new(2013, 6, 8)
qualification86.save!

qualification87 = Qualification.new school: school29
qualification87.subject = 'Technological Studies'
qualification87.award = 'HNC'
qualification87.grade = 'Pass'
qualification87.start_date = Date.new(2013, 8, 23)
qualification87.end_date = Date.new(2015, 6, 8)
qualification87.save!

school30 = School.new application: app15
school30.name = 'The Manchester Metropolitan University'
school30.address_1 = '049 Quincy Pass'
school30.address_2 = 'Norton'
school30.country = 'United Kingdom'
school30.postcode = 'S8 3FB'
school30.save!

qualification88 = Qualification.new school: school30
qualification88.subject = 'English'
qualification88.award = 'HND'
qualification88.grade = 'C'
qualification88.start_date = Date.new(2014, 8, 23)
qualification88.end_date = Date.new(2013, 6, 8)
qualification88.save!

qualification89 = Qualification.new school: school30
qualification89.subject = 'Computing'
qualification89.award = 'HND'
qualification89.grade = 'D'
qualification89.start_date = Date.new(2012, 8, 23)
qualification89.end_date = Date.new(2013, 6, 8)
qualification89.save!

qualification90 = Qualification.new school: school30
qualification90.subject = 'Computing'
qualification90.award = 'Standard'
qualification90.grade = 'C'
qualification90.start_date = Date.new(2014, 8, 23)
qualification90.end_date = Date.new(2015, 6, 8)
qualification90.save!

job29 = Job.new application: app15
job29.employer = 'Eamia'
job29.address_1 = '58 Upham Road'
job29.address_2 = 'Carlton'
job29.postcode = 'DL8'
job29.country = 'United Kingdom'
job29.job_title = 'Editor'
job29.duties = 'Fundamental leading edge help-desk'
job29.start_date = Date.parse('2012-10-13')
job29.end_date = Date.parse('2015-08-18')
job29.save!

job30 = Job.new application: app15
job30.employer = 'Jabberstorm'
job30.address_1 = '9 Swallow Crossing'
job30.address_2 = 'Kinloch'
job30.postcode = 'PH43'
job30.country = 'United Kingdom'
job30.job_title = 'Actuary'
job30.duties = 'Progressive tertiary structure'
job30.start_date = Date.parse('2012-12-26')
job30.end_date = Date.parse('2016-11-05')
job30.save!

ref29 = Reference.new application: app15
ref29.reference_1_full_name = 'Jacqueline Lewis'
ref29.reference_1_email = 'jlewiss@php.net'
ref29.reference_1_occupation = 'Junior Executive'
ref29.reference_1_address_1 = '252 Beilfuss Crossing'
ref29.reference_1_address_2 = 'Eaton'
ref29.reference_1_postcode = 'DN22 7QW'
ref29.reference_1_country = 'United Kingdom'
ref29.reference_1_relationship = 'time-frame'
ref29.reference_1_telephone = '44-(394)246-0959'
ref29.reference_2_full_name = 'Martha Grant'
ref29.reference_2_email = 'mgrantt@hhs.gov'
ref29.reference_2_occupation = 'Geological Engineer'
ref29.reference_2_address_1 = '40210 Springs Court'
ref29.reference_2_address_2 = 'Buckland'
ref29.reference_2_postcode = 'CT16 3TR'
ref29.reference_2_country = 'United Kingdom'
ref29.reference_2_relationship = 'Adaptive'
ref29.reference_2_telephone = '44-(251)612-1118'
ref29.save!

course41 = CourseSelection.new application_id: app15.id, course_id: 2
course41.save!

student16 = Student.new
student16.first_name = 'Shirley'
student16.family_name = 'Henry'
student16.email = 'ahenryf@360.cn'
student16.scottish_candidate_number = '176201223'
student16.national_insurance_number = 'NJ992426C'
student16.password = 'secret'
student16.password_confirmation = 'secret'
student16.confirmed_at = DateTime.now
student16.save!

app16 = student16.create_application
app16.title = 'Ms'
app16.middle_name = 'Anne'
app16.previous_name = 'Anne Henry'
app16.gender = :female
app16.telephone = '44-(741)548-1274'
app16.mobile = '44-(801)248-8980'
app16.email = 'ahenryf@360.cn'
app16.personal_statement = 'Quisque porta volutpat erat. Quisque erat eros viverra eget congue eget. Semper rutrum nulla. Nunc purus.'
app16.permanent_house_number = '15433'
app16.permanent_address_1 = 'Cascade Crossing'
app16.permanent_postcode = 'PR1 2GR'
app16.permanent_country = 'United Kingdom'
app16.state = :completed
app16.save!

school31 = School.new application: app16
school31.name = 'University of Wales'
school31.address_1 = '2 Anzinger Park'
school31.address_2 = 'Edinburgh'
school31.country = 'United Kingdom'
school31.postcode = 'EH9 3FB'
school31.save!

qualification91 = Qualification.new school: school31
qualification91.subject = 'Geography'
qualification91.award = 'NQ'
qualification91.grade = 'C'
qualification91.start_date = Date.new(2014, 8, 23)
qualification91.end_date = Date.new(2013, 6, 8)
qualification91.save!

qualification92 = Qualification.new school: school31
qualification92.subject = 'Biology'
qualification92.award = 'Higher'
qualification92.grade = 'C'
qualification92.start_date = Date.new(2015, 8, 23)
qualification92.end_date = Date.new(2015, 6, 8)
qualification92.save!

qualification93 = Qualification.new school: school31
qualification93.subject = 'English'
qualification93.award = 'Standard'
qualification93.grade = 'D'
qualification93.start_date = Date.new(2015, 8, 23)
qualification93.end_date = Date.new(2014, 6, 8)
qualification93.save!

school32 = School.new application: app16
school32.name = 'Staffordshire University'
school32.address_1 = '2 Express Drive'
school32.address_2 = 'Norton'
school32.country = 'United Kingdom'
school32.postcode = 'NN11 3FB'
school32.save!

qualification94 = Qualification.new school: school32
qualification94.subject = 'Technological Studies'
qualification94.award = 'HNC'
qualification94.grade = 'D'
qualification94.start_date = Date.new(2015, 8, 23)
qualification94.end_date = Date.new(2013, 6, 8)
qualification94.save!

qualification95 = Qualification.new school: school32
qualification95.subject = 'Geography'
qualification95.award = 'Standard'
qualification95.grade = 'A'
qualification95.start_date = Date.new(2012, 8, 23)
qualification95.end_date = Date.new(2015, 6, 8)
qualification95.save!

qualification96 = Qualification.new school: school32
qualification96.subject = 'Geography'
qualification96.award = 'Higher'
qualification96.grade = 'Pass'
qualification96.start_date = Date.new(2015, 8, 23)
qualification96.end_date = Date.new(2013, 6, 8)
qualification96.save!

job31 = Job.new application: app16
job31.employer = 'Mydeo'
job31.address_1 = '6728 Blue Bill Park Point'
job31.address_2 = 'Bradford'
job31.postcode = 'BD7'
job31.country = 'United Kingdom'
job31.job_title = 'Compensation Analyst'
job31.duties = 'Virtual national orchestration'
job31.start_date = Date.parse('2012-09-06')
job31.end_date = Date.parse('2016-09-08')
job31.save!

job32 = Job.new application: app16
job32.employer = 'Topdrive'
job32.address_1 = '73981 Fuller Junction'
job32.address_2 = 'Glasgow'
job32.postcode = 'G4'
job32.country = 'United Kingdom'
job32.job_title = 'Biostatistician II'
job32.duties = 'Fully-configurable explicit data-warehouse'
job32.start_date = Date.parse('2012-04-09')
job32.end_date = Date.parse('2013-12-01')
job32.save!

ref31 = Reference.new application: app16
ref31.reference_1_full_name = 'Ruby Ramos'
ref31.reference_1_email = 'rramosu@issuu.com'
ref31.reference_1_occupation = 'Nurse'
ref31.reference_1_address_1 = '8 Morningstar '
ref31.reference_1_address_2 = 'London'
ref31.reference_1_postcode = 'WC2H 7QW'
ref31.reference_1_country = 'United Kingdom'
ref31.reference_1_relationship = 'model'
ref31.reference_1_telephone = '44-(864)894-0215'
ref31.reference_2_full_name = 'Kathy Parker'
ref31.reference_2_email = 'kparkerv@barnesandnoble.com'
ref31.reference_2_occupation = 'Teacher'
ref31.reference_2_address_1 = '250 4th '
ref31.reference_2_address_2 = 'Edinburgh'
ref31.reference_2_postcode = 'EH9 3TR'
ref31.reference_2_country = 'United Kingdom'
ref31.reference_2_relationship = 'parallelism'
ref31.reference_2_telephone = '44-(351)167-5329'
ref31.save!

course42 = CourseSelection.new application_id: app16.id, course_id: 22
course42.save!

course43 = CourseSelection.new application_id: app16.id, course_id: 16
course43.save!

student17 = Student.new
student17.first_name = 'Joshua'
student17.family_name = 'Reyes'
student17.email = 'creyesg@noaa.gov'
student17.scottish_candidate_number = '179537389'
student17.national_insurance_number = 'NJ791914B'
student17.password = 'secret'
student17.password_confirmation = 'secret'
student17.confirmed_at = DateTime.now
student17.save!

app17 = student17.create_application
app17.title = 'Mr'
app17.middle_name = 'Craig'
app17.gender = :male
app17.telephone = '44-(143)333-3096'
app17.mobile = '44-(167)858-3082'
app17.email = 'creyesg@noaa.gov'
app17.personal_statement = 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'
app17.permanent_house_number = '102'
app17.permanent_address_1 = 'Green Ridge Park'
app17.permanent_postcode = 'ST20 2GR'
app17.permanent_country = 'United Kingdom'
app17.correspondence_house_number = '8395'
app17.correspondence_address_1 = 'Hermina Junction'
app17.correspondence_address_2 = 'Mr'
app17.correspondence_postcode = 'CT16 2GR'
app17.correspondence_country = 'United Kingdom'
app17.state = :completed
app17.save!

school33 = School.new application: app17
school33.name = 'Wimbledon School of Art'
school33.address_1 = '476 Sunfield Point'
school33.address_2 = 'East End'
school33.country = 'United Kingdom'
school33.postcode = 'BH21 3FB'
school33.save!

qualification97 = Qualification.new school: school33
qualification97.subject = 'Computing'
qualification97.award = 'NQ'
qualification97.grade = 'Pass'
qualification97.start_date = Date.new(2013, 8, 23)
qualification97.end_date = Date.new(2016, 6, 8)
qualification97.save!

qualification98 = Qualification.new school: school33
qualification98.subject = 'Computing'
qualification98.award = 'Higher'
qualification98.grade = 'D'
qualification98.start_date = Date.new(2014, 8, 23)
qualification98.end_date = Date.new(2014, 6, 8)
qualification98.save!

qualification99 = Qualification.new school: school33
qualification99.subject = 'Biology'
qualification99.award = 'Standard'
qualification99.grade = 'Pass'
qualification99.start_date = Date.new(2014, 8, 23)
qualification99.end_date = Date.new(2015, 6, 8)
qualification99.save!

school34 = School.new application: app17
school34.name = 'University of St. Andrews'
school34.address_1 = '670 Corscot Terrace'
school34.address_2 = 'Bristol'
school34.country = 'United Kingdom'
school34.postcode = 'BS41 3FB'
school34.save!

qualification100 = Qualification.new school: school34
qualification100.subject = 'English'
qualification100.award = 'HND'
qualification100.grade = 'A'
qualification100.start_date = Date.new(2015, 8, 23)
qualification100.end_date = Date.new(2013, 6, 8)
qualification100.save!

qualification101 = Qualification.new school: school34
qualification101.subject = 'Geography'
qualification101.award = 'HND'
qualification101.grade = 'A'
qualification101.start_date = Date.new(2014, 8, 23)
qualification101.end_date = Date.new(2016, 6, 8)
qualification101.save!

qualification102 = Qualification.new school: school34
qualification102.subject = 'English'
qualification102.award = 'Standard'
qualification102.grade = 'B'
qualification102.start_date = Date.new(2014, 8, 23)
qualification102.end_date = Date.new(2016, 6, 8)
qualification102.save!

job33 = Job.new application: app17
job33.employer = 'Thoughtworks'
job33.address_1 = '86217 Green Alley'
job33.address_2 = 'Thorpe'
job33.postcode = 'BD23'
job33.country = 'United Kingdom'
job33.job_title = 'Human Resources Assistant III'
job33.duties = 'Profound bifurcated software'
job33.start_date = Date.parse('2010-12-04')
job33.end_date = Date.parse('2014-01-11')
job33.save!

job34 = Job.new application: app17
job34.employer = 'Flashpoint'
job34.address_1 = '408 Roxbury Plaza'
job34.address_2 = 'Wirral'
job34.postcode = 'CH48'
job34.country = 'United Kingdom'
job34.job_title = 'Professor'
job34.duties = 'Focused dedicated internet solution'
job34.start_date = Date.parse('2010-10-21')
job34.end_date = Date.parse('2016-12-06')
job34.save!

ref33 = Reference.new application: app17
ref33.reference_1_full_name = 'Wanda White'
ref33.reference_1_email = 'wwhitew@vkontakte.ru'
ref33.reference_1_occupation = 'Nurse Practicioner'
ref33.reference_1_address_1 = '5541 Monument Park'
ref33.reference_1_address_2 = 'Normanton'
ref33.reference_1_postcode = 'LE15 7QW'
ref33.reference_1_country = 'United Kingdom'
ref33.reference_1_relationship = 'artificial intelligence'
ref33.reference_1_telephone = '44-(686)422-8426'
ref33.reference_2_full_name = 'Gloria Lawrence'
ref33.reference_2_email = 'glawrencex@ucoz.ru'
ref33.reference_2_occupation = 'Internal Auditor'
ref33.reference_2_address_1 = '5938 Randy '
ref33.reference_2_address_2 = 'Craigavon'
ref33.reference_2_postcode = 'BT66 3TR'
ref33.reference_2_country = 'United Kingdom'
ref33.reference_2_relationship = '24/7'
ref33.reference_2_telephone = '44-(240)678-3099'
ref33.save!

course44 = CourseSelection.new application_id: app17.id, course_id: 21
course44.save!

student18 = Student.new
student18.first_name = 'Jane'
student18.family_name = 'Hughes'
student18.email = 'jhughesh@gov.uk'
student18.scottish_candidate_number = '177418749'
student18.national_insurance_number = 'NJ426685D'
student18.password = 'secret'
student18.password_confirmation = 'secret'
student18.confirmed_at = DateTime.now
student18.save!

app18 = student18.create_application
app18.title = 'Rev'
app18.middle_name = 'Judy'
app18.gender = :female
app18.telephone = '44-(475)167-8103'
app18.mobile = '44-(129)184-0157'
app18.email = 'jhughesh@gov.uk'
app18.personal_statement = 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'
app18.permanent_house_number = '2450'
app18.permanent_address_1 = 'Portage Plaza'
app18.permanent_address_2 = 'Newtown'
app18.permanent_postcode = 'RG20 2GR'
app18.permanent_country = 'United Kingdom'
app18.state = :completed
app18.save!

school35 = School.new application: app18
school35.name = 'University of Aberdeen'
school35.address_1 = '4 Susan Place'
school35.address_2 = 'Whitchurch'
school35.country = 'United Kingdom'
school35.postcode = 'BS14 3FB'
school35.save!

qualification103 = Qualification.new school: school35
qualification103.subject = 'Chemistry'
qualification103.award = 'Standard'
qualification103.grade = 'A'
qualification103.start_date = Date.new(2014, 8, 23)
qualification103.end_date = Date.new(2014, 6, 8)
qualification103.save!

qualification104 = Qualification.new school: school35
qualification104.subject = 'English'
qualification104.award = 'Higher'
qualification104.grade = 'C'
qualification104.start_date = Date.new(2013, 8, 23)
qualification104.end_date = Date.new(2014, 6, 8)
qualification104.save!

qualification105 = Qualification.new school: school35
qualification105.subject = 'Biology'
qualification105.award = 'HND'
qualification105.grade = 'D'
qualification105.start_date = Date.new(2012, 8, 23)
qualification105.end_date = Date.new(2014, 6, 8)
qualification105.save!

school36 = School.new application: app18
school36.name = 'Middlesex University'
school36.address_1 = '3 Scott Avenue'
school36.address_2 = 'Leeds'
school36.country = 'United Kingdom'
school36.postcode = 'LS6 3FB'
school36.save!

qualification106 = Qualification.new school: school36
qualification106.subject = 'Biology'
qualification106.award = 'Standard'
qualification106.grade = 'C'
qualification106.start_date = Date.new(2013, 8, 23)
qualification106.end_date = Date.new(2014, 6, 8)
qualification106.save!

qualification107 = Qualification.new school: school36
qualification107.subject = 'Geography'
qualification107.award = 'Standard'
qualification107.grade = 'D'
qualification107.start_date = Date.new(2012, 8, 23)
qualification107.end_date = Date.new(2013, 6, 8)
qualification107.save!

qualification108 = Qualification.new school: school36
qualification108.subject = 'Chemistry'
qualification108.award = 'NQ'
qualification108.grade = 'Pass'
qualification108.start_date = Date.new(2015, 8, 23)
qualification108.end_date = Date.new(2016, 6, 8)
qualification108.save!

job35 = Job.new application: app18
job35.employer = 'Skajo'
job35.address_1 = '84015 Hayes Court'
job35.address_2 = 'Middleton'
job35.postcode = 'LE16'
job35.country = 'United Kingdom'
job35.job_title = 'Senior Developer'
job35.duties = 'Profit-focused modular parallelism'
job35.start_date = Date.parse('2012-05-19')
job35.end_date = Date.parse('2015-08-09')
job35.save!

job36 = Job.new application: app18
job36.employer = 'Zooveo'
job36.address_1 = '99 Nelson Junction'
job36.address_2 = 'Dean'
job36.postcode = 'OX7'
job36.country = 'United Kingdom'
job36.job_title = 'Desktop Support Technician'
job36.duties = 'Implemented bandwidth-monitored conglomeration'
job36.start_date = Date.parse('2012-06-03')
job36.end_date = Date.parse('2014-04-11')
job36.save!

ref35 = Reference.new application: app18
ref35.reference_1_full_name = 'Terry Banks'
ref35.reference_1_email = 'tbanksy@histats.com'
ref35.reference_1_occupation = 'Database Administrator I'
ref35.reference_1_address_1 = '04 Weeping Birch '
ref35.reference_1_address_2 = 'Kinloch'
ref35.reference_1_postcode = 'PH43 7QW'
ref35.reference_1_country = 'United Kingdom'
ref35.reference_1_relationship = 'approach'
ref35.reference_1_telephone = '44-(771)429-7912'
ref35.reference_2_full_name = 'Phyllis Larson'
ref35.reference_2_email = 'plarsonz@github.com'
ref35.reference_2_occupation = 'Help Desk Technician'
ref35.reference_2_address_1 = '775 Hanover Junction'
ref35.reference_2_address_2 = 'Whitchurch'
ref35.reference_2_postcode = 'BS14 3TR'
ref35.reference_2_country = 'United Kingdom'
ref35.reference_2_relationship = 'Exclusive'
ref35.reference_2_telephone = '44-(995)797-4055'
ref35.save!

course45 = CourseSelection.new application_id: app18.id, course_id: 19
course45.save!

course46 = CourseSelection.new application_id: app18.id, course_id: 11
course46.save!

student19 = Student.new
student19.first_name = 'Gregory'
student19.family_name = 'Reid'
student19.email = 'jreidi@zdnet.com'
student19.scottish_candidate_number = '173208731'
student19.national_insurance_number = 'NJ648226C'
student19.password = 'secret'
student19.password_confirmation = 'secret'
student19.confirmed_at = DateTime.now
student19.save!

app19 = student19.create_application
app19.title = 'Rev'
app19.middle_name = ''
app19.previous_name = 'Jesse Reid'
app19.gender = :male
app19.telephone = '44-(755)660-8170'
app19.email = 'jreidi@zdnet.com'
app19.personal_statement = 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
app19.permanent_house_number = '148'
app19.permanent_address_1 = 'Cardinal Terrace'
app19.permanent_postcode = 'AB39 2GR'
app19.permanent_country = 'United Kingdom'
app19.correspondence_house_number = '005'
app19.correspondence_address_1 = 'Carberry Street'
app19.correspondence_address_2 = 'Rev'
app19.correspondence_postcode = 'NG34 2GR'
app19.correspondence_country = 'United Kingdom'
app19.state = :completed
app19.save!

school37 = School.new application: app19
school37.name = 'University of Aberdeen'
school37.address_1 = '725 Anderson Drive'
school37.address_2 = 'Ashley'
school37.country = 'United Kingdom'
school37.postcode = 'SN13 3FB'
school37.save!

qualification109 = Qualification.new school: school37
qualification109.subject = 'Biology'
qualification109.award = 'HNC'
qualification109.grade = 'D'
qualification109.start_date = Date.new(2012, 8, 23)
qualification109.end_date = Date.new(2013, 6, 8)
qualification109.save!

qualification110 = Qualification.new school: school37
qualification110.subject = 'Maths'
qualification110.award = 'HNC'
qualification110.grade = 'D'
qualification110.start_date = Date.new(2012, 8, 23)
qualification110.end_date = Date.new(2015, 6, 8)
qualification110.save!

qualification111 = Qualification.new school: school37
qualification111.subject = 'Woodworking'
qualification111.award = 'NQ'
qualification111.grade = 'A'
qualification111.start_date = Date.new(2013, 8, 23)
qualification111.end_date = Date.new(2013, 6, 8)
qualification111.save!

school38 = School.new application: app19
school38.name = 'University of Central Lancashire'
school38.address_1 = '9229 Transport Street'
school38.address_2 = 'London'
school38.country = 'United Kingdom'
school38.postcode = 'EC3M 3FB'
school38.save!

qualification112 = Qualification.new school: school38
qualification112.subject = 'Technological Studies'
qualification112.award = 'HND'
qualification112.grade = 'B'
qualification112.start_date = Date.new(2013, 8, 23)
qualification112.end_date = Date.new(2014, 6, 8)
qualification112.save!

qualification113 = Qualification.new school: school38
qualification113.subject = 'Woodworking'
qualification113.award = 'HND'
qualification113.grade = 'Pass'
qualification113.start_date = Date.new(2014, 8, 23)
qualification113.end_date = Date.new(2016, 6, 8)
qualification113.save!

qualification114 = Qualification.new school: school38
qualification114.subject = 'Woodworking'
qualification114.award = 'NQ'
qualification114.grade = 'A'
qualification114.start_date = Date.new(2013, 8, 23)
qualification114.end_date = Date.new(2014, 6, 8)
qualification114.save!

job37 = Job.new application: app19
job37.employer = 'Dabshots'
job37.address_1 = '2 Sloan Court'
job37.address_2 = 'Belfast'
job37.postcode = 'BT2'
job37.country = 'United Kingdom'
job37.job_title = 'Database Administrator I'
job37.duties = 'Reverse-engineered zero defect focus group'
job37.start_date = Date.parse('2010-05-02')
job37.end_date = Date.parse('2016-03-17')
job37.save!

job38 = Job.new application: app19
job38.employer = 'Buzzbean'
job38.address_1 = '0917 Briar Crest Avenue'
job38.address_2 = 'Bristol'
job38.postcode = 'BS41'
job38.country = 'United Kingdom'
job38.job_title = 'Accounting Assistant IV'
job38.duties = 'Multi-channelled bi-directional focus group'
job38.start_date = Date.parse('2010-09-16')
job38.end_date = Date.parse('2016-05-01')
job38.save!

ref37 = Reference.new application: app19
ref37.reference_1_full_name = 'Willie Murray'
ref37.reference_1_email = 'wmurray10@xing.com'
ref37.reference_1_occupation = 'Food Chemist'
ref37.reference_1_address_1 = '7805 Pond Lane'
ref37.reference_1_address_2 = 'Swindon'
ref37.reference_1_postcode = 'SN1 7QW'
ref37.reference_1_country = 'United Kingdom'
ref37.reference_1_relationship = 'emulation'
ref37.reference_1_telephone = '44-(720)490-0283'
ref37.reference_2_full_name = 'Patrick Williams'
ref37.reference_2_email = 'pwilliams11@yellowpages.com'
ref37.reference_2_occupation = 'Design Engineer'
ref37.reference_2_address_1 = '784 Holy Cross Avenue'
ref37.reference_2_address_2 = 'Denton'
ref37.reference_2_postcode = 'M34 3TR'
ref37.reference_2_country = 'United Kingdom'
ref37.reference_2_relationship = 'encryption'
ref37.reference_2_telephone = '44-(859)845-9504'
ref37.save!

course47 = CourseSelection.new application_id: app19.id, course_id: 24
course47.save!

student20 = Student.new
student20.first_name = 'Antonio'
student20.family_name = 'Richardson'
student20.email = 'drichardsonj@google.co.uk'
student20.scottish_candidate_number = '176686871'
student20.national_insurance_number = 'NJ494308B'
student20.password = 'secret'
student20.password_confirmation = 'secret'
student20.confirmed_at = DateTime.now
student20.save!

app20 = student20.create_application
app20.title = 'Rev'
app20.middle_name = 'Dennis'
app20.previous_name = 'Dennis Richardson'
app20.gender = :male
app20.telephone = '44-(250)929-4363'
app20.mobile = '44-(860)877-2080'
app20.email = 'drichardsonj@google.co.uk'
app20.personal_statement = 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem.'
app20.permanent_house_number = '67870'
app20.permanent_address_1 = 'Bashford Lane'
app20.permanent_postcode = 'BS14 2GR'
app20.permanent_country = 'United Kingdom'
app20.state = :completed
app20.save!

school39 = School.new application: app20
school39.name = 'Trinity College Carmarthen'
school39.address_1 = '2258 Gerald Pass'
school39.address_2 = 'Upton'
school39.country = 'United Kingdom'
school39.postcode = 'WF9 3FB'
school39.save!

qualification115 = Qualification.new school: school39
qualification115.subject = 'Art'
qualification115.award = 'HNC'
qualification115.grade = 'B'
qualification115.start_date = Date.new(2014, 8, 23)
qualification115.end_date = Date.new(2016, 6, 8)
qualification115.save!

qualification116 = Qualification.new school: school39
qualification116.subject = 'Chemistry'
qualification116.award = 'HNC'
qualification116.grade = 'C'
qualification116.start_date = Date.new(2015, 8, 23)
qualification116.end_date = Date.new(2013, 6, 8)
qualification116.save!

qualification117 = Qualification.new school: school39
qualification117.subject = 'Biology'
qualification117.award = 'HNC'
qualification117.grade = 'A'
qualification117.start_date = Date.new(2014, 8, 23)
qualification117.end_date = Date.new(2013, 6, 8)
qualification117.save!

school40 = School.new application: app20
school40.name = 'University of East Anglia'
school40.address_1 = '01016 Montana Alley'
school40.address_2 = 'Whitwell'
school40.country = 'United Kingdom'
school40.postcode = 'DL10 3FB'
school40.save!

qualification118 = Qualification.new school: school40
qualification118.subject = 'Physics'
qualification118.award = 'HND'
qualification118.grade = 'Pass'
qualification118.start_date = Date.new(2014, 8, 23)
qualification118.end_date = Date.new(2014, 6, 8)
qualification118.save!

qualification119 = Qualification.new school: school40
qualification119.subject = 'Art'
qualification119.award = 'Higher'
qualification119.grade = 'B'
qualification119.start_date = Date.new(2012, 8, 23)
qualification119.end_date = Date.new(2014, 6, 8)
qualification119.save!

qualification120 = Qualification.new school: school40
qualification120.subject = 'English'
qualification120.award = 'HNC'
qualification120.grade = 'C'
qualification120.start_date = Date.new(2014, 8, 23)
qualification120.end_date = Date.new(2014, 6, 8)
qualification120.save!

job39 = Job.new application: app20
job39.employer = 'Quimm'
job39.address_1 = '590 Ridgeway Plaza'
job39.address_2 = 'Denton'
job39.postcode = 'M34'
job39.country = 'United Kingdom'
job39.job_title = 'Research Nurse'
job39.duties = 'Re-engineered encompassing solution'
job39.start_date = Date.parse('2010-04-13')
job39.end_date = Date.parse('2013-11-27')
job39.save!

job40 = Job.new application: app20
job40.employer = 'Jatri'
job40.address_1 = '317 Dottie Hill'
job40.address_2 = 'Norton'
job40.postcode = 'NN11'
job40.country = 'United Kingdom'
job40.job_title = 'Web Designer IV'
job40.duties = 'Object-based value-added policy'
job40.start_date = Date.parse('2010-05-17')
job40.end_date = Date.parse('2014-01-10')
job40.save!

ref39 = Reference.new application: app20
ref39.reference_1_full_name = 'Karen Collins'
ref39.reference_1_email = 'kcollins12@yahoo.com'
ref39.reference_1_occupation = 'Junior Executive'
ref39.reference_1_address_1 = '081 Boyd Trail'
ref39.reference_1_address_2 = 'Preston'
ref39.reference_1_postcode = 'PR1 7QW'
ref39.reference_1_country = 'United Kingdom'
ref39.reference_1_relationship = 'Profound'
ref39.reference_1_telephone = '44-(345)429-3166'
ref39.reference_2_full_name = 'Alan Sullivan'
ref39.reference_2_email = 'asullivan13@canalblog.com'
ref39.reference_2_occupation = 'Cost Accountant'
ref39.reference_2_address_1 = '841 Kedzie Lane'
ref39.reference_2_address_2 = 'Burnside'
ref39.reference_2_postcode = 'EH52 3TR'
ref39.reference_2_country = 'United Kingdom'
ref39.reference_2_relationship = 'instruction set'
ref39.reference_2_telephone = '44-(590)169-0449'
ref39.save!

course48 = CourseSelection.new application_id: app20.id, course_id: 24
course48.save!

student21 = Student.new
student21.first_name = 'Beverly'
student21.family_name = 'Kelly'
student21.email = 'kkellyk@usnews.com'
student21.scottish_candidate_number = '170567153'
student21.national_insurance_number = 'NJ529594C'
student21.password = 'secret'
student21.password_confirmation = 'secret'
student21.confirmed_at = DateTime.now
student21.save!

app21 = student21.create_application
app21.title = 'Dr'
app21.middle_name = 'Kelly'
app21.gender = :female
app21.telephone = '44-(933)888-5582'
app21.mobile = '44-(251)702-9828'
app21.email = 'kkellyk@usnews.com'
app21.personal_statement = 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'
app21.permanent_house_number = '4'
app21.permanent_address_1 = 'Fremont Parkway'
app21.permanent_address_2 = 'Eaton'
app21.permanent_postcode = 'DN22 2GR'
app21.permanent_country = 'United Kingdom'
app21.state = :completed
app21.save!

school41 = School.new application: app21
school41.name = 'Courtauld Institute of Art'
school41.address_1 = '66836 Bayside Avenue'
school41.address_2 = 'Newton'
school41.country = 'United Kingdom'
school41.postcode = 'IV1 3FB'
school41.save!

qualification121 = Qualification.new school: school41
qualification121.subject = 'Biology'
qualification121.award = 'HND'
qualification121.grade = 'B'
qualification121.start_date = Date.new(2015, 8, 23)
qualification121.end_date = Date.new(2016, 6, 8)
qualification121.save!

qualification122 = Qualification.new school: school41
qualification122.subject = 'Chemistry'
qualification122.award = 'Standard'
qualification122.grade = 'D'
qualification122.start_date = Date.new(2012, 8, 23)
qualification122.end_date = Date.new(2013, 6, 8)
qualification122.save!

qualification123 = Qualification.new school: school41
qualification123.subject = 'Physics'
qualification123.award = 'HND'
qualification123.grade = 'A'
qualification123.start_date = Date.new(2013, 8, 23)
qualification123.end_date = Date.new(2015, 6, 8)
qualification123.save!

school42 = School.new application: app21
school42.name = 'University of Halifax'
school42.address_1 = '3 Del Mar Lane'
school42.address_2 = 'Ford'
school42.country = 'United Kingdom'
school42.postcode = 'GL54 3FB'
school42.save!

qualification124 = Qualification.new school: school42
qualification124.subject = 'Technological Studies'
qualification124.award = 'NQ'
qualification124.grade = 'Pass'
qualification124.start_date = Date.new(2013, 8, 23)
qualification124.end_date = Date.new(2016, 6, 8)
qualification124.save!

qualification125 = Qualification.new school: school42
qualification125.subject = 'Geography'
qualification125.award = 'HND'
qualification125.grade = 'C'
qualification125.start_date = Date.new(2013, 8, 23)
qualification125.end_date = Date.new(2015, 6, 8)
qualification125.save!

qualification126 = Qualification.new school: school42
qualification126.subject = 'Computing'
qualification126.award = 'NQ'
qualification126.grade = 'D'
qualification126.start_date = Date.new(2012, 8, 23)
qualification126.end_date = Date.new(2013, 6, 8)
qualification126.save!

job41 = Job.new application: app21
job41.employer = 'Vitz'
job41.address_1 = '79 Sutteridge Park'
job41.address_2 = 'Eaton'
job41.postcode = 'DN22'
job41.country = 'United Kingdom'
job41.job_title = 'Budget/Accounting Analyst III'
job41.duties = 'Reactive stable process improvement'
job41.start_date = Date.parse('2013-03-01')
job41.end_date = Date.parse('2016-02-14')
job41.save!

job42 = Job.new application: app21
job42.employer = 'Oloo'
job42.address_1 = '40 Gerald Way'
job42.address_2 = 'Langley'
job42.postcode = 'SG4'
job42.country = 'United Kingdom'
job42.job_title = 'Chief Design Engineer'
job42.duties = 'Integrated scalable workforce'
job42.start_date = Date.parse('2010-10-18')
job42.end_date = Date.parse('2015-02-16')
job42.save!

ref41 = Reference.new application: app21
ref41.reference_1_full_name = 'Adam Smith'
ref41.reference_1_email = 'asmith14@intel.com'
ref41.reference_1_occupation = 'Dental Hygienist'
ref41.reference_1_address_1 = '9 Mifflin '
ref41.reference_1_address_2 = 'Norton'
ref41.reference_1_postcode = 'NN11 7QW'
ref41.reference_1_country = 'United Kingdom'
ref41.reference_1_relationship = 'Vision-oriented'
ref41.reference_1_telephone = '44-(104)407-6867'
ref41.reference_2_full_name = 'Jeffrey Lewis'
ref41.reference_2_email = 'jlewis15@amazon.de'
ref41.reference_2_occupation = 'Chief Design Engineer'
ref41.reference_2_address_1 = '296 Harper '
ref41.reference_2_address_2 = 'Newtown'
ref41.reference_2_postcode = 'RG20 3TR'
ref41.reference_2_country = 'United Kingdom'
ref41.reference_2_relationship = 'Expanded'
ref41.reference_2_telephone = '44-(953)973-0689'
ref41.save!

course49 = CourseSelection.new application_id: app21.id, course_id: 8
course49.save!

course50 = CourseSelection.new application_id: app21.id, course_id: 2
course50.save!

course51 = CourseSelection.new application_id: app21.id, course_id: 22
course51.save!

course52 = CourseSelection.new application_id: app21.id, course_id: 12
course52.save!

course53 = CourseSelection.new application_id: app21.id, course_id: 7
course53.save!

student22 = Student.new
student22.first_name = 'Jeremy'
student22.family_name = 'Hill'
student22.email = 'philll@tuttocitta.it'
student22.scottish_candidate_number = '175228225'
student22.national_insurance_number = 'NJ354384B'
student22.password = 'secret'
student22.password_confirmation = 'secret'
student22.confirmed_at = DateTime.now
student22.save!

app22 = student22.create_application
app22.title = 'Dr'
app22.middle_name = 'Phillip'
app22.gender = :male
app22.telephone = '44-(706)749-5875'
app22.mobile = '44-(118)561-1745'
app22.email = 'philll@tuttocitta.it'
app22.personal_statement = 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
app22.permanent_house_number = '4555'
app22.permanent_address_1 = 'Gina Avenue'
app22.permanent_postcode = 'NR34 2GR'
app22.permanent_country = 'United Kingdom'
app22.state = :completed
app22.save!

school43 = School.new application: app22
school43.name = 'University of Worcester'
school43.address_1 = '5172 Pierstorff Terrace'
school43.address_2 = 'Birmingham'
school43.country = 'United Kingdom'
school43.postcode = 'B12 3FB'
school43.save!

qualification127 = Qualification.new school: school43
qualification127.subject = 'PE'
qualification127.award = 'HNC'
qualification127.grade = 'A'
qualification127.start_date = Date.new(2012, 8, 23)
qualification127.end_date = Date.new(2014, 6, 8)
qualification127.save!

qualification128 = Qualification.new school: school43
qualification128.subject = 'Maths'
qualification128.award = 'Standard'
qualification128.grade = 'A'
qualification128.start_date = Date.new(2013, 8, 23)
qualification128.end_date = Date.new(2016, 6, 8)
qualification128.save!

qualification129 = Qualification.new school: school43
qualification129.subject = 'Technological Studies'
qualification129.award = 'Higher'
qualification129.grade = 'A'
qualification129.start_date = Date.new(2015, 8, 23)
qualification129.end_date = Date.new(2014, 6, 8)
qualification129.save!

school44 = School.new application: app22
school44.name = 'University of Sheffield'
school44.address_1 = '8089 Corben Circle'
school44.address_2 = 'Liverpool'
school44.country = 'United Kingdom'
school44.postcode = 'L74 3FB'
school44.save!

qualification130 = Qualification.new school: school44
qualification130.subject = 'Woodworking'
qualification130.award = 'Standard'
qualification130.grade = 'Pass'
qualification130.start_date = Date.new(2012, 8, 23)
qualification130.end_date = Date.new(2013, 6, 8)
qualification130.save!

qualification131 = Qualification.new school: school44
qualification131.subject = 'Geography'
qualification131.award = 'Standard'
qualification131.grade = 'C'
qualification131.start_date = Date.new(2012, 8, 23)
qualification131.end_date = Date.new(2013, 6, 8)
qualification131.save!

qualification132 = Qualification.new school: school44
qualification132.subject = 'Maths'
qualification132.award = 'HND'
qualification132.grade = 'D'
qualification132.start_date = Date.new(2015, 8, 23)
qualification132.end_date = Date.new(2016, 6, 8)
qualification132.save!

job43 = Job.new application: app22
job43.employer = 'Avaveo'
job43.address_1 = '7547 Huxley Way'
job43.address_2 = 'Whitchurch'
job43.postcode = 'BS14'
job43.country = 'United Kingdom'
job43.job_title = 'VP Accounting'
job43.duties = 'User-centric 5th generation circuit'
job43.start_date = Date.parse('2010-10-08')
job43.end_date = Date.parse('2014-04-06')
job43.save!

job44 = Job.new application: app22
job44.employer = 'Voonte'
job44.address_1 = '559 Talisman Crossing'
job44.address_2 = 'Bristol'
job44.postcode = 'BS41'
job44.country = 'United Kingdom'
job44.job_title = 'Web Developer I'
job44.duties = 'Reactive heuristic superstructure'
job44.start_date = Date.parse('2012-06-25')
job44.end_date = Date.parse('2016-11-01')
job44.save!

ref43 = Reference.new application: app22
ref43.reference_1_full_name = 'Jesse Boyd'
ref43.reference_1_email = 'jboyd16@shop-pro.jp'
ref43.reference_1_occupation = 'Mechanical Systems Engineer'
ref43.reference_1_address_1 = '07 Bashford Way'
ref43.reference_1_address_2 = 'Whitchurch'
ref43.reference_1_postcode = 'BS14 7QW'
ref43.reference_1_country = 'United Kingdom'
ref43.reference_1_relationship = 'Exclusive'
ref43.reference_1_telephone = '44-(531)807-5964'
ref43.reference_2_full_name = 'Fred Martinez'
ref43.reference_2_email = 'fmartinez17@lycos.com'
ref43.reference_2_occupation = 'Speech Pathologist'
ref43.reference_2_address_1 = '8 Anthes '
ref43.reference_2_address_2 = 'Preston'
ref43.reference_2_postcode = 'PR1 3TR'
ref43.reference_2_country = 'United Kingdom'
ref43.reference_2_relationship = 'leading edge'
ref43.reference_2_telephone = '44-(451)545-3693'
ref43.save!

course54 = CourseSelection.new application_id: app22.id, course_id: 21
course54.save!

student23 = Student.new
student23.first_name = 'Aaron'
student23.family_name = 'Chapman'
student23.email = 'cchapmanm@naver.com'
student23.scottish_candidate_number = '170157028'
student23.national_insurance_number = 'NJ683896B'
student23.password = 'secret'
student23.password_confirmation = 'secret'
student23.confirmed_at = DateTime.now
student23.save!

app23 = student23.create_application
app23.title = 'Rev'
app23.middle_name = 'Charles'
app23.gender = :male
app23.telephone = '44-(154)162-9552'
app23.mobile = '44-(409)676-5213'
app23.email = 'cchapmanm@naver.com'
app23.personal_statement = 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'
app23.permanent_house_number = '25714'
app23.permanent_address_1 = 'Pine View Drive'
app23.permanent_address_2 = 'Sheffield'
app23.permanent_postcode = 'S1 2GR'
app23.permanent_country = 'United Kingdom'
app23.state = :completed
app23.save!

school45 = School.new application: app23
school45.name = 'The Robert Gordon University'
school45.address_1 = '937 Bunker Hill Point'
school45.address_2 = 'Halton'
school45.country = 'United Kingdom'
school45.postcode = 'LS9 3FB'
school45.save!

qualification133 = Qualification.new school: school45
qualification133.subject = 'PE'
qualification133.award = 'HND'
qualification133.grade = 'B'
qualification133.start_date = Date.new(2015, 8, 23)
qualification133.end_date = Date.new(2014, 6, 8)
qualification133.save!

qualification134 = Qualification.new school: school45
qualification134.subject = 'Chemistry'
qualification134.award = 'NQ'
qualification134.grade = 'A'
qualification134.start_date = Date.new(2012, 8, 23)
qualification134.end_date = Date.new(2015, 6, 8)
qualification134.save!

qualification135 = Qualification.new school: school45
qualification135.subject = 'Chemistry'
qualification135.award = 'NQ'
qualification135.grade = 'C'
qualification135.start_date = Date.new(2015, 8, 23)
qualification135.end_date = Date.new(2016, 6, 8)
qualification135.save!

school46 = School.new application: app23
school46.name = 'London School of Jewish Studies'
school46.address_1 = '99 Claremont Circle'
school46.address_2 = 'Whitwell'
school46.country = 'United Kingdom'
school46.postcode = 'DL10 3FB'
school46.save!

qualification136 = Qualification.new school: school46
qualification136.subject = 'Maths'
qualification136.award = 'Higher'
qualification136.grade = 'A'
qualification136.start_date = Date.new(2013, 8, 23)
qualification136.end_date = Date.new(2014, 6, 8)
qualification136.save!

qualification137 = Qualification.new school: school46
qualification137.subject = 'Maths'
qualification137.award = 'NQ'
qualification137.grade = 'D'
qualification137.start_date = Date.new(2014, 8, 23)
qualification137.end_date = Date.new(2016, 6, 8)
qualification137.save!

qualification138 = Qualification.new school: school46
qualification138.subject = 'Chemistry'
qualification138.award = 'Higher'
qualification138.grade = 'B'
qualification138.start_date = Date.new(2012, 8, 23)
qualification138.end_date = Date.new(2015, 6, 8)
qualification138.save!

job45 = Job.new application: app23
job45.employer = 'Photobean'
job45.address_1 = '0 Surrey Pass'
job45.address_2 = 'Horton'
job45.postcode = 'BS37'
job45.country = 'United Kingdom'
job45.job_title = 'Occupational Therapist'
job45.duties = 'Implemented composite extranet'
job45.start_date = Date.parse('2010-06-03')
job45.end_date = Date.parse('2014-06-23')
job45.save!

job46 = Job.new application: app23
job46.employer = 'Meevee'
job46.address_1 = '4 Myrtle Avenue'
job46.address_2 = 'Sheffield'
job46.postcode = 'S33'
job46.country = 'United Kingdom'
job46.job_title = 'Senior Quality Engineer'
job46.duties = 'Synergistic systematic middleware'
job46.start_date = Date.parse('2010-04-21')
job46.end_date = Date.parse('2016-08-13')
job46.save!

ref45 = Reference.new application: app23
ref45.reference_1_full_name = 'Todd Ramirez'
ref45.reference_1_email = 'tramirez18@google.ru'
ref45.reference_1_occupation = 'Staff Scientist'
ref45.reference_1_address_1 = '432 Summerview '
ref45.reference_1_address_2 = 'Liverpool'
ref45.reference_1_postcode = 'L33 7QW'
ref45.reference_1_country = 'United Kingdom'
ref45.reference_1_relationship = 'De-engineered'
ref45.reference_1_telephone = '44-(180)296-6706'
ref45.reference_2_full_name = 'Charles Peters'
ref45.reference_2_email = 'cpeters19@gizmodo.com'
ref45.reference_2_occupation = 'Chief Design Engineer'
ref45.reference_2_address_1 = '58126 Hoard '
ref45.reference_2_address_2 = 'Church End'
ref45.reference_2_postcode = 'CB4 3TR'
ref45.reference_2_country = 'United Kingdom'
ref45.reference_2_relationship = 'Enhanced'
ref45.reference_2_telephone = '44-(267)656-2487'
ref45.save!

course55 = CourseSelection.new application_id: app23.id, course_id: 1
course55.save!

course56 = CourseSelection.new application_id: app23.id, course_id: 4
course56.save!

course57 = CourseSelection.new application_id: app23.id, course_id: 2
course57.save!
