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
course.category_id = categories['Applied Computing & Digital Technologies']
course.college = cogc
course.title = 'Information Technology HNC'
course.description = 'This computing course provides the entry level knowledge and IT skills you need to work in computing. The course will provide you with an opportunity to undertake a variety of practical and theoretical activities and assessments, which will prepare you for higher learning, or entry into the job market.

If you successfully complete the course, you can apply for entry to the second year HND program where you\'ll have the opportunity to further enhance your knowledge and skills by building e-commerce applications using the Microsoft.Net framework and undertaking the Industry recognised Oracle Database Design and Programming vendor qualification.

This course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/.'
course.entry_requirements = 'One appropriate Higher and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR
One Higher and three Standard Grades at Credit level; OR
One Higher and three National 5 qualifications; OR
A national qualification at SCQF Level 5/6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR
Other equivalent qualifications or experience.

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
course.entry_requirements='Two Higher and three Standard Grades at Credit level (including Computing or Information Systems); OR
Two Higher and three National 5 level qualifications (including Computing or Information Systems); OR
A national qualification at SCQF Level 6 in a related subject such as Digital Media Computing, NQ Computing.

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
course.entry_requirements='Two Higher and three Intermediate 2 courses (including Computing, Graphic Design or Information Systems); OR
Two Higher and three Standard Grades at Credit level or above (including Computing, Graphic Design or Information Systems); OR
Two Higher and three National 5 qualifications or above (including Computing, Graphic Design or Information Systems); OR
A national qualification at SCQF Level 5 or 6 in a related subject such as Digital Media Computing, NQ Computing,  Computing: Technical Support or Software Development.
You\'ll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you\'re interested in this subject area. It is important that you prepare a personal statement which reflects your desire to study on this course.'
course.career_prospects = 'Apply for various job vacancies, such as a junior web developer/designer.'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 15
course.level = 'SCQF level 8'
course.save!