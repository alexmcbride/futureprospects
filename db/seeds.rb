# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed students (generate a new SCN with Student.generate_scn)
john = Student.create first_name: 'John', family_name: 'Smith', email: 'johnsmith@email.com',
                      scottish_candidate_number: '173515731', national_insurance_number: 'NR672354B',
                      password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now

steve = Student.create first_name: 'Steve', family_name: 'Purchase', email: 'stevepurchase@email.com',
                       scottish_candidate_number: '172105955', national_insurance_number: 'NR622454B',
                       password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now

gemma = Student.create first_name: 'Gemma', family_name: 'McNiel', email: 'gemmamcniel@email.com',
                       scottish_candidate_number: '176266201', national_insurance_number: 'NR627454B',
                       password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now

susan = Student.create first_name: 'Susan', family_name: 'Mitchell', email: 'susanmitchell@email.com',
                       scottish_candidate_number: '172205100', national_insurance_number: 'NR724454B',
                       password: 'secret', password_confirmation: 'secret', confirmed_at: DateTime.now


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

# Get random images
$images = %w(3d-model-hnd-y2.jpg accounting-hnc.jpg accounting-hnd.jpg accounting-nc.jpg admin-digital-hnc.jpg admin-hnc.jpg admin-hnd.jpg archi-tech-hnd.jpg art-and-design-nc.jpg build-surv-hnd.jpg built-env-nc.jpg buisness-diplo.jpg business-hnc.jpg car-join-cag.jpg con-craft-nq.jpg creative-writing-hnc.jpg ed-interior-hnd.jpg info-tech-hnc.jpg info-tech-hnd.jpg legal-hnd.jpg paint-dec-cag.jpg performance-hnc.jpg radio-hnd.jpg supply-chain-hnd.jpg web-dev-hnd.jpg)
def random_image
  image = $images.sample
  Rails.root.join("app/assets/images/seed_images/#{image}").open
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
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
course.image = random_image
course.spaces = course_spaces
course.save!