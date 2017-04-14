# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
cogc.image = 'college-cogc.jpg'
cogc.save



# Staff
Staff.create college: cogc, first_name: 'Alex', family_name: 'McBride', email: 'xandermcbride@gmail.com', password: 'secret', password_confirmation: 'secret', job_title: 'College Admin'




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
kelvin.image = 'college-kelvin.jpg'
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
clyde.image = 'college-clyde.jpg'
clyde.save



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
course1 = Course.new college: cogc
course1.title = 'SPD Marine Engineering (Cadet Training) PDA'
course1.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course1.level = 'SCQF level 9'
course1.start_date = Date.new 2017, 8, 28
course1.end_date = Date.new 2018, 6, 13
course1.image = 'MarineManagementPDA.jpg'
course1.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch. The HND in Marine Engineering will also give academic exemptions for management level exams further in your career path, while the SPD Marine management element will give exemptions from the IAMI Engineering Knowledge examination.\n\nThere are a number of elements to the programme and also a compulsory sea time requirement of seven months.\n\nThe programme is structured into 5 phases:\n\nPhase 1 – College phase where you will complete year 1 of HND in Marine Engineering, compulsory STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 2 – Sea phase where you will start your MNTB training record book in addition to a work based learning course and a distance learning maths course.\n\nPhase 3 – College phase where you will complete year 2 of the HND in Marine Engineering (excluding the graded unit project), STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 4 – Sea phase where you will complete your MNTB training record book.\n\nPhase 5 – College phase where you will complete an SPD in Maritime Management and HND Marine Engineering graded unit 2 projects in addition to preparing for your MCA Oral Examination and completing your final STCW short courses. Additional maths tuition in order to aide transition to university will also be provided.\n\nThere are two main entries into this programme: A September entry and also a January entry.\n\nFor further information see http://www.careersatsea.org/."
course1.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n1. Higher maths and/or physical science at grade C or above, and national 5/GCSE or equivalent which must include:\n..* English.\n..* Maths.\n..* Physical Science (e.g. Physics, Chemistry, Technological Studies or Engineering Science).\n..* One other subject.\n\n2. NC Shipping and Maritime Operations (SCQF Level 6) with optional Engineering units.\n\n3. Alternative qualifications will be considered on an individual basis in conjunction with the sponsoring company or training provider.\n\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme.\n\nInitial applications for this course should be submitted to a training provider or company, please follow the link for more information."
course1.career_prospects = "On successful completion of the SPD programme, cadets can gain employment as a fully qualified officer of the watch or choose to progress into university to study at a higher level."
course1.spaces = course_spaces
course1.save! validate: false

course2 = Course.new college: cogc
course2.title = 'Business HNC'
course2.category = Category.find_by_name 'Business & Procurement'
course2.level = 'SCQF level 7'
course2.start_date = Date.new 2017, 8, 28
course2.end_date = Date.new 2018, 6, 13
course2.image = 'Business_HNC.jpg'
course2.description = "Are you looking for a career in banking, insurance, civil service, local government or distribution? This course gives you the skills and knowledge necessary to succeed, with excellent career opportunities and progression routes. \n\nYou'll be taught by staff with relevant industry experience and a proven track record of bringing out the best in their students.\n\nToday, the internet is an important part of business, so we've updated the course to include analysing and using information for strategic purposes.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course2.entry_requirements = "* One Higher pass in a relevant* academic subject OR\n* National Certificate in Business (with at least 3 units at level 6) OR\n* Other appropriate and relevant National Certificate courses (with at least 3 units at level 6) may be considered.\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course2.career_prospects = "You could expect to apply for a trainee management position and/or a team leader in industry or commerce."
course2.spaces = course_spaces
course2.save! validate: false

course3 = Course.new college:kelvin
course3.title = 'Administration and Information Technology  HND'
course3.category = Category.find_by_name 'Administration, Human Resources & Law'
course3.level = 'SCQF level 8'
course3.start_date = Date.new 2017, 8, 28
course3.end_date = Date.new 2019, 6, 13
course3.image = 'Business_boys_learning.jpg'
course3.description = "This course will provide you with a broad range of office-based skills and knowledge required for a career in office administration. This is a challenging course, where you'll develop specialist skills in IT, desktop publishing, communication, research and planning.\n\nYour stimulating programme will be delivered by our highly professional teaching staff with significant experience in office administration and a proven track record of bringing out the best in their students.\n\nThis course accepts year two direct entrants (you must have a completed HNC Administration, please see further information in direct entry section)\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7 (year 1) and Level 8 (year 2).  For more information on the framework visit: www.scqf.org.uk/the-framework/."
course3.entry_requirements = "* Two Highers in a relevant* academic subject OR\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course3.career_prospects = "This course prepares you for a career as a Personal Assistant or Administrator in both the public and private sector. The HND can provide progression into employment in a general administrative role within small to medium enterprises. It'll also provide opportunities to develop the skills and knowledge required for more specialist posts demanded by larger organisations.\n\nThe qualification will allow you to develop:\n\n* Technical and administrative knowledge relevant to current practice.\n* Interpersonal skills relevant to an administrative role.\n* Personal effectiveness.\n* Communication.\n* Presentation technique."
course3.spaces = course_spaces
course3.save! validate: false

course4 = Course.new college: cogc
course4.title = 'Information Technology HNC'
course4.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course4.level = 'SCQF level 7'
course4.start_date = Date.new 2017, 8, 28
course4.end_date = Date.new 2019, 6, 13
course4.image = 'InformationTechnology_HNC.jpg'
course4.description = "This computing course provides the entry level knowledge and IT skills you need to work in computing. The course will provide you with an opportunity to undertake a variety of practical and theoretical activities and assessments, which will prepare you for higher learning, or entry into the job market.\n\nIf you successfully complete the course, you can apply for entry to the second year HND program where you'll have the opportunity to further enhance your knowledge and skills by building e-commerce applications using the Microsoft.Net framework and undertaking the Industry recognised Oracle Database Design and Programming vendor qualification.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course4.entry_requirements = "* One appropriate Higher and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* One Higher and three Standard Grades at Credit level; OR\n* One Higher and three National 5 qualifications; OR\n* A national qualification at SCQF Level 5/6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR\n* Other equivalent qualifications or experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course4.career_prospects = "The course will develop your core and employability skills and make you more attractive to prospective employers."
course4.spaces = course_spaces
course4.save! validate: false

course5 = Course.new college:kelvin
course5.title = 'Information Technology HND'
course5.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course5.level = 'SCQF level 8'
course5.start_date = Date.new 2017, 8, 28
course5.end_date = Date.new 2019, 6, 13
course5.image = 'Computing_Hard_drive_0.jpg'
course5.description = "The HND Information Technology computing qualification is designed to give you a solid technical understanding of information systems and technologies used by both small and large scale businesses.\n\nYou'll gain an understanding of how data is transformed into usable information through the theory and practice of relational database technologies. You'll also undertake units in web design and development, e-commerce, applications programming, operating systems and project management.\n\nAs part of the second year program you'll also undertake the Oracle Database Design and Programming using SQL vendor qualification, which is a worldwide recognised qualification that prepares the student to undertake external Oracle exams.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course5.entry_requirements = "* Two Highers and three Intermediate 2 courses (including Computing or Information Systems); OR\n* Two Higher and three Standard Grades at Credit level (including Computing or Information Systems); OR\n* Two Higher and three National 5 level qualifications (including Computing or Information Systems); OR\n* A national qualification at SCQF Level 6 in a related subject such as Digital Media Computing, NQ Computing.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course5.career_prospects = "After completing the HND you may pursue a career in business intelligence analysis, information management, database administration, trainer/teacher, hardware and software support, or web development."
course5.spaces = course_spaces
course5.save! validate: false

course6 = Course.new college: kelvin
course6.title = 'Web Development HND'
course6.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course6.level = 'SCQF level 8'
course6.start_date = Date.new 2017, 8, 28
course6.end_date = Date.new 2019, 6, 13
course6.image = 'WebDevelopent_HND.jpg'
course6.description = "On this two year course, you'll gain skills to start or advance a career as a web designer/developer. You'll learn to build both static and dynamic websites that deliver content in a variety of formats for computers, smartphones and tablets. You'll have access to current smartphones and tablets for testing your responsive websites."
course6.entry_requirements = "* Two Higher and three Intermediate 2 courses (including Computing, Graphic Design or Information Systems); OR\n* Two Higher and three Standard Grades at Credit level or above (including Computing, Graphic Design or Information Systems); OR\n* Two Higher and three National 5 qualifications or above (including Computing, Graphic Design or Information Systems); OR\n* A national qualification at SCQF Level 5 or 6 in a related subject such as Digital Media Computing, NQ Computing,  Computing: Technical Support or Software Development.\nYou'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you're interested in this subject area. It is important that you prepare a personal statement which reflects your desire to study on this course."
course6.career_prospects = "Apply for various job vacancies, such as a junior web developer/designer.\n\nContinuining Study\n\nYou'll have the opportunity to progress to the following degree courses at university:\n\n* BSc (Hons) Web and Mobile Development at the University of the West of Scotland.\n* BSc/BSc (Hons) Interactive Media Design at Napier University.\n* BSc/BSc (Hons) Digital Media at Napier University.\n* BSc/BSc (Hons) Creative Computing at Napier University.\n* BEng (Hons) Web Technologies at Napier University."
course6.spaces = course_spaces
course6.save! validate: false

course7 = Course.new college: cogc
course7.title = 'Advertising and Public Relations HND'
course7.category = Category.find_by_name 'Marketing & Retail'
course7.level = 'SCQF level 8'
course7.start_date = Date.new 2017, 8, 28
course7.end_date = Date.new 2019, 6, 13
course7.image = 'creative_writing_girl_with_20_book_0.jpg'
course7.description = "This course trains you for a career in the communication industries. You'll develop an understanding of the nature and function of advertising and public relations, within a wider marketing and marketing communications framework. You'll also learn how to communicate effectively in this environment.\n\nThis course accepts year two direct entrants.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course7.entry_requirements = "* Two Higher Grade passes at Grade C or above, including English, OR\n* A relevant NC or NQ qualification with appropriate subject modules), OR\n* Evidence of relevant industry experience.\n* Successful completion of a full time HNC Advertising and PR course with 15 credits.\n* A genuine interest in the advertising and PR industries is needed and should be demonstrated in the applicatio"
course7.career_prospects = "This course prepares you for a career in:\n\n* Advertising agencies.\n* PR consultancies.\n* Social media companies.\n* Advertising departments.\n* Commercial, or media-based companies.\nThere are a number of work experience and placement opportunities throughout the course."
course7.spaces = course_spaces
course7.save! validate: false

course8 = Course.new college: clyde
course8.title = 'Marketing HND'
course8.category = Category.find_by_name 'Marketing & Retail'
course8.level = 'SCQF level 8'
course8.start_date = Date.new 2017, 8, 28
course8.end_date = Date.new 2019, 6, 13
course8.image = 'Desktop_Publishing_girl_1.jpg'
course8.description = "The course helps you develop the skills you’ll need to work in marketing and business. It covers marketing theory and buyer behaviour, as well as the main operational areas of marketing research, promotion and selling.\n\nCoursework includes projects and assignments that relate to current industry practice and market environments. You’ll be assessed continuously throughout the course.\n\nYou can keep up to date with marketing industry news and future opportunities with The Drum and Digital Intelligence.\n\nAfter successful completion of the course, you will be awarded with an HND in Marketing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework."
course8.entry_requirements = "* Two Higher Grade passes at Grade C or above including English (or an equivalent such as Modern Studies, Economics, History or Business); OR\n* Adult learners with some relevant experience in, or who hope to move into the marketing area, may be accepted subject to interview.\n* A genuine interest in marketing is needed and should be demonstrated in the applicatio"
course8.career_prospects = "You may go on to a career in marketing, public relations, or internal or external communications in any number of business sectors."
course8.spaces = course_spaces
course8.save! validate: false

course9 = Course.new college: cogc
course9.title = '3D Design: Interior Design HND'
course9.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course9.level = 'SCQF level 8'
course9.start_date = Date.new 2017, 8, 28
course9.end_date = Date.new 2019, 6, 13
course9.image = 'Interior_design_girl_drawing.jpg'
course9.description = "This course will enable you to develop the creative, analytical and technical skills for a career in interior design. It's a two year course that can lead to direct entry to the third year of a degree programme.\n\nThis course also accepts year two direct entrants.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course9.entry_requirements = "* NC Interior Design or related subject, OR\n* Higher Art and Design, and English at minimum Intermediate 2, OR\n* Higher Art and Design, and English at National 5 level.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to provide examples of your art and design work."
course9.career_prospects = "This course may lead to a variety of careers in interior design and architectural practices, such as space planning, property development – shop and office fitting, and museum and exhibition design.\n\nContinuing Study\n\nAfter successfully completing the HND course, you can apply for direct entry to 3rd year BA (Hons) Interior Design program at a choice of universities such as: Glasgow School of Art, Edinburgh College of Art, Duncan of Jordonstone College of Art or Heriot Watt University."
course9.spaces = course_spaces
course9.save! validate: false

course10 = Course.new college: clyde
course10.title = '3D Design: Model Making for the Creative Industries (Year 2 Direct Entry) HND'
course10.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course10.level = 'SCQF level 8'
course10.start_date = Date.new 2017, 8, 28
course10.end_date = Date.new 2019, 6, 13
course10.image = 'HND_203D_20Design_20Model_20Making_202nd_20Year_201600x1078.jpg'
course10.description = "This course will help you develop multiple skills and knowledge of materials and processes relevant to the Model Making Industry, whether for film/TV props, miniatures, prototyping, engineering, architecture, or exhibition models.\n\nAs part of the course, previous students have had the opportunity to work with live clients throughout the UK and Europe and have made industry visits to London, Liverpool, Manchester, Barcelona and beyond.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course10.entry_requirements = "* HNC 3D Design: Model Making for the Creative Industries; OR\n* First year HND 3D Design: Model Making for the Creative Industries.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you're asked to bring your best examples of both 2D and 3D art and design work, in original, photographic or portfolio form."
course10.career_prospects = "Many graduates work as model makers all over the world, including New Zealand, Dubai and Australia.."
course10.spaces = course_spaces
course10.save! validate: false

course11 = Course.new college: kelvin
course11.title = 'Creative Printmaking (Year 2 Direct Entry) HND'
course11.category = Category.find_by_name 'Fine Arts & Photography'
course11.level = 'SCQF level 8'
course11.start_date = Date.new 2017, 8, 28
course11.end_date = Date.new 2019, 6, 13
course11.image = 'HND_20Creative_20Printmaking_202nd_20Year_201600x1078.jpg'
course11.description = "This course offers you an opportunity to develop your creative talents allowing you to develop traditional and contemporary printmaking, drawing and digital skills. Various printmaking techniques and media are explored and supplemented with technical and creative skills in digital media, drawing, bookbinding and mixed media.\n\nThis course combines practical skills with theoretical knowledge and is project based. It is delivered through a series of lectures, practical workshops and activities. You'll produce a portfolio of work that will support entry to employment or degree level courses.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course11.entry_requirements = "* HNC Creative Printmaking; OR\n* First year HND Creative Printmaking.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide examples of your art, photography, or design work."
course11.career_prospects = "On completion of the course, you can pursue a career as a practicing Artist, Printmaker, Designer, Print Technician, or as a Printmaking Educator.."
course11.spaces = course_spaces
course11.save! validate: false

course12 = Course.new college: cogc
course12.title = 'Accounting HNC'
course12.category = Category.find_by_name 'Accounting'
course12.level = 'SCQF level 7'
course12.start_date = Date.new 2017, 8, 28
course12.end_date = Date.new 2018, 6, 13
course12.image = 'Business_calculator_pen_0.jpg'
course12.description = "The HNC Accounting Award has been designed to meet the demands and requirements of the Accounting Industry. \n\nOpportunities are provided to develop your skills, knowledge and understanding in preparation for employment, or for progression to courses such as AAT level 8, or HND Accounting.  Further detail of the topics covered is provided in the section \"What You Study\" below. \n\nYou'll be assessed throughout this course with the assessments taking the form of practical assessments, assignment and case studies. Towards the end of your course you'll undertake a Graded Unit examination, which is designed to assess your ability to integrate the knowledge and skills gained through the mandatory units. \n\nThroughout the course you'll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience. \n\nYou'll be required to attend college on 4 days every week from 9 am to 5 pm for one academic year.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course12.entry_requirements = "* One relevant* Higher at grade C or above; OR\n* Three relevant National 5 courses at grade A; OR\n* Successful completion of an NC/NQ** containing more than one unit at SCQF level 6; OR\n* Relevant work experience will be considered where employer referee details have been supplied.\n* Equivalent qualifications will be considered.  \n*Qualifications cannot include any from the following list: Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL.\n\n**Internal applicants must complete all 16 credits undertaken in the NC qualification. \n\nYou'll be invited to attend a compulsory interview. The interview dates are:\n\n* Thursday 30 March 2017 at 9.30 am\n* Thursday 27 April 2017 at 1.30 pm\nThe interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You'll be given the opportunity to ask questions. You must bring a copy of qualification certificates."
course12.career_prospects = "This course prepares you for a career in:\n\n* Bookkeeping.\n* Financial and/or Management Accounting.\n* Accounts Technician.\n* Assistant Accountant.\n* Accounts Supervisor.\n* Financial Reporting.\n* Taxation.\nContinuing Study\n\nYou can progress to HND Accounting, or AAT Level 8 (Advanced Diploma) on successful completion of this course."
course12.spaces = course_spaces
course12.save! validate: false

course13 = Course.new college: cogc
course13.title = 'Architectural Technology HND'
course13.category = Category.find_by_name 'Built Environment'
course13.level = 'SCQF level 8'
course13.start_date = Date.new 2017, 8, 28
course13.end_date = Date.new 2019, 6, 13
course13.image = 'Architecture_boy_on_20_laptop.jpg'
course13.description = "This course gives you a technician level qualification, combining a broad first year curriculum with a specialist second year curriculum. It'll give you the skills required for employment in this high demand industry sector.\n\nYou'll also have the opportunity to go on site visits around the West of Scotland, to give you an understanding of contemporary relevance.\n\nThis is a two-year HND which accepts direct entrants to year two.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course13.entry_requirements = "* Two Higher Grade passes, preferably including Mathematics or a science, OR\n* A National Certificate in Built Environment or equivalent qualification at SCQF level 6, OR\n* Relevant experience and the ability to show the commitment and capacity required to cope with the academic content of the course.\n* HNC in Construction.\n* It may also be possible to gain entry with an HNC in Architectural Technology. This will depend on the units that have been covered in the HNC. Students who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course13.career_prospects = "This course prepares you for a career as an Architectural Technician, or Architectural Technologist in a variety of sectors including:\n\n* Built Environment.\n* Construction.\n* Property.\n* Private consultant practices (architects and surveyors).\n* Design and build services divisions of construction contractors.\n* Local authorities.\n* Health trusts.\n* Housing associations.\n* Building component manufacturers.\n* Government organisation."
course13.spaces = course_spaces
course13.save! validate: false

course14 = Course.new college: cogc
course14.title = 'Building Surveying HND'
course14.category = Category.find_by_name 'Built Environment'
course14.level = 'SCQF level 8'
course14.start_date = Date.new 2017, 8, 28
course14.end_date = Date.new 2019, 6, 13
course14.image = 'Construction_2_1.jpg'
course14.description = "This stimulating, learner-focused course is delivered by highly professional teaching staff, with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nThe technician level qualification combines a broad-based first year curriculum with a more specialist second year curriculum, which will provide you with the skills required for employment in this sector.\n\nThis is a two-year HND which accepts direct entrants to year two of the course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course14.entry_requirements = "* Two Higher passes, preferably including Mathematics or a science, OR\n* A National Certificate in Built Environment or equivalent qualification at SCQF level 6, OR\n* Relevant construction industry experience and the ability to show the commitment and capacity needed to cope with the academic content of the course.\nHNC in Construction. It may also be possible to gain entry with an HNC in Building Surveying. Students who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course14.career_prospects = "This course prepares you for a career in:\n\n* Private practice surveying firms.\n* Government and public authorities.\n* Building control departments.\n* Construction companies.\n* Facilities management.\n* Property companie."
course14.spaces = course_spaces
course14.save! validate: false

course15 = Course.new college: cogc
course15.title = 'Built Environment HNC'
course15.category = Category.find_by_name 'Built Environment'
course15.level = 'SCQF level 7'
course15.start_date = Date.new 2017, 8, 28
course15.end_date = Date.new 2018, 6, 13
course15.image = 'Architecture_boards.jpg'
course15.description = "This course is a technician level qualification that will provide you with the basics you'll need to enter into a career in the Built Environment. During the course you'll:\n\nThe course is a great way into a career in the Construction Industry. It's also an ideal course for those who want to pursue a technician level career in the industry, but haven't yet chosen a specialism.\n\nOn completing the course, you can progress straight to the second year HND programme without having to do any extra units.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course15.entry_requirements = "* One Higher Grade pass, preferably Maths or a Science; OR\n* National Certificate in Built Environment, or equivalent qualification at SCQF level 6; OR\n* Relevant Construction Industry experience.\nYou also need to show you'll be able to cope with the academic content of the course.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course15.career_prospects = "You might work as a Technician, or Junior Manager in the built environment and construction sector – architectural technology, quantity surveying, estimating, building surveying and construction management."
course15.spaces = course_spaces
course15.save! validate: false

course16 = Course.new college: kelvin
course16.title = 'Computer Aided Architectural Design & Technology HND'
course16.category = Category.find_by_name 'Built Environment'
course16.level = 'SCQF level 8'
course16.start_date = Date.new 2017, 8, 28
course16.end_date = Date.new 2019, 6, 13
course16.image = 'CompAidedArchDesignTechHND.jpg'
course16.description = "This is a technician level qualification that provides a specialist curriculum focused on the application of Computer Aided Design software in a construction specific context underpinned by a Construction Industry specific curriculum. It will equip you with skills required for employment in this specialist industry sector.\n\nAn Architectural Technologist is a specialist in the technological aspects of building design and construction, bridging the gap between design theory and construction practice (find the job profile here).\n\nThis course is delivered by highly professional teaching staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nDuring your studies you'll:\n\nIf you are looking for architectural inspiration - Our Riverside Campus won ‘The Architectural Excellence Award for a Public Building\" last year! \n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course16.entry_requirements = "You'll be invited for a group and/or individual interview where you'll get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course16.career_prospects = "* Architectural CAD Technician or Building/Civil Engineering Technicia."
course16.spaces = course_spaces
course16.save! validate: false

course17 = Course.new college: cogc
course17.title = 'Construction Management HND'
course17.category = Category.find_by_name 'Built Environment'
course17.level = 'SCQF level 8'
course17.start_date = Date.new 2017, 8, 28
course17.end_date = Date.new 2019, 6, 13
course17.image = 'HND_20Construction_20Management_201600x1078_20.jpg'
course17.description = "This stimulating, learner-focused programme is delivered by highly professional teaching staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nThe HND Construction Management is a technician level qualification that combines a broad-based construction industry specific first year curriculum with a more specialist second year curriculum, teaching you the skills you need for employment in this highly demanding sector.\n\nConstruction Managers (also known as Project Managers, Site Managers and Site Agents) supervise and direct operations on a construction project to make sure it is completed safely, on time and within budget. To do this well, a Construction Manager needs to be good at organising and planning; motivating and managing people; and creatively solving problems.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course17.entry_requirements = "* Two Higher Grade passes, preferably including Mathematics or a Science; OR\n* A National Certificate in Built Environment or equivalent qualification at SCQF level 6; OR\n* Relevant construction industry experience and the ability to evidence the commitment and capacity required to cope with the academic content of the course.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course17.career_prospects = "This course prepares you for a career as a Higher Technician, or Junior Manager in both the public and private sector, in areas including: built environment, the construction sector, construction management, site engineering, estimating, and construction project planning."
course17.spaces = course_spaces
course17.save! validate: false

course18 = Course.new college: kelvin
course18.title = 'Quantity Surveying HND'
course18.category = Category.find_by_name 'Built Environment'
course18.level = 'SCQF level 8'
course18.start_date = Date.new 2017, 8, 28
course18.end_date = Date.new 2019, 6, 13
course18.image = 'Constuction_hardhats_2.jpg'
course18.description = "Quantity Surveyors (also known as a Construction Cost Consultants or Commercial Managers) manage all costs relating to building and civil engineering projects, from the early design plans, through to completion. Quantity Surveyors seek to minimise the costs of a project and enhance value, while still achieving the required standards and quality. Many of these are specified by statutory building regulations, which the surveyor needs to understand and adhere to.\n\nThe HND in Quantity Surveying is a technician level qualification that combines a construction industry specific first year curriculum with a more specialist second year curriculum that equips you with the skills required for employment in this specialist industry sector.\n\nYou'll be taught by staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course18.entry_requirements = "* Two Higher Grade passes, preferably including Mathematics or a Science; OR\n* A National Certificate in Built Environment or equivalent qualification at SCQF level 6; OR\n* Relevant construction industry experience and the ability to evidence the commitment and capacity required to cope with the academic content of the course.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course18.career_prospects = "This course prepares you for a career in private practice QS consultancies, contracting organisations, property companies, financial institutions, local and central government, commercial clients, and housing associations."
course18.spaces = course_spaces
course18.save! validate: false

course19 = Course.new college: kelvin
course19.title = 'Engineering Systems HNC'
course19.category = Category.find_by_name 'Engineering, Energy & Gas'
course19.level = 'SCQF level 7'
course19.start_date = Date.new 2017, 8, 28
course19.end_date = Date.new 2018, 6, 13
course19.image = 'engineering_systems_0.jpg'
course19.description = "Are you interested in gaining an excellent all round knowledge of how engineering systems function and contribute to the modern day industrial applications? Then this course could be for you.\n\nThis is a highly practical course designed to prepare you for ‘Real life’ scenarios encountered within current working environments. The diversity of the subjects studied within the framework gives you the opportunity to explore various disciplines including Mechanical Engineering, Systems Engineering and Renewable energies. \n\nYou'll be taught by staff with significant engineering experience and a proven track record of bringing out the best in their students.\n\nOn successful completion of this course you can pursue a career in engineering at Engineer or Technician level. \n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course19.entry_requirements = "* One Higher from Physics, Technological Studies, Mechatronics or Mathematics and at least three Standard Grades 1-2/Intermediate passes including Mathematics, Physics/Technological Studies and English.\n* A National Certificate Group Award in Engineering Systems\n* You'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you are interested in this subject are"
course19.career_prospects = "Career\n\nYou have the opportunity to further their careers in the Manufacturing, Mechanical and Maintenance service sectors.\n\nContinuing Study\n\nConsider studying to HND level in Engineering Systems with the potential to progress to University degree level."
course19.spaces = course_spaces
course19.save! validate: false

course20 = Course.new college: cogc
course20.title = 'Engineering: Mechanical HNC'
course20.category = Category.find_by_name 'Engineering, Energy & Gas'
course20.level = 'SCQF level 7'
course20.start_date = Date.new 2017, 8, 28
course20.end_date = Date.new 2018, 6, 13
course20.image = 'engineer_workshop.jpg'
course20.description = "Looking to become an engineering technician? This course gives you the skills, knowledge and understanding that you’ll need for a career in mechanical engineering. Successful completion of this HNC also gives you entry to Higher National Diploma or degree courses.\n\nYou’ll be able to use state of the art facilities at the college – such as our fully equipped engineering workshop, pneumatic and hydraulic labs and computer labs running CAD software.\n\nYou'll be taught by staff with significant engineering experience and a proven track record of bringing out the best in their students.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course20.entry_requirements = "* NC in an appropriate Mechanical Engineering subject; OR\n* Two Higher Grades – Maths and one other (preferably Physics).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course20.career_prospects = "This course prepares you for a career as an Engineering Technician."
course20.spaces = course_spaces
course20.save! validate: false

course21 = Course.new college: cogc
course21.title = 'Electronic Engineering HND'
course21.category = Category.find_by_name 'Engineering, Energy & Gas'
course21.level = 'SCQF level 8'
course21.start_date = Date.new 2017, 8, 28
course21.end_date = Date.new 2019, 6, 13
course21.image = 'electronic_class_0.jpg'
course21.description = "Electronic engineers solve 21st century problems for industry and society. This course starts with you building and testing your own CityBytes microcomputer board. The board is integrated into the study of electronic circuits and you'll also use it to learn how to program embedded devices using ‘C’ programming language. The board can be used as a Bluetooth device, a game controller, a logic designer and hybrid audio amplifier. It even comes with an Android, or Windows mobile app.\n\nThe course reinforces theory with extensive practical work culminating in a substantial practical project. In previous years, projects have included a programmable drone, an ultra-sonic tape measure, a solar powered baby incubator for disaster areas, a keyboard, and a remote control mini search and rescue vehicle.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.\n\nWe are updating some of our course titles and would be grateful if you could take 2 minutes to complete our short survey.  Thank you in advance for your feedback."
course21.entry_requirements = "* Two Higher passes, one in Maths and preferably Physics; OR\n* Other qualifications and experience.\nYou'll need a good grounding in maths for entry to the course.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course21.career_prospects = "This course prepares you for a career as an Electronics Technician Engineer."
course21.spaces = course_spaces
course21.save! validate: false

course22 = Course.new college: kelvin
course22.title = 'Electronic Engineering HNC'
course22.category = Category.find_by_name 'Engineering, Energy & Gas'
course22.level = 'SCQF level 7'
course22.start_date = Date.new 2017, 8, 28
course22.end_date = Date.new 2018, 6, 13
course22.image = 'electronics_girl.jpg'
course22.description = "This course teaches the basics you'll need to pursue a career as an Electronic Engineer. The journey to becoming a professional engineer starts by building and testing your own CityBytes microcomputer board (Watch the brief CityBytes video here).\n\nThe board is used to study electronic circuits and learning how to program embedded devices, using ‘C’ programming language. The board can be used as a Bluetooth device, a game style gesture controller, a logic designer and hybrid audio amplifier. It even comes with an Android or Windows mobile app.\n\nThe majority of our students progress to HND Electronics and use the board as a template when designing their own project.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/.\n\nWe are updating some of our course titles and would be grateful if you could take 2 minutes to complete our short survey.  Thank you in advance for your feedback."
course22.entry_requirements = "* Two Higher grades (grade C or better). Maths and a science subject, preferably Physics; OR\n* An NC in an appropriate engineering subject.\nMature students who don’t meet these requirements will be considered on the basis of their experience.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course22.career_prospects = "This course prepares you for a career as an Electronics Technician in electronic manufacturing and service industries, including construction, installation and repair of electronic equipment and systems."
course22.spaces = course_spaces
course22.save! validate: false

course23 = Course.new college: cogc
course23.title = 'Engineering: Electrical HND'
course23.category = Category.find_by_name 'Engineering, Energy & Gas'
course23.level = 'SCQF level 8'
course23.start_date = Date.new 2017, 8, 28
course23.end_date = Date.new 2019, 6, 13
course23.image = 'HND_20Electrical_20Engineering1.jpg'
course23.description = "On this Electrical Engineering course, you'll expand on the electrical principles covered in National 5 and Higher level. During the course you'll be taught by staff with significant industry experience to develop your skills over a range of science disciplines.\n\nMany of the course modules are project based with report writing included in second year modules. The course is also designed for higher level technicians in the Electrical Engineering Industry which deals with the production, transmission, distribution and application of electricity and the manufacture, installation and maintenance of electrical equipment.\n\nThe course can also be studied over three years on a day-release top-up programme, after completion of the Higher National Certificate in Electrical Engineering.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course23.entry_requirements = "* NC in an appropriate Engineering subject; OR\n* Two higher Grades - Maths and one other (preferably Physics).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course23.career_prospects = "This course prepares you for a career as a Technician Engineer.\n\nContinuing study -\n\nSuccessful students can progress to degree courses in related areas. Successful students may progress to studying an HND at the College, or enter year two of B Eng Electrical Power Systems at Glasgow Caledonian University."
course23.spaces = course_spaces
course23.save! validate: false

course24 = Course.new college: kelvin
course24.title = 'Engineering: Electrical HNC'
course24.category = Category.find_by_name 'Engineering, Energy & Gas'
course24.level = 'SCQF level 7'
course24.start_date = Date.new 2017, 8, 28
course24.end_date = Date.new 2018, 6, 13
course24.image = 'ENGINEERING-_20ELECTRICAL_20HNC.jpg'
course24.description = "This course prepares you to become a Technician, or Technical Engineer in the Electrical Engineering Industry which deals with the production, transmission, distribution and application of electricity and the manufacturing, installation and maintenance of electrical equipment.\n\nDuring the course, we will cover electrical circuit analysis using the latest available software packages, and laboratory analysis will be conducted on magnetic principles and practical electrical machines.\n\nAt the end of the course there will be a graded exam. Successful completion of the course allows you to apply for a position to the second year of the HND Electrical Engineering course.\n\nThere is also a part-time HNC Electrical Engineering course which runs over two years, requiring one day's study a week.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course24.entry_requirements = "* NC in an appropriate Engineering subject; OR\n* Two Higher Grades – Maths and one other (preferably Physics).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course24.career_prospects = "This course prepares you for a career as a Technician Engineer."
course24.spaces = course_spaces
course24.save! validate: false

course25 = Course.new college: cogc
course25.title = 'Accounting HND'
course25.category = Category.find_by_name 'Accounting'
course25.level = 'SCQF level 8'
course25.start_date = Date.new 2017, 8, 28
course25.end_date = Date.new 2019, 6, 13
course25.image = 'Accounting_HND.jpg'
course25.description = "The HND Accounting Award has been designed to meet the demands and requirements of the accounting industry. Opportunities are provided to develop your skills, knowledge and understanding in preparation for employment or for progression to further study at university, or for courses run by professional accounting organisations like ACCA, CIPFA and CIMA. Further details of the topics covered is provided in the section \"what you study\" below. \n\nYou'll be assessed throughout this course with the assessments taking the form of practical assessments, assignment and case studies. Towards the end of the first year of the course you'll undertake a Graded Unit examination, which is designed to assess your ability to integrate the knowledge and skills gained through the mandatory units. There are a further 2 Graded Units in the second year of the HND – a project based Graded Unit and a Graded Unit examination. \n\nThroughout the course you'll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience. \n\nYou'll be required to attend college on 4 days every week from 9 am to 5 pm for two academic years.\n\nThis course accepts year two direct entrants only for applicants who have already attained HNC Accounting. \n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course25.entry_requirements = "* Two relevant* Highers at grade C or above; OR\n* Successful completion of an NC/NQ** with a minimum of 2 units at SCQF level 6; OR\n* Relevant work experience will be considered where employer referee details have been supplied.\n* Equivalent qualifications will be considered. \n*Qualifications cannot include any from the following list: Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL.\n\n**Internal applicants must complete all 16 credits undertaken in the NC qualification. \n\nYear 2\n\n* Successful completion of a full time HNC Accounting course with 15 credits, with a Grade A in the graded unit and all mandatory units, OR\n* Successful completion of a part time HNC Accounting course with 12 credits, with a Grade A in the graded unit and all mandatory units.\nApplications for HND Accounting year 2 will not be processed until June 2017.\n\nYou'll be invited to attend a compulsory interview. The interview dates are:\n\n* Thursday 30 March 2017 at 1.30pm\n* Thursday 27 April 2017 at 9.30am\nThe interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You will be given the opportunity to ask questions. You must bring a copy of qualification certificates."
course25.career_prospects = "This course prepares you for a career in:\n\n* Bookkeeping.\n* Financial and/or Management Accounting.\n* Accounts Technician.\n* Assistant Accountant.\n* Accounts Supervisor.\n* Financial Reporting.\n* Management Accounting.\n* Taxation."
course25.spaces = course_spaces
course25.save! validate: false

course26 = Course.new college: clyde
course26.title = 'Supply Chain Management HND'
course26.category = Category.find_by_name 'Business & Procurement'
course26.level = 'SCQF level 8'
course26.start_date = Date.new 2017, 8, 28
course26.end_date = Date.new 2019, 6, 13
course26.image = 'accounting_keyboard_book_2.jpg'
course26.description = "This course will provide you with the knowledge and skills you need to work within the operational supply chains of a business organisation.\n\nThe course is delivered by highly qualified lecturers who have a wealth of experience within the industry. You'll gain insight, learning and transferable skills across all core operational areas of supply chain management, procurement, logistics, storage and operations.\n\nCareer prospects and employment opportunities are excellent with many of our students progressing to degree level study and careers within supply chain management or international logistics (please see the \"After the Course \"section, below, to find out more).\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework: visit www.scqf.org.uk/the-framework/."
course26.entry_requirements = "* Two Higher Grade passes at grade C or above including English (Modern Studies, Economics, History or Business); OR\n* Adult learners with some relevant experience, or who hope to move into this area, may be accepted subject to interview.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course26.career_prospects = "This course prepares you for a career in supply chain management, procurement, and international Logistics across all  major industry sectors."
course26.spaces = course_spaces
course26.save! validate: false

course27 = Course.new college: clyde
course27.title = 'Computing: Software Development HND'
course27.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course27.level = 'SCQF level 8'
course27.start_date = Date.new 2017, 8, 28
course27.end_date = Date.new 2019, 6, 13
course27.image = 'ComputingSoftwareDevelopment_HND.jpg'
course27.description = "This is a challenging course, where you'll study towards an up-to-date qualification covering many of the skills that are in demand for a range of different careers in the software development / programming sector of the Computer Industry.\n\nThese include developing skills in C#, VB.NET, Java, Object Oriented Design, Object Oriented Programming, SQL Programming and Project Management.\n\nThe 2012 Technology Insights Report from e-skills UK stated: \"The technical skills most often called for by employers were: SQL, .NET (VB and C#) and Java.\"\n\nIt also stated: \"Through to 2020 Software Professionals show the highest forecast employment growth of all IT &amp; Telecoms occupations.\"\n\nThis course will help prepare you for either employment or progression to university in computing, a skill set that is currently in high demand.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course27.entry_requirements = "* Two appropriate Highers and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* Two Highers and three Standard Grades at Credit Level; OR\n* Two Highers and three National 5 qualifications.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course27.career_prospects = "This course prepares you for a career in software development, web design/development, and information systems development."
course27.spaces = course_spaces
course27.save! validate: false

course28 = Course.new college: cogc
course28.title = 'Computing: Software Development HNC'
course28.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course28.level = 'SCQF level 7'
course28.start_date = Date.new 2017, 8, 28
course28.end_date = Date.new 2018, 6, 13
course28.image = 'Computing_Boy_with_wires.jpg'
course28.description = "According to Technology Insights Report from e-skills UK, \"Through to 2020 Software Professionals show the highest forecast employment growth of all IT &amp; Telecoms occupations.\"\n\nTherefore, this hands-on course will allow you to study towards an up-to-date qualification, covering many of the skills that are in high demand for a range of different careers in the software development / programming sector of the computer industry. These include developing skills in C# and Java, System Design, Android Development, XML, Event Driven Programming and Project Management. \n\nThis stimulating, learner focused programme will be delivered to you by our highly professional teaching staff with significant software development experience and a proven track record of bringing out the best in their students.\n\nThis course will prepare you for either employment in a junior developer role within the IT Industry or progression to HND Software Development second year. Also, this course provides you with the entry level to a wide range of university courses in computing.\n\nYou'll receive a HNC Computing / HNC Computing: Software Development qualification on successful completion of the course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course28.entry_requirements = "* One Higher* and three National 5 qualifications; OR\n* One appropriate Higher* and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* One Higher* and three Standard Grades at credit level; OR\n* A national qualification at SCQF Level 6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR\n* Other equivalent qualifications or experience.\n*in one of these subjects:  Computing, Information Systems, Maths, Physics, Chemistry or any relevant subject.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course28.career_prospects = "You have an opportunity to continue studying with us, progressing on to HND Software Development 2nd year as long as you meet the entry requirements: 15 credits, very good attendance in HNC and a very good reference from your lecturers."
course28.spaces = course_spaces
course28.save! validate: false

course29 = Course.new college:kelvin
course29.title = 'Computing: Technical Support HNC'
course29.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course29.level = 'SCQF level 7'
course29.start_date = Date.new 2017, 8, 28
course29.end_date = Date.new 2018, 6, 13
course29.image = 'ComputTechSupHNC.jpeg'
course29.description = "There is a shortage of people who are qualified to carry out desktop support roles in industry. This first year HNC course introduces you to some of skills that are in demand in many support roles in the IT industry; including learning skills in desktop support and systems administration. You’ll cover the basics of computer networking and will also learn how the components of a computer/laptop device function.\n\nThis particular unit is taught using the Cisco Networking Academy online material and success in this unit may allow you to also sit the vendor Cisco IT Essentials qualification at the end of the second term. \n\nThe course contains a mixture of practical and theoretical material and does involve independent research, study and report writing. Although you'll use the Windows environment in class, you'll also learn how to use the Linux operating system.\n\nThe technical units on this course, such as those dealing with the Windows and Linux operating systems and the networking elements of the course, are taught by lecturers who have extensive working knowledge of these systems and are Cisco/Microsoft certified practitioners.\n\nOn completion of the course, you may have the opportunity to work for companies such as Dell and Ericsson in a technical support/networking role.\n\nAfter successfully completing a first year HNC you'll receive the HNC Computing qualification. After completing the second year of an HND you'll receive the HND Computing: Technical Support qualification.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course29.entry_requirements = "* One appropriate Higher and three Intermediate 2 or National  5 qualifications (at least one of these should include a computing related qualification and/or English/Maths OR\n* One Higher and three Standard Grades (including English/Maths, all at credit level OR\n* A National Qualification at level 6 in a closely related subject (such as Digital Media Computing, Computing: Technical Support or Software Development OR\n* Other equivalent qualifications or experience.\nDepending on your qualifications, you may be invited for an individual interview or group information session where you can find out more about the course and decide if it’s the right one for you."
course29.career_prospects = "This course prepares you for a career in IT infrastructure support."
course29.spaces = course_spaces
course29.save! validate: false

course30 = Course.new college: kelvin
course30.title = 'Administration and Information Technology HNC'
course30.category = Category.find_by_name 'Administration, Human Resources & Law'
course30.level = 'SCQF level 7'
course30.start_date = Date.new 2017, 8, 28
course30.end_date = Date.new 2018, 6, 13
course30.image = 'Business_boy_with_pen_1.jpg'
course30.description = "This course provides you with a broad range of office-based skills and knowledge required to undertake a career in office administration. You’ll develop specialist skills in ICT, desktop publishing, communication, research and planning (please see further information in the 'what you study' section below).\n\nThis stimulating, learner focused programme will be delivered to you by our highly professional teaching staff with significant office administration experience and a proven track record of bringing out the best in their students.\n\nOn successful completion of this course, you'll be awarded with a HNC Administration and Information Technology.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course30.entry_requirements = "* One Higher pass in a relevant* academic subject OR\n* National Certificate in Administration (with at least 3 units at level 6) OR\n* Other appropriate and relevant National Certificate courses (with at least 3 units at level 6) may be considered.\n* Relevant office work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course30.career_prospects = "This course prepares you for a career as a Personal Assistant or Administrator in the public and private sectors."
course30.spaces = course_spaces
course30.save! validate: false

course31 = Course.new college: kelvin
course31.title = 'Administration and Information Technology with Digital Communication HNC'
course31.category = Category.find_by_name 'Administration, Human Resources & Law'
course31.level = 'SCQF level 7'
course31.start_date = Date.new 2017, 8, 28
course31.end_date = Date.new 2018, 6, 13
course31.image = 'admin_20_26_20IT_20HNC_20Course.jpg'
course31.description = "The increased digitisation of the workplace has meant there is a demand for administrators to have increased digital skills; this course is an excellent opportunity for you to study and train for a career in various administration positions with excellent career opportunities and progression routes.\n\nYour programme will be delivered by highly professional teaching staff with significant industry experience and a proven track record of bringing out the best in their students. To find out what units you'll cover, please read the 'What you Study' section, below.\n\nOn successful completion of this course, you'll be awarded with a HNC Administration and Information Technology with Digital Communications\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course31.entry_requirements = "* One Higher pass in a relevant* academic subject OR\n* National Certificate in Administration (with at least 3 units at level 6) OR\n* Other appropriate and relevant National Certificate courses (with at least 3 units at level 6) may be considered.\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course31.career_prospects = "This course would help you to gain various administration positions in both the public and private sectors."
course31.spaces = course_spaces
course31.save! validate: false

course32 = Course.new college: cogc
course32.title = 'Business Diploma of Higher Education'
course32.category = Category.find_by_name 'Business & Procurement'
course32.level = 'SCQF level 8'
course32.start_date = Date.new 2017, 8, 28
course32.end_date = Date.new 2019, 6, 13
course32.image = 'BusinessDiplomaofHE.jpg'
course32.description = "This course is designed to give you direct entry into the third year of the BA degree programme in Business at Strathclyde Business School, a qualification highly regarded by employers. It is run as a collaboration between City of Glasgow College and the University of Strathclyde, Glasgow.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course32.entry_requirements = "* A minimum of three Higher Grade passes, 2 at Grade B and 1 at grade C in suitable academic subjects *, one of which must be English (or equivalent).  AND\n* Two other passes at National 5 (or equivalent) including Mathematics.\n* relevant academic subjects include Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or Natural Sciences.\n\nYou'll be invited to attend a group presentation and interview session. The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course32.career_prospects = "This course prepares you for a career in marketing, legal services, management, human resources, administration in industrial and commercial sectors, teaching, public sector employment or research."
course32.spaces = course_spaces
course32.save! validate: false

course33 = Course.new college: cogc
course33.title = '3D Computer Animation HND'
course33.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course33.level = 'SCQF level 8'
course33.start_date = Date.new 2017, 8, 28
course33.end_date = Date.new 2019, 6, 13
course33.image = 'Computing_digitalmedia.jpg'
course33.description = "This hands-on course helps you develop the skills needed to become a 3D Digital Developer, incorporating live industry related projects in a range of different 3D animation disciplines.\n\nSome students may gain internships and summer placements while studying at the college.This course also accepts year two direct entrants.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course33.entry_requirements = "* Two appropriate Highers and three Intermediate 2 courses (including at least one from Computing, Information Systems, Graphic Communications or equivalent), OR\n* Two Higher passes and three Standard Grades at credit level or above, OR\n* A national qualification at SCQF Level 5 or 6 in a related subject such as Digital Media Computing, Computer Arts and Animation.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course33.career_prospects = "After completing the HND you can apply for jobs in areas of the Communication Industry, including design consultancies, advertising agencies, newspaper and magazine publishing, web design and motion graphics for screen, or in-house design studios.\n\nYou may eventually become self-employed as a Graphic Designer."
course33.spaces = course_spaces
course33.save! validate: false

course34 = Course.new college: cogc
course34.title = 'Art Glass Design HND'
course34.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course34.level = 'SCQF level 8'
course34.start_date = Date.new 2017, 8, 28
course34.end_date = Date.new 2019, 6, 13
course34.image = 'decorative_glass_lady_0.jpg'
course34.description = "The HND Art Glass Design course is for you, if you want to follow a career in art glass design and production. This course offers you a broad education with a balance between creative, practical and core skills.  \n\nYou’ll work in two and three dimensions, learning contemporary warm glass techniques like slumping and fusing and traditional skills like copper foil and lead work, as well as more advanced glass surface applications.\n\nPrevious students have gone on to become glass technicians, self-employed glass artists or used their skills within a larger design studio; designing and manufacturing stained glass panels, household items and jewellery. Visit the Contemporary Glass Society for more useful resources.\n\nIf you want a recognised art glass industry qualification: This course offers the only HND certified glass work course in Scotland!\n\nFollow the latest trends in the creative industries, visit The Pulse\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course34.entry_requirements = "* One Higher in Art and Design and two National 5 Qualifications (or equivalent), OR\n* NC/NQ in an Art and Design subject.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to show examples of your art and design work."
course34.career_prospects = "The HND course may lead to a job in the art glass industry or self-employment."
course34.spaces = course_spaces
course34.save! validate: false

course35 = Course.new college:kelvin
course35.title = 'Creative Printmaking HND'
course35.category = Category.find_by_name 'Fine Arts & Photography'
course35.level = 'SCQF level 8'
course35.start_date = Date.new 2017, 8, 28
course35.end_date = Date.new 2019, 6, 13
course35.image = 'HND_20Creative_20Printmaking.jpg'
course35.description = "This course offers you an opportunity to develop your creative talents allowing you to develop traditional and contemporary printmaking, drawing and digital skills.\n\nVarious printmaking techniques and media are explored and supplemented with technical and creative skills in digital media, drawing, bookbinding and mixed media.\n\nThis course combines practical skills with theoretical knowledge and is project based. It is delivered through a series of lectures, practical workshops and activities. You'll produce a portfolio of work that will support entry to employment or degree level courses.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course35.entry_requirements = "* An NC/NQ qualification in Print, Art and Design, Graphic Design, illustration or equivalent SVQ, OR\n* Higher Art and Design and English at minimum Intermediate level 2 or National 5; OR\n* Relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide examples of your art, photography, or design work."
course35.career_prospects = "On completion of the course, you can pursue a career as a practicing Artist, Printmaker, Designer, Print Technician, or as a Printmaking Educator."
course35.spaces = course_spaces
course35.save! validate: false

course36 = Course.new college: cogc
course36.title = 'Display Design for Retail HND'
course36.category = Category.find_by_name 'Fine Arts & Photography'
course36.level = 'SCQF level 8'
course36.start_date = Date.new 2017, 8, 28
course36.end_date = Date.new 2019, 6, 13
course36.image = 'HND_20Display_20Design_20for_20Retail.jpg'
course36.description = "The role of the Display Designer is to create a three-dimensional environment that tells a story. This may be about a collection, a brand or simply an idea. Display Designers use a range of media and technologies in order to effectively communicate messages in space.\n\nOutside London, this is the UK’s only further education course in Retail Display Design at this level. This two-year course will provide you with a wide understanding of all aspects of design necessary for a career in retail display design.\n\nThis course will involve:\n\nThe course is very vocational and has direct links to the retail sector, which will prepare you for employment in the Industry, after successfully completing your qualification.\n\nFocusing on three-dimensional design, you’ll develop your creative abilities and artistic skills. You’ll also learn the personal and professional effectiveness you’ll need for a career in the retail display sector through work experience placements.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course36.entry_requirements = "* Higher Art &amp; Design and English at minimum Intermediate 2; OR\n* NC in Art &amp; Design or Illustration; OR \n* Related experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course36.career_prospects = "Demand for retail display designers is continuous within the retail sector. Previous students are employed by national and international companies such as Levi's, French Connection, Ikea, Frasers, BHS, Marks and Spencer and John Lewis."
course36.spaces = course_spaces
course36.save! validate: false

course37 = Course.new college: cogc
course37.title = 'Art and Animation HND'
course37.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course37.level = 'SCQF level 8'
course37.start_date = Date.new 2017, 8, 28
course37.end_date = Date.new 2019, 6, 13
course37.image = 'animation.png'
course37.description = "This is a broad based course that develops your creative and technical animation skills, encompassing both traditional animation techniques and digital practices. \n\nDuring your time on the course you'll have the opportunity for study trips at both home and abroad. Recent trips have included Berlin, Amsterdam, the Outer Hebrides, Edinburgh and the art galleries of Glasgow.    \n\nIn addition the course prides itself in providing relevant industrial experience and you would be expected to complete a range of live and client led projects. \n\nView Computer Arts and Animation on Vimeo.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course37.entry_requirements = "* NC in Art and Design, Graphic Arts portfolio, Illustration or Graphic Design, OR\n* Art and Design at Higher and English at minimum Intermediate 2, OR\n* Art and Design at Higher and English at National 5 level.\nYou'll also be expected to submit examples of your art and design work, including figure drawings to support your application. If you don’t have the required qualifications, we’ll consider you for a place based on your experience and examples of your work.\n\n* An HNC in Computer Arts and Design or an equivalent level qualification.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n\nYou'll be expected to show examples of your art &amp; design work at the interview."
course37.career_prospects = "Students who complete their HND can progress to a career in motion graphics as an: animator, storyboard artist, layout artist, character developer, compositor, vfx designer and other related specialist.\n\nThere are opportunities for employment in-house or as a self-employed freelancer working for animation studios, VFX companies, BBC, STV, TV production companies, wed design studios, advertising agencies, and other clients requiring animation or motion graphics sequences."
course37.spaces = course_spaces
course37.save! validate: false

course38 = Course.new college: cogc
course38.title = 'Digital Art and Culture HND'
course38.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course38.level = 'SCQF level 8'
course38.start_date = Date.new 2017, 8, 28
course38.end_date = Date.new 2019, 6, 13
course38.image = 'digCulture-web.jpg'
course38.description = "The Digital Art and Culture course provides a foundation in art and design and the opportunity for you to develop project-based work in new media, mixed media, digital video, digital sound, interactive media and other forms of computer art.\n\nSuccessful graduates are now working in a range of creative industry jobs, from new media artists to games designers and from front-end web developers to filmmakers. So if you're curious about how artists and designers can work with new and emerging technologies then this could be the course for you.  \n\nDuring your time on the course you'll have the opportunity for study trips at both home and abroad. Recent trips have included Berlin, Amsterdam, the Outer Hebrides, Edinburgh and the art galleries of Glasgow.    \n\nIn addition the course prides itself in providing relevant industrial experience and you would be expected to complete a range of live and client led projects.\n\nFollow the latest trends in new media, animation and other forms of computer art on the Computer Arts and Design Facebook page.\n\nView the Digital Art and Culture's course pages on Youtube or Vimeo:\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course38.entry_requirements = "* National Certificate in Art and Design or related subject; OR\n* One Higher in Art and Design and English at minimum Intermediate 2; OR\n* One Higher in Art and Design and English at National 5 level; OR\n* Relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course38.career_prospects = "This course will create career opportunities in: cross-media art, interactive digital media, film and moving image, time-based art, education and community arts."
course38.spaces = course_spaces
course38.save! validate: false

course39 = Course.new college: kelvin
course39.title = 'Digital Media HND'
course39.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course39.level = 'SCQF level 8'
course39.start_date = Date.new 2017, 8, 28
course39.end_date = Date.new 2019, 6, 13
course39.image = 'HND_DigitalMedia_1600x1078_IMAGE1.jpg'
course39.description = "This new Digital Media course will develop your creative and technical skills, in the production of screen based graphic design and media content for interactive and multimedia applications, such as web, mobile app, motion graphics and VFX.\n\nDuring the course you'll be taught by staff with significant Digital Media experience and a proven track record of bringing out the best in their students.\n\nThe course is delivered mainly through practical projects in the studio and state-of-the-art labs, using industry standard software and techniques.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course39.entry_requirements = "* National Certificate in Art and Design or related area; OR\n* Higher Art and Design or Graphic Communication and English at minimum Intermediate 2; OR\n* Higher Art and Design or Graphic Communication and English at National 5 Level; OR\n* Relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course39.career_prospects = "After the HND you can apply for jobs in the Communication Industry, such as with design consultancies, advertising agencies, on line publishing, web design, television and film production, motion graphics for screen, or in-house design studios.\n\nYou may eventually become employed as an Interactive, Multimedia, Web or Graphic Designer."
course39.spaces = course_spaces
course39.save! validate: false

course40 = Course.new college:kelvin
course40.title = 'Graphic Design HND'
course40.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course40.level = 'SCQF level 8'
course40.start_date = Date.new 2017, 8, 28
course40.end_date = Date.new 2019, 6, 13
course40.image = 'HND_20Graphic_20Design_201600x1078_IMAGE1.jpg'
course40.description = "This Graphic Design course prepares you for a career in the exciting and constantly developing area of graphic design. The course develops your creative ability and technical graphics skills, mainly through practical projects in the studio.\n\nThe course also encourages you to take responsibility for your own development. You'll build on your own creative concepts through research and development in the sketchbook, before producing finished work digitally.\n\nThe emphasis of the course is on layout of type and image, for both print and screen and the development of creative concepts.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course40.entry_requirements = "* Higher Art and Design and English at minimum Intermediate 2; OR\n* Higher Art and Design and English at National 5 Level; OR\n* NC in Art and Design, or related subject.\nYou'll be invited for a group and/or individual interview, where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course40.career_prospects = "After completing the HND you can apply for jobs in areas of the Communication Industry, including design consultancies, advertising agencies, newspaper and magazine publishing, web design and motion graphics for screen, or in-house design studios.\n\nYou may eventually become self-employed as a Graphic Designer."
course40.spaces = course_spaces
course40.save! validate: false

course41 = Course.new college:kelvin
course41.title = 'Creative Industries: Professional Writing Skills HNC'
course41.category = Category.find_by_name 'Drama & Creative Writing'
course41.level = 'SCQF level 7'
course41.start_date = Date.new 2017, 8, 28
course41.end_date = Date.new 2018, 6, 13
course41.image = 'Drama_read_script_2.jpg'
course41.description = "This course is for you, if you are looking for a career in writing. It will help you to develop the skills you'll need to work in a variety of fields. We cover scripting for TV and radio, short story writing, poetry and journalism, as well as vital freelance skills and industry knowledge.\n\nThis stimulating, learner-focused course is delivered by highly professional teaching staff, with significant Communications Industry experience and a proven track record of bringing out the best in their students.\n\nPrevious students on this course have had scripts produced, novels and poetry published, or worked professionally in a range of relevant disciplines. Others have gone on to complete degree and postgraduate courses.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course41.entry_requirements = "* A Higher in English at minimum B or above or relevant group of units (e.g. Literature 1, Communication 4); OR\n* Relevant experience.\nYou'll be invited for a group pre-entry guidance session and individual interview where you can find out more about the course and tell us why you are interested in this subject.\n\nAt interview you'll be asked to write a short factual piece and provide a folio of three or four typed pieces of work. This may include poetry collections, short stories or prose extracts, script extracts, or journalism articles.\n\nPlease note that school essays are not suitable. "
course41.career_prospects = "This course prepares you for a career in creative writing, freelance writing, journalism, script editing, scriptwriting or broadcasting. Previous students have gone on to work in publishing, script tutoring, ghost writing, and speech writing."
course41.spaces = course_spaces
course41.save! validate: false

course42 = Course.new college: cogc
course42.title = 'Creative Industries: Radio HNC'
course42.category = Category.find_by_name 'Media'
course42.level = 'SCQF level 7'
course42.start_date = Date.new 2017, 8, 28
course42.end_date = Date.new 2018, 6, 13
course42.image = 'Radio_girl_on_live.jpg'
course42.description = "This course helps you to develop a range of radio production and broadcasting skills including production, interviewing, scripting, presentation, news, radio station operations, sound recording, commercial production and digital editing.\n\nYou can regularly contribute to the college radio station, and the course may also provide opportunities to work with major professional radio stations. \n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course42.entry_requirements = "* ​NC Media or equivalent SVQ; OR\n* Higher English plus two National 5 Qualifications (or equivalent).\nYou'll be invited for a group pre-entry guidance session and individual interview where you can find out more about the course and tell us why you are interested in this subject.\n\nIt may strengthen your application to provide evidence of relevant experience or activity in the subject area, e.g. podcasting; involvement in community, hospital, online or school radio stations; music blogging; sound production or editing; relevant work experience or volunteering etc."
course42.career_prospects = "There are opportunities in radio for those with a variety of up-to-date skills, broadcasting knowledge and experience. Alternatively, students can progress to further study either at City of Glasgow College or elsewhere subject to entry conditions."
course42.spaces = course_spaces
course42.save! validate: false

course43 = Course.new college: cogc
course43.title = 'Practical Journalism HND'
course43.category = Category.find_by_name 'Media'
course43.level = 'SCQF level 8'
course43.start_date = Date.new 2017, 8, 28
course43.end_date = Date.new 2019, 6, 13
course43.image = 'Television_camera_0.jpg'
course43.description = "This is a vocational and skills specific course suitable only for those who have a desire to pursue Journalism as a career.\n\nJournalists must have the essential skills of writing and research, but are now expected to record sound, shoot video and edit on digital systems. They are also increasingly expected to produce their own web content.\n\nYou'll acquire these skills on this course to enable you to position yourself for the world of work, or university.\n\nThere will be an opportunity to specialise in the area of journalism you are most interested in.\n\nWhy not connect with International Journalism Network and keep up to date with news and opportunities from journalists worldwide?\n\nYou'll be awarded a HND Practical Journalism on successful completion of this course. This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course43.entry_requirements = "Two Highers in relevant subjects, at grade C or above, which must include Higher English and/or Higher Modern Studies OR NC Media or equivalent; AND\n\nSome practical skills in IT, including word processing, email and internet.\n\nYou'll be invited for a group pre-entry guidance session and individual interview where you can find out more about the course and tell us why you're interested in this subject. At your interview you will have to:\n\n* Write a 200 word article according to brief given on the day.\n* Correct the spelling, grammar and punctuation in a 300 word article.\n* Discuss the importance of journalism.\nIt would also strengthen your application to provide evidence of relevant experience in the area, e.g. blogging, podcasting, published articles, involvement in school newspapers, magazines or radio stations, relevant volunteering or work experience."
course43.career_prospects = "Following this course, you can either apply for jobs in the industry or for a place at university."
course43.spaces = course_spaces
course43.save! validate: false

course44 = Course.new college:kelvin
course44.title = 'Photography HND'
course44.category = Category.find_by_name 'Fine Arts & Photography'
course44.level = 'SCQF level 8'
course44.start_date = Date.new 2017, 8, 28
course44.end_date = Date.new 2019, 6, 13
course44.image = 'photography_figures_in_settings_2.jpg'
course44.description = "This highly competitive course provides you with the skills you need to start a career in photography, or a related area within the creative industries. This is a practice-based course with projects both in the studio and on location. Alongside technical skills, you're encouraged to work on self-reflection and evaluation through class feedback sessions.\n\nYou'll have an opportunity to work independently on self-initiated projects and to develop your own photographic ideas and briefs.\n\nWith a broad range of experienced staff on hand and industry standard facilities, this course is an excellent opportunity for those with a keen interest in photography, who want to develop that interest through full time study.\n\nYou'll continually update your photographic portfolio showcasing your most recent work.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course44.entry_requirements = "* An NC/NQ in photography is preferred; OR\n* One Higher at minimum grade C or above in Photography plus 2 National 5 Qualifications (one in English preferred).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide a strong photographic portfolio of work."
course44.career_prospects = "With an HND in photography, you'll be prepared for a position in the highly competitive creative and media sector including: advertising, commercial, press and photojournalism, fashion, sports, social, medical, scientific, throughout the UK and worldwide."
course44.spaces = course_spaces
course44.save! validate: false

course45 = Course.new college: clyde
course45.title = 'Beauty Therapy HND'
course45.category = Category.find_by_name 'Hair & Beauty'
course45.level = 'SCQF level 8'
course45.start_date = Date.new 2017, 8, 28
course45.end_date = Date.new 2019, 6, 13
course45.image = 'Beauty_Complementary_Therapies_face.jpg'
course45.description = "The course offers a high level beauty qualification which will provide you with the knowledge of current beauty treatments, product ranges and techniques. An employment driven focus throughout all aspects of the course ensures that you are employment ready and have great success in developing careers within the ever expanding beauty sector.\n\nYou'll be taught by a highly motivated and versatile team with an excellent range of industrial expertise who deliver world class student focussed learning.\n\nThe department has been awarded The Herald look Awards Training Institution of the year and our students have gained Gold and Silver medals in World Skills UK.\n\nPlease note, prior beauty knowledge is not essential.\n\nThis course is offered with 2 different pathways – one for those with a qualification at NCGA Beauty Care Level 6 and the other for those with no prior beauty but have 2 Highers or equivalent.\n\nYou'll receive a HND Beauty Therapy award on successful completion of the course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course45.entry_requirements = "Direct Entry - No prior beauty qualification pathway\n\n* Two Higher grade passes. \nOR\n\n* NC Level 6 or HNC/D in any subject area.\nNCGA Beauty Care Level 6 pathway\n\n* NCGA Beauty Care Level 6.\nOR\n\n* NVQ/SVQ Level 3 Beauty.\n* You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course.\n* Excellent communication skills and an enthusiasm for the beauty industry is essentia"
course45.career_prospects = "This course prepares you for a career in the Beauty Industry including roles in salons, health spas, cruise ships, or self-employment. A number of senior, or managerial posts may also be available to HND qualified therapists."
course45.spaces = course_spaces
course45.save! validate: false

course46 = Course.new college: clyde
course46.title = 'Complementary Therapies HNC'
course46.category = Category.find_by_name 'Hair & Beauty'
course46.level = 'SCQF level 7'
course46.start_date = Date.new 2017, 8, 28
course46.end_date = Date.new 2018, 6, 13
course46.image = 'CT_Reflexology_102.jpg'
course46.description = "Do you have a keen interest in therapy treatments, combined with the holistic approach to health and wellbeing, and enjoy working with people? If so, this could be the course for you.\n\nIn recent years there has been a considerable increase in interest and demand for complementary and holistic therapies; growth is expected to continue, providing employment opportunities to meet the demand from those seeking alternative ways to reduce stress and enhance feelings of general well-being. \n\nThis advanced level course develops skills involved within complementary therapies, including a variety of massage techniques, stress management and health and wellbeing. It will encourage you to examine alternative methods of enhancing general health and allow you to gain experience and confidence working with clients. The course is delivered by our dedicated lecturing team, who have high level skills and wide experience within the holistic and complementary therapies profession. \n\nYou'll be able to participate in volunteering opportunities throughout the year, offering treatments in a variety of settings.\n\nThe course aim is to produce qualified practitioners, eligible for professional membership and insurance as a Complementary Therapist. The qualification will also provide possible entry to HND, and then progression to degree level courses.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course46.entry_requirements = "* Two Highers at C or above (English and Science subject preferred); OR\n* NC Wellness Therapies; OR\n* NC Level 6 in Beauty Care; OR\n* Relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject.\n\nThis is a popular course, and you'll be expected to strongly communicate your enthusiasm for all aspects of its content."
course46.career_prospects = "This course prepares you for a career in the field of complementary therapies, working in healthcare services, eg palliative care, therapy clinics, or within the spa industry. There are also opportunities for self-employment, eg providing a mobile therapy service."
course46.spaces = course_spaces
course46.save! validate: false

course47 = Course.new college: cogc
course47.title = 'Fitness, Health and Exercise HND'
course47.category = Category.find_by_name 'Sport & Fitness'
course47.level = 'SCQF level 8'
course47.start_date = Date.new 2017, 8, 28
course47.end_date = Date.new 2019, 6, 13
course47.image = 'Sport_gym_workout_0.jpg'
course47.description = "This course is most suited to those with an interest in the fields of fitness, health and exercise. The new framework has been developed to include industry recognition in the form of the endorsement by the Register of Exercise Professionals (REPS).\n\nYou can leave the course after Year 1 and achieve the HNC Fitness, Health and Exercise and Gym Instructor qualification.\n\nOn successful completion of Year two, you'll be awarded the Level 3 Personal Trainer accreditation.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course47.entry_requirements = "* A minimum of 2 Highers one of which must be English; OR\n* A NQ/NC qualification at Level 6 in Sport and Fitness related subjects.\n* Relevant experience is advantageous.\n* Applications are welcome from those without formal qualifications who can demonstrate an active interest in sport or fitness.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. An element of the interview process will involve paired exercise where you demonstrate an exercise of your choice to a partner, highlighting safe and effective practice. Please bring suitable indoor gym wear."
course47.career_prospects = "This course will suit individuals wishing to pursue careers in sports clubs, private fitness facilities, local authorities and government sport initiatives; ranging from personal training and exercise instruction, to teaching physical education, or working within sports science.\n\nYou may also look at self-employment in fitness, exercise prescription and athletic conditioning."
course47.spaces = course_spaces
course47.save! validate: false

course48 = Course.new college: cogc
course48.title = 'Professional Cookery HND'
course48.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course48.level = 'SCQF level 8'
course48.start_date = Date.new 2017, 8, 28
course48.end_date = Date.new 2019, 6, 13
course48.image = 'Cooks_serving_food.jpg'
course48.description = "Professional cookery has never been as popular as it is today. This course is an excellent opportunity for you to study and train for a career in catering with excellent career opportunities and progression routes.\n\nIn the first year, you'll develop your culinary skills to an advanced level and learn the knowledge you’ll need for a supervisory role in the Catering Industry. In the second year you'll combine culinary expertise and managerial skills. The course contains practical and theory units, which are assessed throughout (please see further information in the 'what you study' section below).\n\nExperience in the Hospitality Industry is an integral part of the course, and you’ll work towards the Industrial Experience unit.\n\nOn successful completion of tihs course, you'll be awarded with a HND in Professional Cookery.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course48.entry_requirements = "* Professional Cookery Year 2 / NC Professional Cookery (Level 6) or an appropriate group of National Units; OR\n* Other equivalent qualifications or experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course48.career_prospects = "On completing your HND, you might progress to a career in catering, restaurants, and hospitality at a supervisory, or junior management level."
course48.spaces = course_spaces
course48.save! validate: false

course49 = Course.new college: clyde
course49.title = 'Events HNC'
course49.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course49.level = 'SCQF level 7'
course49.start_date = Date.new 2017, 8, 28
course49.end_date = Date.new 2018, 6, 13
course49.image = 'Events_HNC.jpg'
course49.description = "This course will give you the skills, knowledge and understanding to develop a career in the organisation and management of conferences, exhibitions and special events.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course49.entry_requirements = "* One Higher pass with a minimum of C, in an appropriate subject such as Business Management, English, Modern Studies, Economics, History; OR\n* NQ in Events or another relevant subject; OR\n* Other qualifications and relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course49.career_prospects = "You could expect to go on to work in events across a range of industries."
course49.spaces = course_spaces
course49.save! validate: false

course50 = Course.new college: cogc
course50.title = 'Nautical Science/ Chief Mate Full / Master  HND'
course50.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course50.start_date = Date.new 2017, 8, 28
course50.end_date = Date.new 2018, 6, 13
course50.image = 'marine_D3.jpg'
course50.description = "This course is designed for you to progress from OOW level (deck) to Chief mates level. The course requires that you have held a MCA approved OOW certificate and that you have had a position at sea for a period of 12 months. You'll also have completed the following short courses: HELM Management, NAEST Management and a Medical Care certificate.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course50.entry_requirements = "* Recognised sea time of 12 months at OOW level\n* NAEST (M) certificate (to be valid when finally applying for your COC). The NAEST(M) course is scheduled within course progr"
course50.career_prospects = "The course overall will equip you to become a competent and efficient Chief Mate."
course50.spaces = course_spaces
course50.save! validate: false

course51 = Course.new college: clyde
course51.title = 'Marine Operations Scottish Professional Diploma'
course51.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course51.level = 'SCQF level 8'
course51.start_date = Date.new 2017, 8, 28
course51.end_date = Date.new 2018, 6, 13
course51.image = 'Marine_class_teaching.jpg'
course51.description = "If you're a school leaver with at least 120 UCAS points, this course will help you become a seagoing Deck Officers. It is structured into five distinct phases spent at college and sea.\n\nAt the end of the course you'll have gained a Professional Diploma in Marine Operations and your qualifications will allow you to be an Officer of the Watch (OOW) on a merchant vessel.\n\nYou'll be sponsored by a shipping company or training agency, who'll provide the sea phases on ships operating worldwide. Applications should be made via sponsoring companies, full details of which can be obtained from the Careers at Sea website: www.careersatsea.org\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course51.entry_requirements = "* Standard Grade passes at grade 3 or above (maths to Grade 2); OR\n* GCSE passes at grade C or above; OR\n* A pass at Intermediate 2 in maths, English or a subject involving the use of English. A science subject with a significant content of a physical science; OR\n* National Certificate passes at National 5 in maths, English and a science subject\n* Plus Higher Level/A Level: One or more passes at Higher Level/A Level subjects, amounting to at least 120 points on the UCAS tariff system, one of which should preferably be maths or a physical science subject\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course51.career_prospects = "This course prepares you for a career at sea in the Merchant Navy and in a number of different sectors such as offshore, cruise ships, oil tankers, LNG and chemical tankers."
course51.spaces = course_spaces
course51.save! validate: false

course52 = Course.new college: kelvin
course52.title = 'Nautical Science (Top up) HND'
course52.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course52.level = 'SCQF level 8'
course52.start_date = Date.new 2017, 8, 28
course52.end_date = Date.new 2018, 6, 13
course52.image = 'Nautical_Science_Top_Up.jpg'
course52.description = "This one-year program is suitable for those cadets who have completed MNTB/MCA approved HNC in Nautical Science.\n\nFor further information see http://www.careersatsea.org/."
course52.entry_requirements = "* MNTB/MCA Approved HNC in Nautical Scienc"
course52.career_prospects = "This course prepares you for a career at sea in the Merchant Navy and in a number of different sectors such as offshore, cruise ships, oil tankers, LNG and chemical tankers."
course52.spaces = course_spaces
course52.save! validate: false

course53 = Course.new college: cogc
course53.title = 'UK Maritime and Coastguard Agency Officer of the Watch (Reg11/ 1) (including HNC Nautical Science)  HNC'
course53.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course53.start_date = Date.new 2017, 8, 28
course53.end_date = Date.new 2018, 6, 13
course53.image = 'Marine_safetyboys_0.jpg'
course53.description = "This is an exciting and challenging full-time course designed for serving deck ratings who want to obtain a UK Certificate of Competency at Officer of the Watch (STCW 95) level.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course53.entry_requirements = "* Three years of acceptable sea service in a deck capacity; AND\n* An acceptable level of maths; AND\n* Completion of the City of Glasgow College Distance Learning Mathematics course (SCQF Level 6/"
course53.career_prospects = "This course prepares you for a career as a Merchant Navy Deck Officer or shore-based employment in the shipping industry. You could apply for our higher level Deck Officer or Master Mariner qualifications, or a degree in maritime studies with various institutions. You could also look at progression to the second year of a Marine Operation degree course at Southampton Solent University."
course53.spaces = course_spaces
course53.save! validate: false

course54 = Course.new college: cogc
course54.title = 'Marine Engineering for Cadets from International Partner Colleges HND'
course54.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course54.level = 'SCQF level 8'
course54.start_date = Date.new 2017, 8, 28
course54.end_date = Date.new 2019, 6, 13
course54.image = 'Marine_climb_ladders.jpg'
course54.description = "This 2 year course, approved by the MCA, is for applicants aspiring to be Marine Engineer Officers on board merchant ships. It's offered in collaboration with our international partners in India and Pakistan.\n\nYour first year will be with our international partners with the second year at City of Glasgow College. There will be a phase at sea after which, you will return to the College to complete the EOOW courses.\n\nFor further information see http://www.careersatsea.org/."
course54.entry_requirements = "* It is expected that those recruited onto the Marine Engineering Cadetship programme will have entry qualifications equivalent to Scottish Qualification Authority (SQA) Highers that include Maths, Physics, Technological Studies, or another science based subject all at level B or above\n* IELTS at 5.5\n* The International Department of the City of Glasgow College can offer qualification matching services if required."
course54.career_prospects = "This course prepares you for a career as a Senior Marine Engineering Officer, Ship Manager, or Ship Superintendent."
course54.spaces = course_spaces
course54.save! validate: false

course55 = Course.new college: cogc
course55.title = 'Hospitality Management HND'
course55.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course55.level = 'SCQF level 8'
course55.start_date = Date.new 2017, 8, 28
course55.end_date = Date.new 2019, 6, 13
course55.image = 'HND_20Hospitality_201600x1078.jpg'
course55.description = "This two year Hospitality Management course helps you to develop the knowledge and skills required to operate effectively at supervisory level in the Hospitality Industry. The first year covers a range of subjects, both practical and theoretical. The second year focuses on providing you with the necessary managerial knowledge and skills for a junior management position.\n\nThis HND is a valuable qualification for employment in an exciting and ever changing industry, as well as a good preparation for further studies.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course55.entry_requirements = "* Two Higher passes with a minimum of C passes; OR\n* NQ in Hospitality or other appropriate NQ; OR\n* Other relevant industry experience or equivalent qualification.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course55.career_prospects = "The course prepares you for employment at junior management/supervisory level in a hospitality department, and graduate training schemes with many large organisations.\n\nWe work with key representatives from industry to offer graduate training positions following the successful completion of the HND."
course55.spaces = course_spaces
course55.save! validate: false

course56 = Course.new college: cogc
course56.title = 'Hospitality Operations HNC'
course56.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course56.level = 'SCQF level 7'
course56.start_date = Date.new 2017, 8, 28
course56.end_date = Date.new 2019, 6, 13
course56.image = 'HNC_20Hospitality_201600x1078.jpg'
course56.description = "This course covers a range of subjects in Hospitality, both practical and theoretical. This course provide you with valuable qualifications for employment in an exciting and ever changing industry, or further studies.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course56.entry_requirements = "* One Higher with a minimum of a C pass; OR\n* NQ in Hospitality or other appropriate NQ; OR\n* Offers are subject to attending an interview with a member of the Hospitality / Events Team where you should articulate your interest and/or experience in hospitality and your goals after completing the course.\nYou’ll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course56.career_prospects = "This course prepares you for a career at a supervisory level in a hospitality department of a hotel, or directly into a graduate training scheme with many large organisations, or a junior management position. We work with key representatives from industry to offer Graduate training positions following the successful completion of the HNC."
course56.spaces = course_spaces
course56.save! validate: false

course57 = Course.new college: clyde
course57.title = 'Mechanical Engineering HND'
course57.category = Category.find_by_name 'Engineering, Energy & Gas'
course57.level = 'SCQF level 8'
course57.start_date = Date.new 2017, 8, 28
course57.end_date = Date.new 2019, 6, 13
course57.image = 'Engineering_block.jpg'
course57.description = "This two year course allows you to study mechanical engineering to a professional standard. On completion of this course you'll typically go to university, or move into industry as supervisors or technician. Find job profiles and opportunities here.\n\nThis course involves the use of the college’s extensive engineering equipment, which includes a fully functioning mechanical workshop and computer labs running CAD design software, hydraulic pneumatic software and labs.\n\nFollow Vickram’s journey from leaving school to direct entry to 3rd year Mechanical Engineering university course!\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course57.entry_requirements = "* NC in an appropriate Mechanical Engineering subject; OR\n* Two Higher Grades – Maths and one other (we’d prefer Physics).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course57.career_prospects = "This course prepares you for a career as an Engineering Technician, Supervisor or Manager."
course57.spaces = course_spaces
course57.save! validate: false

course58 = Course.new college:kelvin
course58.title = 'Women into Engineering HNC'
course58.category = Category.find_by_name 'Engineering, Energy & Gas'
course58.level = 'SCQF level 7'
course58.start_date = Date.new 2017, 8, 28
course58.end_date = Date.new 2018, 6, 13
course58.image = 'engineer_pipe_girl.jpg'
course58.description = "This HNC Mechanical Engineering course is open only to women. You'll learn the skills, knowledge and understanding required for a career in mechanical engineering – an area where women are under-represented. \n\nIf you want to work in one of the most diverse forms of Engineering, this course is for you. During practical sessions, you have use of our engineering workshop - fully equipped with pneumatic and hydraulic labs as well as CAD software running in our computer labs. \n\nWe can offer you a suitable mentor during the course through our partnership with Equate\n\n(Discover how Equate are making a positive difference for women in science engineering, technology and the built environment here).  \n\nSuccessful students have gone on to work in a range of engineering positions, from Engineering Technician to Mechanical Engineer. On successful completion of the course, you also have the opportunity to continue study at HND or Degree level.\n\nUse Interconnect to join like-minded women studying science, engineering, technology and built environment at Scotland’s Colleges and Universities.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course58.entry_requirements = "* NC in an appropriate Mechanical Engineering subject, OR\n* Two Highers – Maths and one other subject, preferably Physics.\nThis course is for women only. You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course58.career_prospects = "This course prepares you for a career as an Engineering Technician."
course58.spaces = course_spaces
course58.save! validate: false

course59 = Course.new college: cogc
course59.title = 'Chief Mate/ Master Post HND'
course59.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course59.start_date = Date.new 2017, 8, 28
course59.end_date = Date.new 2018, 6, 13
course59.image = 'Class2_Post_HND.jpg'
course59.description = "This course will allow you to progress to the Chief Mates and Master level and achieve the relevant (Unlimited) Certificate of Competency.\n\nTo apply for this course you should have successfully completed an HND in Nautical Science in the UK and have accrued at least 12 months of sea service after obtaining your OOW UK COC (Unlimited)."
course59.entry_requirements = "* Recognised sea time of at least 12 months at an OOW level.\n* STCW Certificate in Medical Care On Board (Medical Care is required before the candidates take their MCA Oral examination. The course can be booked in advance through marine@cityofglasgowcollege.ac.uk).\n* NAEST (Operational) Certificate (If you completed the NARAST (O) course prior to 1st January 2005 you are required to undertake an ECDIS course conforming with an IMO Model 1.27 prior to undertaking the NAEST Management course).\n* Applications from International Students who meet the above requirements are welcom"
course59.career_prospects = "The course will equip you with the skills to become a competent and efficient Chief Mate. You will require a total of 36 months ‘watch-keeping service’ while holding an OOW Unlimited II/I COC to undertake your next examination for Master (Unlimited) COC. This period may be reduced to 24 months if at least 12 months of such seagoing service has been served as Chief Mate while holding a Chief Mate unlimited, II/2, Certificate of Competency (Reference MSN 1856)."
course59.spaces = course_spaces
course59.save! validate: false

course60 = Course.new college: cogc
course60.title = 'MCA Class 1 Orals Only'
course60.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course60.level = 'SCQF level 7'
course60.start_date = Date.new 2017, 8, 28
course60.end_date = Date.new 2018, 6, 13
course60.image = 'MCA_20Class_201_20Orals_201600x1078.jpg'
course60.description = "This four-week course prepares you for the Master Orals examination conducted by MCA.  The course will primarily prepare you to answer MCA oral questions based on underpinning knowledge gained and study undertaken previously.  The course will primarily prepare a delegate to answer MCA oral questions based on underpinning knowledge gained and study undertaken previously. Master’s oral syllabus is stated in MGN69 issued by MCA.\n\nFor a full list of course dates or to book a place contact marine@cityofglasgowcollege.ac.uk."
course60.entry_requirements = "You should have completed 36 months watch keeping service while holding OOW unlimited II/1, Certificate of Competency.\n\nThis period may be reduced to 24 months if at least 12 months of such seagoing service has been served as Chief Mate while holding a Chief Mate unlimited, II/2, Certificate of Competency and MCA approved medical Certificate.\n\nFor more detail see MSN 1856."
course60.career_prospects = "Progression to ships master or shore employment within the marine sector."
course60.spaces = course_spaces
course60.save! validate: false

course61 = Course.new college: cogc
course61.title = 'MCA Class 2 Writtens'
course61.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course61.level = 'SCQF level 8'
course61.start_date = Date.new 2017, 8, 28
course61.end_date = Date.new 2018, 6, 13
course61.image = 'MCA_Class_2_Writtens.jpg'
course61.description = "On this course you will cover topics within the MCA class 2 written examinations not included within the HND Nautical Science and revision of past papers."
course61.entry_requirements = "Completion of a full Chief Mate course including HND Nautical Science or a Chief Mate Post HND course."
course61.career_prospects = "Progression to ships master or shore employment within the marine sector."
course61.spaces = course_spaces
course61.save! validate: false

course62 = Course.new college: kelvin
course62.title = 'Events Management HND'
course62.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course62.level = 'SCQF level 8'
course62.start_date = Date.new 2017, 8, 28
course62.end_date = Date.new 2019, 6, 13
course62.image = 'HND_20Events_201600x1078.jpg'
course62.description = "This course is for those who want a career in the management of events like conferences, exhibitions and special events. On this course you'll cover a wide range of subjects to ensure a good knowledge base, as well as relevant skills.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course62.entry_requirements = "* Two Higher passes with a minimum of C, including at least one from the following Business Management, English, Modern Studies, Economics, History; OR\n* NQ in Events or other appropriate NQ; OR\n* Other qualification and relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course62.career_prospects = "This course prepares you for a career in the organisation and management of conferences, exhibitions, festivals and special events."
course62.spaces = course_spaces
course62.save! validate: false

course63 = Course.new college:kelvin
course63.title = 'Building Surveying (Year 2 Direct Entry) HND'
course63.category = Category.find_by_name 'Built Environment'
course63.level = 'SCQF level 8'
course63.start_date = Date.new 2017, 8, 28
course63.end_date = Date.new 2019, 6, 13
course63.image = 'Construction_2_2.jpg'
course63.description = "This stimulating, learner-focused course is delivered by highly professional teaching staff with significant construction industry experience and a proven track record of bringing out the best in their students.\n\nThe technician level qualification combines a broad-based first year curriculum with a more specialist second year curriculum, which will provide you with the skills required for employment in this sector (please see the 'after the course' section for further information).\n\nOn successful completion of this course, you'll be awarded with a HND in Building Surveying.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course63.entry_requirements = "* HNC in Construction\n* It may also be possible to gain entry with an HNC in Building Surveying\nStudents who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course63.career_prospects = "This course prepares you for a career in:\n\n* Private practice surveying firms\n* Government and public authorities\n* Building control departments\n* Construction companies\n* Facilities management\n* Property compani."
course63.spaces = course_spaces
course63.save! validate: false

course64 = Course.new college: kelvin
course64.title = 'Computing: Technical Support HND'
course64.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course64.level = 'SCQF level 8'
course64.start_date = Date.new 2017, 8, 28
course64.end_date = Date.new 2019, 6, 13
course64.image = 'Computing_girl_wires_1.jpg'
course64.description = "This new HND course teaches you skills that are in demand in many support roles in the IT industry, including desktop support and systems administration.\n\nYou’ll cover the basics of computer networking and will also learn how the components of a computer/laptop device function. This particular unit is taught using the Cisco Networking Academy online material and success in this unit may allow you to also sit the vendor Cisco IT Essentials qualification at the end of the second term. \n\nThe course contains a mixture of practical and theoretical material and does involve independent research, study and report writing. Although you'll use the Windows environment in class, you'll also learn how to use the Linux operating system.\n\nOn completion of the course, you may have the opportunity to work for companies such as Dell and Ericsson in a technical support/networking role.\n\nCity of Glasgow College has an excellent track record for students entering computing competitions for World Skills UK and you may have an opportunity to develop themselves further by entering these competitions.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course64.entry_requirements = "* Two appropriate Highers and three Intermediate 2 or National  5 qualifications (at least one of these should include a computing related qualification and/or English/Maths OR\n* Two Highers and three Standard Grades (including  English/Maths, all at credit level OR\n* Other equivalent qualifications or experience\nDepending on your qualifications, you may be invited for an individual interview or group information session where you can find out more about the course and decide if it’s the right one for you.\n\nApplicants with a level 6 qualification will be considered for the HNC course."
course64.career_prospects = "This course prepares you for a career in IT infrastructure."
course64.spaces = course_spaces
course64.save! validate: false

course65 = Course.new college: clyde
course65.title = 'Retail Management HND'
course65.category = Category.find_by_name 'Marketing & Retail'
course65.level = 'SCQF level 8'
course65.start_date = Date.new 2017, 8, 28
course65.end_date = Date.new 2019, 6, 13
course65.image = 'Business_staff.jpg'
course65.description = "This exciting and challenging course provides you with the skills knowledge and understanding for a career within the dynamic and ever changing world of retail.\n\nThis course provides the foundation necessary to fill trainee management positions or run your own small retail business. It covers all aspects of the retail environment including Stock Presentation, Customer Care, Fashion Merchandising, Buying, Visual Merchandising and Consumer Behaviour. You'll also have the opportunity to develop your digital communication skills.\n\nYour course lecturers will bring their individual background knowledge and experience of the retail industry to the classroom environment in order to enhance and improve your learning experience. Methods of teaching will include case studies reflecting real life retail scenarios, group discussion, projects, visits and guest speakers.\n\nWithin 2nd year, you'll have the opportunity to enjoy a work placement with leading retailers e.g., New Look, House of Fraser, Schuh, Tesco, River Island, Matalan, M &amp; Co and Marks and Spencer.\n\nUpon successful completion you'll be able to apply to various universities for possible 3rd year entry dependent on your UCAS application, reference and Graded Unit results.\n\nPrevious students have successfully gained employment with such diverse retailers as House of Fraser, Michael Kors, Marks and Spencer and New Look.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course65.entry_requirements = "* Two Higher Grade passes at grade C or above including English, (or a relevant Higher); OR\n* A National Qualification including Core Skills Communication Higher or an appropriate SVQ; OR\n* Relevant experience.\n* A genuine interest in retail management is needed and should be demonstrated in the applicatio"
course65.career_prospects = "This course prepares you for a career in retail at a supervisory, or junior management level."
course65.spaces = course_spaces
course65.save! validate: false

course66 = Course.new college: clyde
course66.title = 'Web Development (Year 2 Direct Entry) HND'
course66.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course66.level = 'SCQF level 8'
course66.start_date = Date.new 2017, 8, 28
course66.end_date = Date.new 2019, 6, 13
course66.image = 'HND_20Web_20Development_202nd_20Year_201600x1078.jpg'
course66.description = "On this course, you'll gain skills to start or advance a career as a web designer/developer. You'll learn to build both static and dynamic websites that deliver content in a variety of formats for computers, smartphones and tablets. You'll have access to current smartphones and tablets for testing your responsive websites."
course66.entry_requirements = "* HNC Web Development OR\n* First year of HND Web Development\nYou'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you're interested in this subject area. It is important that you prepare a personal statement which reflects your desire to study on this course."
course66.career_prospects = "Apply for various job vacancies, such as a junior web developer/designer."
course66.spaces = course_spaces
course66.save! validate: false

course67 = Course.new college:kelvin
course67.title = 'Television BA (Hons)'
course67.category = Category.find_by_name 'Fine Arts & Photography'
course67.level = 'SCQF level 9'
course67.start_date = Date.new 2017, 8, 28
course67.end_date = Date.new 2018, 6, 13
course67.image = 'Television_trio.jpg'
course67.description = "This course covers broadcast television, studio and location work, research, scriptwriting and new media. You'll be well placed to apply for a limited number of competitive internship placements, including at STV, offering valuable hands-on experience in video, broadcast, editing and online production.\n\nThe course balances professional level technical production skills and research practice. We have close links with the television industry and you will enjoy the expertise of visiting specialists covering all aspects of TV production, alongside teaching staff, who have direct experience of working in the industry.\n\nRun in partnership with the School of Arts and Creative Industries at Edinburgh Napier University, who have a first class reputation for excellence in practice-led screen courses, it is delivered at City of Glasgow College's outstanding industry standard studio and production facilities and offers students a degree in Television.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 9. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course67.entry_requirements = "* HND Creative Industries TV; OR\n* Relevant television experience.\nPlease apply to Edinburgh Napier University through UCAS, making your preference to study at City of Glasgow College clear in your personal statement."
course67.career_prospects = "After the course, you'll be prepared for an entry-level position in the highly competitive creative and media sector including production, directing, editing, presenting, researching and independent projects.  You may also consider applying for further studies at Masters level."
course67.spaces = course_spaces
course67.save! validate: false

course68 = Course.new college: cogc
course68.title = 'Travel and Tourism (with option to study languages) HND'
course68.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course68.level = 'SCQF level 8'
course68.start_date = Date.new 2017, 8, 28
course68.end_date = Date.new 2019, 6, 13
course68.image = 'HND_Travel_Tourism.jpg'
course68.description = "The course develops your knowledge of the Travel and Tourism Industry giving you a solid preparation for a career in the sector. You'll gain the skills and knowledge required to provide high quality customer service and enhance your own employability.\n\nThe course lasts two years starting in September, but you can also leave after one year with an HNC Travel and Tourism.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course68.entry_requirements = "* Two Highers at Grade C or above in appropriate academic subjects (such as English, Modern Studies, Languages, Business Management, History) and three National 5 qualifications including English; OR\n* Two Highers at Grade C or above (such as English, Modern Studies, Languages Business Management, History) with three Intermediate 2 courses including English; OR\n* Two Highers at Grade C or above (such as English, Modern Studies, Languages Business Management, History,) and three Standard Grades at credit level including English; OR\n* Other equivalent qualifications or experience.\nYou'll be invited to attend a course presentation where you'll get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course68.career_prospects = "This course prepares you for a career in travel and tourism with:\n\n* National Tourist Organisations.\n* Travel Management Companies.\n* Visitor Centres/Attractions.\n* Tour Operators.\n* Travel Agents.\n* Airlines.\n* Airport Ground Handling.\n* Foreign Exchange Service."
course68.spaces = course_spaces
course68.save! validate: false

course69 = Course.new college:kelvin
course69.title = 'Contemporary Art Practice BA (Hons)'
course69.category = Category.find_by_name 'Fine Arts & Photography'
course69.level = 'SCQF level 9'
course69.start_date = Date.new 2017, 8, 28
course69.end_date = Date.new 2019, 6, 13
course69.image = 'BA_Contemporary_Art_Practice.jpg'
course69.description = "This is a practice-based degree, where you'll have opportunities to explore two and three-dimensional art as well as lens-based and digital disciplines. You'll have opportunities through your studies for professional placements in the arts and for curation and self-promotion. Critical thinking and writing are also central to the course.\n\nTo find out more and join the community, visit the department's facebook page, Visual Grammar.\n\nThis course is delivered by City of Glasgow College and validated by University of the West of Scotland. We encourage a high level of artistic exploration and personal development in students, while delivering a distinct and prestigious vocational qualification.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 9. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course69.entry_requirements = "* HND in Contemporary Art Practice (or equivalent) with a good pass in the graded unit; OR\n* Relevant professional experience.\nYou must also meet the general admission requirements of the University and apply via UCAS.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to present a portfolio which should demonstrate developed and focused studio practice, and a sophisticated theoretical approach."
course69.career_prospects = "This course prepares you for a career as a practising artist, roles in museums, galleries, studios, arts centres, public art and public sector agencies, education bodies, festivals and art fairs."
course69.spaces = course_spaces
course69.save! validate: false

course70 = Course.new college: cogc
course70.title = 'Photography BA (Hons)'
course70.category = Category.find_by_name 'Fine Arts & Photography'
course70.level = 'SCQF level 9'
course70.start_date = Date.new 2017, 8, 28
course70.end_date = Date.new 2019, 6, 13
course70.image = 'Photography_in_arched_building.jpg'
course70.description = "In this course you'll develop the practical and critical skills needed for a practicing photographer. Guest lectures and workshop sessions are an essential element, with opportunities for business, entrepreneurship and enterprise activities.\n\nA self-directed approach to your studies will allow you to tailor your portfolio towards your own photographic interests. During the fourth year of this course, you'll focus on and develop your skills and knowledge towards your own photographic goals.\n\nThis Photography degree is delivered by City of Glasgow College and validated by University of the West of Scotland. For more information on job prospects and work experience opportunities, please visit here.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 10. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course70.entry_requirements = "* HND in Photography; OR\n* Relevant professional experience.\n* You'll  be interviewed and assessed on their portfolio.\nYou must also meet the general admission requirements of the University and apply via UCAS."
course70.career_prospects = "The Creative Industries sector covers a range of creative practice and activities. As a graduate of this course, you will be well placed to work within this sector as a practicing photographer, or in a related role."
course70.spaces = course_spaces
course70.save! validate: false

course71 = Course.new college: cogc
course71.title = 'Hairdressing HNC'
course71.category = Category.find_by_name 'Hair & Beauty'
course71.level = 'SCQF level 7'
course71.start_date = Date.new 2017, 8, 28
course71.end_date = Date.new 2018, 6, 13
course71.image = 'HNC_20hairdressing.jpg'
course71.description = "The HNC Hairdressing course is designed for hairdressers currently working in the profession who are seeking an advanced certificate in hairdressing. This course will provide you with the highest qualification currently held in hairdressing. The course is designed for experienced stylists or newly qualified stylists who want to further their studies.\n\nAll technical units build and expand on your existing skills, knowledge as a stylist, giving you the opportunity to design and create looks based on current fashion. A specialised unit in hair and scalp allows you to develop a deeper understanding of hair loss and implications of conditions and how to treat. This is an invaluable tool for the current market of clientele suffering hair loss.\nYou'll also learn new skills in photoshop to portray your work and advance in your communication skills via writing and presenting.\n\nLecturers teaching on your course are equipped with vast experience and expertise in Hairdressing and learning and teaching methods. Your lecturers continually upskill in professional development and pride ourselves as Colour Experts/Specialists, Trichologists and Cutting Ambassadors. One of our core values as lecturers and industry experts are to support you as an individual to flourish as a student.\n\nYour course will be interactive using a variation of methods to ensure your learning and progression needs are met. Units are lecturer led, however, we fully encourage you to take ownership of your own learning through designing looks, working with other college students from make-up artists to photographers and organising charity events.\n\nCareer prospects and employment opportunities are excellent with many of our students who previously undertaken this course; going on to study TQFE, secured lecturing positions, became self-employed and starting own businesses, became private educators, living and working in Australia and working as a stylist on cruise liner via Steiner. You may also have opportunities to take part in European Partner Student Exchanges. \n\nOn successfull completion of this course, you'll be awarded an HNC Hairdressing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course71.entry_requirements = "* A qualification in either SCQF Level 6 or SVQ Level 3 Hairdressing; OR\n* A minimum of 5 years' experience within the hairdressing profession.\nYou should be working within the hairdressing profession.\n\nEntry will be based on a successful interview.  Depending on experience you might be asked to participate in a skills test.\n\nYou'll also be required to supply relevant items of professional equipment essential to the course, information will be given at interview."
course71.career_prospects = "On successful completion of the course you could operate your own business, apply for employment on-board cruise liners, lecturing posts in Further Education or as a Company Technician / Trainer."
course71.spaces = course_spaces
course71.save! validate: false

course72 = Course.new college: kelvin
course72.title = 'Digital Design and Web Development HNC'
course72.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course72.level = 'SCQF level 7'
course72.start_date = Date.new 2017, 8, 28
course72.end_date = Date.new 2018, 6, 13
course72.image = 'web_development.jpg'
course72.description = "On this one year web based computing course, you will gain skills to start or advance a career as a web designer/developer.\n\nYou'll learn to build a range of websites using a variety of modern techniques that deliver content in a variety of formats for computers, smartphones and tablets. You'll have access to current smartphones and tablets for testing your responsive websites.\n\nBeginning with the fundamentals of website development, you'll build on a foundation of client side technologies and techniques (HTML5, CSS and SEO) through to more advanced study on topics such as native JavaScript and JavaScript frameworks.\n\nThe course will also provide opportunities to use industry standard reusable web templates where you will develop platform/browser compliant and consistent web based content. Currently we use Bootstrap for responsive web design.  Content Management Systems such as WordPress are also explored as a means to deliver content.\n\nThe course introduces you to both client and server side technologies with opportunities to prepare and develop web interfaces and media rich content incorporating Photoshop and Illustrator and a range of other creative software applications. The faculty has access to the full Adobe suite which can be utilised to produce creative and engaging media content for inclusion within your websites.\n\nThis course incorporates live industry related web development projects. Some students may gain internships and real live external work whilst studying at the college.\n\nAs of 2016, the course will be delivered in a new state of the art campus based on Cathedral St. This course has been designed to prepare you for progression to Year 2 of our HND Web Development programme or to enter employment as a web designer at junior level.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course72.entry_requirements = "* One Higher and three Intermediate 2 courses (including Computing, Graphic Design or Information Systems); OR\n* One Higher and three Standard Grades at Credit level or above (including Computing, Graphic Design or Information Systems); OR\n* One Higher and three National 5 qualifications or above (including Computing, Graphic Design or Information Systems); OR\n* A national qualification at SCQF Level 5 or 6 in a related subject such as Digital Media Computing, NQ Computing, Computing: Technical Support or Software Development.\nYou'll be invited for a group and/or individual interview where you'll get the opportunity to find out more about the course and tell us why you are interested in this subject area. It is important that you prepare a personal statement which reflects your desire to study on this course."
course72.career_prospects = "Apply for various positions including junior web designer or developer.\n\nContinuing Study\n\nYou can apply for the HND Web development course at the college."
course72.spaces = course_spaces
course72.save! validate: false

course73 = Course.new college: cogc
course73.title = 'Architectural Technology (Year 2 Direct Entry) HND'
course73.category = Category.find_by_name 'Built Environment'
course73.level = 'SCQF level 8'
course73.start_date = Date.new 2017, 8, 28
course73.end_date = Date.new 2019, 6, 13
course73.image = 'Architecture_boy_on_20_laptop_0.jpg'
course73.description = "This course gives you a technician level qualification, combining a broad first year curriculum with a specialist second year curriculum. It'll give you the skills required for employment in this high demand industry sector.\n\nYou'll also have the opportunity to go on site visits around the west of Scotland, to give you an understanding of contemporary relevance.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course73.entry_requirements = "* HNC in Construction.\n* It may also be possible to gain entry with an HNC in Architectural Technology. This will depend on the units that have been covered in the HNC. Students who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course73.career_prospects = "This course prepares you for a career as an Architectural Technician or Architectural Technologist in a variety of sectors including:\n\n* Built environment.\n* Construction.\n* Property.\n* Private consultant practices (architects and surveyors).\n* Design and build services divisions of construction contractors.\n* Local authorities.\n* Health trusts.\n* Housing associations.\n* Building component manufacturers.\n* Government organisation."
course73.spaces = course_spaces
course73.save! validate: false

course74 = Course.new college: cogc
course74.title = 'Computer Aided Architectrual Design & Technology (Year 2 Direct Entry) HND'
course74.category = Category.find_by_name 'Construction Crafts'
course74.level = 'SCQF level 8'
course74.start_date = Date.new 2017, 8, 28
course74.end_date = Date.new 2019, 6, 13
course74.image = 'HND_20Computer_20Aided_20Architectural_20Design_20and_20Technology_201600x1078.jpg'
course74.description = "This is a technician level qualification that provides a specialist curriculum focused on the application of Computer Aided Design software in a construction specific context underpinned by a Construction Industry specific curriculum. It will equip you with skills required for employment in this specialist industry sector.\n\nAn Architectural Technologist is a specialist in the technological aspects of building design and construction, bridging the gap between design theory and construction practice. Find the job profile here.\n\nThis course is delivered by highly professional teaching staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nDuring your studies you'll:\n\nIf you are looking for architectural inspiration? - Our Riverside Campus won ‘The Architectural Excellence Award for a Public Building\" last year! \n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course74.entry_requirements = "* HNC Computer Aided Design OR\n* First year of HND Computer Aided Design\nYou should also have a sound knowledge of and be competent users of ICT.\n\nYou'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you are interested in this subject area."
course74.career_prospects = "* Architectural CAD Technician or Building/Civil Engineering Technicia."
course74.spaces = course_spaces
course74.save! validate: false

course75 = Course.new college: cogc
course75.title = 'Construction Management (Year 2 Direct Entry)  HND'
course75.category = Category.find_by_name 'Built Environment'
course75.level = 'SCQF level 8'
course75.start_date = Date.new 2017, 8, 28
course75.end_date = Date.new 2019, 6, 13
course75.image = 'Construction_2_0.jpg'
course75.description = "This stimulating, learner-focused programme is delivered by highly professional teaching staff with significant construction industry experience and a proven track record of bringing out the best in their students.\n\nConstruction Managers (also known as Project Managers, Site Managers and Site Agents) supervise and direct operations on a construction project to make sure it is completed safely, on time and within budget. To do this well, a Construction Manager needs to be good at organising and planning; motivating and managing people; and creatively solving problems.\n\nThe HND in Construction Management is a technician level qualification that combines a broad-based construction industry specific first year curriculum with a more specialist second year curriculum, teaching you the skills you need for employment in this highly demanding sector.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course75.entry_requirements = "* HNC Construction Management OR\n* First year of HND in Construction Management\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course75.career_prospects = "This course prepares you for a career as a Higher Technician or Junior Manager in both the public and private sector in areas including: built environment, the construction sector, construction management, site engineering, estimating, and construction project planning."
course75.spaces = course_spaces
course75.save! validate: false

course76 = Course.new college: cogc
course76.title = 'Quantity Surveying (Year 2 Direct Entry) HND'
course76.category = Category.find_by_name 'Built Environment'
course76.level = 'SCQF level 8'
course76.start_date = Date.new 2017, 8, 28
course76.end_date = Date.new 2019, 6, 13
course76.image = 'HND_20Quantity_20Surveying_202nd_20Year_201600x1078.jpg'
course76.description = "Quantity Surveyors (also known as a Construction Cost Consultants or Commercial Managers) manage all costs relating to building and civil engineering projects, from the early design plans, through to completion. Quantity Surveyors seek to minimise the costs of a project and enhance value, while still achieving the required standards and quality. Many of these are specified by statutory building regulations, which the surveyor needs to understand and adhere to.\n\nThe HND in Quantity Surveying is a technician level qualification that combines a construction industry specific first year curriculum with a more specialist second year curriculum that equips you with the skills required for employment in this specialist industry sector.\n\nYou'll be taught by staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course76.entry_requirements = "* HNC Quantity Surveying OR\n* First year of HND Quantity Surveying\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course76.career_prospects = "This course prepares you for a career in private practice QS consultancies, contracting organisations, property companies, financial institutions, local and central government, commercial clients, and housing associations."
course76.spaces = course_spaces
course76.save! validate: false

course77 = Course.new college: clyde
course77.title = 'Mechanical Engineering (Year 2 Direct Entry) HND'
course77.category = Category.find_by_name 'Engineering, Energy & Gas'
course77.level = 'SCQF level 8'
course77.start_date = Date.new 2017, 8, 28
course77.end_date = Date.new 2019, 6, 13
course77.image = 'HND_20Mechanical_20Engineering_202nd_20Year_201600x1078.jpg'
course77.description = "This course allows you to study mechanical engineering to a professional standard. On completion of this course you will typically go to university, or move into industry as supervisors or technicians.\n\nDuring your studies you'll have the use of the college’s extensive engineering equipment, which includes a fully functioning mechanical workshop and computer labs running CAD design software, hydraulic pneumatic software and labs.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course77.entry_requirements = "* HNC in Mechanical Engineering OR\n* First yea rof HND Mechanical Engineering\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course77.career_prospects = "This course prepares you for a career as an Engineering Technician, Supervisor or Manager."
course77.spaces = course_spaces
course77.save! validate: false

course78 = Course.new college: cogc
course78.title = 'Electronic Engineering (Year 2 Direct Entry) HND'
course78.category = Category.find_by_name 'Engineering, Energy & Gas'
course78.level = 'SCQF level 8'
course78.start_date = Date.new 2017, 8, 28
course78.end_date = Date.new 2019, 6, 13
course78.image = 'HND_20Electronic_20Engineering.jpg'
course78.description = "Electronic engineers solve 21st century problems for industry and society. This course starts with you building and testing your own CityBytes microcomputer board. The board is integrated into the study of electronic circuits and you'll also use it to learn how to program embedded devices using ‘C’ programming language. The board can be used as a Bluetooth device, a game controller, a logic designer and hybrid audio amplifier. It even comes with an Android, or Windows mobile app.\n\nThe course reinforces theory with extensive practical work culminating in a substantial practical project. In previous years, projects have included a programmable drone, an ultra-sonic tape measure, a solar powered baby incubator for disaster areas, a keyboard, and a remote control mini search and rescue vehicle.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.\n\nWe are updating some of our course titles and would be grateful if you could take 2 minutes to complete our short survey.  Thank you in advance for your feedback."
course78.entry_requirements = "* HNC Electronics OR\n* First year of HND Electronics\nApplicants need a good grounding in maths for entry to the course.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course78.career_prospects = "This course prepares you for a career as an Electronics Technician Engineer."
course78.spaces = course_spaces
course78.save! validate: false

course79 = Course.new college: kelvin
course79.title = 'Engineering: Electrical (Year 2 Direct Entry) HND'
course79.category = Category.find_by_name 'Engineering, Energy & Gas'
course79.level = 'SCQF level 8'
course79.start_date = Date.new 2017, 8, 28
course79.end_date = Date.new 2019, 6, 13
course79.image = 'HND_20Electrical_20Engineering.jpg'
course79.description = "On this Electrical Engineering course, you'll expand on the electrical principles covered in Higher level. During the course you'll be taught by staff with significant industry experience to develop your skills over a range of science disciplines.\n\nMany of the course modules are project based with report writing included in second year modules. The course is also designed for higher level technicians in the Electrical Engineering Industry which deals with the production, transmission, distribution and application of electricity and the manufacture, installation and maintenance of electrical equipment.\n\nThe course can also be studied over three years on a day-release top-up programme, after completion of the Higher National Certificate in Electrical Engineering.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course79.entry_requirements = "* HNC in an appropriate Engineering subject; OR\n* Successful completion of HNC or HND first year at City of Glasgow College.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course79.career_prospects = "This course prepares you for a career as trainees within the oil and gas industries which recognise the value of the course. Many students have been recruited by blue chip organisations as well as a wide range of industrial and commercial organisations."
course79.spaces = course_spaces
course79.save! validate: false

course80 = Course.new college: cogc
course80.title = 'Accounting (Year 2 Direct Entry) HND'
course80.category = Category.find_by_name 'Accounting'
course80.level = 'SCQF level 8'
course80.start_date = Date.new 2017, 8, 28
course80.end_date = Date.new 2019, 6, 13
course80.image = 'Business_boys_learning_1.jpg'
course80.description = "This course assumes no prior knowledge of accounting, but is still suitable for those who've studied it before. It will prepare you for further study at university, or for courses run by professional accounting organisations like ACCA, CIPFA and CIMA.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course80.entry_requirements = "Year two:\n\n* Successful completion of a full time HNC Accounting course with 15 credits, with a Grade A in the graded unit and all mandatory units, OR\n* Successful completion of a part time HNC Accounting course with 12 credits, with a Grade A in the graded unit and all mandatory units\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course80.career_prospects = "This course prepares you for a career in:\n\n* Bookkeeping\n* Financial and management accounting using manual and computerside techniques\n* Accounts technician\n* Assistant accountant\n* Accounts supervisor\n* Financial reporting\n* Management accounting\n* Taxati."
course80.spaces = course_spaces
course80.save! validate: false

course81 = Course.new college:kelvin
course81.title = 'Legal Services (Year 2 Direct Entry) HND'
course81.category = Category.find_by_name 'Administration, Human Resources & Law'
course81.level = 'SCQF level 8'
course81.start_date = Date.new 2017, 8, 28
course81.end_date = Date.new 2019, 6, 13
course81.image = 'HND_20Legal_20Services_202nd_20Year_201600x1078.jpg'
course81.description = "The course is recommended for you if you're planning a professional career in the legal field, progressing to study law in depth following the HND, or if you might be interested in consolidating your career in a related field.\n\nThe course will consist of lectures, tutorials, practical based tasks such as mock trials and the presentation of evidence under court conditions. You'll consider numerous common aspects of life and how the law affects individuals every day when facing problems in business, relationships, employment and the courts.\n\nEmphasis is placed on developing both your academic and vocational skills to equip you to progress into employment or further study. You'll be introduced to notions of equality, society, discrimination, prejudice and the rule of law.\n\nThe HND in Legal services is an excellent foundation course in law which provides a recognised professional qualification for an application to enter the Scottish paralegal profession.\n\nThe course is full-time covering at least 4 days per week and addresses a broad range of legal topics including business law, private and public law, employment law, criminal law, Sheriff Court procedure and corporate law.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course81.entry_requirements = "* HNC Legal Services; OR\n* First year HND Legal Services.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course81.career_prospects = "On successful completion of your HND you may enter a related field, working as a trainee paralegal or as part of an in-house legal team. You can find employment with local authorities, the Sheriff Court, or Procurator Fiscal office.\n\nThere are also opportunities for you in the Banking and Insurance Sectors, and a number of graduates have joined Police Scotland."
course81.spaces = course_spaces
course81.save! validate: false

course82 = Course.new college:kelvin
course82.title = 'Computer Science (Year 2 Direct Entrants) HND'
course82.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course82.level = 'SCQF level 8'
course82.start_date = Date.new 2017, 8, 28
course82.end_date = Date.new 2018, 6, 13
course82.image = 'Computer_Science_1.jpg'
course82.description = "The HND Computing (Science) course is an SQA qualification which aims to meet the challenges of employers seeking qualified learners who can demonstrate knowledge and skills in a range of technology areas.\n\nAccording to research from Tech Partnership (a network of employers working with the Scottish Government and Skills Development Scotland to create skills for the UK's digital economy) the number of UK Digital Businesses has increased 30% in the last 5 years.\nTheir forecast shows the number of people working in the UK as technology specialists between 2014 and 2024 will grow by 28%, significantly outstripping that predicted for workers more generally.\n\nThe course is delivered by experienced lecturing staff many of whom have industry experience in IT areas such as software engineering, programming, project management and technical support.\n\nThis HND course places particular emphasis on software development, project management and soft skills such as team-working; with year 2 of the programme further developing skills in object oriented programming and design, data science and mathematics\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course82.entry_requirements = "* Successful completion of the HNC Computer (Science) or year 1 of the HND Computer Science course.\n* Successful completion of the first year of the HND Computing: Software Development (dependent upon units taken"
course82.career_prospects = "After successful completion of this course, you can apply for a range of entry level roles within the IT industry."
course82.spaces = course_spaces
course82.save! validate: false

course83 = Course.new college: cogc
course83.title = 'Computing: Software Development  (Year 2 Direct Entry) HND'
course83.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course83.level = 'SCQF level 8'
course83.start_date = Date.new 2017, 8, 28
course83.end_date = Date.new 2019, 6, 13
course83.image = 'Computing_DigitalMedia_screen_1.jpg'
course83.description = "You'll study towards an up-to-date qualification covering many of the skills that are in demand for a range of different careers in the software development / programming sector of the computer industry. These include developing skills in C#, VB.NET, Java, Object Oriented Design, Object Oriented Programming, SQL Programming and Project Management.\n\nThe 2012 Technology Insights Report from e-skills UK stated: \"The technical skills most often called for by employers were: SQL, .NET (VB and C#) and Java.\"\n\nIt also stated: \"Through to 2020 Software Professionals show the highest forecast employment growth of all IT &amp; Telecoms occupations.\"\n\nThis course will help prepare you for either employment or progression to university in computing, a skill set that is currently in high demand.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course83.entry_requirements = "* HNC Computing: Software Development, OR\n* First Year HND Computing: Software Development.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course83.career_prospects = "This course prepares you for a career in software development, web design/development, and information systems development."
course83.spaces = course_spaces
course83.save! validate: false

course84 = Course.new college: clyde
course84.title = 'Computing: Technical Support (Year 2 Direct Entry) HND'
course84.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course84.level = 'SCQF level 8'
course84.start_date = Date.new 2017, 8, 28
course84.end_date = Date.new 2019, 6, 13
course84.image = 'Computing_girl_wires_2.jpg'
course84.description = "This new HND course teaches you skills that are in demand in many support roles in the IT industry, including desktop support and systems administration.\n\nYou'll cover the basics of computer networking, as well as how the components of a computer function. Ethical hacking has been introduced as a new unit and you'll also learn about the importance of legal issues within the IT industry.\n\nCity of Glasgow College has an excellent track record for students entering computing competitions for World Skills UK and students may have an opportunity to develop themselves further by entering these competitions.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course84.entry_requirements = "* HNC Computing: Technical Support, OR\n* First year HND Computing: Technical Support.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course84.career_prospects = "This course prepares you for a career in IT infrastructure."
course84.spaces = course_spaces
course84.save! validate: false

course85 = Course.new college: cogc
course85.title = 'Administration and Information Technology (Year 2 Direct Entry) HND'
course85.category = Category.find_by_name 'Administration, Human Resources & Law'
course85.level = 'SCQF level 8'
course85.start_date = Date.new 2017, 8, 28
course85.end_date = Date.new 2018, 6, 13
course85.image = 'HND_20Administration_20and_20IT_202nd_20Year_201600x1078.jpg'
course85.description = "This course will provide you with a broad range of office-based skills and knowledge required for a career in office administration. This is a challenging course, where you'll develop specialist skills in IT, desktop publishing, communication, research and planning.\n\nYour stimulating programme will be delivered by our highly professional teaching staff with significant experience in office administration and a proven track record of bringing out the best in their students.\n\nOn successful completion of this course, you'll be awarded with a HND Administration and Information Technology.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course85.entry_requirements = "* HNC Administration and Information Technology OR\n* Year 1 of HND Administration and Information Technology.\nYou'll be invited to attend a group presentation and interview session. The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course85.career_prospects = "This course prepares you for a career as a Personal Assistant or Administrator in both the public and private sector. The HND can provide progression into employment in a general administrative role within small to medium enterprises. It'll also provide opportunities to develop the skills and knowledge required for more specialist posts demanded by larger organisations.\n\nThe qualification will allow you to develop:\n\n* Technical and administrative knowledge relevant to current practice.\n* Interpersonal skills relevant to an administrative role.\n* Personal effectiveness.\n* Communication.\n* Presentation technique."
course85.spaces = course_spaces
course85.save! validate: false

course86 = Course.new college: cogc
course86.title = 'Business (Year 2 Direct Entry) HND'
course86.category = Category.find_by_name 'Business & Procurement'
course86.level = 'SCQF level 8'
course86.start_date = Date.new 2017, 8, 28
course86.end_date = Date.new 2018, 6, 13
course86.image = 'Business_boy_with_pen_0.jpg'
course86.description = "The course provides you with the skills and knowledge necessary for careers in banking, insurance, civil service, local government and distribution. Today, the internet is an important part of business, so we've updated the course to include analysing and using information for strategic purposes.\n\nYour course will be delivered by our highly professional teaching staff with relevant industry experience and track record of bringing out the best in their students.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8.  For more information on the framework visit: www.scqf.org.uk/the-framework/."
course86.entry_requirements = "* HNC Business; OR\n* First year of HND Business.\nYou'll be invited to attend a group presentation and interview session. The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course86.career_prospects = "This course will prepare you for trainee positions in management and administration in industry, financial services and the public sector."
course86.spaces = course_spaces
course86.save! validate: false

course87 = Course.new college: kelvin
course87.title = '3D Computer Animation (Year 2 Direct Entry) HND'
course87.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course87.level = 'SCQF level 8'
course87.start_date = Date.new 2017, 8, 28
course87.end_date = Date.new 2019, 6, 13
course87.image = 'HND_203D_20Computer_20Animation_202nd_20Year_201600x1078.jpg'
course87.description = "This hands-on course helps you develop the skills needed to become a 3D Digital Developer, incorporating live industry related projects in a range of different 3D animation disciplines. Some students may gain internships and summer placements while studying at the college.This course also accepts year two direct entrants.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course87.entry_requirements = "* HNC 3D Computer Animation, OR\n* First year HND 3D Computer Animation.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course87.career_prospects = "* BSc (Hons) Computer Animation (with options) at the University of the West of Scotland.\n* BA (Hons) 3D Computing Animation at Glasgow Caledonian University.\n* BDes (Hons) Animation at University of Abertay.\n* There's also the option to study Visual FX at Napier Universit."
course87.spaces = course_spaces
course87.save! validate: false

course88 = Course.new college:kelvin
course88.title = 'Digital Design and Web Development (Year 2 Direct Entry) HND'
course88.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course88.level = 'SCQF level 8'
course88.start_date = Date.new 2017, 8, 28
course88.end_date = Date.new 2019, 6, 13
course88.image = 'HND_20Digital_20Design_20and_20Web_20Development_20Year_202_20entry_201600x1078.jpg'
course88.description = "This year of the course further explores coding skills, particularly in front-end languages and technologies. There will be an emphasis on design and development of content and user engagement for responsive web products.\n\nYou'll build on skills from HNC Digital Design and Web Development or HNC Web Development and develop further techniques in HTML5, JavaScript, CSS, framework development, interface design, media creation and optimisation.\n\nTo showcase your skills you'll complete the year by developing a specialist project in several of the subject areas.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course88.entry_requirements = "* 12- 15 Credit HNC Digital Design and Web Development;OR\n* 12 - 15 Credit HNC Web Development.\nWe prefer a 15 credit HNC."
course88.career_prospects = "Apply for various job vacancies, such as a junior web developer/designer."
course88.spaces = course_spaces
course88.save! validate: false

course89 = Course.new college: clyde
course89.title = 'Information Technology (Year 2 Direct Entry)  HND'
course89.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course89.level = 'SCQF level 8'
course89.start_date = Date.new 2017, 8, 28
course89.end_date = Date.new 2019, 6, 13
course89.image = 'HND_20IT_202nd_20Year_201600x1078.jpg'
course89.description = "The HND Information Technology computing qualification is designed to give you a solid technical understanding of information systems and technologies used by both small and large scale businesses.\n\nYou'll gain an understanding of how data is transformed into usable information through the theory and practice of relational database technologies. You'll also undertake units in web design and development, e-commerce, applications programming, operating systems and project management.\n\nAs part of the second year program you'll also undertake the Oracle Database Design and Programming using SQL vendor qualification, which is a worldwide recognised qualification that prepares the student to undertake external Oracle exams.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course89.entry_requirements = "* HNC Information Technology, OR\n* First year HND Information Technology.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course89.career_prospects = "After completing the HND you may pursue a career in business intelligence analysis, information management, database administration, trainer/teacher, hardware and software support, or web development."
course89.spaces = course_spaces
course89.save! validate: false

course90 = Course.new college:kelvin
course90.title = 'Advertising and Public Relations (Year 2 Direct Entry) HND'
course90.category = Category.find_by_name 'Marketing & Retail'
course90.level = 'SCQF level 8'
course90.start_date = Date.new 2017, 8, 28
course90.end_date = Date.new 2019, 6, 13
course90.image = 'creative_writing_girl_with_20_book_1.jpg'
course90.description = "This course trains you for a career in the communication industries. You'll develop an understanding of the nature and function of advertising and public relations, within a wider marketing and marketing communications framework. You'll also learn how to communicate effectively in this environment.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course90.entry_requirements = "* Successful completion of a full time HNC Advertising and PR course with 15 credits\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course90.career_prospects = "This course prepares you for a career in:\n\n* Advertising agencies\n* PR consultancies\n* Social media companies\n* Advertising departments\n* Commercial or media-based companies\nThere are a number of work experience and placement opportunities throughout the course."
course90.spaces = course_spaces
course90.save! validate: false

course91 = Course.new college: clyde
course91.title = 'Marketing (Year 2 Direct Entry) HND'
course91.category = Category.find_by_name 'Marketing & Retail'
course91.level = 'SCQF level 8'
course91.start_date = Date.new 2017, 8, 28
course91.end_date = Date.new 2019, 6, 13
course91.image = 'HND_20Marketing_202nd_20Year_201600x1078.jpg'
course91.description = "The course helps you develop the skills you’ll need to work in marketing and business. It covers marketing theory and buyer behaviour, as well as the main operational areas of marketing research, promotion and selling.\n\nCoursework includes projects and assignments that relate to current industry practice and market environments. You’ll be assessed continuously throughout the course.\n\nYou can keep up to date with marketing industry news and future opportunities with The Drum and Digital Intelligence.\n\nAfter successful completion of the course, you will be awarded with an HND in Marketing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework."
course91.entry_requirements = "* HNC Marketing; OR\n* First year HND Marketing.\n* A genuine interest in marketing is needed and should be demonstrated in the application."
course91.career_prospects = "You may go on to a career in marketing, public relations, or internal or external communications in any number of business sectors."
course91.spaces = course_spaces
course91.save! validate: false

course92 = Course.new college: cogc
course92.title = 'Retail Management (Year 2 Direct Entry) HND'
course92.category = Category.find_by_name 'Marketing & Retail'
course92.level = 'SCQF level 8'
course92.start_date = Date.new 2017, 8, 28
course92.end_date = Date.new 2019, 6, 13
course92.image = 'HND_20Retail_20Management_202nd_20Year_201600x1078.jpg'
course92.description = "This course prepares you for a career in the Retail Industry, where there is a growing need for qualified people to fill trainee management positions. You'll carry out case studies, projects and assignments and we'll assess your progress continuously.\n\nTo expand the learning experience, in the second year you'll take part in a work placement. We also organise industrial visits and study tours.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course92.entry_requirements = "* HNC Retail Management; OR\n* First year HND Retail Management.\n* A genuine interest in retail management is needed and should be demonstrated in the applicatio"
course92.career_prospects = "This course prepares you for a career in retail at a supervisory, or junior management level."
course92.spaces = course_spaces
course92.save! validate: false

course93 = Course.new college:kelvin
course93.title = '3D Design: Interior Design (Year 2 Direct Entry)  HND'
course93.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course93.level = 'SCQF level 8'
course93.start_date = Date.new 2017, 8, 28
course93.end_date = Date.new 2019, 6, 13
course93.image = 'Interio_Design_girl_artwork.jpg'
course93.description = "This course will enable you to develop the creative, analytical and technical skills for a career in interior design. This course can lead to direct entry to the third year of a degree programme."
course93.entry_requirements = "* An HNC in 3D Design: Interior Design\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to provide examples of your art and design work."
course93.career_prospects = "This course may lead to a variety of careers in interior design and architectural practices, such as space planning, property development – shop and office fitting, and museum and exhibition design."
course93.spaces = course_spaces
course93.save! validate: false

course94 = Course.new college: kelvin
course94.title = 'Acting and Performance (Year 2 Direct Entry) HND'
course94.category = Category.find_by_name 'Drama & Creative Writing'
course94.level = 'SCQF level 8'
course94.start_date = Date.new 2017, 8, 28
course94.end_date = Date.new 2019, 6, 13
course94.image = 'Drama_group_2.jpg'
course94.description = "This course allows direct entry to year two of the HND Acting and Performance course, and builds on the skills acquired in HNC Acting and Performance by developing knowledge and awareness of the craft of acting. It's designed for those who are interested in becoming actors, drama teachers or drama workers.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course94.entry_requirements = "Direct entry to year two may be possible if you complete the HNC Acting and Performance with 15 credits, including all mandatory credits.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course94.career_prospects = "There are a wide range of career opportunities for graduates, including work in theatre, television, community drama, and theatre production."
course94.spaces = course_spaces
course94.save! validate: false

course95 = Course.new college:kelvin
course95.title = 'Art Glass Design (Year 2 Direct Entry)  HND'
course95.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course95.level = 'SCQF level 8'
course95.start_date = Date.new 2017, 8, 28
course95.end_date = Date.new 2019, 6, 13
course95.image = 'HND_20Art_20Glass_20Production_202nd_20Year_201600x1078.jpg'
course95.description = "The HND Art Glass Design course is for you, if you want to follow a career in art glass design and production. This course offers you a broad education with a balance between creative, practical and core skills.  \n\nYou’ll work in two and three dimensions, learning contemporary warm glass techniques like slumping and fusing and traditional skills like copper foil and lead work, as well as more advanced glass surface applications.\n\nPrevious students have gone on to become glass technicians, self-employed glass artists or used their skills within a larger design studio; designing and manufacturing stained glass panels, household items and jewellery. Visit the Contemporary Glass Society for more useful resources.\n\nIf you want a recognised art glass industry qualification: This course offers the only HND certified glass work course in Scotland!\n\nFollow the latest trends in the creative industries, visit The Pulse\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course95.entry_requirements = "* HNC Art Glass Design; OR\n* First year HND Art Glass Design.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to show examples of your art and design work."
course95.career_prospects = "The HND course may lead to a job in the art glass industry or self-employment."
course95.spaces = course_spaces
course95.save! validate: false

course96 = Course.new college: cogc
course96.title = 'Furniture Craftmanship with Design (Year 2 Direct Entry) HND'
course96.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course96.level = 'SCQF level 8'
course96.start_date = Date.new 2017, 8, 28
course96.end_date = Date.new 2019, 6, 13
course96.image = 'HND_20Furniture_20Craftsman_20with_20Design_202nd_20Year_201600x1078.jpg'
course96.description = "This course encourages you to develop practical skills through manufacture, and to express yourself through design. You’ll be encouraged to study in-depth the construction of furniture, to develop and build designs and to hone your skills in cabinet making, upholstery and wood finishing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course96.entry_requirements = "* HNC Furniture Craftmanship with Design; OR\n* First year HND Furniture Craftmanship with Design.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of any design and/or making of furniture or 3D work."
course96.career_prospects = "After completing the course you may go on to become self-employed Designers/Makers of furniture, as well as pursuing jobs in the furniture trades and shop-fitting."
course96.spaces = course_spaces
course96.save! validate: false

course97 = Course.new college: kelvin
course97.title = 'Furniture Restoration (Year 2 Direct Entry) HND'
course97.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course97.level = 'SCQF level 8'
course97.start_date = Date.new 2017, 8, 28
course97.end_date = Date.new 2019, 6, 13
course97.image = 'HND_20Furniture_20Restoration_202nd_20Year_201600x1078.jpg'
course97.description = "This course will allow you to develop your skills in furniture analysis and practical solutions, through workshop activities. You’ll study the history of furniture design and materials as well as the construction, upholstery and finishing of period furniture. You’ll also restore items of furniture throughout this course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course97.entry_requirements = "* HNC Furniture Restoration; OR\n* First year HND Furniture Restoration.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course97.career_prospects = "Career opportunities are many and varied. A high number of craftspeople are self-employed or in a partnership, which can be rewarding. There are also jobs in furniture trades and shop-fitting."
course97.spaces = course_spaces
course97.save! validate: false

course98 = Course.new college:kelvin
course98.title = 'Jewellery (Year 2 Direct Entry) HND'
course98.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course98.level = 'SCQF level 8'
course98.start_date = Date.new 2017, 8, 28
course98.end_date = Date.new 2019, 6, 13
course98.image = 'HND_20Jewellery_20Design_202nd_20Year_201600x1078_0.jpg'
course98.description = "This HND course will teach you a comprehensive range of skills in jewellery design and manufacture, with a design-led focus. You'll be able to choose specialisms according to your own interests, as well as the current business environment.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course98.entry_requirements = "* HNC in Jewellery OR\n* First year of HND Jewellery\nYou'll be invited for a group and/or individual interview where you will find out more about the course and tell us why you are interested in this subject area. At the interview you'll be asked to provide examples of your art and design work."
course98.career_prospects = "You'll be able to join year one or two of some courses, including:\n\n* Jewellery Design at Birmingham University.\n* Three Dimensional Design (ceramics, glass, jewellery) at Robert Gordon University.\n* Jewellery and Silversmithing at the Edinburgh School of Art.\n* Silversmithing and Jewellery Design at the Glasgow School of Art.\n* Year 3 of BA (Hons) Top-up Degree Jewellery at North Glasgow College."
course97.spaces = course_spaces
course97.save! validate: false


course1 = Course.new college: kelvin
course1.title = 'Graphic Design (Year 2 Direct Entry) HND'
course1.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course1.level = 'SCQF level 8'
course1.start_date = Date.new 2017, 8, 28
course1.end_date = Date.new 2019, 6, 13
course1.image = 'Graphic_Design_HND_0.jpg'
course1.description = "This Graphic Design course prepares you for a career in the exciting and constantly developing area of graphic design. The course develops your creative ability and technical graphics skills, mainly through practical projects in the studio.\nThe course also encourages you to take responsibility for your own development. You'll build on your own creative concepts through research and development in the sketchbook, before producing finished work digitally.\n\nThe emphasis of the course is on layout of type and image, for both print and screen and the development of creative concepts.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course1.entry_requirements = "* HNC Graphic Design OR\n* First year of HND in Graphic Design\nYou'll be invited for a group and/or individual interview, where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course1.career_prospects = "After completing the HND you can apply for jobs in areas of the Communication Industry, including design consultancies, advertising agencies, newspaper and magazine publishing, web design and motion graphics for screen, or in-house design studios.\n\nYou may eventually become self-employed as a Graphic Designer."
course1.spaces = course_spaces
course1.save! validate: false

course2 = Course.new college: kelvin
course2.title = 'Creative Industries: Media and Communication (Year 2 Direct Entry) HND'
course2.category = Category.find_by_name 'Drama & Creative Writing'
course2.level = 'SCQF level 8'
course2.start_date = Date.new 2017, 8, 28
course2.end_date = Date.new 2019, 6, 13
course2.image = 'Graphics_boy_at_table.jpg'
course2.description = "This highly practical course prepares you for higher education and media industry employment. On this course, the teaching staff have a wide variety of media experience and you can expect media guest speakers, visits and professional workshops. You’re continually assessed and you’ll also need to complete a graded project.\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course2.entry_requirements = "* HNC Media &amp; Communication with minimum B at Graded Unit "
course2.career_prospects = "Career paths include journalism, television and radio production, video production, public relations and advertising."
course2.spaces = course_spaces
course2.save! validate: false

course3 = Course.new college: cogc
course3.title = 'Creative Industries: Radio (Year 2 Direct Entry) HND'
course3.category = Category.find_by_name 'Drama & Creative Writing'
course3.level = 'SCQF level 8'
course3.start_date = Date.new 2017, 8, 28
course3.end_date = Date.new 2019, 6, 13
course3.image = 'Radio_group2.jpg'
course3.description = "This course builds on the skills you developed in the HNC. The focus is still on programme making, but goes beyond radio and develops a more sophisticated skillset – technical, production and creative. This course is an excellent opportunity for you to study and train for a career in radio production, with excellent career opportunities and progression routes.\n\nThe course is delivered by highly qualified lecturers who have a wealth of experience within the radio industry and have well established industry contacts.\n\nAfter successful completion of the course, you'll be awarded with an HND Creative Industries: Radio.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course3.entry_requirements = "* HNC Creative Industries: Radio, including A or B in graded unit on"
course3.career_prospects = "There are opportunities in radio for those with a variety of up to date skills, broadcasting knowledge and experience."
course3.spaces = course_spaces
course3.save! validate: false

course4 = Course.new college:kelvin
course4.title = 'Practical Journalism (Year 2 Direct Entry) HND'
course4.category = Category.find_by_name 'Media'
course4.level = 'SCQF level 8'
course4.start_date = Date.new 2017, 8, 28
course4.end_date = Date.new 2019, 6, 13
course4.image = 'Television_camera_1.jpg'
course4.description = "Journalists must have the essential skills of writing and research, but they are now expected to also record sound, shoot video and edit on digital systems. Increasingly, they are expected to produce their own web content. The skills you'll acquire on the course will enable you to position yourself for the world of work, or university.\n\nThere will be an opportunity to specialise in the area of journalism you are most interested in.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course4.entry_requirements = "* HNC Practical Journalism OR\n* First year of HND Practical Journalism\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At your interview you'll have to:\n\n* Write a 200 word article.\n* Use correct spelling, grammar and punctuation in a 300 word article.\n* Discuss the importance of journalis"
course4.career_prospects = "You can get a job on the paper."
course4.spaces = course_spaces
course4.save! validate: false

course5 = Course.new college: cogc
course5.title = 'Photography (Year 2 Direct Entry) HND'
course5.category = Category.find_by_name 'Fine Arts & Photography'
course5.level = 'SCQF level 8'
course5.start_date = Date.new 2017, 8, 28
course5.end_date = Date.new 2019, 6, 13
course5.image = 'HND_20Photography_202nd_20Year_201600x1078.jpg'
course5.description = "This highly competitive course provides you with the skills you need to start a career in photography, or a related area within the creative industries. This is a practice-based course with projects both in the studio and on location. Alongside technical skills, you're encouraged to work on self-reflection and evaluation through class feedback sessions.\n\nYou'll have an opportunity to work independently on self-initiated projects and to develop your own photographic ideas and briefs.\n\nWith a broad range of experienced staff on hand and industry standard facilities, this course is an excellent opportunity for those with a keen interest in photography, who want to develop that interest through full time study.\n\nYou'll continually update your photographic portfolio showcasing your most recent work.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course5.entry_requirements = "* HNC in Photography OR\n* First year of HND Photography\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide a strong photographic portfolio of work."
course5.career_prospects = "With an HND in photography, you'll be prepared for a position in the highly competitive creative and media sector including: advertising, commercial, press and photojournalism, fashion, sports, social, medical, scientific, throughout the UK and worldwide."
course5.spaces = course_spaces
course5.save! validate: false

course6 = Course.new college: kelvin
course6.title = 'Beauty Therapy (Year 2 Direct Entry) HND'
course6.category = Category.find_by_name 'Hair & Beauty'
course6.level = 'SCQF level 8'
course6.start_date = Date.new 2017, 8, 28
course6.end_date = Date.new 2019, 6, 13
course6.image = 'HND_20Beauty_20Therapy_202nd_20Year_201600x1078.jpg'
course6.description = "The course offers a high level beauty qualification which will provide you with knowledge of current beauty treatments and techniques. You'll also gain experience in using a wide range of products and will gain the skills necessary to secure employment in a variety of settings within the Beauty Industry such as salons, spas and cruise liners.\n\nThis year focuses on more advanced treatments, techniques and product ranges as well as business planning, retailing, and gaining employment. \n\nYou'll be taught be a highly motivated and versitile team with an excellent range of industrial expertise who deliver world class student focussed learning.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/. "
course6.entry_requirements = "* A pass in HNC Beauty Therapy with 15 credits, OR\n* Units achieved to be compatible with the college's existing HNC course plan.\n* A positive report from your HNC course team.\n* You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n* Excellent communication skills and an enthusiasm for the beauty industry is essentia"
course6.career_prospects = "This course prepares you for a career in the Beauty Industry including roles in salons, health spas, cruise ships, or self-employment.\n\nA number of senior, or managerial posts may also be available to HND qualified therapists."
course6.spaces = course_spaces
course6.save! validate: false

course7 = Course.new college: kelvin
course7.title = 'Fitness, Health and Exercise (Year 2 Direct Entry) HND'
course7.category = Category.find_by_name 'Sport & Fitness'
course7.level = 'SCQF level 8'
course7.start_date = Date.new 2017, 8, 28
course7.end_date = Date.new 2019, 6, 13
course7.image = 'HND_20Fitness_20Health_20and_20Exercise_202nd_20Year_201600x1078.jpg'
course7.description = "This course is most suited to those with an interest in the fields of fitness, health and exercise. The new framework has been developed to include industry recognition in the form of the endorsement by the Register of Exercise Professionals (REPS).\n\nOn successful completion of Year two, you'll be awarded the Level 3 Personal Trainer accreditation.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course7.entry_requirements = "* HNC Fitness, Health and Exercise OR\n* First year of HND in Fitness, Health and Exercise\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. An element of the interview process will involve paired exercise where you demonstrate an exercise of your choice to a partner, highlighting safe and effective practice. Please bring suitable indoor gym wear."
course7.career_prospects = "This course will suit individuals wishing to pursue careers in sports clubs, private fitness facilities, local authorities and government sport initiatives; ranging from personal training and exercise instruction, to teaching physical education, or working within sports science.\nYou may also look at self-employment in fitness, exercise prescription and athletic conditioning."
course7.spaces = course_spaces
course7.save! validate: false

course8 = Course.new college: kelvin
course8.title = 'Professional Cookery (Year 2 Direct Entry) HND'
course8.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course8.level = 'SCQF level 8'
course8.start_date = Date.new 2017, 8, 28
course8.end_date = Date.new 2019, 6, 13
course8.image = 'HND_20Professional_20Cookery_202nd_20Year_201600x1078.jpg'
course8.description = "Professional cookery has never been as popular as it is today. This course is an excellent opportunity for you to study and train for a career in catering with excellent career opportunities and progression routes.\n\nIn the first year, you'll develop your culinary skills to an advanced level and learn the knowledge you’ll need for a supervisory role in the Catering Industry. In the second year you'll combine culinary expertise and managerial skills. The course contains practical and theory units, which are assessed throughout (please see further information in the 'what you study' section below).\n\nExperience in the Hospitality Industry is an integral part of the course, and you’ll work towards the Industrial Experience unit.\n\nOn successful completion of this course, you'll be awarded with a HND in Professional Cookery.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course8.entry_requirements = "* HNC Professional Cookery OR\n* First year of HND in Professional Cookery\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course8.career_prospects = "On completing your HND, you might progress to a career in catering, restaurants, and hospitality at a supervisory, or junior management level."
course8.spaces = course_spaces
course8.save! validate: false

course9 = Course.new college: clyde
course9.title = 'Event Management (Year 2 Direct Entry) HND'
course9.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course9.level = 'SCQF level 8'
course9.start_date = Date.new 2017, 8, 28
course9.end_date = Date.new 2019, 6, 13
course9.image = 'HND_20Events_20Management_202nd_20Year_201600x1078.jpg'
course9.description = "This course is for those who want a career in the management of events like conferences, exhibitions and special events. On this course you'll cover a wide range of subjects to ensure a good knowledge base, as well as relevant skills.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course9.entry_requirements = "* HNC in Events OR\n* First year of HND in Events\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course9.career_prospects = "This course prepares you for a career in the organisation and management of conferences, exhibitions, festivals and special events."
course9.spaces = course_spaces
course9.save! validate: false

course10 = Course.new college: cogc
course10.title = 'Hospitality (Year 2 Direct Entry) HND'
course10.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course10.level = 'SCQF level 8'
course10.start_date = Date.new 2017, 8, 28
course10.end_date = Date.new 2019, 6, 13
course10.image = 'Hospitality_girl_serving_drinks_1.jpg'
course10.description = "This course helps you develop the knowledge and skills required to operate effectively at supervisory level in the hospitality industry. The first year covers a range of subjects both practical and theoretical. The second year focuses on providing you with the necessary managerial knowledge and skills for a junior management position.\n\nThis HND Hospitality Management is a valuable qualification for employment in an exciting and ever changing industry, as well as a good preparation for further studies.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course10.entry_requirements = "* Successful completion of the HNC Hospitality Operations or similar award, including a pass in Graded Unit 1; OR\n* Relevant industrial experience at supervisory level.\nOffers are subject to attending an interview with a member of the Hospitality / Events team where you should describe your interest and/or experience in hospitality, and your hopes for after completing the course."
course10.career_prospects = "The course prepares you for employment at junior management/supervisory level in a hospitality department, and graduate training schemes with many large organisations.\n\nWe work with key representatives from industry to offer graduate training positions following the successful completion of the HND."
course10.spaces = course_spaces
course10.save! validate: false

course11 = Course.new college:kelvin
course11.title = 'Coaching and Developing Sport (Year 2 Direct Entry) HND'
course11.category = Category.find_by_name 'Sport & Fitness'
course11.level = 'SCQF level 8'
course11.start_date = Date.new 2017, 8, 28
course11.end_date = Date.new 2019, 6, 13
course11.image = 'Sport_group_playing_basketball.jpg'
course11.description = "This course introduces and develops the skills and knowledge you’ll need for a career in sports coaching. The principles of good coaching practice are examined and a wide practical and theoretical knowledge of games and sports is developed (please see further information in the 'what you study' section below).\n\nYou'll be taught by experienced sports coaching staff with a proven track record of bringing out the best in their students.\n\nOn successful completion of this course, you'll be awarded with the HND in Coaching and Deveolping Sport.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course11.entry_requirements = "* An HNC Sport Coaching qualification with 15 credits\nThis ensures you don't need to study additional units to complete the 30 credits in second year.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n\nThe interview will consist of a group discussion and a practical assessment. You'll need to submit a reference form, normally from a PE teacher or coach."
course11.career_prospects = "You get can a job doing P.E."
course11.spaces = course_spaces
course11.save! validate: false

course12 = Course.new college: clyde
course12.title = 'Sports Therapy (Year 2 Direct Entry) HND'
course12.category = Category.find_by_name 'Sport & Fitness'
course12.level = 'SCQF level 8'
course12.start_date = Date.new 2017, 8, 28
course12.end_date = Date.new 2019, 6, 13
course12.image = 'HND_20Sports_20Therapy_202nd_20Year_201600x1078.jpg'
course12.description = "The sports therapy course will equip you with the skills required to help prevent injury and rehabilitate clients back to full fitness. The second year of the course focuses on the assessment and treatment of musculoskeletal conditions arising from sporting activity.\n\nYou'll also get the opportunity to work in our sports injury clinic, developing skills in clinical assessment, devising treatment plans and providing physical therapies. You may also be involved in pre and post match and touchline support for sporting events.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course12.entry_requirements = "* HNC Sports Therapy OR\n* First year HND Sports Therapy\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course12.career_prospects = "This course prepares you for a career as a sports therapist working freelance, in sports clubs, or as part of a government health initiative."
course12.spaces = course_spaces
course12.save! validate: false

course13 = Course.new college: cogc
course13.title = 'Travel and Tourism (Year 2 Direct Entry) HND'
course13.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course13.level = 'SCQF level 8'
course13.start_date = Date.new 2017, 8, 28
course13.end_date = Date.new 2019, 6, 13
course13.image = 'HND_20Travel_20and_20Tourism_202nd_20Year_201600x1078.jpg'
course13.description = "The course develops your knowledge of the Travel and Tourism Industry giving you a solid preparation for a career in the sector. You'll gain the skills and knowledge required to provide high quality customer service and enhance your own employability.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course13.entry_requirements = "* HNC in Travel and Tourism OR\n* First year of HND in Travel and Tourism\nYou'll be invited to attend a course presentation where you will get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course13.career_prospects = "This course prepares you for a career in travel and tourism with:\n\n* National Tourist Organisations.\n* Travel Management Companies.\n* Visitor Centres/Attractions.\n* Tour Operators.\n* Travel Agents.\n* Airlines.\n* Airport Ground Handling.\n* Foreign Exchange Service."
course13.spaces = course_spaces
course13.save! validate: false

course14 = Course.new college: cogc
course14.title = 'Financial Services (Year 2 Direct Entry) HND'
course14.category = Category.find_by_name 'Accounting'
course14.level = 'SCQF level 8'
course14.start_date = Date.new 2017, 8, 28
course14.end_date = Date.new 2018, 6, 13
course14.image = 'HND_20Financial_20Services_202nd_20year_20app_201600x1078.jpg'
course14.description = "This HND year 2 is a continuation from the HNC course and is designed to provide you with the key competencies required by anyone entering the Financial Services Industry as a trainee, or at a technical level, or for anyone already working in such a position but wishing to lay the foundation of a professional career. \n\nIt develops your understanding in areas such as Pensions, Insurance and Investments. \n\nFurther details of the topics covered is provided in the section “what you study” below. "
course14.entry_requirements = "Successful completion of a full time HNC Financial Services course with 15 credits, with a Grade A in the graded unit and all mandatory units.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course14.career_prospects = "The course is for those wishing to work in an administrative, sales, customer support or technical support role within the Finance Industry.\nThere are various employment opportunities, including working in: banking, building societies, pension funds, investment companies, insurance, unit trusts, stock market operations, life and pensions, asset management and intermediation."
course14.spaces = course_spaces
course14.save! validate: false

course15 = Course.new college: cogc
course15.title = 'Fine Art (Year 2 Direct Entry) HND'
course15.category = Category.find_by_name 'Fine Arts & Photography'
course15.level = 'SCQF level 8'
course15.start_date = Date.new 2017, 8, 28
course15.end_date = Date.new 2019, 6, 13
course15.image = 'HND_20Fine_20Art_20Year_202_20Direct_20Entry_201600x1078_20.jpg'
course15.description = "This stimulating, and creative course will be delivered to you by our highly professional teaching staff with significant fine art experience and a proven track record of bringing out the best in their students.\n\nThe course includes both traditional and innovative practices. It will give you a broad visual education in contemporary art practice. You'll develop your skills in a range of specialist disciplines and increase your awareness and knowledge of conceptual thinking. It also offers an opportunity to develop individual practice in relation to your own interests.\n\nStudents who successfully complete this course will achieve the HND Contemporary Art Practice.\n\nVisit Visual Grammar, City of Glasgow College Fine Art Facebook page.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course15.entry_requirements = "* HNC Fine Art (Contemporary Art Practice), or equivalent.\nYou'll be invited to a portfolio event where you will get the opportunity to find out more about the course and tell us why you are interested in this subject area. You'll be required to bring a portfolio of your work for assessment."
course15.career_prospects = "Work as an independent exhibiting artist, depending on the quality of your work, motivation and self-promotion skills. The experience of the HND can also help to prepare you for working in other roles within the creative industries such as curation or community arts.\n\nStudents who complete their HND can progress to:\n\n* BA (Hons) Contemporary Art Practice at City of Glasgow College.\n* Other art school or university degree courses (2nd or 3rd year entry."
course15.spaces = course_spaces
course15.save! validate: false

course16 = Course.new college: cogc
course16.title = 'Financial Services HNC'
course16.category = Category.find_by_name 'Accounting'
course16.level = 'SCQF level 7'
course16.start_date = Date.new 2017, 8, 28
course16.end_date = Date.new 2018, 6, 13
course16.image = 'FinancialServices_HNC.jpg'
course16.description = "This HNC is designed to provide you with the key competencies required by anyone entering the Financial Services Industry as a trainee, or at a technical level, or for anyone already working in such a position but wishing to lay the foundation of a professional career.  Further details of the topics covered is provided in the section “what you study” below. \n\nThe aims of the HNC are to:\n\nYou'll be assessed throughout this course with the assessments taking the form of practical assessments, assignment and case studies.  You'll also undertake a Graded Unit project, which is designed to assess your ability to integrate the knowledge and skills gained through the mandatory units. \n\nCity of Glasgow College has strong links with Financial Services organisations, which provide industry visits and guest speakers to add value to the academic content of the course. \n\nThroughout the course you'll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience. \n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course16.entry_requirements = "* One relevant* Higher at grade C or above; OR\n* Three relevant* National 5 courses at grade A; OR\n* Successful completion of an NC/NQ; OR\n* Successful completion of a Foundation Apprenticeship in Financial Services; OR\n* Successful completion of an NPA in Financial Services.\n* Equivalent qualifications will be considered. \n* Relevant work experience will be considered where employer referee details have been supplied.\n*Qualifications cannot include any from the following list: Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL.\n\nYou'll be invited to attend a compulsory interview. The interview dates are:\n\n* Thursday 20 April 2017 at 4.15pm\n* Thursday 1 June 2017 at 4.15pm\nThe interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You will be given the opportunity to ask questions. You must bring a copy of qualification certificates."
course16.career_prospects = "The course is for those wishing to work in an administrative, sales, customer support or technical support role within the Finance Industry.\n\nThere are various employment opportunities, including working in: banking, building societies, pension funds, investment companies, insurance, unit trusts, stock market operations, life and pensions, asset management and intermediation."
course16.spaces = course_spaces
course16.save! validate: false

course17 = Course.new college:kelvin
course17.title = 'Computing: Networking HND'
course17.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course17.level = 'SCQF level 8'
course17.start_date = Date.new 2017, 8, 28
course17.end_date = Date.new 2019, 6, 13
course17.image = 'Computing_digitalmedia_3.jpg'
course17.description = "This course aims to teach you the skills required to install, configure and maintain computer network infrastructures.  Students gain practical skills and knowledge of current and emerging principles and network technologies with an emphasis on active and participative learning.\n\nYear One builds a solid foundation in networking and routing concepts, ethical hacking and client operating systems, incorporating both Microsoft and Linux platforms.  You will have access in our specialist computing classrooms and networking labs.\n\nYear Two progresses your skills in administering networks, configuring server operating systems and developing security concepts.\n\nThe programme integrates learning materials from industry standard vendors, which help prepare you for a variety of optional certification exams such as Cisco Certified Network Associate (CCNA) and Microsoft Certifications.  These qualifications are highly sought after by employers. \nAfter successfully completing this course you will have the skills needed to get an entry level role in IT infrastructure support.   \n\nA large number of HND Networking students progress on to University programmes including 2nd or 3rd year entry in Cyber Security, Ethical Hacking and Networking. \n\nThis course also accepts year two direct entrants.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course17.entry_requirements = "* Two appropriate Highers and three Intermediate 2 courses (including at least one from Computing or Information Systems), OR\n* Two Highers and three Standard Grades at Credit Level, OR\n* Two Highers and three National 5 qualifications, OR\n* A national qualification at SCQF Level 6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development), OR\n* Other equivalent qualifications or experience.\n* An HNC with relevant options.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course17.career_prospects = "This course prepares you for a career in IT infrastructure support."
course17.spaces = course_spaces
course17.save! validate: false

course18 = Course.new college: cogc
course18.title = 'Computing: Networking HNC'
course18.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course18.level = 'SCQF level 7'
course18.start_date = Date.new 2017, 8, 28
course18.end_date = Date.new 2018, 6, 13
course18.image = 'Computing_girl_wires.jpg'
course18.description = "This course will allow you to study towards an up-to-date qualification in many of the skills that are in demand for different types of computing careers. The course will follow the units of the first year of the HND Networking course, including network technology and routing technology.\n\nYou will receive a HNC Computing / HNC Computing: Networking award qualification on successful completion of the course. This course integrates learning materials from industry standard vendors such as Microsoft and Cisco which can help you to prepare for a variety of vendor certification exams.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course18.entry_requirements = "* One Higher and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* One Higher and three Standard Grades at credit level; OR\n* One Higher and three National 5 qualifications; OR\n* A national qualification at SCQF Level 6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR\n* Other equivalent qualifications or experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course18.career_prospects = "You can progress on to second year of HND Computing: Network Technology or apply for entry into the first year of related BSc Computing degree programmes at most universities on successful completion of this course."
course18.spaces = course_spaces
course18.save! validate: false

course19 = Course.new college: kelvin
course19.title = 'Computer Games Development HNC'
course19.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course19.level = 'SCQF level 7'
course19.start_date = Date.new 2017, 8, 28
course19.end_date = Date.new 2018, 6, 13
course19.image = 'Computing_GamesDevHNC.jpg'
course19.description = "This creative, hands-on course enables you to develop skills in all aspects of computer games development. You'll learn how to create logic games, 2D games and 3D first person game by staff with significant Computer Games industry experience and a proven track record of bringing out the best in their students.\n\nThis course prepares you for employment in a junior developer role within the Computer Games Industry, or a junior software developer role within the IT Industry. The HNC Computer Games Development qualification has progression routes to 2nd year BSc Games and Software Development degree programmes.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course19.entry_requirements = "* 2 Highers at grade  A to C, one of which must be Mathematics AND\n* 2 Standard Grades at band 1 to 3 OR Intermediate 2 at  band A to C\n* English or Communication Standard Grade at band 1 to 3 OR Intermediate 2 at  band A to C\n* Candidates possessing a National Qualification in Computer Games at Level 5 or 6 may also be eligible for entry to this cours"
course19.career_prospects = "Employment as a junior Games Programmer/Modeller or Software Developer."
course19.spaces = course_spaces
course19.save! validate: false

course20 = Course.new college: clyde
course20.title = 'SPD Marine Engineering (Cadet Programme) HND'
course20.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course20.level = 'SCQF level 8'
course20.start_date = Date.new 2017, 8, 28
course20.end_date = Date.new 2019, 6, 13
course20.image = 'marine_engineering_1.jpg'
course20.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch.  The HND in marine engineering will also give academic exemptions for management level exams further in your career path. There are a number of elements to the programme and also a compulsory sea time requirement.\n\nThe programme is structured into 5 phases:\n\nThere are two main entries into this programme: September and January. "
course20.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n* National 5/GCSE or equivalent which must include: English, Maths, Physical Science (e.g. Physics/Chemistry/Technological Studies/Engineering Science) and one other subject\n* NC Shipping and Maritime Operations (SCQF level 6) without optional Engineering Units.\n* Alternative qualifications will be considered on an individual basis in conjunction with the sponsoring company or training provider\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme.  \n\nInitial applications for this course should be submitted to a training provider or company, please follow the link below for more information:\n\nwww.careersatsea.org/sponsoring-companies/"
course20.career_prospects = "On successful completion of the HND programme, Cadets can gain employment as a fully qualified officer of the watch or choose to progress onto university to study at a higher level."
course20.spaces = course_spaces
course20.save! validate: false

course21 = Course.new college: kelvin
course21.title = 'Acting and Performance HNC'
course21.category = Category.find_by_name 'Drama & Creative Writing'
course21.level = 'SCQF level 7'
course21.start_date = Date.new 2017, 8, 28
course21.end_date = Date.new 2018, 6, 13
course21.image = 'Drama_group3.jpg'
course21.description = "This course develops the skills you require for acting and performance. It is designed to focus on the practical skills required by the actor, while also supporting the practical experiences with knowledge of theatre and performance.\n\nThis creative, learner-focused course is delivered by highly professional teaching staff, with significant acting and performance experience and a proven track record of bringing out the best in their students.\n\nOn completion of the course, you'll be awared a HNC Acting and Performance and you may be eligible for direct entry into the second year of HND Acting and Performance.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course21.entry_requirements = "* Two Higher Grades, including English; OR\n* NQ Drama; OR\n* Equivalent qualification.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject.\n\nIf your application is successful, you'll also be asked to audition where you will perform a monologue."
course21.career_prospects = "There are a wide range of career opportunities which include working in theatre, television, community drama, and theatre production."
course21.spaces = course_spaces
course21.save! validate: false

course22 = Course.new college: cogc
course22.title = 'Furniture Restoration HND'
course22.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course22.level = 'SCQF level 8'
course22.start_date = Date.new 2017, 8, 28
course22.end_date = Date.new 2019, 6, 13
course22.image = 'Furniture_group_discussing.jpg'
course22.description = "This course will allow you to develop your skills in furniture analysis and practical solutions, through workshop activities. You’ll study the history of furniture design and materials as well as the construction, upholstery and finishing of period furniture. You’ll also restore items of furniture throughout this course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course22.entry_requirements = "* NQ in Furniture Making; OR\n* One Higher – Craft and Design, and English at minimum Intermediate 2 or National 5.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of any design and/or making of furniture or 3D work."
course22.career_prospects = "Career opportunities are many and varied. A high number of craftspeople are self-employed or in a partnership, which can be rewarding. There are also jobs in furniture trades and shop-fitting."
course22.spaces = course_spaces
course22.save! validate: false

course23 = Course.new college:kelvin
course23.title = 'Jewellery Design HND'
course23.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course23.level = 'SCQF level 8'
course23.start_date = Date.new 2017, 8, 28
course23.end_date = Date.new 2019, 6, 13
course23.image = 'jewellery_clamp_lady.jpg'
course23.description = "This HND course will teach you a comprehensive range of skills in jewellery design and manufacture, with a design-led focus. You'll be able to choose specialisms according to your own interests, as well as the current business environment.\n\nYour course will be delivered by qualified lecturers, all with a degree in Jewellery/Silversmithing, TQFE Certified and have related industry experience and various specialised skill sets.\n\nYou'll learn designing and manufacturing with various precious and non precious metals (please see the 'Materials' section, below, to find out more). \n\nThe course is project based with units usually being integrated. You'll study specialist practical techniques which can be found in the 'What you Study' section, below. We focus on marrying new technology with traditional techniques – pushing boundaries of material exploration, and developing skills in emerging technologies including: 3D Printing, Scanning, Laser Cutting, Smart Materials.\n\nTo reflect the constant changes within the industry, we work closely with a range of industry partners, and update course content to ensure you receive relevant skills and qualifications.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course23.entry_requirements = "* One Higher in Art and Design and English at minimum Intermediate 2; OR\n* NC/NQ in an Art and Design subject.\nYou'll be invited for a group and/or individual interview where you'll find out more about the course and tell us why you're interested in this subject area.\n\nAt the interview you'll be asked to provide examples of your art and design work."
course23.career_prospects = "You can set up business as a jeweller or gain employment in the creative industries, by utilising the range of skills you'll learn throughout the course."
course23.spaces = course_spaces
course23.save! validate: false

course24 = Course.new college: clyde
course24.title = 'Travel and Tourism (with option to study languages) HNC'
course24.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course24.level = 'SCQF level 7'
course24.start_date = Date.new 2017, 8, 28
course24.end_date = Date.new 2018, 6, 13
course24.image = 'Tourism_Barcelona_1.jpg'
course24.description = "This course will give you the skills, knowledge and understanding to develop your career in the Travel and Tourism Industry. You'll gain the skills and knowledge required to provide high quality customer service and enhance your own employability."
course24.entry_requirements = "* One Higher at Grade C or above in appropriate academic subjects (such as English, Modern Studies, Languages, Business Management, History) and three National 5 qualifications including English; OR\n* One Higher at Grade C or above (such as English, Modern Studies, Languages Business Management, History) with three Intermediate 2 courses including English; OR\n* One Higher at Grade C or above (such as English, Modern Studies, Languages Business Management, History,) and three Standard Grades at credit level including English; OR\n* Other equivalent qualifications or experience.\nYou'll be invited to attend a course presentation where you'll get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course24.career_prospects = "* National Tourist Organisations.\n* Travel Management Companies.\n* Visitor Centres/Attractions.\n* Tour Operators.\n* Travel Agents.\n* Airlines.\n* Airport Ground Handling.\n* Foreign Exchange Service."
course24.spaces = course_spaces
course24.save! validate: false

course25 = Course.new college:kelvin
course25.title = 'Computer Science HNC'
course25.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course25.level = 'SCQF level 7'
course25.start_date = Date.new 2017, 8, 28
course25.end_date = Date.new 2018, 6, 13
course25.image = 'Computer_Science.jpg'
course25.description = "The HNC Computing (Science) course is an SQA qualification which aims to meet the challenges of employers seeking qualified learners who can demonstrate knowledge and skills in a range of technology areas.\nThe course places particular emphasis on software development, data science, project management and soft skills such as team-working.\n\nAccording to research from Tech Partnership (a network of employers working with the Scottish Government and Skills Development Scotland to create skills for the UK's digital economy) the number of UK Digital Businesses has increased 30% in the last 5 years.\n\nTheir forecast shows the number of people working in the UK as technology specialists between 2014 and 2024 will grow by 28%, significantly outstripping that predicted for workers more generally.\n\nThe course is delivered by experienced lecturing staff many of whom have industry experience in IT areas such as software engineering, programming, project management and technical support.\n\nAfter successfully completing the award, you can apply for a range of entry level posts within the IT industry, you may progress to year 2 of the HND Computer Science course or enter a relevant degree course at a range of universities\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course25.entry_requirements = "* One Higher* and three National 5 qualifications; OR\n* One Higher* and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* One Higher* and three Standard Grades at credit level; OR\n* A national qualification  at SCQF Level 6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR\n* Other equivalent qualifications or experience\n*in one of these subjects: Computing, Information Systems, Mathematics, Physics or any other relevant subject\n\nYou’ll be invited for a group and/or individual interview where you can find out more about the course and tell us why you’re interested in this subject."
course25.career_prospects = "The HNC/D in Computing: Computer Science will prepare you for a career in programming, website development or as a support technician or database administrator."
course25.spaces = course_spaces
course25.save! validate: false

course26 = Course.new college:kelvin
course26.title = 'Marine Engineering - Year 2 Direct Entry HND'
course26.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course26.level = 'SCQF level 8'
course26.start_date = Date.new 2017, 8, 28
course26.end_date = Date.new 2018, 6, 13
course26.image = 'marine_engineering_2.jpg'
course26.description = "This one-year program is suitable for those cadets who have completed MNTB/MCA approved HNC in Marine Engineering.\n\nSuccessful completion of HND in Marine Engineering will entitle you to MCA’s Management Level Academic subjects such Mathematics, Engineering Drawing, Electro-technology, Naval Architecture, Applied Heat and Applied Mechanics.\n\nFor further information see http://www.careersatsea.org/."
course26.entry_requirements = "* MNTB/MCA Approved HNC in Marine Engineerin"
course26.career_prospects = "Successful completion of the course may offer you entry to second year of a four years honours course at university.\n\nThis course prepares you for a career as a Senior Marine Engineering Officer, Ship Manager, or Ship Superintendent."
course26.spaces = course_spaces
course26.save! validate: false

course27 = Course.new college: cogc
course27.title = 'Complementary Therapies (Year 2 Direct Entry) HND'
course27.category = Category.find_by_name 'Hair & Beauty'
course27.level = 'SCQF level 8'
course27.start_date = Date.new 2017, 8, 28
course27.end_date = Date.new 2019, 6, 13
course27.image = 'Beauty_complementary_therapy_massage_1.jpg'
course27.description = "We are a sector leading provider of training in complementary therapies and our second year HND programme aims to provide everything you need to become a confident practitioner, qualified to an advanced level.\n\nAfter successfully completing the course, you'll be eligible for professional membership and insurance within the field of complementary therapies.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course27.entry_requirements = "* HNC Complementary Therapies (15 credits), must include Reflexology.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. We'll also want to hear why you are interested in undertaking progression of your qualification."
course27.career_prospects = "This course prepares you for a career in the field of complementary therapies, for example in healthcare services, cruise ships, spas, hotels or self-employment."
course27.spaces = course_spaces
course27.save! validate: false

course28 = Course.new college: kelvin
course28.title = '3D Design/ HNC 3D Design: Product Design HNC'
course28.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course28.start_date = Date.new 2017, 8, 28
course28.end_date = Date.new 2018, 6, 13
course28.image = 'Product_design_boyfix_wheel_0.jpg'
course28.description = "Looking to become a qualified Product Designer? This is a challenging course, where you take part in an exciting and comprehensive programme of product design. You’ll learn about new materials, CAD and how to use manufacturing processes, as well as developing 3D prototypes.\n\nYou'll work through all the stages of the design process through a number of projects, producing presentation boards for clients to review.\n\nThe course gives you the skills required for employment in this high demand industry sector (please see further information in the 'after the course' section) and will be delivered by our professional teaching staff with significant product design experience.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course28.entry_requirements = "* NC Product Design or related discipline (eg Furniture Design), OR\n* One Higher from Design and Manufacture, Product Design, Graphic Communication or Art and Design, and English at minimum Intermediate 2, OR\n* One Higher from Product Design, Graphic Communication or Art and Design, and English at National 5 level, OR\n* Other equivalent qualifications, or experience.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to provide examples of your art and design work."
course28.career_prospects = "Upon graduating, you'll be able to seek employment as a qualified Product Designer, Solidworks 3D Modeller, or Digital Media Designer."
course28.spaces = course_spaces
course28.save! validate: false

course29 = Course.new college: clyde
course29.title = '3D Design: Model Making for the Creative Industries HND'
course29.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course29.level = 'SCQF level 8'
course29.start_date = Date.new 2017, 8, 28
course29.end_date = Date.new 2019, 6, 13
course29.image = 'Modelmaking_02.jpg'
course29.description = "This Model Making course is aimed at students who have some practical skills in crafts, art and design and who have an interest in working in the fields of model or prop making for TV, film and theatre, architecture, product design, prototypes, museums, cosplay etc.\n\nYou'll develop skills in the design and construction of a wide variety of types of model through project-based units designed to be relevant to future employment and study routes. Projects are varied to cater for a broad range of interests and to allow as much individual creative input as possible. In addition, by the end of the course you will be encouraged to have a strong online presence to facilitate networking within the industry.\n\nThe dedicated course lecturers bring many years of wide ranging commercial model making experience to the college and have been continually updating and developing the course over the last 10 years. You'll work on projects independently or in groups. Teaching will be through class discussion and demonstrations and one-to-one tutorials in practical and design tasks, with individual feedback, guidance and support.\n\nLinks to relevant companies and practitioners are encouraged and industry guest speakers and visits are frequently arranged. At the end of the course, selected students have the opportunity to show their work at the annual model making trade show in London.\n\nStudents from this course have gone on to study at degree level, gone directly into employment with some of the country’s most prestigious companies e.g. Sir Norman Foster Architects or found success as freelance model makers in various niche markets.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course29.entry_requirements = "* NC Model Making, or a NC in a related discipline, OR\n* One Higher from Art, Design &amp; Manufacture, Product Design or Graphic Communication and English at National 5 level, OR\n* Related work experience.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you're asked to bring your best examples of both 2D and 3D art and design work, in original, photographic or portfolio form."
course29.career_prospects = "Many graduates work as model makers all over the world, including New Zealand, Dubai and Australia."
course29.spaces = course_spaces
course29.save! validate: false

course31 = Course.new college: cogc
course31.title = 'Legal Services (With Criminology and Police Studies) HNC'
course31.category = Category.find_by_name 'Administration, Human Resources & Law'
course31.level = 'SCQF level 7'
course31.start_date = Date.new 2017, 8, 28
course31.end_date = Date.new 2018, 6, 13
course31.image = 'LegalSerivcesHNC.jpg'
course31.description = "This course is based around Scottish criminal law and Scottish criminal procedures, criminology, contemporary policing and the criminal justice system in Scotland. In addition to these core subjects, you'll study commercial law, private law and property law, sheriff civil and a communications unit.\n\nDuring the year, you'll look at the role of the citizen within society, the rights and obligations of the private citizen across commercial, property and private matters, the principle of equality, fairness and the role of government and other agencies in maintaining and regulating the rights of the individual.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course31.entry_requirements = "* One Higher at grade C or above, preferably English, History, Modern Studies or a related subject; PLUS\n* Three Intermediate 2 at grade C or above, preferably including English, History, Modern Studies or a related subject; OR\n* An NC Qualification at Level 6.\nIf you don't have the standard entry qualifications but have an employment history and are looking for a career change, you can be considered subject to review of that work experience.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course31.career_prospects = "This course prepares you for a career in the police service, prison service, and other related agencies."
course31.spaces = course_spaces
course31.save! validate: false

course33 = Course.new college: cogc
course33.title = 'Business HND'
course33.category = Category.find_by_name 'Business & Procurement'
course33.level = 'SCQF level 8'
course33.start_date = Date.new 2017, 8, 28
course33.end_date = Date.new 2019, 6, 13
course33.image = 'Business_Boy_ipad.jpg'
course33.description = "The course provides you with the skills and knowledge necessary for careers in banking, insurance, civil service, local government and distribution. Today, the internet is an important part of business, so we've updated the course to include analysing and using information for strategic purposes.\n\nYour course will be delivered by our highly professional teaching staff with relevant industry experience and track record of bringing out the best in their students.\n\nThis course accepts year two direct entrants (you must have a completed HNC Business, please see further information in direct entry section).\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7 (year 1) and Level 8 (year 2).  For more information on the framework visit: www.scqf.org.uk/the-framework/."
course33.entry_requirements = "Year 1 Entry\n\n* Two Highers in a relevant* academic subject OR\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course33.career_prospects = "This course will prepare you for trainee positions in management and administration in industry, financial services and the public sector."
course33.spaces = course_spaces
course33.save! validate: false

course37 = Course.new college:kelvin
course37.title = 'Fine Art HNC'
course37.category = Category.find_by_name 'Fine Arts & Photography'
course37.level = 'SCQF level 7'
course37.start_date = Date.new 2017, 8, 28
course37.end_date = Date.new 2018, 6, 13
course37.image = 'HNC_Fine_Art.jpg'
course37.description = "This contemporary course includes both traditional and innovative art practices. It gives you a broad visual education in contemporary art practice.\n\nYou'll develop your skills in a range of specialist disciplines and increase your awareness and knowledge of conceptual thinking. It's also a great opportunity to improve and strengthen your existing portfolio of artwork.\n\nYou'll be awarded an HNC Contemporary Art Practice on successful completion of this course.\n\nFor more information visit Visual Grammar, the department of Fine Art's Facebook page, and other courses on this website with Fine Art i.e. NC Fine Art Portfolio / HND Fine Art / BA (Hons) Contemporary Art Practice.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course37.entry_requirements = "* Two Higher Grade passes at grade C or above, in Art and English and two other passes at Standard Grade (or equivalent) at band 3 or above; OR\n* Two Higher Grade passes at grade C or above, in Art and English and two National 4 qualifications; OR\n* NQ Art and Design (or equivalent).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. On the day you'll also be asked to submit a portfolio of your art and design work for assessment and may be given a short interview."
course37.career_prospects = "This course prepares you for work as an independent exhibiting artist, depending on the calibre of your work, your motivation and self-promotion skills."
course37.spaces = course_spaces
course37.save! validate: false

course38 = Course.new college: cogc
course38.title = 'Illustration HND'
course38.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course38.level = 'SCQF level 8'
course38.start_date = Date.new 2017, 8, 28
course38.end_date = Date.new 2019, 6, 13
course38.image = 'Illustration.jpg'
course38.description = "This course will help you develop your creative and technical skills to become a commercial illustrator. You'll build projects from initial ideas and sketchbook drawings, through to illustration artwork ready for presentation to a client. You're encouraged to explore individual responses to project briefs.  On completion of the course you'll have produced a broad and exciting portfolio of illustrations and other relevant art and design work.  \n\nDuring your time on the course you'll have the opportunity for study trips at both home and abroad.  \nRecent trips have included Berlin, Amsterdam, the Outer Hebrides, Edinburgh and the art galleries of Glasgow.   \n\nIn addition, the course prides itself in providing relevant industrial experience and you would be expected to complete a range of live and client led projects.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course38.entry_requirements = "* NC in Art and Design or related subject; OR\n* Higher Art and Design and English at minimum Intermediate 2/National 5 level; OR\n* Relevant experience.\n* HNC Illustration OR\n* First year of HND Illustration.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course38.career_prospects = "The HNC/D course can lead to self-employment as a freelance Illustrator working with advertising agencies, design consultants, and book, magazine and newspaper publishers, or in your own private practice."
course38.spaces = course_spaces
course38.save! validate: false

course41 = Course.new college:kelvin
course41.title = 'Creative Industries: Television  (Year 2 Direct Entry) HND'
course41.category = Category.find_by_name 'Media'
course41.level = 'SCQF level 8'
course41.start_date = Date.new 2017, 8, 28
course41.end_date = Date.new 2019, 6, 13
course41.image = 'TV_Sound_edit_0.jpg'
course41.description = "This course will help you to develop skills in all areas of television production, including camera, sound, editing, sound dubbing and lighting. An ideal course if you're interested in TV, film, video, broadcast and working in a studio environment.\n\nCareer prospects and employment opportunities are excellent with many of our students progressing to degree level study or to careers both in broadcasting and with independent production companies (please see \"After the Course\" section below for more information). \n\nOn successful completion of the course, you'll be awarded with an HND Creative Industries: Television.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course41.entry_requirements = "​HNC Television with 15 credits\n\nOR\n\nRelevant television experience.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. You'll also be asked to bring examples of their work."
course41.career_prospects = "The Television Industry is expanding and there are opportunities for skilled graduates, both in broadcasting and with independent production companies."
course41.spaces = course_spaces
course41.save! validate: false

course42 = Course.new college: clyde
course42.title = 'Media and Communication HNC'
course42.category = Category.find_by_name 'Media'
course42.level = 'SCQF level 7'
course42.start_date = Date.new 2017, 8, 28
course42.end_date = Date.new 2018, 6, 13
course42.image = 'Desktop_Publishing_girl.jpg'
course42.description = "This wide-ranging and multi-faceted Media and Communication course will help you to develop a broad base of multi-platform media skills suitable for higher education and employment in the modern, convergent media and communications industries.\n\nEach tutor has a wide variety of media experience, and you'll gain even more knowledge from expert media guest speakers, visits, field trips and professional workshops.\n\nYou’ll be continually assessed and will be working on industry relevant projects, in some cases for real clients.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course42.entry_requirements = "* Higher English or Higher Media Studies at Grade C or above, OR\n* NC Media or a similar NC programme, OR\n* Relevant work experience.\nYou'll be invited for a group pre-entry guidance session and individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n\nAt this interview you'll be given a short written exercise (around 200 words) so we can review your writing style, syntax, spelling and grammar.\n\n It may also strengthen your application to provide evidence of relevant experience or activity in the subject area, e.g. blogging, podcasting, published work, involvement in school newspapers, magazines or radio stations, relevant work experience or volunteering etc. "
course42.career_prospects = "This course prepares you for a career in journalism, television and radio production, video production, public relations and advertising."
course42.spaces = course_spaces
course42.save! validate: false

course43 = Course.new college: clyde
course43.title = 'Media with Journalism HNC'
course43.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course43.level = 'SCQF level 7'
course43.start_date = Date.new 2017, 8, 28
course43.end_date = Date.new 2018, 6, 13
course43.image = 'HNC_20Creative_20Industries_20Media_20and_20Communication_201600x1078_IMAGE1_0.jpg'
course43.description = "This course has a focus on Journalism for learners who are interested in that discipline and might wish to apply for first year entry at University. \n\nIt will help you develop a broad base of multi-platform media and Journalism skills suitable for higher education and employment in the modern, convergent media and communications industries. \n\nEach tutor has a wide variety of media experience, and you'll gain even more knowledge from expert media guest speakers, visits, field trips and professional workshops.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course43.entry_requirements = "* One Higher at Grade C or above preferably English or Media Studies, OR\n* NC Media or a similar NC programme, OR\n* Relevant work experience.\nYou'll be invited for a group pre-entry guidance session and individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n\nAt this interview you'll be given a short written exercise (around 200 words) so we can review your writing style, syntax, spelling and grammar.\n\n It may also strengthen your application to provide evidence of relevant experience or activity in the subject area, e.g. blogging, podcasting, published work, involvement in school newspapers, magazines or radio stations, relevant work experience or volunteering."
course43.career_prospects = "This course prepares you for a career in journalism, television and radio production, video production, public relations and advertising."
course43.spaces = course_spaces
course43.save! validate: false

course45 = Course.new college: cogc
course45.title = 'Childhood Practice HNC'
course45.category = Category.find_by_name 'Health, Social Care & Early Education'
course45.level = 'SCQF level 7'
course45.start_date = Date.new 2017, 8, 28
course45.end_date = Date.new 2018, 6, 13
course45.image = 'HNC_20Childhood_20Practice_201600x1078.jpg'
course45.description = "This course is for individuals interested in a career in the early education and childcare field or for those wishing to pursue further study for example, within Primary Education or Childhood Practice.\n\nApproved by the Scottish Social Services Council, this course is a suitable qualification for registration as a Child Development Officer.\n\nThe main aim of the HNC is to provide an integrated course of values, skills and knowledge to equip candidates to work effectively within an early education and childcare settings.\n\nMore specifically, the course will enable you to:\n\n\nThe structure of the course includes lectures, research tasks, presentations and group discussions.  This is an interactive course which includes blended learning and encourages your active participation. During your course, industry experts will be invited to speak with student groups. The staff group consists of lecturers from a variety of early education, health and social care backgrounds.  \n\nHNC Childhood Practice full-time students will complete two days per week on placement throughout the duration of the course to allow development of experience and completion of three SVQ3 units.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course45.entry_requirements = "* Two or more Highers at C or above including English; OR\n* NC Early Education and Childcare Level 6.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject.\n\nYou'll also need to provide two suitable references, one from your most recent educational provider (if in education) or your employer. \n\nExperience witihn an early education - voluntary or employed - would be extreamly beneficial."
course45.career_prospects = "This course prepares you for a career as a practitioner in the Childcare and Early Education sectors."
course45.spaces = course_spaces
course45.save! validate: false

course46 = Course.new college: cogc
course46.title = 'Social Services HNC'
course46.category = Category.find_by_name 'Health, Social Care & Early Education'
course46.level = 'SCQF level 7'
course46.start_date = Date.new 2017, 8, 28
course46.end_date = Date.new 2018, 6, 13
course46.image = 'social_services.jpg'
course46.description = "This course is for individuals interested in a career in the social care field or those wishing to pursue further study, for example, to the Degree in Social Work.\n\nIt is also suitable for individuals who are employed in the care field and require qualifications for registration with the Scottish Social Services Council and/or continual professional development.\n\nThe main aim of the HNC is to provide an integrated course of values, skills and knowledge to equip candidates to work effectively in a range of care settings.\n\nThe specific aims of the course are to enable you to:\n\nYou'll be taught by qualified lecturing staff from a variety of health and social care backgrounds. The structure of the course includes lectures, research tasks, presentations and group discussions.\n\nThis is an interactive course which includes blended learning and encourages your active participation. Industry experts will also be invited to speak with student groups and there is a yearly Graduate Panel for previous students to share their experiences with those currently studying.  \n\nAs a HNC Social Services student you'll complete two days per week on placement from October/November to June within a social care setting allowing for the opportunity to gain experience working directly with service users, put theory into practice in a care setting and complete the SVQ3 units.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course46.entry_requirements = "* Two Higher Grades at C or above preferably including English; OR\n* An appropriate Level 6 Group Award and/or an appropriate group of SQA units at level 6.\n* Candidates with SVQ3 in a related area will also be considered.\n* Applicants without these qualifications who have relevant experience may also be considered.\nTwo suitable references will be required, including one from your most recent educational provider and/or employed as appropriate.\n\nYou'll be invited for an interview where there will be the opportunity to find out more about the course and tell us why you're interested in this subject area.\n\nPlease note, for a number of the articulation options, Level 5 Maths is required.  This is offered within City of Glasgow College as Lifeskills Maths."
course46.career_prospects = "This course prepares you for a career in:\n\n* Social work.\n* Social care worker.\nSupport worker with various groups such as older adults, people with learning difficulties, adult care, community care, offenders, residential child care, or the addiction field.\n\nVarious careers in Care both within the private and public sector."
course46.spaces = course_spaces
course46.save! validate: false

course47 = Course.new college: clyde
course47.title = 'Social Sciences Diploma of Higher Education'
course47.category = Category.find_by_name 'Social Sciences'
course47.level = 'SCQF level 8'
course47.start_date = Date.new 2017, 8, 28
course47.end_date = Date.new 2018, 6, 13
course47.image = 'SocialSciencesDipofHE.jpg'
course47.description = "The Diploma of Higher Education in Social Sciences is offered by City of Glasgow College, in association with the University of Strathclyde, Glasgow.\n\nIt is equivalent to the first two years of an Honours Degree at the University of Strathclyde and therefore allows you to apply to there for direct entry to the third year of the BA Politics and/or History Degree.\n\nIn the first year you'll study History, Politics, Economics and Sociology and in the second year Politics and History only. Please note that there is no psychology in this degree.\n\nIf you leave after one year – or don’t meet the requirements for the Diploma after two years – you may be awarded a Certificate of Higher Education in Social Sciences.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course47.entry_requirements = "* Four or more Higher Grade pass at grade C or above, one of which must be in English or ESOL and at least two others in social science subjects such as Sociology, Modern Studies, History, Politics, Psychology, Philosophy, Geography, R.M.P.S or Economics.\n* Two other passes at National 5 or equivalent.\nYou'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course47.career_prospects = "This course prepares you for a career in public and private sectors including:\n\n* Health service.\n* Community work.\n* Welfare rights.\n* Social research.\n* Teaching.\n* Aid agencies.\n* Social work.\n* Housing.\n* Local, national and European Governmen."
course47.spaces = course_spaces
course47.save! validate: false

course48 = Course.new college: kelvin
course48.title = 'Social Sciences HNC'
course48.category = Category.find_by_name 'Social Sciences'
course48.level = 'SCQF level 7'
course48.start_date = Date.new 2017, 8, 28
course48.end_date = Date.new 2018, 6, 13
course48.image = 'HNC_20Social_20Sciences_201600x1078.jpg'
course48.description = "This course provides you with sound education and training in key areas of social science theory, research and investigation.\n\nKey course objectives are to develop knowledge in the social sciences; to develop analytical, evaluative and problem solving skills; to develop communication skills; and to develop personal effectiveness and critical thinking about social and cultural issues.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course48.entry_requirements = "* Two SQA Higher Grade passes or equivalent at first sitting. At least one of the Highers must be in English (or ESOL equivalent) or in a social science subject such as Modern Studies, Sociology, Politics, Psychology, History, Economics or Philosophy.\n* Mature students may be considered based on work and life experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. Some applicants may be required to take a short written exercise. Applicants are advised to ensure that their personal statement is written to a very high standard."
course48.career_prospects = "The vast majority of our successful HNC students apply for the second year of study – HND Social Sciences but others:\n\n* Enter employment.\n* Apply to university for entry at level 1 or ."
course48.spaces = course_spaces
course48.save! validate: false

course49 = Course.new college: cogc
course49.title = 'Social Sciences (Year 2 Direct Entry) HND'
course49.category = Category.find_by_name 'Social Sciences'
course49.level = 'SCQF level 8'
course49.start_date = Date.new 2017, 8, 28
course49.end_date = Date.new 2018, 6, 13
course49.image = 'HND_20Social_20Sciences_202nd_20Year_20entry_201600x1078.jpg'
course49.description = "This course provides you with sound education and training in key areas of social science theory, research and investigation.\n\nThe course is delivered by highly qualified lecturers who have a wealth of experience within the industry. Key course objectives are to develop knowledge in the social sciences; to develop analytical, evaluative and problem solving skills; to develop communication skills; and to develop personal effectiveness and critical thinking about social and cultural issues.\n\nCareer prospects and employment opportunities are excellent with many of our students progressing to 3rd year at university (please see the \"After the Course\" section, below, to find out more).\n\nAfter successful completion of the course, you'll be awarded with an HND Social Sciences.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course49.entry_requirements = "* HNC Social Sciences with 15 credits at SCQF level 7; OR\n* First year of HND Social Sciences with 15 credits as SCQF level 7.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. Some applicants may be required to take a short written exercise. You are advised to ensure that you personal statement is written to a very high standard."
course49.career_prospects = "You can science all the social you like."
course49.spaces = course_spaces
course49.save! validate: false

course52 = Course.new college: cogc
course52.title = 'Coaching and Developing Sport HND'
course52.category = Category.find_by_name 'Sport & Fitness'
course52.level = 'SCQF level 8'
course52.start_date = Date.new 2017, 8, 28
course52.end_date = Date.new 2019, 6, 13
course52.image = 'Sport_fitness.jpg'
course52.description = "This course introduces and develops the skills and knowledge you’ll need for a career in sports coaching. The principles of good coaching practice are examined and a wide practical and theoretical knowledge of games and sports is developed (please see further information in the 'what you study' section below).\n\nYou'll be taught by sports coaching staff with significant industry experience and a proven track record of bringing out the best in their students.\n\nThis course accepts direct entrants to year two. On successful completion of this course, you'll be awarded with the HND in Coaching and Deveolping Sport.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course52.entry_requirements = "* Two Highers at grade C or above including English or equivalent.\n* An HNC Sport Coaching qualification with 15 credits.\nThis ensures you do not need to study additional units to complete the 30 credits in second year.\n\nYou'll be invited for a group interview."
course52.career_prospects = "You can get a job doing P.E."
course52.spaces = course_spaces
course52.save! validate: false

course53 = Course.new college: cogc
course53.title = 'Coaching and Developing Sport HNC'
course53.category = Category.find_by_name 'Sport & Fitness'
course53.level = 'SCQF level 7'
course53.start_date = Date.new 2017, 8, 28
course53.end_date = Date.new 2018, 6, 13
course53.image = 'Gym_2boys_workout.jpg'
course53.description = "This course introduces and develops the skills and knowledge you’ll need for a career in sports coaching. Together we'll examine the principles of good coaching practice, as well as developing a wide range of practical and theoretical knowledge of games and sports. Work experience is included on HN programmes and you will also have the opportunity to qualify for Sports Coaching awards from national governing bodies.\n\nYou'll lead practical coaching sessions, in college and in schools. An Enhanced Disclosure Scotland check must be successfully completed before you coach young people in schools.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course53.entry_requirements = "* At least one Higher at Grade C in English or equivalent.\n* NQ/NC qualification at Level 6.\nYou'll be invited for a group interview."
course53.career_prospects = "This course prepares you for a career in sports as a Sports Development Officer, or a Sports Co-ordinator."
course53.spaces = course_spaces
course53.save! validate: false

course56 = Course.new college: cogc
course56.title = 'Marine Engineering (Cadet Training) HNC'
course56.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course56.level = 'SCQF level 7'
course56.start_date = Date.new 2017, 8, 28
course56.end_date = Date.new 2018, 6, 13
course56.image = 'marine_engineering_0.jpg'
course56.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch.  There are a number of elements to the programme and also a compulsory sea time requirement.\n\nThe programme is structured into 5 phases:\n\nThere are two main entry dates into this programme: September and January. \n\nFor course contact details, please email maritime@cityofglasgowcollege.ac.uk."
course56.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n* National 5/GCSE or equivalent which must include: English, Maths, Physical Science (e.g. Physics/Chemistry/Technological Studies/Engineering Science) and one other subject\n* NC Shipping and Maritime Operations (SCQF level 6) without optional Engineering Units.\n* Alternative qualifications will be considered on an individual basis in conjunction with the sponsoring company or training provider.\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme.  \n\nInitial applications for this course should be submitted to a training provider or company, please follow the link below for more information: \n\nhttp://www.careersatsea.org/sponsoring-companies/"
course56.career_prospects = "On successful completion of the HNC programme, Cadets can gain employment as a fully qualified officer of the watch or choose to progress onto the HND Marine Engineering top up course, which will provide academic exemptions up to management level."
course56.spaces = course_spaces
course56.save! validate: false

course57 = Course.new college: cogc
course57.title = 'Retail Management - January Start HNC'
course57.category = Category.find_by_name 'Marketing & Retail'
course57.level = 'SCQF level 7'
course57.start_date = Date.new 2017, 8, 28
course57.end_date = Date.new 2018, 6, 13
course57.image = 'Retail_marketing.jpg'
course57.description = "This course prepares you for a career in the retail industry, where there's a growing need for people qualified to fill trainee management positions.\n\nDuring the course you'll carry out case studies, projects and assignments, and we'll assess your progress continuously. We also organise industrial visits and study tours.\n\nThis course runs for 6 months from January - June 2017.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course57.entry_requirements = "* Higher English at grade C or above (or another relevant Higher).\n* Two other passes at Standard Grade, or equivalent at band 3 or above, OR\n* A National Qualification in a relevant area or an appropriate SVQ\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course57.career_prospects = "Apply for second year of HND Retail Management. You can also apply for first or second year entry to relevant degree programmes at Glasgow Caledonian University, Stirling University, Queen Margaret University or Robert Gordon University."
course57.spaces = course_spaces
course57.save! validate: false

course58 = Course.new college: cogc
course58.title = 'Nautical Science/ Chief Mate/ Master (Jan) HND'
course58.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course58.start_date = Date.new 2017, 8, 28
course58.end_date = Date.new 2018, 6, 13
course58.image = 'marine_D3_0.jpg'
course58.description = "This course is designed for you to progress from OOW level (deck) to chief mates level. You will also complete the following short courses HELM Management, NAEST Management and a medical care certificate. The course overall will equip you to become a competent and efficient chief mate.\n\nThere are assessments for the HND units and also preparation for the MCA Mates/Masters written exams and also for the MCA Mates oral exam. Students enrol on each of the courses separately."
course58.entry_requirements = "* A recognised complete sea time of 12 months at OOW level\n* A MCA approved OOW certificate\n* A NAEST (M) certificate (to be valid when finally applying for your COC). The NAEST(M) course is scheduled within course program."
course58.career_prospects = "You can get a job on a boat."
course58.spaces = course_spaces
course58.save! validate: false

course59 = Course.new college: kelvin
course59.title = 'SPD Marine Engineering Cadet Programme - January Start HND'
course59.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course59.level = 'SCQF level 8'
course59.start_date = Date.new 2017, 8, 28
course59.end_date = Date.new 2019, 6, 13
course59.image = 'Marine_Engineering_girl_0.jpg'
course59.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch.  The HND in marine engineering will also give academic exemptions for management level exams further in your career path, while the SPD Marine Management element will give exemptions from the IAMI Engineering Knowledge examination.\n\nThere are a number of elements to the programme and also a compulsory sea time requirement of seven months.\n\nThe programme is structured into 5 phases:\n\nPhase 1 – College phase where you will complete year 1 of HND in Marine Engineering, compulsory STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 2 – Sea Phase where you will start your MNTB training record book in addition to a work based learning course and a distance learning maths course.\n\nPhase 3 - College phase where you will complete year 2 of the HND in Marine Engineering (excluding the graded unit project), STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 4 – Sea Phase where you will complete your MNTB training record book.\n\nPhase 5 - College phase where you will complete an SPD in Marine Management and HND Marine Engineering graded unit 2 projects in addition to preparing for your MCA Oral Examination and completing your final STCW short courses.  Additional Maths tuition in order to aide transition to university will also be provided.\n\nThere are two main entries into this programme: A September entry and also a January entry. "
course59.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n·       English\n\n·       Maths\n\n·       Physical Science (e.g. Physics/Chemistry/Technological Studies/Engineering Science)\n\n·       One other subject\n\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme. \n\nInitial applications for this course should be submitted to a training provider or company, please follow the link below for more information.\n\nhttp://www.careersatsea.org/sponsoring-companies/"
course59.career_prospects = "On successful completion of the SPD programme, Cadets can gain employment as a fully qualified officer of the watch or choose to progress onto university to study at a higher level."
course59.spaces = course_spaces
course59.save! validate: false

course60 = Course.new college: cogc
course60.title = 'Marine Engineering (Cadet Programme) (Jan) HNC'
course60.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course60.level = 'SCQF level 7'
course60.start_date = Date.new 2017, 8, 28
course60.end_date = Date.new 2018, 6, 13
course60.image = 'Marine_Engineering_girl.jpg'
course60.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch.  There are a number of elements to the programme and also a compulsory sea time requirement.\n\nPhase 1 – College phase where you will complete an NC in shipping and Maritime Operations, compulsory STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 2 – Sea Phase where you will start your MNTB training record book in addition to a work based learning course and a distance learning maths course.\n\nPhase 3 - College phase where you will complete an HNC in Marine Engineering, STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 4 – Sea Phase where you will complete your MNTB training record book.\n\nPhase 5 - College phase where you will prepare for your IAMI engineering knowledge examination, MCA Oral Examination and complete your final STCW short courses.\n\nThere are two main entries into this programme: September and January."
course60.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n* English.\n* Maths.\n* Physical Science (e.g. Physics/Chemistry/Technological Studies/Engineering Science).\n* One other subject.\nAlternative qualifications will be considered on an individual basis in conjunction with the sponsoring company or training provider.\n\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme. \n\nInitial applications for this course should be submitted to a training provider or company, please follow the link for more information."
course60.career_prospects = "On successful completion of the HNC programme, Cadets can gain employment as a fully qualified officer of the watch or choose to progress onto the HND Marine Engineering top up course, which will provide academic exemptions up to management level."

statuses = ['open', 'open', 'open', 'open', 'cancelled', 'closed']

# Add status
Course.all.each do |course|
  course.status = statuses.sample.to_sym
  course.save! validate: false
end

# TEST STUDENTS
student = Student.new
student.first_name = 'Mary'
student.family_name = 'Morrison'
student.email = 'vmorrison0@merriam-webster.com'
student.scottish_candidate_number = '177584673'
student.national_insurance_number = 'NJ987124D'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Falmouth University'
school.address_1 = '6 Loftsgordon Plaza'
school.address_2 = 'Denton'
school.country = 'United Kingdom'
school.postcode = 'M34 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'Standard'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
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
qualification.subject = 'Art'
qualification.award = 'Higher'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 44
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 110
course.save! validate: false

student = Student.new
student.first_name = 'Brian'
student.family_name = 'Owens'
student.email = 'jowens1@altervista.org'
student.scottish_candidate_number = '173600127'
student.national_insurance_number = 'NJ484949A'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Open University'
school.address_1 = '3065 Mockingbird Trail'
school.address_2 = 'Upton'
school.country = 'United Kingdom'
school.postcode = 'DN21 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
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
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Standard'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2015, 8, 23)
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

course = CourseSelection.new application_id: app.id, course_id: 102
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 62
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 12
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 56
course.save! validate: false

student = Student.new
student.first_name = 'Antonio'
student.family_name = 'Sims'
student.email = 'bsims2@utexas.edu'
student.scottish_candidate_number = '174185972'
student.national_insurance_number = 'NJ507437B'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'The Robert Gordon University'
school.address_1 = '9657 Chive Center'
school.address_2 = 'Sutton'
school.country = 'United Kingdom'
school.postcode = 'RH5 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'Higher'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Courtauld Institute of Art'
school.address_1 = '5411 Badeau Center'
school.address_2 = 'Linton'
school.country = 'United Kingdom'
school.postcode = 'BD23 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 26
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 95
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 17
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 104
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 80
course.save! validate: false

student = Student.new
student.first_name = 'Beverly'
student.family_name = 'Ferguson'
student.email = 'tferguson3@twitter.com'
student.scottish_candidate_number = '176256486'
student.national_insurance_number = 'NJ881714D'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Royal College of Music'
school.address_1 = '1 Sunnyside Terrace'
school.address_2 = 'Manchester'
school.country = 'United Kingdom'
school.postcode = 'M14 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Warnborough University'
school.address_1 = '408 Manufacturers Circle'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'WC1B 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Standard'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
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

course = CourseSelection.new application_id: app.id, course_id: 71
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 129
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 47
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 56
course.save! validate: false

student = Student.new
student.first_name = 'Marilyn'
student.family_name = 'Sullivan'
student.email = 'wsullivan4@yellowbook.com'
student.scottish_candidate_number = '179640686'
student.national_insurance_number = 'NJ759257A'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'University of Ulster'
school.address_1 = '271 Garrison Junction'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'EC1V 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'HND'
qualification.grade = 'Pass'
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
qualification.subject = 'Geography'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
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

course = CourseSelection.new application_id: app.id, course_id: 130
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 19
course.save! validate: false

student = Student.new
student.first_name = 'Judith'
student.family_name = 'Matthews'
student.email = 'mmatthews5@china.com.cn'
student.scottish_candidate_number = '170946170'
student.national_insurance_number = 'NJ371043A'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Chelsea College of Art and Design'
school.address_1 = '37 Orin Avenue'
school.address_2 = 'Leeds'
school.country = 'United Kingdom'
school.postcode = 'LS6 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Warwick'
school.address_1 = '5 Hanover Lane'
school.address_2 = 'Langley'
school.country = 'United Kingdom'
school.postcode = 'SG4 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 94
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 33
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 55
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 103
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 34
course.save! validate: false

student = Student.new
student.first_name = 'Chris'
student.family_name = 'Duncan'
student.email = 'rduncan6@blogger.com'
student.scottish_candidate_number = '170709810'
student.national_insurance_number = 'NJ283441B'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Aston University'
school.address_1 = '69171 Scoville Place'
school.address_2 = 'Buckland'
school.country = 'United Kingdom'
school.postcode = 'CT16 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Warnborough University'
school.address_1 = '41942 Warrior Court'
school.address_2 = 'Walton'
school.country = 'United Kingdom'
school.postcode = 'CV35 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 121
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 20
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 104
course.save! validate: false

student = Student.new
student.first_name = 'Patrick'
student.family_name = 'Carr'
student.email = 'rcarr7@soup.io'
student.scottish_candidate_number = '172176860'
student.national_insurance_number = 'NJ189062C'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'University of East London'
school.address_1 = '45 Florence Street'
school.address_2 = 'Belfast'
school.country = 'United Kingdom'
school.postcode = 'BT2 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Institute of Germanic Studies'
school.address_1 = '4467 Redwing Parkway'
school.address_2 = 'Swindon'
school.country = 'United Kingdom'
school.postcode = 'SN1 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 86
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 85
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 46
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 67
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 79
course.save! validate: false

student = Student.new
student.first_name = 'Diane'
student.family_name = 'Myers'
student.email = 'amyers8@zdnet.com'
student.scottish_candidate_number = '173161743'
student.national_insurance_number = 'NJ368821D'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Camberwell College of Arts'
school.address_1 = '7071 Forest Road'
school.address_2 = 'Leeds'
school.country = 'United Kingdom'
school.postcode = 'LS6 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
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
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HND'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
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

course = CourseSelection.new application_id: app.id, course_id: 112
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 42
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 44
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 116
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 73
course.save! validate: false

student = Student.new
student.first_name = 'Sharon'
student.family_name = 'Murphy'
student.email = 'dmurphy9@hibu.com'
student.scottish_candidate_number = '177154261'
student.national_insurance_number = 'NJ864091C'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Canterbury Christ Church University'
school.address_1 = '17182 Melvin Junction'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'EC3M 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Standard'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Chelsea College of Art and Design'
school.address_1 = '3 Dottie Trail'
school.address_2 = 'Newton'
school.country = 'United Kingdom'
school.postcode = 'NG34 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 54
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 45
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 38
course.save! validate: false

student = Student.new
student.first_name = 'Terry'
student.family_name = 'Johnson'
student.email = 'sjohnsona@java.com'
student.scottish_candidate_number = '179195321'
student.national_insurance_number = 'NJ386345B'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'University of Hertfordshire'
school.address_1 = '39133 Forster Drive'
school.address_2 = 'Sheffield'
school.country = 'United Kingdom'
school.postcode = 'S1 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
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
qualification.subject = 'Computing'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HND'
qualification.grade = 'D'
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

course = CourseSelection.new application_id: app.id, course_id: 61
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 30
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 124
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 73
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 67
course.save! validate: false

student = Student.new
student.first_name = 'Bruce'
student.family_name = 'Hill'
student.email = 'bhillb@quantcast.com'
student.scottish_candidate_number = '177545503'
student.national_insurance_number = 'NJ426944D'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Trinity College Carmarthen'
school.address_1 = '436 Lake View Plaza'
school.address_2 = 'Sutton'
school.country = 'United Kingdom'
school.postcode = 'RH5 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'Chelsea College of Art and Design'
school.address_1 = '62 Jay Crossing'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'W1F 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 119
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 25
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 116
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 69
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 128
course.save! validate: false

student = Student.new
student.first_name = 'Douglas'
student.family_name = 'Phillips'
student.email = 'gphillipsc@biblegateway.com'
student.scottish_candidate_number = '177201324'
student.national_insurance_number = 'NJ939981B'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Courtauld Institute of Art'
school.address_1 = '13 Maple Place'
school.address_2 = 'Seaton'
school.country = 'United Kingdom'
school.postcode = 'LE15 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'United Medical and Dental Schools'
school.address_1 = '2 Evergreen Trail'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'EC3M 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HNC'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
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
qualification.subject = 'Chemistry'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 41
course.save! validate: false

student = Student.new
student.first_name = 'Irene'
student.family_name = 'Freeman'
student.email = 'dfreemand@thetimes.co.uk'
student.scottish_candidate_number = '170942043'
student.national_insurance_number = 'NJ832025B'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Heriot-Watt University'
school.address_1 = '75 Petterle Alley'
school.address_2 = 'Newtown'
school.country = 'United Kingdom'
school.postcode = 'RG20 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HND'
qualification.grade = 'Pass'
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
qualification.subject = 'Physics'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 137
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 116
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 54
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 21
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 20
course.save! validate: false

student = Student.new
student.first_name = 'Phyllis'
student.family_name = 'Harvey'
student.email = 'dharveye@ehow.com'
student.scottish_candidate_number = '171122627'
student.national_insurance_number = 'NJ627382B'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'University of Portsmouth'
school.address_1 = '23 Cody Park'
school.address_2 = 'Preston'
school.country = 'United Kingdom'
school.postcode = 'PR1 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'NQ'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'The Manchester Metropolitan University'
school.address_1 = '049 Quincy Pass'
school.address_2 = 'Norton'
school.country = 'United Kingdom'
school.postcode = 'S8 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 110
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 14
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 33
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 81
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 105
course.save! validate: false

student = Student.new
student.first_name = 'Shirley'
student.family_name = 'Henry'
student.email = 'ahenryf@360.cn'
student.scottish_candidate_number = '173698674'
student.national_insurance_number = 'NJ323959D'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'University of Wales'
school.address_1 = '2 Anzinger Park'
school.address_2 = 'Edinburgh'
school.country = 'United Kingdom'
school.postcode = 'EH9 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HND'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
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
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Physics'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 110
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 49
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 83
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 26
course.save! validate: false

student = Student.new
student.first_name = 'Joshua'
student.family_name = 'Reyes'
student.email = 'creyesg@noaa.gov'
student.scottish_candidate_number = '172890296'
student.national_insurance_number = 'NJ543194D'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Wimbledon School of Art'
school.address_1 = '476 Sunfield Point'
school.address_2 = 'East End'
school.country = 'United Kingdom'
school.postcode = 'BH21 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'NQ'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Standard'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 71
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 39
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 8
course.save! validate: false

student = Student.new
student.first_name = 'Jane'
student.family_name = 'Hughes'
student.email = 'jhughesh@gov.uk'
student.scottish_candidate_number = '173292635'
student.national_insurance_number = 'NJ897009A'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'University of Aberdeen'
school.address_1 = '4 Susan Place'
school.address_2 = 'Whitchurch'
school.country = 'United Kingdom'
school.postcode = 'BS14 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Maths'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
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
qualification.subject = 'Maths'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'NQ'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 138
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 117
course.save! validate: false

student = Student.new
student.first_name = 'Gregory'
student.family_name = 'Reid'
student.email = 'jreidi@zdnet.com'
student.scottish_candidate_number = '170789768'
student.national_insurance_number = 'NJ805402C'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'University of Aberdeen'
school.address_1 = '725 Anderson Drive'
school.address_2 = 'Ashley'
school.country = 'United Kingdom'
school.postcode = 'SN13 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'Higher'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Standard'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Central Lancashire'
school.address_1 = '9229 Transport Street'
school.address_2 = 'London'
school.country = 'United Kingdom'
school.postcode = 'EC3M 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Higher'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'Standard'
qualification.grade = 'C'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 42
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 140
course.save! validate: false

student = Student.new
student.first_name = 'Antonio'
student.family_name = 'Richardson'
student.email = 'drichardsonj@google.co.uk'
student.scottish_candidate_number = '174705879'
student.national_insurance_number = 'NJ370998C'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Trinity College Carmarthen'
school.address_1 = '2258 Gerald Pass'
school.address_2 = 'Upton'
school.country = 'United Kingdom'
school.postcode = 'WF9 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'Higher'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Higher'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
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
qualification.subject = 'Maths'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HND'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 126
course.save! validate: false

student = Student.new
student.first_name = 'Beverly'
student.family_name = 'Kelly'
student.email = 'kkellyk@usnews.com'
student.scottish_candidate_number = '177674648'
student.national_insurance_number = 'NJ194124D'
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
app.state = :completed
app.save! validate: false

school = School.new application: app
school.name = 'Courtauld Institute of Art'
school.address_1 = '66836 Bayside Avenue'
school.address_2 = 'Newton'
school.country = 'United Kingdom'
school.postcode = 'IV1 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Higher'
qualification.grade = 'C'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HNC'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Halifax'
school.address_1 = '3 Del Mar Lane'
school.address_2 = 'Ford'
school.country = 'United Kingdom'
school.postcode = 'GL54 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'Higher'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'HNC'
qualification.grade = 'D'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 142
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 46
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 28
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 31
course.save! validate: false

student = Student.new
student.first_name = 'Jeremy'
student.family_name = 'Hill'
student.email = 'philll@tuttocitta.it'
student.scottish_candidate_number = '176461446'
student.national_insurance_number = 'NJ467058A'
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
app.state = :completed
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
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Woodworking'
qualification.award = 'NQ'
qualification.grade = 'B'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'PE'
qualification.award = 'Standard'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'University of Sheffield'
school.address_1 = '8089 Corben Circle'
school.address_2 = 'Liverpool'
school.country = 'United Kingdom'
school.postcode = 'L74 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Technological Studies'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2013, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Biology'
qualification.award = 'NQ'
qualification.grade = 'D'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2014, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 34
course.save! validate: false

student = Student.new
student.first_name = 'Aaron'
student.family_name = 'Chapman'
student.email = 'cchapmanm@naver.com'
student.scottish_candidate_number = '174599793'
student.national_insurance_number = 'NJ867200B'
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
app.state = :completed
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
qualification.grade = 'D'
qualification.start_date = Date.new(2014, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Art'
qualification.award = 'Standard'
qualification.grade = 'A'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Computing'
qualification.award = 'HNC'
qualification.grade = 'B'
qualification.start_date = Date.new(2015, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
qualification.save! validate: false

school = School.new application: app
school.name = 'London School of Jewish Studies'
school.address_1 = '99 Claremont Circle'
school.address_2 = 'Whitwell'
school.country = 'United Kingdom'
school.postcode = 'DL10 3FB'
school.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'English'
qualification.award = 'HND'
qualification.grade = 'B'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2015, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Chemistry'
qualification.award = 'HND'
qualification.grade = 'D'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2016, 6, 8)
qualification.save! validate: false

qualification = Qualification.new school: school
qualification.subject = 'Geography'
qualification.award = 'HNC'
qualification.grade = 'Pass'
qualification.start_date = Date.new(2012, 8, 23)
qualification.end_date = Date.new(2013, 6, 8)
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

course = CourseSelection.new application_id: app.id, course_id: 50
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 141
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 135
course.save! validate: false

course = CourseSelection.new application_id: app.id, course_id: 94
course.save! validate: false
