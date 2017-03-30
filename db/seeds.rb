# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed college
cogc = College.new
cogc.name = 'City of Glasgow College'
cogc.description = 'City of Glasgow College, like Scotland as a nation, is a real melting pot of diversity, equality and excellence. Our innovative approaches to teaching and learning enable personalised development for all our 27,000 students across a range of nearly 2,000 courses from Access Level to Masters.

To date we have delivered 420 modern apprenticeships; 3162 work experience placements; 3467 work-based learning projects and we work directly with 1500 industry partners.

So, whether it’s full-time, part-time or distance learning, we’ll help find you a course that suits you and equips you to succeed. '
cogc.address = 'City Campus
190 Cathedral Street'
cogc.postcode = 'G4 0RF'
cogc.telephone = '0141 375 5555'
cogc.email = 'enquiries@cityofglasgowcollege.ac.uk'
cogc.website = 'https://www.cityofglasgowcollege.ac.uk'
cogc.save

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
Inspiring Later Life
Languages
Licensing & Security
Marketing & Retail
Media
Nautical Studies & Marine Engineering
Social Sciences
Sport & Fitness
Adult Learning and Supported Programmes
Teacher and Training Development
Trade Union Education'

# Save categories to DB and store ids in map
categories = {}
category_names.split(/\n/).each do |line|
  category = Category.create name: line
  categories[line] = category.id
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
course.save!







course = Course.new
course.category_id = categories['Accounting']
course.college = cogc
course.title = 'Accounting HC'
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
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
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
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
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
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
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
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
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
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
course.save!