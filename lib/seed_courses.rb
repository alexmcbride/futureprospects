def course_spaces
  [15, 30, 45, 60].sample
end

upload_images = false

course = Course.new college_id: 3
course.title = 'SPD Marine Engineering (Cadet Training) PDA'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 9'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/MarineManagementPDA.jpg').open
else
  course.image.filename = 'MarineManagementPDA.jpg'
end
course.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch. The HND in Marine Engineering will also give academic exemptions for management level exams further in your career path, while the SPD Marine management element will give exemptions from the IAMI Engineering Knowledge examination.\n\nThere are a number of elements to the programme and also a compulsory sea time requirement of seven months.\n\nThe programme is structured into 5 phases:\n\nPhase 1 – College phase where you will complete year 1 of HND in Marine Engineering, compulsory STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 2 – Sea phase where you will start your MNTB training record book in addition to a work based learning course and a distance learning maths course.\n\nPhase 3 – College phase where you will complete year 2 of the HND in Marine Engineering (excluding the graded unit project), STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 4 – Sea phase where you will complete your MNTB training record book.\n\nPhase 5 – College phase where you will complete an SPD in Maritime Management and HND Marine Engineering graded unit 2 projects in addition to preparing for your MCA Oral Examination and completing your final STCW short courses. Additional maths tuition in order to aide transition to university will also be provided.\n\nThere are two main entries into this programme: A September entry and also a January entry.\n\nFor further information see http://www.careersatsea.org/."
course.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n1. Higher maths and/or physical science at grade C or above, and national 5/GCSE or equivalent which must include:\n* English.\n* Maths.\n* Physical Science (e.g. Physics, Chemistry, Technological Studies or Engineering Science).\n* One other subject.\n\n2. NC Shipping and Maritime Operations (SCQF Level 6) with optional Engineering units.\n\n3. Alternative qualifications will be considered on an individual basis in conjunction with the sponsoring company or training provider.\n\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme.\n\nInitial applications for this course should be submitted to a training provider or company, please follow the link for more information."
course.career_prospects = "On successful completion of the SPD programme, cadets can gain employment as a fully qualified officer of the watch or choose to progress into university to study at a higher level."
course.spaces = course_spaces
course.status = :open
puts 'SPD Marine Engineering (Cadet Training) PDA saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Business HNC'
course.category = Category.find_by_name 'Business & Procurement'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_HNC.jpg').open
else
  course.image.filename = 'Business_HNC.jpg'
end
course.description = "Are you looking for a career in banking, insurance, civil service, local government or distribution? This course gives you the skills and knowledge necessary to succeed, with excellent career opportunities and progression routes. \n\nYou'll be taught by staff with relevant industry experience and a proven track record of bringing out the best in their students.\n\nToday, the internet is an important part of business, so we've updated the course to include analysing and using information for strategic purposes.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher pass in a relevant* academic subject OR\n* National Certificate in Business (with at least 3 units at level 6) OR\n* Other appropriate and relevant National Certificate courses (with at least 3 units at level 6) may be considered.\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course.career_prospects = "You could expect to apply for a trainee management position and/or a team leader in industry or commerce."
course.spaces = course_spaces
course.status = :cancelled
puts 'Business HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Administration and Information Technology  HND'
course.category = Category.find_by_name 'Administration, Human Resources & Law'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_boys_learning.jpg').open
else
  course.image.filename = 'Business_boys_learning.jpg'
end
course.description = "This course will provide you with a broad range of office-based skills and knowledge required for a career in office administration. This is a challenging course, where you'll develop specialist skills in IT, desktop publishing, communication, research and planning.\n\nYour stimulating programme will be delivered by our highly professional teaching staff with significant experience in office administration and a proven track record of bringing out the best in their students.\n\nThis course accepts year two direct entrants (you must have a completed HNC Administration, please see further information in direct entry section)\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7 (year 1) and Level 8 (year 2).  For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Highers in a relevant* academic subject OR\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course.career_prospects = "This course prepares you for a career as a Personal Assistant or Administrator in both the public and private sector. The HND can provide progression into employment in a general administrative role within small to medium enterprises. It'll also provide opportunities to develop the skills and knowledge required for more specialist posts demanded by larger organisations.\n\nThe qualification will allow you to develop:\n\n* Technical and administrative knowledge relevant to current practice.\n* Interpersonal skills relevant to an administrative role.\n* Personal effectiveness.\n* Communication.\n* Presentation technique."
course.spaces = course_spaces
course.status = :open
puts 'Administration and Information Technology  HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Information Technology HNC'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/InformationTechnology_HNC.jpg').open
else
  course.image.filename = 'InformationTechnology_HNC.jpg'
end
course.description = "This computing course provides the entry level knowledge and IT skills you need to work in computing. The course will provide you with an opportunity to undertake a variety of practical and theoretical activities and assessments, which will prepare you for higher learning, or entry into the job market.\n\nIf you successfully complete the course, you can apply for entry to the second year HND program where you'll have the opportunity to further enhance your knowledge and skills by building e-commerce applications using the Microsoft.Net framework and undertaking the Industry recognised Oracle Database Design and Programming vendor qualification.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One appropriate Higher and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* One Higher and three Standard Grades at Credit level; OR\n* One Higher and three National 5 qualifications; OR\n* A national qualification at SCQF Level 5/6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR\n* Other equivalent qualifications or experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "The course will develop your core and employability skills and make you more attractive to prospective employers."
course.spaces = course_spaces
course.status = :open
puts 'Information Technology HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Information Technology HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_Hard_drive_0.jpg').open
else
  course.image.filename = 'Computing_Hard_drive_0.jpg'
end
course.description = "The HND Information Technology computing qualification is designed to give you a solid technical understanding of information systems and technologies used by both small and large scale businesses.\n\nYou'll gain an understanding of how data is transformed into usable information through the theory and practice of relational database technologies. You'll also undertake units in web design and development, e-commerce, applications programming, operating systems and project management.\n\nAs part of the second year program you'll also undertake the Oracle Database Design and Programming using SQL vendor qualification, which is a worldwide recognised qualification that prepares the student to undertake external Oracle exams.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Highers and three Intermediate 2 courses (including Computing or Information Systems); OR\n* Two Higher and three Standard Grades at Credit level (including Computing or Information Systems); OR\n* Two Higher and three National 5 level qualifications (including Computing or Information Systems); OR\n* A national qualification at SCQF Level 6 in a related subject such as Digital Media Computing, NQ Computing.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "After completing the HND you may pursue a career in business intelligence analysis, information management, database administration, trainer/teacher, hardware and software support, or web development."
course.spaces = course_spaces
course.status = :open
puts 'Information Technology HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Web Development HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/WebDevelopent_HND.jpg').open
else
  course.image.filename = 'WebDevelopent_HND.jpg'
end
course.description = "On this two year course, you'll gain skills to start or advance a career as a web designer/developer. You'll learn to build both static and dynamic websites that deliver content in a variety of formats for computers, smartphones and tablets. You'll have access to current smartphones and tablets for testing your responsive websites."
course.entry_requirements = "* Two Higher and three Intermediate 2 courses (including Computing, Graphic Design or Information Systems); OR\n* Two Higher and three Standard Grades at Credit level or above (including Computing, Graphic Design or Information Systems); OR\n* Two Higher and three National 5 qualifications or above (including Computing, Graphic Design or Information Systems); OR\n* A national qualification at SCQF Level 5 or 6 in a related subject such as Digital Media Computing, NQ Computing,  Computing: Technical Support or Software Development.\nYou'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you're interested in this subject area. It is important that you prepare a personal statement which reflects your desire to study on this course."
course.career_prospects = "Apply for various job vacancies, such as a junior web developer/designer.\n\nContinuining Study\n\nYou'll have the opportunity to progress to the following degree courses at university:\n\n* BSc (Hons) Web and Mobile Development at the University of the West of Scotland.\n* BSc/BSc (Hons) Interactive Media Design at Napier University.\n* BSc/BSc (Hons) Digital Media at Napier University.\n* BSc/BSc (Hons) Creative Computing at Napier University.\n* BEng (Hons) Web Technologies at Napier University."
course.spaces = course_spaces
course.status = :open
puts 'Web Development HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Advertising and Public Relations HND'
course.category = Category.find_by_name 'Marketing & Retail'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/creative_writing_girl_with%20_book_0.jpg').open
else
  course.image.filename = 'creative_writing_girl_with_20_book_0.jpg'
end
course.description = "This course trains you for a career in the communication industries. You'll develop an understanding of the nature and function of advertising and public relations, within a wider marketing and marketing communications framework. You'll also learn how to communicate effectively in this environment.\n\nThis course accepts year two direct entrants.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes at Grade C or above, including English, OR\n* A relevant NC or NQ qualification with appropriate subject modules), OR\n* Evidence of relevant industry experience.\n* Successful completion of a full time HNC Advertising and PR course with 15 credits.\n* A genuine interest in the advertising and PR industries is needed and should be demonstrated in the applicatio"
course.career_prospects = "This course prepares you for a career in:\n\n* Advertising agencies.\n* PR consultancies.\n* Social media companies.\n* Advertising departments.\n* Commercial, or media-based companies.\nThere are a number of work experience and placement opportunities throughout the course."
course.spaces = course_spaces
course.status = :cancelled
puts 'Advertising and Public Relations HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Marketing HND'
course.category = Category.find_by_name 'Marketing & Retail'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Desktop_Publishing_girl_1.jpg').open
else
  course.image.filename = 'Desktop_Publishing_girl_1.jpg'
end
course.description = "The course helps you develop the skills you’ll need to work in marketing and business. It covers marketing theory and buyer behaviour, as well as the main operational areas of marketing research, promotion and selling.\n\nCoursework includes projects and assignments that relate to current industry practice and market environments. You’ll be assessed continuously throughout the course.\n\nYou can keep up to date with marketing industry news and future opportunities with The Drum and Digital Intelligence.\n\nAfter successful completion of the course, you will be awarded with an HND in Marketing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework."
course.entry_requirements = "* Two Higher Grade passes at Grade C or above including English (or an equivalent such as Modern Studies, Economics, History or Business); OR\n* Adult learners with some relevant experience in, or who hope to move into the marketing area, may be accepted subject to interview.\n* A genuine interest in marketing is needed and should be demonstrated in the applicatio"
course.career_prospects = "You may go on to a career in marketing, public relations, or internal or external communications in any number of business sectors."
course.spaces = course_spaces
course.status = :open
puts 'Marketing HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = '3D Design: Interior Design HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Interior_design_girl_drawing.jpg').open
else
  course.image.filename = 'Interior_design_girl_drawing.jpg'
end
course.description = "This course will enable you to develop the creative, analytical and technical skills for a career in interior design. It's a two year course that can lead to direct entry to the third year of a degree programme.\n\nThis course also accepts year two direct entrants.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC Interior Design or related subject, OR\n* Higher Art and Design, and English at minimum Intermediate 2, OR\n* Higher Art and Design, and English at National 5 level.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "This course may lead to a variety of careers in interior design and architectural practices, such as space planning, property development – shop and office fitting, and museum and exhibition design.\n\nContinuing Study\n\nAfter successfully completing the HND course, you can apply for direct entry to 3rd year BA (Hons) Interior Design program at a choice of universities such as: Glasgow School of Art, Edinburgh College of Art, Duncan of Jordonstone College of Art or Heriot Watt University."
course.spaces = course_spaces
course.status = :open
puts '3D Design: Interior Design HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = '3D Design: Model Making for the Creative Industries (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%203D%20Design%20Model%20Making%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_203D_20Design_20Model_20Making_202nd_20Year_201600x1078.jpg'
end
course.description = "This course will help you develop multiple skills and knowledge of materials and processes relevant to the Model Making Industry, whether for film/TV props, miniatures, prototyping, engineering, architecture, or exhibition models.\n\nAs part of the course, previous students have had the opportunity to work with live clients throughout the UK and Europe and have made industry visits to London, Liverpool, Manchester, Barcelona and beyond.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC 3D Design: Model Making for the Creative Industries; OR\n* First year HND 3D Design: Model Making for the Creative Industries.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you're asked to bring your best examples of both 2D and 3D art and design work, in original, photographic or portfolio form."
course.career_prospects = "Many graduates work as model makers all over the world, including New Zealand, Dubai and Australia.."
course.spaces = course_spaces
course.status = :open
puts '3D Design: Model Making for the Creative Industries (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Creative Printmaking (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Creative%20Printmaking%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Creative_20Printmaking_202nd_20Year_201600x1078.jpg'
end
course.description = "This course offers you an opportunity to develop your creative talents allowing you to develop traditional and contemporary printmaking, drawing and digital skills. Various printmaking techniques and media are explored and supplemented with technical and creative skills in digital media, drawing, bookbinding and mixed media.\n\nThis course combines practical skills with theoretical knowledge and is project based. It is delivered through a series of lectures, practical workshops and activities. You'll produce a portfolio of work that will support entry to employment or degree level courses.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Creative Printmaking; OR\n* First year HND Creative Printmaking.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide examples of your art, photography, or design work."
course.career_prospects = "On completion of the course, you can pursue a career as a practicing Artist, Printmaker, Designer, Print Technician, or as a Printmaking Educator.."
course.spaces = course_spaces
course.status = :closed
puts 'Creative Printmaking (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Accounting HNC'
course.category = Category.find_by_name 'Accounting'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_calculator_pen_0.jpg').open
else
  course.image.filename = 'Business_calculator_pen_0.jpg'
end
course.description = "The HNC Accounting Award has been designed to meet the demands and requirements of the Accounting Industry. \n\nOpportunities are provided to develop your skills, knowledge and understanding in preparation for employment, or for progression to courses such as AAT level 8, or HND Accounting.  Further detail of the topics covered is provided in the section \"What You Study\" below. \n\nYou'll be assessed throughout this course with the assessments taking the form of practical assessments, assignment and case studies. Towards the end of your course you'll undertake a Graded Unit examination, which is designed to assess your ability to integrate the knowledge and skills gained through the mandatory units. \n\nThroughout the course you'll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience. \n\nYou'll be required to attend college on 4 days every week from 9 am to 5 pm for one academic year.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One relevant* Higher at grade C or above; OR\n* Three relevant National 5 courses at grade A; OR\n* Successful completion of an NC/NQ** containing more than one unit at SCQF level 6; OR\n* Relevant work experience will be considered where employer referee details have been supplied.\n* Equivalent qualifications will be considered.  \n*Qualifications cannot include any from the following list: Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL.\n\n**Internal applicants must complete all 16 credits undertaken in the NC qualification. \n\nYou'll be invited to attend a compulsory interview. The interview dates are:\n\n* Thursday 30 March 2017 at 9.30 am\n* Thursday 27 April 2017 at 1.30 pm\nThe interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You'll be given the opportunity to ask questions. You must bring a copy of qualification certificates."
course.career_prospects = "This course prepares you for a career in:\n\n* Bookkeeping.\n* Financial and/or Management Accounting.\n* Accounts Technician.\n* Assistant Accountant.\n* Accounts Supervisor.\n* Financial Reporting.\n* Taxation.\nContinuing Study\n\nYou can progress to HND Accounting, or AAT Level 8 (Advanced Diploma) on successful completion of this course."
course.spaces = course_spaces
course.status = :cancelled
puts 'Accounting HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Architectural Technology HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Architecture_boy_on%20_laptop.jpg').open
else
  course.image.filename = 'Architecture_boy_on_20_laptop.jpg'
end
course.description = "This course gives you a technician level qualification, combining a broad first year curriculum with a specialist second year curriculum. It'll give you the skills required for employment in this high demand industry sector.\n\nYou'll also have the opportunity to go on site visits around the West of Scotland, to give you an understanding of contemporary relevance.\n\nThis is a two-year HND which accepts direct entrants to year two.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes, preferably including Mathematics or a science, OR\n* A National Certificate in Built Environment or equivalent qualification at SCQF level 6, OR\n* Relevant experience and the ability to show the commitment and capacity required to cope with the academic content of the course.\n* HNC in Construction.\n* It may also be possible to gain entry with an HNC in Architectural Technology. This will depend on the units that have been covered in the HNC. Students who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career as an Architectural Technician, or Architectural Technologist in a variety of sectors including:\n\n* Built Environment.\n* Construction.\n* Property.\n* Private consultant practices (architects and surveyors).\n* Design and build services divisions of construction contractors.\n* Local authorities.\n* Health trusts.\n* Housing associations.\n* Building component manufacturers.\n* Government organisation."
course.spaces = course_spaces
course.status = :open
puts 'Architectural Technology HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Building Surveying HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Construction_2_1.jpg').open
else
  course.image.filename = 'Construction_2_1.jpg'
end
course.description = "This stimulating, learner-focused course is delivered by highly professional teaching staff, with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nThe technician level qualification combines a broad-based first year curriculum with a more specialist second year curriculum, which will provide you with the skills required for employment in this sector.\n\nThis is a two-year HND which accepts direct entrants to year two of the course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher passes, preferably including Mathematics or a science, OR\n* A National Certificate in Built Environment or equivalent qualification at SCQF level 6, OR\n* Relevant construction industry experience and the ability to show the commitment and capacity needed to cope with the academic content of the course.\nHNC in Construction. It may also be possible to gain entry with an HNC in Building Surveying. Students who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career in:\n\n* Private practice surveying firms.\n* Government and public authorities.\n* Building control departments.\n* Construction companies.\n* Facilities management.\n* Property companie."
course.spaces = course_spaces
course.status = :open
puts 'Building Surveying HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Built Environment HNC'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Architecture_boards.jpg').open
else
  course.image.filename = 'Architecture_boards.jpg'
end
course.description = "This course is a technician level qualification that will provide you with the basics you'll need to enter into a career in the Built Environment. During the course you'll:\n\nThe course is a great way into a career in the Construction Industry. It's also an ideal course for those who want to pursue a technician level career in the industry, but haven't yet chosen a specialism.\n\nOn completing the course, you can progress straight to the second year HND programme without having to do any extra units.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher Grade pass, preferably Maths or a Science; OR\n* National Certificate in Built Environment, or equivalent qualification at SCQF level 6; OR\n* Relevant Construction Industry experience.\nYou also need to show you'll be able to cope with the academic content of the course.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "You might work as a Technician, or Junior Manager in the built environment and construction sector – architectural technology, quantity surveying, estimating, building surveying and construction management."
course.spaces = course_spaces
course.status = :open
puts 'Built Environment HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Computer Aided Architectural Design & Technology HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/CompAidedArchDesignTechHND.jpg').open
else
  course.image.filename = 'CompAidedArchDesignTechHND.jpg'
end
course.description = "This is a technician level qualification that provides a specialist curriculum focused on the application of Computer Aided Design software in a construction specific context underpinned by a Construction Industry specific curriculum. It will equip you with skills required for employment in this specialist industry sector.\n\nAn Architectural Technologist is a specialist in the technological aspects of building design and construction, bridging the gap between design theory and construction practice (find the job profile here).\n\nThis course is delivered by highly professional teaching staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nDuring your studies you'll:\n\nIf you are looking for architectural inspiration - Our Riverside Campus won ‘The Architectural Excellence Award for a Public Building\" last year! \n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "You'll be invited for a group and/or individual interview where you'll get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course.career_prospects = "* Architectural CAD Technician or Building/Civil Engineering Technicia."
course.spaces = course_spaces
course.status = :closed
puts 'Computer Aided Architectural Design & Technology HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Construction Management HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Construction%20Management%201600x1078%20.jpg').open
else
  course.image.filename = 'HND_20Construction_20Management_201600x1078_20.jpg'
end
course.description = "This stimulating, learner-focused programme is delivered by highly professional teaching staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nThe HND Construction Management is a technician level qualification that combines a broad-based construction industry specific first year curriculum with a more specialist second year curriculum, teaching you the skills you need for employment in this highly demanding sector.\n\nConstruction Managers (also known as Project Managers, Site Managers and Site Agents) supervise and direct operations on a construction project to make sure it is completed safely, on time and within budget. To do this well, a Construction Manager needs to be good at organising and planning; motivating and managing people; and creatively solving problems.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes, preferably including Mathematics or a Science; OR\n* A National Certificate in Built Environment or equivalent qualification at SCQF level 6; OR\n* Relevant construction industry experience and the ability to evidence the commitment and capacity required to cope with the academic content of the course.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career as a Higher Technician, or Junior Manager in both the public and private sector, in areas including: built environment, the construction sector, construction management, site engineering, estimating, and construction project planning."
course.spaces = course_spaces
course.status = :open
puts 'Construction Management HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Quantity Surveying HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Constuction_hardhats_2.jpg').open
else
  course.image.filename = 'Constuction_hardhats_2.jpg'
end
course.description = "Quantity Surveyors (also known as a Construction Cost Consultants or Commercial Managers) manage all costs relating to building and civil engineering projects, from the early design plans, through to completion. Quantity Surveyors seek to minimise the costs of a project and enhance value, while still achieving the required standards and quality. Many of these are specified by statutory building regulations, which the surveyor needs to understand and adhere to.\n\nThe HND in Quantity Surveying is a technician level qualification that combines a construction industry specific first year curriculum with a more specialist second year curriculum that equips you with the skills required for employment in this specialist industry sector.\n\nYou'll be taught by staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes, preferably including Mathematics or a Science; OR\n* A National Certificate in Built Environment or equivalent qualification at SCQF level 6; OR\n* Relevant construction industry experience and the ability to evidence the commitment and capacity required to cope with the academic content of the course.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career in private practice QS consultancies, contracting organisations, property companies, financial institutions, local and central government, commercial clients, and housing associations."
course.spaces = course_spaces
course.status = :open
puts 'Quantity Surveying HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Engineering Systems HNC'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/engineering_systems_0.jpg').open
else
  course.image.filename = 'engineering_systems_0.jpg'
end
course.description = "Are you interested in gaining an excellent all round knowledge of how engineering systems function and contribute to the modern day industrial applications? Then this course could be for you.\n\nThis is a highly practical course designed to prepare you for ‘Real life’ scenarios encountered within current working environments. The diversity of the subjects studied within the framework gives you the opportunity to explore various disciplines including Mechanical Engineering, Systems Engineering and Renewable energies. \n\nYou'll be taught by staff with significant engineering experience and a proven track record of bringing out the best in their students.\n\nOn successful completion of this course you can pursue a career in engineering at Engineer or Technician level. \n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher from Physics, Technological Studies, Mechatronics or Mathematics and at least three Standard Grades 1-2/Intermediate passes including Mathematics, Physics/Technological Studies and English.\n* A National Certificate Group Award in Engineering Systems\n* You'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you are interested in this subject are"
course.career_prospects = "Career\n\nYou have the opportunity to further their careers in the Manufacturing, Mechanical and Maintenance service sectors.\n\nContinuing Study\n\nConsider studying to HND level in Engineering Systems with the potential to progress to University degree level."
course.spaces = course_spaces
course.status = :cancelled
puts 'Engineering Systems HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Engineering: Mechanical HNC'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/engineer_workshop.jpg').open
else
  course.image.filename = 'engineer_workshop.jpg'
end
course.description = "Looking to become an engineering technician? This course gives you the skills, knowledge and understanding that you’ll need for a career in mechanical engineering. Successful completion of this HNC also gives you entry to Higher National Diploma or degree courses.\n\nYou’ll be able to use state of the art facilities at the college – such as our fully equipped engineering workshop, pneumatic and hydraulic labs and computer labs running CAD software.\n\nYou'll be taught by staff with significant engineering experience and a proven track record of bringing out the best in their students.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC in an appropriate Mechanical Engineering subject; OR\n* Two Higher Grades – Maths and one other (preferably Physics).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career as an Engineering Technician."
course.spaces = course_spaces
course.status = :cancelled
puts 'Engineering: Mechanical HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Electronic Engineering HND'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/electronic_class_0.jpg').open
else
  course.image.filename = 'electronic_class_0.jpg'
end
course.description = "Electronic engineers solve 21st century problems for industry and society. This course starts with you building and testing your own CityBytes microcomputer board. The board is integrated into the study of electronic circuits and you'll also use it to learn how to program embedded devices using ‘C’ programming language. The board can be used as a Bluetooth device, a game controller, a logic designer and hybrid audio amplifier. It even comes with an Android, or Windows mobile app.\n\nThe course reinforces theory with extensive practical work culminating in a substantial practical project. In previous years, projects have included a programmable drone, an ultra-sonic tape measure, a solar powered baby incubator for disaster areas, a keyboard, and a remote control mini search and rescue vehicle.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.\n\nWe are updating some of our course titles and would be grateful if you could take 2 minutes to complete our short survey.  Thank you in advance for your feedback."
course.entry_requirements = "* Two Higher passes, one in Maths and preferably Physics; OR\n* Other qualifications and experience.\nYou'll need a good grounding in maths for entry to the course.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career as an Electronics Technician Engineer."
course.spaces = course_spaces
course.status = :cancelled
puts 'Electronic Engineering HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Electronic Engineering HNC'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/electronics_girl.jpg').open
else
  course.image.filename = 'electronics_girl.jpg'
end
course.description = "This course teaches the basics you'll need to pursue a career as an Electronic Engineer. The journey to becoming a professional engineer starts by building and testing your own CityBytes microcomputer board (Watch the brief CityBytes video here).\n\nThe board is used to study electronic circuits and learning how to program embedded devices, using ‘C’ programming language. The board can be used as a Bluetooth device, a game style gesture controller, a logic designer and hybrid audio amplifier. It even comes with an Android or Windows mobile app.\n\nThe majority of our students progress to HND Electronics and use the board as a template when designing their own project.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/.\n\nWe are updating some of our course titles and would be grateful if you could take 2 minutes to complete our short survey.  Thank you in advance for your feedback."
course.entry_requirements = "* Two Higher grades (grade C or better). Maths and a science subject, preferably Physics; OR\n* An NC in an appropriate engineering subject.\nMature students who don’t meet these requirements will be considered on the basis of their experience.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career as an Electronics Technician in electronic manufacturing and service industries, including construction, installation and repair of electronic equipment and systems."
course.spaces = course_spaces
course.status = :open
puts 'Electronic Engineering HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Engineering: Electrical HND'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Electrical%20Engineering1.jpg').open
else
  course.image.filename = 'HND_20Electrical_20Engineering1.jpg'
end
course.description = "On this Electrical Engineering course, you'll expand on the electrical principles covered in National 5 and Higher level. During the course you'll be taught by staff with significant industry experience to develop your skills over a range of science disciplines.\n\nMany of the course modules are project based with report writing included in second year modules. The course is also designed for higher level technicians in the Electrical Engineering Industry which deals with the production, transmission, distribution and application of electricity and the manufacture, installation and maintenance of electrical equipment.\n\nThe course can also be studied over three years on a day-release top-up programme, after completion of the Higher National Certificate in Electrical Engineering.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC in an appropriate Engineering subject; OR\n* Two higher Grades - Maths and one other (preferably Physics).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career as a Technician Engineer.\n\nContinuing study -\n\nSuccessful students can progress to degree courses in related areas. Successful students may progress to studying an HND at the College, or enter year two of B Eng Electrical Power Systems at Glasgow Caledonian University."
course.spaces = course_spaces
course.status = :open
puts 'Engineering: Electrical HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Engineering: Electrical HNC'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/ENGINEERING-%20ELECTRICAL%20HNC.jpg').open
else
  course.image.filename = 'ENGINEERING-_20ELECTRICAL_20HNC.jpg'
end
course.description = "This course prepares you to become a Technician, or Technical Engineer in the Electrical Engineering Industry which deals with the production, transmission, distribution and application of electricity and the manufacturing, installation and maintenance of electrical equipment.\n\nDuring the course, we will cover electrical circuit analysis using the latest available software packages, and laboratory analysis will be conducted on magnetic principles and practical electrical machines.\n\nAt the end of the course there will be a graded exam. Successful completion of the course allows you to apply for a position to the second year of the HND Electrical Engineering course.\n\nThere is also a part-time HNC Electrical Engineering course which runs over two years, requiring one day's study a week.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC in an appropriate Engineering subject; OR\n* Two Higher Grades – Maths and one other (preferably Physics).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career as a Technician Engineer."
course.spaces = course_spaces
course.status = :closed
puts 'Engineering: Electrical HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Accounting HND'
course.category = Category.find_by_name 'Accounting'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Accounting_HND.jpg').open
else
  course.image.filename = 'Accounting_HND.jpg'
end
course.description = "The HND Accounting Award has been designed to meet the demands and requirements of the accounting industry. Opportunities are provided to develop your skills, knowledge and understanding in preparation for employment or for progression to further study at university, or for courses run by professional accounting organisations like ACCA, CIPFA and CIMA. Further details of the topics covered is provided in the section \"what you study\" below. \n\nYou'll be assessed throughout this course with the assessments taking the form of practical assessments, assignment and case studies. Towards the end of the first year of the course you'll undertake a Graded Unit examination, which is designed to assess your ability to integrate the knowledge and skills gained through the mandatory units. There are a further 2 Graded Units in the second year of the HND – a project based Graded Unit and a Graded Unit examination. \n\nThroughout the course you'll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience. \n\nYou'll be required to attend college on 4 days every week from 9 am to 5 pm for two academic years.\n\nThis course accepts year two direct entrants only for applicants who have already attained HNC Accounting. \n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two relevant* Highers at grade C or above; OR\n* Successful completion of an NC/NQ** with a minimum of 2 units at SCQF level 6; OR\n* Relevant work experience will be considered where employer referee details have been supplied.\n* Equivalent qualifications will be considered. \n*Qualifications cannot include any from the following list: Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL.\n\n**Internal applicants must complete all 16 credits undertaken in the NC qualification. \n\nYear 2\n\n* Successful completion of a full time HNC Accounting course with 15 credits, with a Grade A in the graded unit and all mandatory units, OR\n* Successful completion of a part time HNC Accounting course with 12 credits, with a Grade A in the graded unit and all mandatory units.\nApplications for HND Accounting year 2 will not be processed until June 2017.\n\nYou'll be invited to attend a compulsory interview. The interview dates are:\n\n* Thursday 30 March 2017 at 1.30pm\n* Thursday 27 April 2017 at 9.30am\nThe interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You will be given the opportunity to ask questions. You must bring a copy of qualification certificates."
course.career_prospects = "This course prepares you for a career in:\n\n* Bookkeeping.\n* Financial and/or Management Accounting.\n* Accounts Technician.\n* Assistant Accountant.\n* Accounts Supervisor.\n* Financial Reporting.\n* Management Accounting.\n* Taxation."
course.spaces = course_spaces
course.status = :closed
puts 'Accounting HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Supply Chain Management HND'
course.category = Category.find_by_name 'Business & Procurement'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/accounting_keyboard_book_2.jpg').open
else
  course.image.filename = 'accounting_keyboard_book_2.jpg'
end
course.description = "This course will provide you with the knowledge and skills you need to work within the operational supply chains of a business organisation.\n\nThe course is delivered by highly qualified lecturers who have a wealth of experience within the industry. You'll gain insight, learning and transferable skills across all core operational areas of supply chain management, procurement, logistics, storage and operations.\n\nCareer prospects and employment opportunities are excellent with many of our students progressing to degree level study and careers within supply chain management or international logistics (please see the \"After the Course \"section, below, to find out more).\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework: visit www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes at grade C or above including English (Modern Studies, Economics, History or Business); OR\n* Adult learners with some relevant experience, or who hope to move into this area, may be accepted subject to interview.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career in supply chain management, procurement, and international Logistics across all  major industry sectors."
course.spaces = course_spaces
course.status = :closed
puts 'Supply Chain Management HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Computing: Software Development HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/ComputingSoftwareDevelopment_HND.jpg').open
else
  course.image.filename = 'ComputingSoftwareDevelopment_HND.jpg'
end
course.description = "This is a challenging course, where you'll study towards an up-to-date qualification covering many of the skills that are in demand for a range of different careers in the software development / programming sector of the Computer Industry.\n\nThese include developing skills in C#, VB.NET, Java, Object Oriented Design, Object Oriented Programming, SQL Programming and Project Management.\n\nThe 2012 Technology Insights Report from e-skills UK stated: \"The technical skills most often called for by employers were: SQL, .NET (VB and C#) and Java.\"\n\nIt also stated: \"Through to 2020 Software Professionals show the highest forecast employment growth of all IT &amp; Telecoms occupations.\"\n\nThis course will help prepare you for either employment or progression to university in computing, a skill set that is currently in high demand.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two appropriate Highers and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* Two Highers and three Standard Grades at Credit Level; OR\n* Two Highers and three National 5 qualifications.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career in software development, web design/development, and information systems development..="
course.spaces = course_spaces
course.status = :open
puts 'Computing: Software Development HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Computing: Software Development HNC'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_Boy_with_wires.jpg').open
else
  course.image.filename = 'Computing_Boy_with_wires.jpg'
end
course.description = "According to Technology Insights Report from e-skills UK, \"Through to 2020 Software Professionals show the highest forecast employment growth of all IT &amp; Telecoms occupations.\"\n\nTherefore, this hands-on course will allow you to study towards an up-to-date qualification, covering many of the skills that are in high demand for a range of different careers in the software development / programming sector of the computer industry. These include developing skills in C# and Java, System Design, Android Development, XML, Event Driven Programming and Project Management. \n\nThis stimulating, learner focused programme will be delivered to you by our highly professional teaching staff with significant software development experience and a proven track record of bringing out the best in their students.\n\nThis course will prepare you for either employment in a junior developer role within the IT Industry or progression to HND Software Development second year. Also, this course provides you with the entry level to a wide range of university courses in computing.\n\nYou'll receive a HNC Computing / HNC Computing: Software Development qualification on successful completion of the course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher* and three National 5 qualifications; OR\n* One appropriate Higher* and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* One Higher* and three Standard Grades at credit level; OR\n* A national qualification at SCQF Level 6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR\n* Other equivalent qualifications or experience.\n*in one of these subjects:  Computing, Information Systems, Maths, Physics, Chemistry or any relevant subject.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "You have an opportunity to continue studying with us, progressing on to HND Software Development 2nd year as long as you meet the entry requirements: 15 credits, very good attendance in HNC and a very good reference from your lecturers."
course.spaces = course_spaces
course.status = :cancelled
puts 'Computing: Software Development HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Computing: Technical Support HNC'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/ComputTechSupHNC.jpeg').open
else
  course.image.filename = 'ComputTechSupHNC.jpeg'
end
course.description = "There is a shortage of people who are qualified to carry out desktop support roles in industry. This first year HNC course introduces you to some of skills that are in demand in many support roles in the IT industry; including learning skills in desktop support and systems administration. You’ll cover the basics of computer networking and will also learn how the components of a computer/laptop device function.\n\nThis particular unit is taught using the Cisco Networking Academy online material and success in this unit may allow you to also sit the vendor Cisco IT Essentials qualification at the end of the second term. \n\nThe course contains a mixture of practical and theoretical material and does involve independent research, study and report writing. Although you'll use the Windows environment in class, you'll also learn how to use the Linux operating system.\n\nThe technical units on this course, such as those dealing with the Windows and Linux operating systems and the networking elements of the course, are taught by lecturers who have extensive working knowledge of these systems and are Cisco/Microsoft certified practitioners.\n\nOn completion of the course, you may have the opportunity to work for companies such as Dell and Ericsson in a technical support/networking role.\n\nAfter successfully completing a first year HNC you'll receive the HNC Computing qualification. After completing the second year of an HND you'll receive the HND Computing: Technical Support qualification.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One appropriate Higher and three Intermediate 2 or National  5 qualifications (at least one of these should include a computing related qualification and/or English/Maths OR\n* One Higher and three Standard Grades (including English/Maths, all at credit level OR\n* A National Qualification at level 6 in a closely related subject (such as Digital Media Computing, Computing: Technical Support or Software Development OR\n* Other equivalent qualifications or experience.\nDepending on your qualifications, you may be invited for an individual interview or group information session where you can find out more about the course and decide if it’s the right one for you."
course.career_prospects = "This course prepares you for a career in IT infrastructure support."
course.spaces = course_spaces
course.status = :closed
puts 'Computing: Technical Support HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Administration and Information Technology HNC'
course.category = Category.find_by_name 'Administration, Human Resources & Law'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_boy_with_pen_1.jpg').open
else
  course.image.filename = 'Business_boy_with_pen_1.jpg'
end
course.description = "This course provides you with a broad range of office-based skills and knowledge required to undertake a career in office administration. You’ll develop specialist skills in ICT, desktop publishing, communication, research and planning (please see further information in the 'what you study' section below).\n\nThis stimulating, learner focused programme will be delivered to you by our highly professional teaching staff with significant office administration experience and a proven track record of bringing out the best in their students.\n\nOn successful completion of this course, you'll be awarded with a HNC Administration and Information Technology.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher pass in a relevant* academic subject OR\n* National Certificate in Administration (with at least 3 units at level 6) OR\n* Other appropriate and relevant National Certificate courses (with at least 3 units at level 6) may be considered.\n* Relevant office work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course.career_prospects = "This course prepares you for a career as a Personal Assistant or Administrator in the public and private sectors."
course.spaces = course_spaces
course.status = :open
puts 'Administration and Information Technology HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Administration and Information Technology with Digital Communication HNC'
course.category = Category.find_by_name 'Administration, Human Resources & Law'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/admin%20%26%20IT%20HNC%20Course.jpg').open
else
  course.image.filename = 'admin_20_26_20IT_20HNC_20Course.jpg'
end
course.description = "The increased digitisation of the workplace has meant there is a demand for administrators to have increased digital skills; this course is an excellent opportunity for you to study and train for a career in various administration positions with excellent career opportunities and progression routes.\n\nYour programme will be delivered by highly professional teaching staff with significant industry experience and a proven track record of bringing out the best in their students. To find out what units you'll cover, please read the 'What you Study' section, below.\n\nOn successful completion of this course, you'll be awarded with a HNC Administration and Information Technology with Digital Communications\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher pass in a relevant* academic subject OR\n* National Certificate in Administration (with at least 3 units at level 6) OR\n* Other appropriate and relevant National Certificate courses (with at least 3 units at level 6) may be considered.\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course.career_prospects = "This course would help you to gain various administration positions in both the public and private sectors."
course.spaces = course_spaces
course.status = :open
puts 'Administration and Information Technology with Digital Communication HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Business Diploma of Higher Education'
course.category = Category.find_by_name 'Business & Procurement'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/BusinessDiplomaofHE.jpg').open
else
  course.image.filename = 'BusinessDiplomaofHE.jpg'
end
course.description = "This course is designed to give you direct entry into the third year of the BA degree programme in Business at Strathclyde Business School, a qualification highly regarded by employers. It is run as a collaboration between City of Glasgow College and the University of Strathclyde, Glasgow.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* A minimum of three Higher Grade passes, 2 at Grade B and 1 at grade C in suitable academic subjects *, one of which must be English (or equivalent).  AND\n* Two other passes at National 5 (or equivalent) including Mathematics.\n* relevant academic subjects include Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or Natural Sciences.\n\nYou'll be invited to attend a group presentation and interview session. The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course.career_prospects = "This course prepares you for a career in marketing, legal services, management, human resources, administration in industrial and commercial sectors, teaching, public sector employment or research."
course.spaces = course_spaces
course.status = :cancelled
puts 'Business Diploma of Higher Education saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = '3D Computer Animation HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_digitalmedia.jpg').open
else
  course.image.filename = 'Computing_digitalmedia.jpg'
end
course.description = "This hands-on course helps you develop the skills needed to become a 3D Digital Developer, incorporating live industry related projects in a range of different 3D animation disciplines.\n\nSome students may gain internships and summer placements while studying at the college.This course also accepts year two direct entrants.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two appropriate Highers and three Intermediate 2 courses (including at least one from Computing, Information Systems, Graphic Communications or equivalent), OR\n* Two Higher passes and three Standard Grades at credit level or above, OR\n* A national qualification at SCQF Level 5 or 6 in a related subject such as Digital Media Computing, Computer Arts and Animation.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "After completing the HND you can apply for jobs in areas of the Communication Industry, including design consultancies, advertising agencies, newspaper and magazine publishing, web design and motion graphics for screen, or in-house design studios.\n\nYou may eventually become self-employed as a Graphic Designer."
course.spaces = course_spaces
course.status = :cancelled
puts '3D Computer Animation HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Art Glass Design HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/decorative_glass_lady_0.jpg').open
else
  course.image.filename = 'decorative_glass_lady_0.jpg'
end
course.description = "The HND Art Glass Design course is for you, if you want to follow a career in art glass design and production. This course offers you a broad education with a balance between creative, practical and core skills.  \n\nYou’ll work in two and three dimensions, learning contemporary warm glass techniques like slumping and fusing and traditional skills like copper foil and lead work, as well as more advanced glass surface applications.\n\nPrevious students have gone on to become glass technicians, self-employed glass artists or used their skills within a larger design studio; designing and manufacturing stained glass panels, household items and jewellery. Visit the Contemporary Glass Society for more useful resources.\n\nIf you want a recognised art glass industry qualification: This course offers the only HND certified glass work course in Scotland!\n\nFollow the latest trends in the creative industries, visit The Pulse\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher in Art and Design and two National 5 Qualifications (or equivalent), OR\n* NC/NQ in an Art and Design subject.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to show examples of your art and design work."
course.career_prospects = "The HND course may lead to a job in the art glass industry or self-employment."
course.spaces = course_spaces
course.status = :open
puts 'Art Glass Design HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Creative Printmaking HND'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Creative%20Printmaking.jpg').open
else
  course.image.filename = 'HND_20Creative_20Printmaking.jpg'
end
course.description = "This course offers you an opportunity to develop your creative talents allowing you to develop traditional and contemporary printmaking, drawing and digital skills.\n\nVarious printmaking techniques and media are explored and supplemented with technical and creative skills in digital media, drawing, bookbinding and mixed media.\n\nThis course combines practical skills with theoretical knowledge and is project based. It is delivered through a series of lectures, practical workshops and activities. You'll produce a portfolio of work that will support entry to employment or degree level courses.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* An NC/NQ qualification in Print, Art and Design, Graphic Design, illustration or equivalent SVQ, OR\n* Higher Art and Design and English at minimum Intermediate level 2 or National 5; OR\n* Relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide examples of your art, photography, or design work."
course.career_prospects = "On completion of the course, you can pursue a career as a practicing Artist, Printmaker, Designer, Print Technician, or as a Printmaking Educator."
course.spaces = course_spaces
course.status = :closed
puts 'Creative Printmaking HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Display Design for Retail HND'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Display%20Design%20for%20Retail.jpg').open
else
  course.image.filename = 'HND_20Display_20Design_20for_20Retail.jpg'
end
course.description = "The role of the Display Designer is to create a three-dimensional environment that tells a story. This may be about a collection, a brand or simply an idea. Display Designers use a range of media and technologies in order to effectively communicate messages in space.\n\nOutside London, this is the UK’s only further education course in Retail Display Design at this level. This two-year course will provide you with a wide understanding of all aspects of design necessary for a career in retail display design.\n\nThis course will involve:\n\nThe course is very vocational and has direct links to the retail sector, which will prepare you for employment in the Industry, after successfully completing your qualification.\n\nFocusing on three-dimensional design, you’ll develop your creative abilities and artistic skills. You’ll also learn the personal and professional effectiveness you’ll need for a career in the retail display sector through work experience placements.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Higher Art &amp; Design and English at minimum Intermediate 2; OR\n* NC in Art &amp; Design or Illustration; OR \n* Related experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "Demand for retail display designers is continuous within the retail sector. Previous students are employed by national and international companies such as Levi's, French Connection, Ikea, Frasers, BHS, Marks and Spencer and John Lewis."
course.spaces = course_spaces
course.status = :open
puts 'Display Design for Retail HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Art and Animation HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/animation.png').open
else
  course.image.filename = 'animation.png'
end
course.description = "This is a broad based course that develops your creative and technical animation skills, encompassing both traditional animation techniques and digital practices. \n\nDuring your time on the course you'll have the opportunity for study trips at both home and abroad. Recent trips have included Berlin, Amsterdam, the Outer Hebrides, Edinburgh and the art galleries of Glasgow.    \n\nIn addition the course prides itself in providing relevant industrial experience and you would be expected to complete a range of live and client led projects. \n\nView Computer Arts and Animation on Vimeo.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC in Art and Design, Graphic Arts portfolio, Illustration or Graphic Design, OR\n* Art and Design at Higher and English at minimum Intermediate 2, OR\n* Art and Design at Higher and English at National 5 level.\nYou'll also be expected to submit examples of your art and design work, including figure drawings to support your application. If you don’t have the required qualifications, we’ll consider you for a place based on your experience and examples of your work.\n\n* An HNC in Computer Arts and Design or an equivalent level qualification.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n\nYou'll be expected to show examples of your art &amp; design work at the interview."
course.career_prospects = "Students who complete their HND can progress to a career in motion graphics as an: animator, storyboard artist, layout artist, character developer, compositor, vfx designer and other related specialist.\n\nThere are opportunities for employment in-house or as a self-employed freelancer working for animation studios, VFX companies, BBC, STV, TV production companies, wed design studios, advertising agencies, and other clients requiring animation or motion graphics sequences."
course.spaces = course_spaces
course.status = :open
puts 'Art and Animation HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Digital Art and Culture HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/digCulture-web.jpg').open
else
  course.image.filename = 'digCulture-web.jpg'
end
course.description = "The Digital Art and Culture course provides a foundation in art and design and the opportunity for you to develop project-based work in new media, mixed media, digital video, digital sound, interactive media and other forms of computer art.\n\nSuccessful graduates are now working in a range of creative industry jobs, from new media artists to games designers and from front-end web developers to filmmakers. So if you're curious about how artists and designers can work with new and emerging technologies then this could be the course for you.  \n\nDuring your time on the course you'll have the opportunity for study trips at both home and abroad. Recent trips have included Berlin, Amsterdam, the Outer Hebrides, Edinburgh and the art galleries of Glasgow.    \n\nIn addition the course prides itself in providing relevant industrial experience and you would be expected to complete a range of live and client led projects.\n\nFollow the latest trends in new media, animation and other forms of computer art on the Computer Arts and Design Facebook page.\n\nView the Digital Art and Culture's course pages on Youtube or Vimeo:\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* National Certificate in Art and Design or related subject; OR\n* One Higher in Art and Design and English at minimum Intermediate 2; OR\n* One Higher in Art and Design and English at National 5 level; OR\n* Relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "This course will create career opportunities in: cross-media art, interactive digital media, film and moving image, time-based art, education and community arts."
course.spaces = course_spaces
course.status = :open
puts 'Digital Art and Culture HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Digital Media HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND_DigitalMedia_1600x1078_IMAGE1.jpg').open
else
  course.image.filename = 'HND_DigitalMedia_1600x1078_IMAGE1.jpg'
end
course.description = "This new Digital Media course will develop your creative and technical skills, in the production of screen based graphic design and media content for interactive and multimedia applications, such as web, mobile app, motion graphics and VFX.\n\nDuring the course you'll be taught by staff with significant Digital Media experience and a proven track record of bringing out the best in their students.\n\nThe course is delivered mainly through practical projects in the studio and state-of-the-art labs, using industry standard software and techniques.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* National Certificate in Art and Design or related area; OR\n* Higher Art and Design or Graphic Communication and English at minimum Intermediate 2; OR\n* Higher Art and Design or Graphic Communication and English at National 5 Level; OR\n* Relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "After the HND you can apply for jobs in the Communication Industry, such as with design consultancies, advertising agencies, on line publishing, web design, television and film production, motion graphics for screen, or in-house design studios.\n\nYou may eventually become employed as an Interactive, Multimedia, Web or Graphic Designer."
course.spaces = course_spaces
course.status = :closed
puts 'Digital Media HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Graphic Design HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Graphic%20Design%201600x1078_IMAGE1.jpg').open
else
  course.image.filename = 'HND_20Graphic_20Design_201600x1078_IMAGE1.jpg'
end
course.description = "This Graphic Design course prepares you for a career in the exciting and constantly developing area of graphic design. The course develops your creative ability and technical graphics skills, mainly through practical projects in the studio.\n\nThe course also encourages you to take responsibility for your own development. You'll build on your own creative concepts through research and development in the sketchbook, before producing finished work digitally.\n\nThe emphasis of the course is on layout of type and image, for both print and screen and the development of creative concepts.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Higher Art and Design and English at minimum Intermediate 2; OR\n* Higher Art and Design and English at National 5 Level; OR\n* NC in Art and Design, or related subject.\nYou'll be invited for a group and/or individual interview, where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "After completing the HND you can apply for jobs in areas of the Communication Industry, including design consultancies, advertising agencies, newspaper and magazine publishing, web design and motion graphics for screen, or in-house design studios.\n\nYou may eventually become self-employed as a Graphic Designer."
course.spaces = course_spaces
course.status = :open
puts 'Graphic Design HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Creative Industries: Professional Writing Skills HNC'
course.category = Category.find_by_name 'Drama & Creative Writing'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Drama_read_script_2.jpg').open
else
  course.image.filename = 'Drama_read_script_2.jpg'
end
course.description = "This course is for you, if you are looking for a career in writing. It will help you to develop the skills you'll need to work in a variety of fields. We cover scripting for TV and radio, short story writing, poetry and journalism, as well as vital freelance skills and industry knowledge.\n\nThis stimulating, learner-focused course is delivered by highly professional teaching staff, with significant Communications Industry experience and a proven track record of bringing out the best in their students.\n\nPrevious students on this course have had scripts produced, novels and poetry published, or worked professionally in a range of relevant disciplines. Others have gone on to complete degree and postgraduate courses.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* A Higher in English at minimum B or above or relevant group of units (e.g. Literature 1, Communication 4); OR\n* Relevant experience.\nYou'll be invited for a group pre-entry guidance session and individual interview where you can find out more about the course and tell us why you are interested in this subject.\n\nAt interview you'll be asked to write a short factual piece and provide a folio of three or four typed pieces of work. This may include poetry collections, short stories or prose extracts, script extracts, or journalism articles.\n\nPlease note that school essays are not suitable. "
course.career_prospects = "This course prepares you for a career in creative writing, freelance writing, journalism, script editing, scriptwriting or broadcasting. Previous students have gone on to work in publishing, script tutoring, ghost writing, and speech writing."
course.spaces = course_spaces
course.status = :open
puts 'Creative Industries: Professional Writing Skills HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Creative Industries: Radio HNC'
course.category = Category.find_by_name 'Media'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Radio_girl_on_live.jpg').open
else
  course.image.filename = 'Radio_girl_on_live.jpg'
end
course.description = "This course helps you to develop a range of radio production and broadcasting skills including production, interviewing, scripting, presentation, news, radio station operations, sound recording, commercial production and digital editing.\n\nYou can regularly contribute to the college radio station, and the course may also provide opportunities to work with major professional radio stations. \n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* ​NC Media or equivalent SVQ; OR\n* Higher English plus two National 5 Qualifications (or equivalent).\nYou'll be invited for a group pre-entry guidance session and individual interview where you can find out more about the course and tell us why you are interested in this subject.\n\nIt may strengthen your application to provide evidence of relevant experience or activity in the subject area, e.g. podcasting; involvement in community, hospital, online or school radio stations; music blogging; sound production or editing; relevant work experience or volunteering etc."
course.career_prospects = "There are opportunities in radio for those with a variety of up-to-date skills, broadcasting knowledge and experience. Alternatively, students can progress to further study either at City of Glasgow College or elsewhere subject to entry conditions."
course.spaces = course_spaces
course.status = :open
puts 'Creative Industries: Radio HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Practical Journalism HND'
course.category = Category.find_by_name 'Media'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Television_camera_0.jpg').open
else
  course.image.filename = 'Television_camera_0.jpg'
end
course.description = "This is a vocational and skills specific course suitable only for those who have a desire to pursue Journalism as a career.\n\nJournalists must have the essential skills of writing and research, but are now expected to record sound, shoot video and edit on digital systems. They are also increasingly expected to produce their own web content.\n\nYou'll acquire these skills on this course to enable you to position yourself for the world of work, or university.\n\nThere will be an opportunity to specialise in the area of journalism you are most interested in.\n\nWhy not connect with International Journalism Network and keep up to date with news and opportunities from journalists worldwide?\n\nYou'll be awarded a HND Practical Journalism on successful completion of this course. This course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "Two Highers in relevant subjects, at grade C or above, which must include Higher English and/or Higher Modern Studies OR NC Media or equivalent; AND\n\nSome practical skills in IT, including word processing, email and internet.\n\nYou'll be invited for a group pre-entry guidance session and individual interview where you can find out more about the course and tell us why you're interested in this subject. At your interview you will have to:\n\n* Write a 200 word article according to brief given on the day.\n* Correct the spelling, grammar and punctuation in a 300 word article.\n* Discuss the importance of journalism.\nIt would also strengthen your application to provide evidence of relevant experience in the area, e.g. blogging, podcasting, published articles, involvement in school newspapers, magazines or radio stations, relevant volunteering or work experience."
course.career_prospects = "Following this course, you can either apply for jobs in the industry or for a place at university."
course.spaces = course_spaces
course.status = :closed
puts 'Practical Journalism HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Photography HND'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/photography_figures_in_settings_2.jpg').open
else
  course.image.filename = 'photography_figures_in_settings_2.jpg'
end
course.description = "This highly competitive course provides you with the skills you need to start a career in photography, or a related area within the creative industries. This is a practice-based course with projects both in the studio and on location. Alongside technical skills, you're encouraged to work on self-reflection and evaluation through class feedback sessions.\n\nYou'll have an opportunity to work independently on self-initiated projects and to develop your own photographic ideas and briefs.\n\nWith a broad range of experienced staff on hand and industry standard facilities, this course is an excellent opportunity for those with a keen interest in photography, who want to develop that interest through full time study.\n\nYou'll continually update your photographic portfolio showcasing your most recent work.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* An NC/NQ in photography is preferred; OR\n* One Higher at minimum grade C or above in Photography plus 2 National 5 Qualifications (one in English preferred).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide a strong photographic portfolio of work."
course.career_prospects = "With an HND in photography, you'll be prepared for a position in the highly competitive creative and media sector including: advertising, commercial, press and photojournalism, fashion, sports, social, medical, scientific, throughout the UK and worldwide."
course.spaces = course_spaces
course.status = :cancelled
puts 'Photography HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Beauty Therapy HND'
course.category = Category.find_by_name 'Hair & Beauty'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Beauty_Complementary_Therapies_face.jpg').open
else
  course.image.filename = 'Beauty_Complementary_Therapies_face.jpg'
end
course.description = "The course offers a high level beauty qualification which will provide you with the knowledge of current beauty treatments, product ranges and techniques. An employment driven focus throughout all aspects of the course ensures that you are employment ready and have great success in developing careers within the ever expanding beauty sector.\n\nYou'll be taught by a highly motivated and versatile team with an excellent range of industrial expertise who deliver world class student focussed learning.\n\nThe department has been awarded The Herald look Awards Training Institution of the year and our students have gained Gold and Silver medals in World Skills UK.\n\nPlease note, prior beauty knowledge is not essential.\n\nThis course is offered with 2 different pathways – one for those with a qualification at NCGA Beauty Care Level 6 and the other for those with no prior beauty but have 2 Highers or equivalent.\n\nYou'll receive a HND Beauty Therapy award on successful completion of the course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "Direct Entry - No prior beauty qualification pathway\n\n* Two Higher grade passes. \nOR\n\n* NC Level 6 or HNC/D in any subject area.\nNCGA Beauty Care Level 6 pathway\n\n* NCGA Beauty Care Level 6.\nOR\n\n* NVQ/SVQ Level 3 Beauty.\n* You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course.\n* Excellent communication skills and an enthusiasm for the beauty industry is essentia"
course.career_prospects = "This course prepares you for a career in the Beauty Industry including roles in salons, health spas, cruise ships, or self-employment. A number of senior, or managerial posts may also be available to HND qualified therapists."
course.spaces = course_spaces
course.status = :open
puts 'Beauty Therapy HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Complementary Therapies HNC'
course.category = Category.find_by_name 'Hair & Beauty'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/CT_Reflexology_102.jpg').open
else
  course.image.filename = 'CT_Reflexology_102.jpg'
end
course.description = "Do you have a keen interest in therapy treatments, combined with the holistic approach to health and wellbeing, and enjoy working with people? If so, this could be the course for you.\n\nIn recent years there has been a considerable increase in interest and demand for complementary and holistic therapies; growth is expected to continue, providing employment opportunities to meet the demand from those seeking alternative ways to reduce stress and enhance feelings of general well-being. \n\nThis advanced level course develops skills involved within complementary therapies, including a variety of massage techniques, stress management and health and wellbeing. It will encourage you to examine alternative methods of enhancing general health and allow you to gain experience and confidence working with clients. The course is delivered by our dedicated lecturing team, who have high level skills and wide experience within the holistic and complementary therapies profession. \n\nYou'll be able to participate in volunteering opportunities throughout the year, offering treatments in a variety of settings.\n\nThe course aim is to produce qualified practitioners, eligible for professional membership and insurance as a Complementary Therapist. The qualification will also provide possible entry to HND, and then progression to degree level courses.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Highers at C or above (English and Science subject preferred); OR\n* NC Wellness Therapies; OR\n* NC Level 6 in Beauty Care; OR\n* Relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject.\n\nThis is a popular course, and you'll be expected to strongly communicate your enthusiasm for all aspects of its content."
course.career_prospects = "This course prepares you for a career in the field of complementary therapies, working in healthcare services, eg palliative care, therapy clinics, or within the spa industry. There are also opportunities for self-employment, eg providing a mobile therapy service."
course.spaces = course_spaces
course.status = :open
puts 'Complementary Therapies HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Fitness, Health and Exercise HND'
course.category = Category.find_by_name 'Sport & Fitness'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Sport_gym_workout_0.jpg').open
else
  course.image.filename = 'Sport_gym_workout_0.jpg'
end
course.description = "This course is most suited to those with an interest in the fields of fitness, health and exercise. The new framework has been developed to include industry recognition in the form of the endorsement by the Register of Exercise Professionals (REPS).\n\nYou can leave the course after Year 1 and achieve the HNC Fitness, Health and Exercise and Gym Instructor qualification.\n\nOn successful completion of Year two, you'll be awarded the Level 3 Personal Trainer accreditation.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* A minimum of 2 Highers one of which must be English; OR\n* A NQ/NC qualification at Level 6 in Sport and Fitness related subjects.\n* Relevant experience is advantageous.\n* Applications are welcome from those without formal qualifications who can demonstrate an active interest in sport or fitness.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. An element of the interview process will involve paired exercise where you demonstrate an exercise of your choice to a partner, highlighting safe and effective practice. Please bring suitable indoor gym wear."
course.career_prospects = "This course will suit individuals wishing to pursue careers in sports clubs, private fitness facilities, local authorities and government sport initiatives; ranging from personal training and exercise instruction, to teaching physical education, or working within sports science.\n\nYou may also look at self-employment in fitness, exercise prescription and athletic conditioning."
course.spaces = course_spaces
course.status = :closed
puts 'Fitness, Health and Exercise HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Professional Cookery HND'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Cooks_serving_food.jpg').open
else
  course.image.filename = 'Cooks_serving_food.jpg'
end
course.description = "Professional cookery has never been as popular as it is today. This course is an excellent opportunity for you to study and train for a career in catering with excellent career opportunities and progression routes.\n\nIn the first year, you'll develop your culinary skills to an advanced level and learn the knowledge you’ll need for a supervisory role in the Catering Industry. In the second year you'll combine culinary expertise and managerial skills. The course contains practical and theory units, which are assessed throughout (please see further information in the 'what you study' section below).\n\nExperience in the Hospitality Industry is an integral part of the course, and you’ll work towards the Industrial Experience unit.\n\nOn successful completion of tihs course, you'll be awarded with a HND in Professional Cookery.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Professional Cookery Year 2 / NC Professional Cookery (Level 6) or an appropriate group of National Units; OR\n* Other equivalent qualifications or experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "On completing your HND, you might progress to a career in catering, restaurants, and hospitality at a supervisory, or junior management level."
course.spaces = course_spaces
course.status = :open
puts 'Professional Cookery HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Events HNC'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Events_HNC.jpg').open
else
  course.image.filename = 'Events_HNC.jpg'
end
course.description = "This course will give you the skills, knowledge and understanding to develop a career in the organisation and management of conferences, exhibitions and special events.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher pass with a minimum of C, in an appropriate subject such as Business Management, English, Modern Studies, Economics, History; OR\n* NQ in Events or another relevant subject; OR\n* Other qualifications and relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "You could expect to go on to work in events across a range of industries."
course.spaces = course_spaces
course.status = :cancelled
puts 'Events HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Nautical Science/ Chief Mate Full / Master  HND'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/marine_D3.jpg').open
else
  course.image.filename = 'marine_D3.jpg'
end
course.description = "This course is designed for you to progress from OOW level (deck) to Chief mates level. The course requires that you have held a MCA approved OOW certificate and that you have had a position at sea for a period of 12 months. You'll also have completed the following short courses: HELM Management, NAEST Management and a Medical Care certificate.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* Recognised sea time of 12 months at OOW level\n* NAEST (M) certificate (to be valid when finally applying for your COC). The NAEST(M) course is scheduled within course progr"
course.career_prospects = "The course overall will equip you to become a competent and efficient Chief Mate."
course.spaces = course_spaces
course.status = :open
puts 'Nautical Science/ Chief Mate Full / Master  HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Marine Operations Scottish Professional Diploma'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Marine_class_teaching.jpg').open
else
  course.image.filename = 'Marine_class_teaching.jpg'
end
course.description = "If you're a school leaver with at least 120 UCAS points, this course will help you become a seagoing Deck Officers. It is structured into five distinct phases spent at college and sea.\n\nAt the end of the course you'll have gained a Professional Diploma in Marine Operations and your qualifications will allow you to be an Officer of the Watch (OOW) on a merchant vessel.\n\nYou'll be sponsored by a shipping company or training agency, who'll provide the sea phases on ships operating worldwide. Applications should be made via sponsoring companies, full details of which can be obtained from the Careers at Sea website: www.careersatsea.org\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* Standard Grade passes at grade 3 or above (maths to Grade 2); OR\n* GCSE passes at grade C or above; OR\n* A pass at Intermediate 2 in maths, English or a subject involving the use of English. A science subject with a significant content of a physical science; OR\n* National Certificate passes at National 5 in maths, English and a science subject\n* Plus Higher Level/A Level: One or more passes at Higher Level/A Level subjects, amounting to at least 120 points on the UCAS tariff system, one of which should preferably be maths or a physical science subject\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career at sea in the Merchant Navy and in a number of different sectors such as offshore, cruise ships, oil tankers, LNG and chemical tankers."
course.spaces = course_spaces
course.status = :open
puts 'Marine Operations Scottish Professional Diploma saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Nautical Science (Top up) HND'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Nautical_Science_Top_Up.jpg').open
else
  course.image.filename = 'Nautical_Science_Top_Up.jpg'
end
course.description = "This one-year program is suitable for those cadets who have completed MNTB/MCA approved HNC in Nautical Science.\n\nFor further information see http://www.careersatsea.org/."
course.entry_requirements = "* MNTB/MCA Approved HNC in Nautical Scienc"
course.career_prospects = "This course prepares you for a career at sea in the Merchant Navy and in a number of different sectors such as offshore, cruise ships, oil tankers, LNG and chemical tankers."
course.spaces = course_spaces
course.status = :cancelled
puts 'Nautical Science (Top up) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'UK Maritime and Coastguard Agency Officer of the Watch (Reg11/ 1) (including HNC Nautical Science)  HNC'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Marine_safetyboys_0.jpg').open
else
  course.image.filename = 'Marine_safetyboys_0.jpg'
end
course.description = "This is an exciting and challenging full-time course designed for serving deck ratings who want to obtain a UK Certificate of Competency at Officer of the Watch (STCW 95) level.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* Three years of acceptable sea service in a deck capacity; AND\n* An acceptable level of maths; AND\n* Completion of the City of Glasgow College Distance Learning Mathematics course (SCQF Level 6/"
course.career_prospects = "This course prepares you for a career as a Merchant Navy Deck Officer or shore-based employment in the shipping industry. You could apply for our higher level Deck Officer or Master Mariner qualifications, or a degree in maritime studies with various institutions. You could also look at progression to the second year of a Marine Operation degree course at Southampton Solent University."
course.spaces = course_spaces
course.status = :open
puts 'UK Maritime and Coastguard Agency Officer of the Watch (Reg11/ 1) (including HNC Nautical Science)  HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Marine Engineering for Cadets from International Partner Colleges HND'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Marine_climb_ladders.jpg').open
else
  course.image.filename = 'Marine_climb_ladders.jpg'
end
course.description = "This 2 year course, approved by the MCA, is for applicants aspiring to be Marine Engineer Officers on board merchant ships. It's offered in collaboration with our international partners in India and Pakistan.\n\nYour first year will be with our international partners with the second year at City of Glasgow College. There will be a phase at sea after which, you will return to the College to complete the EOOW courses.\n\nFor further information see http://www.careersatsea.org/."
course.entry_requirements = "* It is expected that those recruited onto the Marine Engineering Cadetship programme will have entry qualifications equivalent to Scottish Qualification Authority (SQA) Highers that include Maths, Physics, Technological Studies, or another science based subject all at level B or above\n* IELTS at 5.5\n* The International Department of the City of Glasgow College can offer qualification matching services if required."
course.career_prospects = "This course prepares you for a career as a Senior Marine Engineering Officer, Ship Manager, or Ship Superintendent."
course.spaces = course_spaces
course.status = :open
puts 'Marine Engineering for Cadets from International Partner Colleges HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Hospitality Management HND'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Hospitality%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Hospitality_201600x1078.jpg'
end
course.description = "This two year Hospitality Management course helps you to develop the knowledge and skills required to operate effectively at supervisory level in the Hospitality Industry. The first year covers a range of subjects, both practical and theoretical. The second year focuses on providing you with the necessary managerial knowledge and skills for a junior management position.\n\nThis HND is a valuable qualification for employment in an exciting and ever changing industry, as well as a good preparation for further studies.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher passes with a minimum of C passes; OR\n* NQ in Hospitality or other appropriate NQ; OR\n* Other relevant industry experience or equivalent qualification.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "The course prepares you for employment at junior management/supervisory level in a hospitality department, and graduate training schemes with many large organisations.\n\nWe work with key representatives from industry to offer graduate training positions following the successful completion of the HND."
course.spaces = course_spaces
course.status = :open
puts 'Hospitality Management HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Hospitality Operations HNC'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HNC%20Hospitality%201600x1078.jpg').open
else
  course.image.filename = 'HNC_20Hospitality_201600x1078.jpg'
end
course.description = "This course covers a range of subjects in Hospitality, both practical and theoretical. This course provide you with valuable qualifications for employment in an exciting and ever changing industry, or further studies.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher with a minimum of a C pass; OR\n* NQ in Hospitality or other appropriate NQ; OR\n* Offers are subject to attending an interview with a member of the Hospitality / Events Team where you should articulate your interest and/or experience in hospitality and your goals after completing the course.\nYou’ll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career at a supervisory level in a hospitality department of a hotel, or directly into a graduate training scheme with many large organisations, or a junior management position. We work with key representatives from industry to offer Graduate training positions following the successful completion of the HNC."
course.spaces = course_spaces
course.status = :cancelled
puts 'Hospitality Operations HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Mechanical Engineering HND'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Engineering_block.jpg').open
else
  course.image.filename = 'Engineering_block.jpg'
end
course.description = "This two year course allows you to study mechanical engineering to a professional standard. On completion of this course you'll typically go to university, or move into industry as supervisors or technician. Find job profiles and opportunities here.\n\nThis course involves the use of the college’s extensive engineering equipment, which includes a fully functioning mechanical workshop and computer labs running CAD design software, hydraulic pneumatic software and labs.\n\nFollow Vickram’s journey from leaving school to direct entry to 3rd year Mechanical Engineering university course!\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC in an appropriate Mechanical Engineering subject; OR\n* Two Higher Grades – Maths and one other (we’d prefer Physics).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career as an Engineering Technician, Supervisor or Manager."
course.spaces = course_spaces
course.status = :open
puts 'Mechanical Engineering HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Women into Engineering HNC'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/engineer_pipe_girl.jpg').open
else
  course.image.filename = 'engineer_pipe_girl.jpg'
end
course.description = "This HNC Mechanical Engineering course is open only to women. You'll learn the skills, knowledge and understanding required for a career in mechanical engineering – an area where women are under-represented. \n\nIf you want to work in one of the most diverse forms of Engineering, this course is for you. During practical sessions, you have use of our engineering workshop - fully equipped with pneumatic and hydraulic labs as well as CAD software running in our computer labs. \n\nWe can offer you a suitable mentor during the course through our partnership with Equate\n\n(Discover how Equate are making a positive difference for women in science engineering, technology and the built environment here).  \n\nSuccessful students have gone on to work in a range of engineering positions, from Engineering Technician to Mechanical Engineer. On successful completion of the course, you also have the opportunity to continue study at HND or Degree level.\n\nUse Interconnect to join like-minded women studying science, engineering, technology and built environment at Scotland’s Colleges and Universities.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC in an appropriate Mechanical Engineering subject, OR\n* Two Highers – Maths and one other subject, preferably Physics.\nThis course is for women only. You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career as an Engineering Technician."
course.spaces = course_spaces
course.status = :cancelled
puts 'Women into Engineering HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Chief Mate/ Master Post HND'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Class2_Post_HND.jpg').open
else
  course.image.filename = 'Class2_Post_HND.jpg'
end
course.description = "This course will allow you to progress to the Chief Mates and Master level and achieve the relevant (Unlimited) Certificate of Competency.\n\nTo apply for this course you should have successfully completed an HND in Nautical Science in the UK and have accrued at least 12 months of sea service after obtaining your OOW UK COC (Unlimited)."
course.entry_requirements = "* Recognised sea time of at least 12 months at an OOW level.\n* STCW Certificate in Medical Care On Board (Medical Care is required before the candidates take their MCA Oral examination. The course can be booked in advance through marine@cityofglasgowcollege.ac.uk).\n* NAEST (Operational) Certificate (If you completed the NARAST (O) course prior to 1st January 2005 you are required to undertake an ECDIS course conforming with an IMO Model 1.27 prior to undertaking the NAEST Management course).\n* Applications from International Students who meet the above requirements are welcom"
course.career_prospects = "The course will equip you with the skills to become a competent and efficient Chief Mate. You will require a total of 36 months ‘watch-keeping service’ while holding an OOW Unlimited II/I COC to undertake your next examination for Master (Unlimited) COC. This period may be reduced to 24 months if at least 12 months of such seagoing service has been served as Chief Mate while holding a Chief Mate unlimited, II/2, Certificate of Competency (Reference MSN 1856)."
course.spaces = course_spaces
course.status = :cancelled
puts 'Chief Mate/ Master Post HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'MCA Class 1 Orals Only'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/MCA%20Class%201%20Orals%201600x1078.jpg').open
else
  course.image.filename = 'MCA_20Class_201_20Orals_201600x1078.jpg'
end
course.description = "This four-week course prepares you for the Master Orals examination conducted by MCA.  The course will primarily prepare you to answer MCA oral questions based on underpinning knowledge gained and study undertaken previously.  The course will primarily prepare a delegate to answer MCA oral questions based on underpinning knowledge gained and study undertaken previously. Master’s oral syllabus is stated in MGN69 issued by MCA.\n\nFor a full list of course dates or to book a place contact marine@cityofglasgowcollege.ac.uk."
course.entry_requirements = "You should have completed 36 months watch keeping service while holding OOW unlimited II/1, Certificate of Competency.\n\nThis period may be reduced to 24 months if at least 12 months of such seagoing service has been served as Chief Mate while holding a Chief Mate unlimited, II/2, Certificate of Competency and MCA approved medical Certificate.\n\nFor more detail see MSN 1856."
course.career_prospects = "Progression to ships master or shore employment within the marine sector."
course.spaces = course_spaces
course.status = :cancelled
puts 'MCA Class 1 Orals Only saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'MCA Class 2 Writtens'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/MCA_Class_2_Writtens.jpg').open
else
  course.image.filename = 'MCA_Class_2_Writtens.jpg'
end
course.description = "On this course you will cover topics within the MCA class 2 written examinations not included within the HND Nautical Science and revision of past papers."
course.entry_requirements = "Completion of a full Chief Mate course including HND Nautical Science or a Chief Mate Post HND course."
course.career_prospects = "Progression to ships master or shore employment within the marine sector."
course.spaces = course_spaces
course.status = :cancelled
puts 'MCA Class 2 Writtens saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Events Management HND'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Events%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Events_201600x1078.jpg'
end
course.description = "This course is for those who want a career in the management of events like conferences, exhibitions and special events. On this course you'll cover a wide range of subjects to ensure a good knowledge base, as well as relevant skills.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher passes with a minimum of C, including at least one from the following Business Management, English, Modern Studies, Economics, History; OR\n* NQ in Events or other appropriate NQ; OR\n* Other qualification and relevant experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career in the organisation and management of conferences, exhibitions, festivals and special events."
course.spaces = course_spaces
course.status = :open
puts 'Events Management HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Building Surveying (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Construction_2_2.jpg').open
else
  course.image.filename = 'Construction_2_2.jpg'
end
course.description = "This stimulating, learner-focused course is delivered by highly professional teaching staff with significant construction industry experience and a proven track record of bringing out the best in their students.\n\nThe technician level qualification combines a broad-based first year curriculum with a more specialist second year curriculum, which will provide you with the skills required for employment in this sector (please see the 'after the course' section for further information).\n\nOn successful completion of this course, you'll be awarded with a HND in Building Surveying.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* HNC in Construction\n* It may also be possible to gain entry with an HNC in Building Surveying\nStudents who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career in:\n\n* Private practice surveying firms\n* Government and public authorities\n* Building control departments\n* Construction companies\n* Facilities management\n* Property compani."
course.spaces = course_spaces
course.status = :open
puts 'Building Surveying (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Computing: Technical Support HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_girl_wires_1.jpg').open
else
  course.image.filename = 'Computing_girl_wires_1.jpg'
end
course.description = "This new HND course teaches you skills that are in demand in many support roles in the IT industry, including desktop support and systems administration.\n\nYou’ll cover the basics of computer networking and will also learn how the components of a computer/laptop device function. This particular unit is taught using the Cisco Networking Academy online material and success in this unit may allow you to also sit the vendor Cisco IT Essentials qualification at the end of the second term. \n\nThe course contains a mixture of practical and theoretical material and does involve independent research, study and report writing. Although you'll use the Windows environment in class, you'll also learn how to use the Linux operating system.\n\nOn completion of the course, you may have the opportunity to work for companies such as Dell and Ericsson in a technical support/networking role.\n\nCity of Glasgow College has an excellent track record for students entering computing competitions for World Skills UK and you may have an opportunity to develop themselves further by entering these competitions.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two appropriate Highers and three Intermediate 2 or National  5 qualifications (at least one of these should include a computing related qualification and/or English/Maths OR\n* Two Highers and three Standard Grades (including  English/Maths, all at credit level OR\n* Other equivalent qualifications or experience\nDepending on your qualifications, you may be invited for an individual interview or group information session where you can find out more about the course and decide if it’s the right one for you.\n\nApplicants with a level 6 qualification will be considered for the HNC course."
course.career_prospects = "This course prepares you for a career in IT infrastructure."
course.spaces = course_spaces
course.status = :open
puts 'Computing: Technical Support HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Retail Management HND'
course.category = Category.find_by_name 'Marketing & Retail'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_staff.jpg').open
else
  course.image.filename = 'Business_staff.jpg'
end
course.description = "This exciting and challenging course provides you with the skills knowledge and understanding for a career within the dynamic and ever changing world of retail.\n\nThis course provides the foundation necessary to fill trainee management positions or run your own small retail business. It covers all aspects of the retail environment including Stock Presentation, Customer Care, Fashion Merchandising, Buying, Visual Merchandising and Consumer Behaviour. You'll also have the opportunity to develop your digital communication skills.\n\nYour course lecturers will bring their individual background knowledge and experience of the retail industry to the classroom environment in order to enhance and improve your learning experience. Methods of teaching will include case studies reflecting real life retail scenarios, group discussion, projects, visits and guest speakers.\n\nWithin 2nd year, you'll have the opportunity to enjoy a work placement with leading retailers e.g., New Look, House of Fraser, Schuh, Tesco, River Island, Matalan, M &amp; Co and Marks and Spencer.\n\nUpon successful completion you'll be able to apply to various universities for possible 3rd year entry dependent on your UCAS application, reference and Graded Unit results.\n\nPrevious students have successfully gained employment with such diverse retailers as House of Fraser, Michael Kors, Marks and Spencer and New Look.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes at grade C or above including English, (or a relevant Higher); OR\n* A National Qualification including Core Skills Communication Higher or an appropriate SVQ; OR\n* Relevant experience.\n* A genuine interest in retail management is needed and should be demonstrated in the applicatio"
course.career_prospects = "This course prepares you for a career in retail at a supervisory, or junior management level."
course.spaces = course_spaces
course.status = :open
puts 'Retail Management HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Web Development (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Web%20Development%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Web_20Development_202nd_20Year_201600x1078.jpg'
end
course.description = "On this course, you'll gain skills to start or advance a career as a web designer/developer. You'll learn to build both static and dynamic websites that deliver content in a variety of formats for computers, smartphones and tablets. You'll have access to current smartphones and tablets for testing your responsive websites."
course.entry_requirements = "* HNC Web Development OR\n* First year of HND Web Development\nYou'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you're interested in this subject area. It is important that you prepare a personal statement which reflects your desire to study on this course."
course.career_prospects = "Apply for various job vacancies, such as a junior web developer/designer."
course.spaces = course_spaces
course.status = :cancelled
puts 'Web Development (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Television BA (Hons)'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 9'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Television_trio.jpg').open
else
  course.image.filename = 'Television_trio.jpg'
end
course.description = "This course covers broadcast television, studio and location work, research, scriptwriting and new media. You'll be well placed to apply for a limited number of competitive internship placements, including at STV, offering valuable hands-on experience in video, broadcast, editing and online production.\n\nThe course balances professional level technical production skills and research practice. We have close links with the television industry and you will enjoy the expertise of visiting specialists covering all aspects of TV production, alongside teaching staff, who have direct experience of working in the industry.\n\nRun in partnership with the School of Arts and Creative Industries at Edinburgh Napier University, who have a first class reputation for excellence in practice-led screen courses, it is delivered at City of Glasgow College's outstanding industry standard studio and production facilities and offers students a degree in Television.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 9. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HND Creative Industries TV; OR\n* Relevant television experience.\nPlease apply to Edinburgh Napier University through UCAS, making your preference to study at City of Glasgow College clear in your personal statement."
course.career_prospects = "After the course, you'll be prepared for an entry-level position in the highly competitive creative and media sector including production, directing, editing, presenting, researching and independent projects.  You may also consider applying for further studies at Masters level."
course.spaces = course_spaces
course.status = :closed
puts 'Television BA (Hons) saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Travel and Tourism (with option to study languages) HND'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND_Travel_Tourism.jpg').open
else
  course.image.filename = 'HND_Travel_Tourism.jpg'
end
course.description = "The course develops your knowledge of the Travel and Tourism Industry giving you a solid preparation for a career in the sector. You'll gain the skills and knowledge required to provide high quality customer service and enhance your own employability.\n\nThe course lasts two years starting in September, but you can also leave after one year with an HNC Travel and Tourism.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Highers at Grade C or above in appropriate academic subjects (such as English, Modern Studies, Languages, Business Management, History) and three National 5 qualifications including English; OR\n* Two Highers at Grade C or above (such as English, Modern Studies, Languages Business Management, History) with three Intermediate 2 courses including English; OR\n* Two Highers at Grade C or above (such as English, Modern Studies, Languages Business Management, History,) and three Standard Grades at credit level including English; OR\n* Other equivalent qualifications or experience.\nYou'll be invited to attend a course presentation where you'll get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course.career_prospects = "This course prepares you for a career in travel and tourism with:\n\n* National Tourist Organisations.\n* Travel Management Companies.\n* Visitor Centres/Attractions.\n* Tour Operators.\n* Travel Agents.\n* Airlines.\n* Airport Ground Handling.\n* Foreign Exchange Service."
course.spaces = course_spaces
course.status = :cancelled
puts 'Travel and Tourism (with option to study languages) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Contemporary Art Practice BA (Hons)'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 9'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/BA_Contemporary_Art_Practice.jpg').open
else
  course.image.filename = 'BA_Contemporary_Art_Practice.jpg'
end
course.description = "This is a practice-based degree, where you'll have opportunities to explore two and three-dimensional art as well as lens-based and digital disciplines. You'll have opportunities through your studies for professional placements in the arts and for curation and self-promotion. Critical thinking and writing are also central to the course.\n\nTo find out more and join the community, visit the department's facebook page, Visual Grammar.\n\nThis course is delivered by City of Glasgow College and validated by University of the West of Scotland. We encourage a high level of artistic exploration and personal development in students, while delivering a distinct and prestigious vocational qualification.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 9. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HND in Contemporary Art Practice (or equivalent) with a good pass in the graded unit; OR\n* Relevant professional experience.\nYou must also meet the general admission requirements of the University and apply via UCAS.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to present a portfolio which should demonstrate developed and focused studio practice, and a sophisticated theoretical approach."
course.career_prospects = "This course prepares you for a career as a practising artist, roles in museums, galleries, studios, arts centres, public art and public sector agencies, education bodies, festivals and art fairs."
course.spaces = course_spaces
course.status = :cancelled
puts 'Contemporary Art Practice BA (Hons) saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Photography BA (Hons)'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 9'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Photography_in_arched_building.jpg').open
else
  course.image.filename = 'Photography_in_arched_building.jpg'
end
course.description = "In this course you'll develop the practical and critical skills needed for a practicing photographer. Guest lectures and workshop sessions are an essential element, with opportunities for business, entrepreneurship and enterprise activities.\n\nA self-directed approach to your studies will allow you to tailor your portfolio towards your own photographic interests. During the fourth year of this course, you'll focus on and develop your skills and knowledge towards your own photographic goals.\n\nThis Photography degree is delivered by City of Glasgow College and validated by University of the West of Scotland. For more information on job prospects and work experience opportunities, please visit here.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 10. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HND in Photography; OR\n* Relevant professional experience.\n* You'll  be interviewed and assessed on their portfolio.\nYou must also meet the general admission requirements of the University and apply via UCAS."
course.career_prospects = "The Creative Industries sector covers a range of creative practice and activities. As a graduate of this course, you will be well placed to work within this sector as a practicing photographer, or in a related role."
course.spaces = course_spaces
course.status = :open
puts 'Photography BA (Hons) saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Hairdressing HNC'
course.category = Category.find_by_name 'Hair & Beauty'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HNC%20hairdressing.jpg').open
else
  course.image.filename = 'HNC_20hairdressing.jpg'
end
course.description = "The HNC Hairdressing course is designed for hairdressers currently working in the profession who are seeking an advanced certificate in hairdressing. This course will provide you with the highest qualification currently held in hairdressing. The course is designed for experienced stylists or newly qualified stylists who want to further their studies.\n\nAll technical units build and expand on your existing skills, knowledge as a stylist, giving you the opportunity to design and create looks based on current fashion. A specialised unit in hair and scalp allows you to develop a deeper understanding of hair loss and implications of conditions and how to treat. This is an invaluable tool for the current market of clientele suffering hair loss.\nYou'll also learn new skills in photoshop to portray your work and advance in your communication skills via writing and presenting.\n\nLecturers teaching on your course are equipped with vast experience and expertise in Hairdressing and learning and teaching methods. Your lecturers continually upskill in professional development and pride ourselves as Colour Experts/Specialists, Trichologists and Cutting Ambassadors. One of our core values as lecturers and industry experts are to support you as an individual to flourish as a student.\n\nYour course will be interactive using a variation of methods to ensure your learning and progression needs are met. Units are lecturer led, however, we fully encourage you to take ownership of your own learning through designing looks, working with other college students from make-up artists to photographers and organising charity events.\n\nCareer prospects and employment opportunities are excellent with many of our students who previously undertaken this course; going on to study TQFE, secured lecturing positions, became self-employed and starting own businesses, became private educators, living and working in Australia and working as a stylist on cruise liner via Steiner. You may also have opportunities to take part in European Partner Student Exchanges. \n\nOn successfull completion of this course, you'll be awarded an HNC Hairdressing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* A qualification in either SCQF Level 6 or SVQ Level 3 Hairdressing; OR\n* A minimum of 5 years' experience within the hairdressing profession.\nYou should be working within the hairdressing profession.\n\nEntry will be based on a successful interview.  Depending on experience you might be asked to participate in a skills test.\n\nYou'll also be required to supply relevant items of professional equipment essential to the course, information will be given at interview."
course.career_prospects = "On successful completion of the course you could operate your own business, apply for employment on-board cruise liners, lecturing posts in Further Education or as a Company Technician / Trainer."
course.spaces = course_spaces
course.status = :open
puts 'Hairdressing HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Digital Design and Web Development HNC'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/web_development.jpg').open
else
  course.image.filename = 'web_development.jpg'
end
course.description = "On this one year web based computing course, you will gain skills to start or advance a career as a web designer/developer.\n\nYou'll learn to build a range of websites using a variety of modern techniques that deliver content in a variety of formats for computers, smartphones and tablets. You'll have access to current smartphones and tablets for testing your responsive websites.\n\nBeginning with the fundamentals of website development, you'll build on a foundation of client side technologies and techniques (HTML5, CSS and SEO) through to more advanced study on topics such as native JavaScript and JavaScript frameworks.\n\nThe course will also provide opportunities to use industry standard reusable web templates where you will develop platform/browser compliant and consistent web based content. Currently we use Bootstrap for responsive web design.  Content Management Systems such as WordPress are also explored as a means to deliver content.\n\nThe course introduces you to both client and server side technologies with opportunities to prepare and develop web interfaces and media rich content incorporating Photoshop and Illustrator and a range of other creative software applications. The faculty has access to the full Adobe suite which can be utilised to produce creative and engaging media content for inclusion within your websites.\n\nThis course incorporates live industry related web development projects. Some students may gain internships and real live external work whilst studying at the college.\n\nAs of 2016, the course will be delivered in a new state of the art campus based on Cathedral St. This course has been designed to prepare you for progression to Year 2 of our HND Web Development programme or to enter employment as a web designer at junior level.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher and three Intermediate 2 courses (including Computing, Graphic Design or Information Systems); OR\n* One Higher and three Standard Grades at Credit level or above (including Computing, Graphic Design or Information Systems); OR\n* One Higher and three National 5 qualifications or above (including Computing, Graphic Design or Information Systems); OR\n* A national qualification at SCQF Level 5 or 6 in a related subject such as Digital Media Computing, NQ Computing, Computing: Technical Support or Software Development.\nYou'll be invited for a group and/or individual interview where you'll get the opportunity to find out more about the course and tell us why you are interested in this subject area. It is important that you prepare a personal statement which reflects your desire to study on this course."
course.career_prospects = "Apply for various positions including junior web designer or developer.\n\nContinuing Study\n\nYou can apply for the HND Web development course at the college."
course.spaces = course_spaces
course.status = :open
puts 'Digital Design and Web Development HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Architectural Technology (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Architecture_boy_on%20_laptop_0.jpg').open
else
  course.image.filename = 'Architecture_boy_on_20_laptop_0.jpg'
end
course.description = "This course gives you a technician level qualification, combining a broad first year curriculum with a specialist second year curriculum. It'll give you the skills required for employment in this high demand industry sector.\n\nYou'll also have the opportunity to go on site visits around the west of Scotland, to give you an understanding of contemporary relevance.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC in Construction.\n* It may also be possible to gain entry with an HNC in Architectural Technology. This will depend on the units that have been covered in the HNC. Students who gain entry with this qualification will require a bespoke infill programme, so each application will be considered on an individual basis.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career as an Architectural Technician or Architectural Technologist in a variety of sectors including:\n\n* Built environment.\n* Construction.\n* Property.\n* Private consultant practices (architects and surveyors).\n* Design and build services divisions of construction contractors.\n* Local authorities.\n* Health trusts.\n* Housing associations.\n* Building component manufacturers.\n* Government organisation."
course.spaces = course_spaces
course.status = :cancelled
puts 'Architectural Technology (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Computer Aided Architectrual Design & Technology (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Construction Crafts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Computer%20Aided%20Architectural%20Design%20and%20Technology%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Computer_20Aided_20Architectural_20Design_20and_20Technology_201600x1078.jpg'
end
course.description = "This is a technician level qualification that provides a specialist curriculum focused on the application of Computer Aided Design software in a construction specific context underpinned by a Construction Industry specific curriculum. It will equip you with skills required for employment in this specialist industry sector.\n\nAn Architectural Technologist is a specialist in the technological aspects of building design and construction, bridging the gap between design theory and construction practice. Find the job profile here.\n\nThis course is delivered by highly professional teaching staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nDuring your studies you'll:\n\nIf you are looking for architectural inspiration? - Our Riverside Campus won ‘The Architectural Excellence Award for a Public Building\" last year! \n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Computer Aided Design OR\n* First year of HND Computer Aided Design\nYou should also have a sound knowledge of and be competent users of ICT.\n\nYou'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you are interested in this subject area."
course.career_prospects = "* Architectural CAD Technician or Building/Civil Engineering Technicia."
course.spaces = course_spaces
course.status = :open
puts 'Computer Aided Architectrual Design & Technology (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Construction Management (Year 2 Direct Entry)  HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Construction_2_0.jpg').open
else
  course.image.filename = 'Construction_2_0.jpg'
end
course.description = "This stimulating, learner-focused programme is delivered by highly professional teaching staff with significant construction industry experience and a proven track record of bringing out the best in their students.\n\nConstruction Managers (also known as Project Managers, Site Managers and Site Agents) supervise and direct operations on a construction project to make sure it is completed safely, on time and within budget. To do this well, a Construction Manager needs to be good at organising and planning; motivating and managing people; and creatively solving problems.\n\nThe HND in Construction Management is a technician level qualification that combines a broad-based construction industry specific first year curriculum with a more specialist second year curriculum, teaching you the skills you need for employment in this highly demanding sector.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* HNC Construction Management OR\n* First year of HND in Construction Management\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career as a Higher Technician or Junior Manager in both the public and private sector in areas including: built environment, the construction sector, construction management, site engineering, estimating, and construction project planning."
course.spaces = course_spaces
course.status = :open
puts 'Construction Management (Year 2 Direct Entry)  HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Quantity Surveying (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Built Environment'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Quantity%20Surveying%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Quantity_20Surveying_202nd_20Year_201600x1078.jpg'
end
course.description = "Quantity Surveyors (also known as a Construction Cost Consultants or Commercial Managers) manage all costs relating to building and civil engineering projects, from the early design plans, through to completion. Quantity Surveyors seek to minimise the costs of a project and enhance value, while still achieving the required standards and quality. Many of these are specified by statutory building regulations, which the surveyor needs to understand and adhere to.\n\nThe HND in Quantity Surveying is a technician level qualification that combines a construction industry specific first year curriculum with a more specialist second year curriculum that equips you with the skills required for employment in this specialist industry sector.\n\nYou'll be taught by staff with significant Construction Industry experience and a proven track record of bringing out the best in their students.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Quantity Surveying OR\n* First year of HND Quantity Surveying\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career in private practice QS consultancies, contracting organisations, property companies, financial institutions, local and central government, commercial clients, and housing associations."
course.spaces = course_spaces
course.status = :open
puts 'Quantity Surveying (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Mechanical Engineering (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Mechanical%20Engineering%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Mechanical_20Engineering_202nd_20Year_201600x1078.jpg'
end
course.description = "This course allows you to study mechanical engineering to a professional standard. On completion of this course you will typically go to university, or move into industry as supervisors or technicians.\n\nDuring your studies you'll have the use of the college’s extensive engineering equipment, which includes a fully functioning mechanical workshop and computer labs running CAD design software, hydraulic pneumatic software and labs.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC in Mechanical Engineering OR\n* First yea rof HND Mechanical Engineering\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career as an Engineering Technician, Supervisor or Manager."
course.spaces = course_spaces
course.status = :open
puts 'Mechanical Engineering (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Electronic Engineering (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Electronic%20Engineering.jpg').open
else
  course.image.filename = 'HND_20Electronic_20Engineering.jpg'
end
course.description = "Electronic engineers solve 21st century problems for industry and society. This course starts with you building and testing your own CityBytes microcomputer board. The board is integrated into the study of electronic circuits and you'll also use it to learn how to program embedded devices using ‘C’ programming language. The board can be used as a Bluetooth device, a game controller, a logic designer and hybrid audio amplifier. It even comes with an Android, or Windows mobile app.\n\nThe course reinforces theory with extensive practical work culminating in a substantial practical project. In previous years, projects have included a programmable drone, an ultra-sonic tape measure, a solar powered baby incubator for disaster areas, a keyboard, and a remote control mini search and rescue vehicle.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/.\n\nWe are updating some of our course titles and would be grateful if you could take 2 minutes to complete our short survey.  Thank you in advance for your feedback."
course.entry_requirements = "* HNC Electronics OR\n* First year of HND Electronics\nApplicants need a good grounding in maths for entry to the course.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career as an Electronics Technician Engineer."
course.spaces = course_spaces
course.status = :cancelled
puts 'Electronic Engineering (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Engineering: Electrical (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Engineering, Energy & Gas'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Electrical%20Engineering.jpg').open
else
  course.image.filename = 'HND_20Electrical_20Engineering.jpg'
end
course.description = "On this Electrical Engineering course, you'll expand on the electrical principles covered in Higher level. During the course you'll be taught by staff with significant industry experience to develop your skills over a range of science disciplines.\n\nMany of the course modules are project based with report writing included in second year modules. The course is also designed for higher level technicians in the Electrical Engineering Industry which deals with the production, transmission, distribution and application of electricity and the manufacture, installation and maintenance of electrical equipment.\n\nThe course can also be studied over three years on a day-release top-up programme, after completion of the Higher National Certificate in Electrical Engineering.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC in an appropriate Engineering subject; OR\n* Successful completion of HNC or HND first year at City of Glasgow College.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career as trainees within the oil and gas industries which recognise the value of the course. Many students have been recruited by blue chip organisations as well as a wide range of industrial and commercial organisations."
course.spaces = course_spaces
course.status = :open
puts 'Engineering: Electrical (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Accounting (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Accounting'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_boys_learning_1.jpg').open
else
  course.image.filename = 'Business_boys_learning_1.jpg'
end
course.description = "This course assumes no prior knowledge of accounting, but is still suitable for those who've studied it before. It will prepare you for further study at university, or for courses run by professional accounting organisations like ACCA, CIPFA and CIMA.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "Year two:\n\n* Successful completion of a full time HNC Accounting course with 15 credits, with a Grade A in the graded unit and all mandatory units, OR\n* Successful completion of a part time HNC Accounting course with 12 credits, with a Grade A in the graded unit and all mandatory units\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career in:\n\n* Bookkeeping\n* Financial and management accounting using manual and computerside techniques\n* Accounts technician\n* Assistant accountant\n* Accounts supervisor\n* Financial reporting\n* Management accounting\n* Taxati."
course.spaces = course_spaces
course.status = :open
puts 'Accounting (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Legal Services (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Administration, Human Resources & Law'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Legal%20Services%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Legal_20Services_202nd_20Year_201600x1078.jpg'
end
course.description = "The course is recommended for you if you're planning a professional career in the legal field, progressing to study law in depth following the HND, or if you might be interested in consolidating your career in a related field.\n\nThe course will consist of lectures, tutorials, practical based tasks such as mock trials and the presentation of evidence under court conditions. You'll consider numerous common aspects of life and how the law affects individuals every day when facing problems in business, relationships, employment and the courts.\n\nEmphasis is placed on developing both your academic and vocational skills to equip you to progress into employment or further study. You'll be introduced to notions of equality, society, discrimination, prejudice and the rule of law.\n\nThe HND in Legal services is an excellent foundation course in law which provides a recognised professional qualification for an application to enter the Scottish paralegal profession.\n\nThe course is full-time covering at least 4 days per week and addresses a broad range of legal topics including business law, private and public law, employment law, criminal law, Sheriff Court procedure and corporate law.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Legal Services; OR\n* First year HND Legal Services.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "On successful completion of your HND you may enter a related field, working as a trainee paralegal or as part of an in-house legal team. You can find employment with local authorities, the Sheriff Court, or Procurator Fiscal office.\n\nThere are also opportunities for you in the Banking and Insurance Sectors, and a number of graduates have joined Police Scotland."
course.spaces = course_spaces
course.status = :open
puts 'Legal Services (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Computer Science (Year 2 Direct Entrants) HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computer_Science_1.jpg').open
else
  course.image.filename = 'Computer_Science_1.jpg'
end
course.description = "The HND Computing (Science) course is an SQA qualification which aims to meet the challenges of employers seeking qualified learners who can demonstrate knowledge and skills in a range of technology areas.\n\nAccording to research from Tech Partnership (a network of employers working with the Scottish Government and Skills Development Scotland to create skills for the UK's digital economy) the number of UK Digital Businesses has increased 30% in the last 5 years.\nTheir forecast shows the number of people working in the UK as technology specialists between 2014 and 2024 will grow by 28%, significantly outstripping that predicted for workers more generally.\n\nThe course is delivered by experienced lecturing staff many of whom have industry experience in IT areas such as software engineering, programming, project management and technical support.\n\nThis HND course places particular emphasis on software development, project management and soft skills such as team-working; with year 2 of the programme further developing skills in object oriented programming and design, data science and mathematics\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Successful completion of the HNC Computer (Science) or year 1 of the HND Computer Science course.\n* Successful completion of the first year of the HND Computing: Software Development (dependent upon units taken"
course.career_prospects = "After successful completion of this course, you can apply for a range of entry level roles within the IT industry."
course.spaces = course_spaces
course.status = :open
puts 'Computer Science (Year 2 Direct Entrants) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Computing: Software Development  (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_DigitalMedia_screen_1.jpg').open
else
  course.image.filename = 'Computing_DigitalMedia_screen_1.jpg'
end
course.description = "You'll study towards an up-to-date qualification covering many of the skills that are in demand for a range of different careers in the software development / programming sector of the computer industry. These include developing skills in C#, VB.NET, Java, Object Oriented Design, Object Oriented Programming, SQL Programming and Project Management.\n\nThe 2012 Technology Insights Report from e-skills UK stated: \"The technical skills most often called for by employers were: SQL, .NET (VB and C#) and Java.\"\n\nIt also stated: \"Through to 2020 Software Professionals show the highest forecast employment growth of all IT &amp; Telecoms occupations.\"\n\nThis course will help prepare you for either employment or progression to university in computing, a skill set that is currently in high demand.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* HNC Computing: Software Development, OR\n* First Year HND Computing: Software Development.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career in software development, web design/development, and information systems development."
course.spaces = course_spaces
course.status = :open
puts 'Computing: Software Development  (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Computing: Technical Support (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_girl_wires_2.jpg').open
else
  course.image.filename = 'Computing_girl_wires_2.jpg'
end
course.description = "This new HND course teaches you skills that are in demand in many support roles in the IT industry, including desktop support and systems administration.\n\nYou'll cover the basics of computer networking, as well as how the components of a computer function. Ethical hacking has been introduced as a new unit and you'll also learn about the importance of legal issues within the IT industry.\n\nCity of Glasgow College has an excellent track record for students entering computing competitions for World Skills UK and students may have an opportunity to develop themselves further by entering these competitions.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* HNC Computing: Technical Support, OR\n* First year HND Computing: Technical Support.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career in IT infrastructure."
course.spaces = course_spaces
course.status = :closed
puts 'Computing: Technical Support (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Administration and Information Technology (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Administration, Human Resources & Law'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Administration%20and%20IT%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Administration_20and_20IT_202nd_20Year_201600x1078.jpg'
end
course.description = "This course will provide you with a broad range of office-based skills and knowledge required for a career in office administration. This is a challenging course, where you'll develop specialist skills in IT, desktop publishing, communication, research and planning.\n\nYour stimulating programme will be delivered by our highly professional teaching staff with significant experience in office administration and a proven track record of bringing out the best in their students.\n\nOn successful completion of this course, you'll be awarded with a HND Administration and Information Technology.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Administration and Information Technology OR\n* Year 1 of HND Administration and Information Technology.\nYou'll be invited to attend a group presentation and interview session. The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course.career_prospects = "This course prepares you for a career as a Personal Assistant or Administrator in both the public and private sector. The HND can provide progression into employment in a general administrative role within small to medium enterprises. It'll also provide opportunities to develop the skills and knowledge required for more specialist posts demanded by larger organisations.\n\nThe qualification will allow you to develop:\n\n* Technical and administrative knowledge relevant to current practice.\n* Interpersonal skills relevant to an administrative role.\n* Personal effectiveness.\n* Communication.\n* Presentation technique."
course.spaces = course_spaces
course.status = :open
puts 'Administration and Information Technology (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Business (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Business & Procurement'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_boy_with_pen_0.jpg').open
else
  course.image.filename = 'Business_boy_with_pen_0.jpg'
end
course.description = "The course provides you with the skills and knowledge necessary for careers in banking, insurance, civil service, local government and distribution. Today, the internet is an important part of business, so we've updated the course to include analysing and using information for strategic purposes.\n\nYour course will be delivered by our highly professional teaching staff with relevant industry experience and track record of bringing out the best in their students.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8.  For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Business; OR\n* First year of HND Business.\nYou'll be invited to attend a group presentation and interview session. The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course.career_prospects = "This course will prepare you for trainee positions in management and administration in industry, financial services and the public sector."
course.spaces = course_spaces
course.status = :open
puts 'Business (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = '3D Computer Animation (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%203D%20Computer%20Animation%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_203D_20Computer_20Animation_202nd_20Year_201600x1078.jpg'
end
course.description = "This hands-on course helps you develop the skills needed to become a 3D Digital Developer, incorporating live industry related projects in a range of different 3D animation disciplines. Some students may gain internships and summer placements while studying at the college.This course also accepts year two direct entrants.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC 3D Computer Animation, OR\n* First year HND 3D Computer Animation.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "* BSc (Hons) Computer Animation (with options) at the University of the West of Scotland.\n* BA (Hons) 3D Computing Animation at Glasgow Caledonian University.\n* BDes (Hons) Animation at University of Abertay.\n* There's also the option to study Visual FX at Napier Universit."
course.spaces = course_spaces
course.status = :open
puts '3D Computer Animation (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Digital Design and Web Development (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Digital%20Design%20and%20Web%20Development%20Year%202%20entry%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Digital_20Design_20and_20Web_20Development_20Year_202_20entry_201600x1078.jpg'
end
course.description = "This year of the course further explores coding skills, particularly in front-end languages and technologies. There will be an emphasis on design and development of content and user engagement for responsive web products.\n\nYou'll build on skills from HNC Digital Design and Web Development or HNC Web Development and develop further techniques in HTML5, JavaScript, CSS, framework development, interface design, media creation and optimisation.\n\nTo showcase your skills you'll complete the year by developing a specialist project in several of the subject areas.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* 12- 15 Credit HNC Digital Design and Web Development;OR\n* 12 - 15 Credit HNC Web Development.\nWe prefer a 15 credit HNC."
course.career_prospects = "Apply for various job vacancies, such as a junior web developer/designer."
course.spaces = course_spaces
course.status = :open
puts 'Digital Design and Web Development (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Information Technology (Year 2 Direct Entry)  HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20IT%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20IT_202nd_20Year_201600x1078.jpg'
end
course.description = "The HND Information Technology computing qualification is designed to give you a solid technical understanding of information systems and technologies used by both small and large scale businesses.\n\nYou'll gain an understanding of how data is transformed into usable information through the theory and practice of relational database technologies. You'll also undertake units in web design and development, e-commerce, applications programming, operating systems and project management.\n\nAs part of the second year program you'll also undertake the Oracle Database Design and Programming using SQL vendor qualification, which is a worldwide recognised qualification that prepares the student to undertake external Oracle exams.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Information Technology, OR\n* First year HND Information Technology.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "After completing the HND you may pursue a career in business intelligence analysis, information management, database administration, trainer/teacher, hardware and software support, or web development."
course.spaces = course_spaces
course.status = :open
puts 'Information Technology (Year 2 Direct Entry)  HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Advertising and Public Relations (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Marketing & Retail'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/creative_writing_girl_with%20_book_1.jpg').open
else
  course.image.filename = 'creative_writing_girl_with_20_book_1.jpg'
end
course.description = "This course trains you for a career in the communication industries. You'll develop an understanding of the nature and function of advertising and public relations, within a wider marketing and marketing communications framework. You'll also learn how to communicate effectively in this environment.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* Successful completion of a full time HNC Advertising and PR course with 15 credits\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career in:\n\n* Advertising agencies\n* PR consultancies\n* Social media companies\n* Advertising departments\n* Commercial or media-based companies\nThere are a number of work experience and placement opportunities throughout the course."
course.spaces = course_spaces
course.status = :open
puts 'Advertising and Public Relations (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Marketing (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Marketing & Retail'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Marketing%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Marketing_202nd_20Year_201600x1078.jpg'
end
course.description = "The course helps you develop the skills you’ll need to work in marketing and business. It covers marketing theory and buyer behaviour, as well as the main operational areas of marketing research, promotion and selling.\n\nCoursework includes projects and assignments that relate to current industry practice and market environments. You’ll be assessed continuously throughout the course.\n\nYou can keep up to date with marketing industry news and future opportunities with The Drum and Digital Intelligence.\n\nAfter successful completion of the course, you will be awarded with an HND in Marketing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework."
course.entry_requirements = "* HNC Marketing; OR\n* First year HND Marketing.\n* A genuine interest in marketing is needed and should be demonstrated in the application."
course.career_prospects = "You may go on to a career in marketing, public relations, or internal or external communications in any number of business sectors."
course.spaces = course_spaces
course.status = :open
puts 'Marketing (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Retail Management (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Marketing & Retail'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Retail%20Management%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Retail_20Management_202nd_20Year_201600x1078.jpg'
end
course.description = "This course prepares you for a career in the Retail Industry, where there is a growing need for qualified people to fill trainee management positions. You'll carry out case studies, projects and assignments and we'll assess your progress continuously.\n\nTo expand the learning experience, in the second year you'll take part in a work placement. We also organise industrial visits and study tours.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Retail Management; OR\n* First year HND Retail Management.\n* A genuine interest in retail management is needed and should be demonstrated in the applicatio"
course.career_prospects = "This course prepares you for a career in retail at a supervisory, or junior management level."
course.spaces = course_spaces
course.status = :open
puts 'Retail Management (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = '3D Design: Interior Design (Year 2 Direct Entry)  HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Interio_Design_girl_artwork.jpg').open
else
  course.image.filename = 'Interio_Design_girl_artwork.jpg'
end
course.description = "This course will enable you to develop the creative, analytical and technical skills for a career in interior design. This course can lead to direct entry to the third year of a degree programme."
course.entry_requirements = "* An HNC in 3D Design: Interior Design\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "This course may lead to a variety of careers in interior design and architectural practices, such as space planning, property development – shop and office fitting, and museum and exhibition design."
course.spaces = course_spaces
course.status = :open
puts '3D Design: Interior Design (Year 2 Direct Entry)  HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Acting and Performance (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Drama & Creative Writing'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Drama_group_2.jpg').open
else
  course.image.filename = 'Drama_group_2.jpg'
end
course.description = "This course allows direct entry to year two of the HND Acting and Performance course, and builds on the skills acquired in HNC Acting and Performance by developing knowledge and awareness of the craft of acting. It's designed for those who are interested in becoming actors, drama teachers or drama workers.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "Direct entry to year two may be possible if you complete the HNC Acting and Performance with 15 credits, including all mandatory credits.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "There are a wide range of career opportunities for graduates, including work in theatre, television, community drama, and theatre production."
course.spaces = course_spaces
course.status = :closed
puts 'Acting and Performance (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Art Glass Design (Year 2 Direct Entry)  HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Art%20Glass%20Production%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Art_20Glass_20Production_202nd_20Year_201600x1078.jpg'
end
course.description = "The HND Art Glass Design course is for you, if you want to follow a career in art glass design and production. This course offers you a broad education with a balance between creative, practical and core skills.  \n\nYou’ll work in two and three dimensions, learning contemporary warm glass techniques like slumping and fusing and traditional skills like copper foil and lead work, as well as more advanced glass surface applications.\n\nPrevious students have gone on to become glass technicians, self-employed glass artists or used their skills within a larger design studio; designing and manufacturing stained glass panels, household items and jewellery. Visit the Contemporary Glass Society for more useful resources.\n\nIf you want a recognised art glass industry qualification: This course offers the only HND certified glass work course in Scotland!\n\nFollow the latest trends in the creative industries, visit The Pulse\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Art Glass Design; OR\n* First year HND Art Glass Design.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to show examples of your art and design work."
course.career_prospects = "The HND course may lead to a job in the art glass industry or self-employment."
course.spaces = course_spaces
course.status = :open
puts 'Art Glass Design (Year 2 Direct Entry)  HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Furniture Craftmanship with Design (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Furniture%20Craftsman%20with%20Design%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Furniture_20Craftsman_20with_20Design_202nd_20Year_201600x1078.jpg'
end
course.description = "This course encourages you to develop practical skills through manufacture, and to express yourself through design. You’ll be encouraged to study in-depth the construction of furniture, to develop and build designs and to hone your skills in cabinet making, upholstery and wood finishing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Furniture Craftmanship with Design; OR\n* First year HND Furniture Craftmanship with Design.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of any design and/or making of furniture or 3D work."
course.career_prospects = "After completing the course you may go on to become self-employed Designers/Makers of furniture, as well as pursuing jobs in the furniture trades and shop-fitting."
course.spaces = course_spaces
course.status = :open
puts 'Furniture Craftmanship with Design (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Furniture Restoration (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Furniture%20Restoration%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Furniture_20Restoration_202nd_20Year_201600x1078.jpg'
end
course.description = "This course will allow you to develop your skills in furniture analysis and practical solutions, through workshop activities. You’ll study the history of furniture design and materials as well as the construction, upholstery and finishing of period furniture. You’ll also restore items of furniture throughout this course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Furniture Restoration; OR\n* First year HND Furniture Restoration.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "Career opportunities are many and varied. A high number of craftspeople are self-employed or in a partnership, which can be rewarding. There are also jobs in furniture trades and shop-fitting."
course.spaces = course_spaces
course.status = :open
puts 'Furniture Restoration (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Jewellery (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Jewellery%20Design%202nd%20Year%201600x1078_0.jpg').open
else
  course.image.filename = 'HND_20Jewellery_20Design_202nd_20Year_201600x1078_0.jpg'
end
course.description = "This HND course will teach you a comprehensive range of skills in jewellery design and manufacture, with a design-led focus. You'll be able to choose specialisms according to your own interests, as well as the current business environment.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC in Jewellery OR\n* First year of HND Jewellery\nYou'll be invited for a group and/or individual interview where you will find out more about the course and tell us why you are interested in this subject area. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "You'll be able to join year one or two of some courses, including:\n\n* Jewellery Design at Birmingham University.\n* Three Dimensional Design (ceramics, glass, jewellery) at Robert Gordon University.\n* Jewellery and Silversmithing at the Edinburgh School of Art.\n* Silversmithing and Jewellery Design at the Glasgow School of Art.\n* Year 3 of BA (Hons) Top-up Degree Jewellery at North Glasgow College."
course.spaces = course_spaces
course.status = :open
puts 'Jewellery (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Graphic Design (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Graphic_Design_HND_0.jpg').open
else
  course.image.filename = 'Graphic_Design_HND_0.jpg'
end
course.description = "This Graphic Design course prepares you for a career in the exciting and constantly developing area of graphic design. The course develops your creative ability and technical graphics skills, mainly through practical projects in the studio.\nThe course also encourages you to take responsibility for your own development. You'll build on your own creative concepts through research and development in the sketchbook, before producing finished work digitally.\n\nThe emphasis of the course is on layout of type and image, for both print and screen and the development of creative concepts.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Graphic Design OR\n* First year of HND in Graphic Design\nYou'll be invited for a group and/or individual interview, where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "After completing the HND you can apply for jobs in areas of the Communication Industry, including design consultancies, advertising agencies, newspaper and magazine publishing, web design and motion graphics for screen, or in-house design studios.\n\nYou may eventually become self-employed as a Graphic Designer.."
course.spaces = course_spaces
course.status = :open
puts 'Graphic Design (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Creative Industries: Media and Communication (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Drama & Creative Writing'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Graphics_boy_at_table.jpg').open
else
  course.image.filename = 'Graphics_boy_at_table.jpg'
end
course.description = "This highly practical course prepares you for higher education and media industry employment. On this course, the teaching staff have a wide variety of media experience and you can expect media guest speakers, visits and professional workshops. You’re continually assessed and you’ll also need to complete a graded project.\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Media &amp; Communication with minimum B at Graded Unit "
course.career_prospects = "Career paths include journalism, television and radio production, video production, public relations and advertising.."
course.spaces = course_spaces
course.status = :closed
puts 'Creative Industries: Media and Communication (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Creative Industries: Radio (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Drama & Creative Writing'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Radio_group2.jpg').open
else
  course.image.filename = 'Radio_group2.jpg'
end
course.description = "This course builds on the skills you developed in the HNC. The focus is still on programme making, but goes beyond radio and develops a more sophisticated skillset – technical, production and creative. This course is an excellent opportunity for you to study and train for a career in radio production, with excellent career opportunities and progression routes.\n\nThe course is delivered by highly qualified lecturers who have a wealth of experience within the radio industry and have well established industry contacts.\n\nAfter successful completion of the course, you'll be awarded with an HND Creative Industries: Radio.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Creative Industries: Radio, including A or B in graded unit on"
course.career_prospects = "There are opportunities in radio for those with a variety of up to date skills, broadcasting knowledge and experience.."
course.spaces = course_spaces
course.status = :open
puts 'Creative Industries: Radio (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Practical Journalism (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Media'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Television_camera_1.jpg').open
else
  course.image.filename = 'Television_camera_1.jpg'
end
course.description = "Journalists must have the essential skills of writing and research, but they are now expected to also record sound, shoot video and edit on digital systems. Increasingly, they are expected to produce their own web content. The skills you'll acquire on the course will enable you to position yourself for the world of work, or university.\n\nThere will be an opportunity to specialise in the area of journalism you are most interested in.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Practical Journalism OR\n* First year of HND Practical Journalism\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At your interview you'll have to:\n\n* Write a 200 word article.\n* Use correct spelling, grammar and punctuation in a 300 word article.\n* Discuss the importance of journalis"
course.career_prospects = "."
course.spaces = course_spaces
course.status = :open
puts 'Practical Journalism (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Photography (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Photography%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Photography_202nd_20Year_201600x1078.jpg'
end
course.description = "This highly competitive course provides you with the skills you need to start a career in photography, or a related area within the creative industries. This is a practice-based course with projects both in the studio and on location. Alongside technical skills, you're encouraged to work on self-reflection and evaluation through class feedback sessions.\n\nYou'll have an opportunity to work independently on self-initiated projects and to develop your own photographic ideas and briefs.\n\nWith a broad range of experienced staff on hand and industry standard facilities, this course is an excellent opportunity for those with a keen interest in photography, who want to develop that interest through full time study.\n\nYou'll continually update your photographic portfolio showcasing your most recent work.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC in Photography OR\n* First year of HND Photography\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. At the interview you'll be asked to provide a strong photographic portfolio of work."
course.career_prospects = "With an HND in photography, you'll be prepared for a position in the highly competitive creative and media sector including: advertising, commercial, press and photojournalism, fashion, sports, social, medical, scientific, throughout the UK and worldwide.."
course.spaces = course_spaces
course.status = :closed
puts 'Photography (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Beauty Therapy (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Hair & Beauty'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Beauty%20Therapy%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Beauty_20Therapy_202nd_20Year_201600x1078.jpg'
end
course.description = "The course offers a high level beauty qualification which will provide you with knowledge of current beauty treatments and techniques. You'll also gain experience in using a wide range of products and will gain the skills necessary to secure employment in a variety of settings within the Beauty Industry such as salons, spas and cruise liners.\n\nThis year focuses on more advanced treatments, techniques and product ranges as well as business planning, retailing, and gaining employment. \n\nYou'll be taught be a highly motivated and versitile team with an excellent range of industrial expertise who deliver world class student focussed learning.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/. "
course.entry_requirements = "* A pass in HNC Beauty Therapy with 15 credits, OR\n* Units achieved to be compatible with the college's existing HNC course plan.\n* A positive report from your HNC course team.\n* You'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n* Excellent communication skills and an enthusiasm for the beauty industry is essentia"
course.career_prospects = "This course prepares you for a career in the Beauty Industry including roles in salons, health spas, cruise ships, or self-employment.\n\nA number of senior, or managerial posts may also be available to HND qualified therapists.."
course.spaces = course_spaces
course.status = :open
puts 'Beauty Therapy (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Fitness, Health and Exercise (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Sport & Fitness'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Fitness%20Health%20and%20Exercise%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Fitness_20Health_20and_20Exercise_202nd_20Year_201600x1078.jpg'
end
course.description = "This course is most suited to those with an interest in the fields of fitness, health and exercise. The new framework has been developed to include industry recognition in the form of the endorsement by the Register of Exercise Professionals (REPS).\n\nOn successful completion of Year two, you'll be awarded the Level 3 Personal Trainer accreditation.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Fitness, Health and Exercise OR\n* First year of HND in Fitness, Health and Exercise\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. An element of the interview process will involve paired exercise where you demonstrate an exercise of your choice to a partner, highlighting safe and effective practice. Please bring suitable indoor gym wear."
course.career_prospects = "This course will suit individuals wishing to pursue careers in sports clubs, private fitness facilities, local authorities and government sport initiatives; ranging from personal training and exercise instruction, to teaching physical education, or working within sports science.\nYou may also look at self-employment in fitness, exercise prescription and athletic conditioning.."
course.spaces = course_spaces
course.status = :open
puts 'Fitness, Health and Exercise (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Professional Cookery (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Professional%20Cookery%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Professional_20Cookery_202nd_20Year_201600x1078.jpg'
end
course.description = "Professional cookery has never been as popular as it is today. This course is an excellent opportunity for you to study and train for a career in catering with excellent career opportunities and progression routes.\n\nIn the first year, you'll develop your culinary skills to an advanced level and learn the knowledge you’ll need for a supervisory role in the Catering Industry. In the second year you'll combine culinary expertise and managerial skills. The course contains practical and theory units, which are assessed throughout (please see further information in the 'what you study' section below).\n\nExperience in the Hospitality Industry is an integral part of the course, and you’ll work towards the Industrial Experience unit.\n\nOn successful completion of this course, you'll be awarded with a HND in Professional Cookery.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Professional Cookery OR\n* First year of HND in Professional Cookery\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "On completing your HND, you might progress to a career in catering, restaurants, and hospitality at a supervisory, or junior management level.."
course.spaces = course_spaces
course.status = :cancelled
puts 'Professional Cookery (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Event Management (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Events%20Management%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Events_20Management_202nd_20Year_201600x1078.jpg'
end
course.description = "This course is for those who want a career in the management of events like conferences, exhibitions and special events. On this course you'll cover a wide range of subjects to ensure a good knowledge base, as well as relevant skills.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC in Events OR\n* First year of HND in Events\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career in the organisation and management of conferences, exhibitions, festivals and special events.."
course.spaces = course_spaces
course.status = :closed
puts 'Event Management (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Hospitality (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Hospitality_girl_serving_drinks_1.jpg').open
else
  course.image.filename = 'Hospitality_girl_serving_drinks_1.jpg'
end
course.description = "This course helps you develop the knowledge and skills required to operate effectively at supervisory level in the hospitality industry. The first year covers a range of subjects both practical and theoretical. The second year focuses on providing you with the necessary managerial knowledge and skills for a junior management position.\n\nThis HND Hospitality Management is a valuable qualification for employment in an exciting and ever changing industry, as well as a good preparation for further studies.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* Successful completion of the HNC Hospitality Operations or similar award, including a pass in Graded Unit 1; OR\n* Relevant industrial experience at supervisory level.\nOffers are subject to attending an interview with a member of the Hospitality / Events team where you should describe your interest and/or experience in hospitality, and your hopes for after completing the course."
course.career_prospects = "The course prepares you for employment at junior management/supervisory level in a hospitality department, and graduate training schemes with many large organisations.\n\nWe work with key representatives from industry to offer graduate training positions following the successful completion of the HND.."
course.spaces = course_spaces
course.status = :closed
puts 'Hospitality (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Coaching and Developing Sport (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Sport & Fitness'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Sport_group_playing_basketball.jpg').open
else
  course.image.filename = 'Sport_group_playing_basketball.jpg'
end
course.description = "This course introduces and develops the skills and knowledge you’ll need for a career in sports coaching. The principles of good coaching practice are examined and a wide practical and theoretical knowledge of games and sports is developed (please see further information in the 'what you study' section below).\n\nYou'll be taught by experienced sports coaching staff with a proven track record of bringing out the best in their students.\n\nOn successful completion of this course, you'll be awarded with the HND in Coaching and Deveolping Sport.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* An HNC Sport Coaching qualification with 15 credits\nThis ensures you don't need to study additional units to complete the 30 credits in second year.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n\nThe interview will consist of a group discussion and a practical assessment. You'll need to submit a reference form, normally from a PE teacher or coach."
course.career_prospects = "."
course.spaces = course_spaces
course.status = :open
puts 'Coaching and Developing Sport (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Sports Therapy (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Sport & Fitness'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Sports%20Therapy%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Sports_20Therapy_202nd_20Year_201600x1078.jpg'
end
course.description = "The sports therapy course will equip you with the skills required to help prevent injury and rehabilitate clients back to full fitness. The second year of the course focuses on the assessment and treatment of musculoskeletal conditions arising from sporting activity.\n\nYou'll also get the opportunity to work in our sports injury clinic, developing skills in clinical assessment, devising treatment plans and providing physical therapies. You may also be involved in pre and post match and touchline support for sporting events.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Sports Therapy OR\n* First year HND Sports Therapy\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career as a sports therapist working freelance, in sports clubs, or as part of a government health initiative.."
course.spaces = course_spaces
course.status = :open
puts 'Sports Therapy (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Travel and Tourism (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Travel%20and%20Tourism%202nd%20Year%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Travel_20and_20Tourism_202nd_20Year_201600x1078.jpg'
end
course.description = "The course develops your knowledge of the Travel and Tourism Industry giving you a solid preparation for a career in the sector. You'll gain the skills and knowledge required to provide high quality customer service and enhance your own employability.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC in Travel and Tourism OR\n* First year of HND in Travel and Tourism\nYou'll be invited to attend a course presentation where you will get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course.career_prospects = "This course prepares you for a career in travel and tourism with:\n\n* National Tourist Organisations.\n* Travel Management Companies.\n* Visitor Centres/Attractions.\n* Tour Operators.\n* Travel Agents.\n* Airlines.\n* Airport Ground Handling.\n* Foreign Exchange Service."
course.spaces = course_spaces
course.status = :closed
puts 'Travel and Tourism (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Financial Services (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Accounting'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Financial%20Services%202nd%20year%20app%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Financial_20Services_202nd_20year_20app_201600x1078.jpg'
end
course.description = "This HND year 2 is a continuation from the HNC course and is designed to provide you with the key competencies required by anyone entering the Financial Services Industry as a trainee, or at a technical level, or for anyone already working in such a position but wishing to lay the foundation of a professional career. \n\nIt develops your understanding in areas such as Pensions, Insurance and Investments. \n\nFurther details of the topics covered is provided in the section “what you study” below. "
course.entry_requirements = "Successful completion of a full time HNC Financial Services course with 15 credits, with a Grade A in the graded unit and all mandatory units.\n\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "The course is for those wishing to work in an administrative, sales, customer support or technical support role within the Finance Industry.\nThere are various employment opportunities, including working in: banking, building societies, pension funds, investment companies, insurance, unit trusts, stock market operations, life and pensions, asset management and intermediation.."
course.spaces = course_spaces
course.status = :open
puts 'Financial Services (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Fine Art (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Fine%20Art%20Year%202%20Direct%20Entry%201600x1078%20.jpg').open
else
  course.image.filename = 'HND_20Fine_20Art_20Year_202_20Direct_20Entry_201600x1078_20.jpg'
end
course.description = "This stimulating, and creative course will be delivered to you by our highly professional teaching staff with significant fine art experience and a proven track record of bringing out the best in their students.\n\nThe course includes both traditional and innovative practices. It will give you a broad visual education in contemporary art practice. You'll develop your skills in a range of specialist disciplines and increase your awareness and knowledge of conceptual thinking. It also offers an opportunity to develop individual practice in relation to your own interests.\n\nStudents who successfully complete this course will achieve the HND Contemporary Art Practice.\n\nVisit Visual Grammar, City of Glasgow College Fine Art Facebook page.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Fine Art (Contemporary Art Practice), or equivalent.\nYou'll be invited to a portfolio event where you will get the opportunity to find out more about the course and tell us why you are interested in this subject area. You'll be required to bring a portfolio of your work for assessment."
course.career_prospects = "Work as an independent exhibiting artist, depending on the quality of your work, motivation and self-promotion skills. The experience of the HND can also help to prepare you for working in other roles within the creative industries such as curation or community arts.\n\nStudents who complete their HND can progress to:\n\n* BA (Hons) Contemporary Art Practice at City of Glasgow College.\n* Other art school or university degree courses (2nd or 3rd year entry."
course.spaces = course_spaces
course.status = :open
puts 'Fine Art (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Financial Services HNC'
course.category = Category.find_by_name 'Accounting'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/FinancialServices_HNC.jpg').open
else
  course.image.filename = 'FinancialServices_HNC.jpg'
end
course.description = "This HNC is designed to provide you with the key competencies required by anyone entering the Financial Services Industry as a trainee, or at a technical level, or for anyone already working in such a position but wishing to lay the foundation of a professional career.  Further details of the topics covered is provided in the section “what you study” below. \n\nThe aims of the HNC are to:\n\nYou'll be assessed throughout this course with the assessments taking the form of practical assessments, assignment and case studies.  You'll also undertake a Graded Unit project, which is designed to assess your ability to integrate the knowledge and skills gained through the mandatory units. \n\nCity of Glasgow College has strong links with Financial Services organisations, which provide industry visits and guest speakers to add value to the academic content of the course. \n\nThroughout the course you'll undertake a programme of guidance activities designed to help you make the most of your qualification and college experience. \n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One relevant* Higher at grade C or above; OR\n* Three relevant* National 5 courses at grade A; OR\n* Successful completion of an NC/NQ; OR\n* Successful completion of a Foundation Apprenticeship in Financial Services; OR\n* Successful completion of an NPA in Financial Services.\n* Equivalent qualifications will be considered. \n* Relevant work experience will be considered where employer referee details have been supplied.\n*Qualifications cannot include any from the following list: Art and Design, Design and Manufacture, Drama, Graphic Communications, Health and Food Technology, Languages, Music, Media, Photography, Physical Education, ESOL.\n\nYou'll be invited to attend a compulsory interview. The interview dates are:\n\n* Thursday 20 April 2017 at 4.15pm\n* Thursday 1 June 2017 at 4.15pm\nThe interview will begin with a 30 minute presentation from the faculty about the course and the college. This will be followed by a 10 minute one to one discussion on your application form and your suitability for the course. You will be given the opportunity to ask questions. You must bring a copy of qualification certificates."
course.career_prospects = "The course is for those wishing to work in an administrative, sales, customer support or technical support role within the Finance Industry.\n\nThere are various employment opportunities, including working in: banking, building societies, pension funds, investment companies, insurance, unit trusts, stock market operations, life and pensions, asset management and intermediation.."
course.spaces = course_spaces
course.status = :closed
puts 'Financial Services HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Computing: Networking HND'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_digitalmedia_3.jpg').open
else
  course.image.filename = 'Computing_digitalmedia_3.jpg'
end
course.description = "This course aims to teach you the skills required to install, configure and maintain computer network infrastructures.  Students gain practical skills and knowledge of current and emerging principles and network technologies with an emphasis on active and participative learning.\n\nYear One builds a solid foundation in networking and routing concepts, ethical hacking and client operating systems, incorporating both Microsoft and Linux platforms.  You will have access in our specialist computing classrooms and networking labs.\n\nYear Two progresses your skills in administering networks, configuring server operating systems and developing security concepts.\n\nThe programme integrates learning materials from industry standard vendors, which help prepare you for a variety of optional certification exams such as Cisco Certified Network Associate (CCNA) and Microsoft Certifications.  These qualifications are highly sought after by employers. \nAfter successfully completing this course you will have the skills needed to get an entry level role in IT infrastructure support.   \n\nA large number of HND Networking students progress on to University programmes including 2nd or 3rd year entry in Cyber Security, Ethical Hacking and Networking. \n\nThis course also accepts year two direct entrants.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two appropriate Highers and three Intermediate 2 courses (including at least one from Computing or Information Systems), OR\n* Two Highers and three Standard Grades at Credit Level, OR\n* Two Highers and three National 5 qualifications, OR\n* A national qualification at SCQF Level 6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development), OR\n* Other equivalent qualifications or experience.\n* An HNC with relevant options.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career in IT infrastructure support.."
course.spaces = course_spaces
course.status = :open
puts 'Computing: Networking HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Computing: Networking HNC'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_girl_wires.jpg').open
else
  course.image.filename = 'Computing_girl_wires.jpg'
end
course.description = "This course will allow you to study towards an up-to-date qualification in many of the skills that are in demand for different types of computing careers. The course will follow the units of the first year of the HND Networking course, including network technology and routing technology.\n\nYou will receive a HNC Computing / HNC Computing: Networking award qualification on successful completion of the course. This course integrates learning materials from industry standard vendors such as Microsoft and Cisco which can help you to prepare for a variety of vendor certification exams.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* One Higher and three Standard Grades at credit level; OR\n* One Higher and three National 5 qualifications; OR\n* A national qualification at SCQF Level 6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR\n* Other equivalent qualifications or experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "You can progress on to second year of HND Computing: Network Technology or apply for entry into the first year of related BSc Computing degree programmes at most universities on successful completion of this course.."
course.spaces = course_spaces
course.status = :open
puts 'Computing: Networking HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Computer Games Development HNC'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computing_GamesDevHNC.jpg').open
else
  course.image.filename = 'Computing_GamesDevHNC.jpg'
end
course.description = "This creative, hands-on course enables you to develop skills in all aspects of computer games development. You'll learn how to create logic games, 2D games and 3D first person game by staff with significant Computer Games industry experience and a proven track record of bringing out the best in their students.\n\nThis course prepares you for employment in a junior developer role within the Computer Games Industry, or a junior software developer role within the IT Industry. The HNC Computer Games Development qualification has progression routes to 2nd year BSc Games and Software Development degree programmes.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* 2 Highers at grade  A to C, one of which must be Mathematics AND\n* 2 Standard Grades at band 1 to 3 OR Intermediate 2 at  band A to C\n* English or Communication Standard Grade at band 1 to 3 OR Intermediate 2 at  band A to C\n* Candidates possessing a National Qualification in Computer Games at Level 5 or 6 may also be eligible for entry to this cours"
course.career_prospects = "Employment as a junior Games Programmer/Modeller or Software Developer.."
course.spaces = course_spaces
course.status = :cancelled
puts 'Computer Games Development HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'SPD Marine Engineering (Cadet Programme) HND'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/marine_engineering_1.jpg').open
else
  course.image.filename = 'marine_engineering_1.jpg'
end
course.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch.  The HND in marine engineering will also give academic exemptions for management level exams further in your career path. There are a number of elements to the programme and also a compulsory sea time requirement.\n\nThe programme is structured into 5 phases:\n\nThere are two main entries into this programme: September and January. "
course.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n* National 5/GCSE or equivalent which must include: English, Maths, Physical Science (e.g. Physics/Chemistry/Technological Studies/Engineering Science) and one other subject\n* NC Shipping and Maritime Operations (SCQF level 6) without optional Engineering Units.\n* Alternative qualifications will be considered on an individual basis in conjunction with the sponsoring company or training provider\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme.  \n\nInitial applications for this course should be submitted to a training provider or company, please follow the link below for more information:\n\nwww.careersatsea.org/sponsoring-companies/"
course.career_prospects = "On successful completion of the HND programme, Cadets can gain employment as a fully qualified officer of the watch or choose to progress onto university to study at a higher level.."
course.spaces = course_spaces
course.status = :open
puts 'SPD Marine Engineering (Cadet Programme) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Acting and Performance HNC'
course.category = Category.find_by_name 'Drama & Creative Writing'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Drama_group3.jpg').open
else
  course.image.filename = 'Drama_group3.jpg'
end
course.description = "This course develops the skills you require for acting and performance. It is designed to focus on the practical skills required by the actor, while also supporting the practical experiences with knowledge of theatre and performance.\n\nThis creative, learner-focused course is delivered by highly professional teaching staff, with significant acting and performance experience and a proven track record of bringing out the best in their students.\n\nOn completion of the course, you'll be awared a HNC Acting and Performance and you may be eligible for direct entry into the second year of HND Acting and Performance.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grades, including English; OR\n* NQ Drama; OR\n* Equivalent qualification.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject.\n\nIf your application is successful, you'll also be asked to audition where you will perform a monologue."
course.career_prospects = "There are a wide range of career opportunities which include working in theatre, television, community drama, and theatre production.."
course.spaces = course_spaces
course.status = :closed
puts 'Acting and Performance HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Furniture Restoration HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Furniture_group_discussing.jpg').open
else
  course.image.filename = 'Furniture_group_discussing.jpg'
end
course.description = "This course will allow you to develop your skills in furniture analysis and practical solutions, through workshop activities. You’ll study the history of furniture design and materials as well as the construction, upholstery and finishing of period furniture. You’ll also restore items of furniture throughout this course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NQ in Furniture Making; OR\n* One Higher – Craft and Design, and English at minimum Intermediate 2 or National 5.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of any design and/or making of furniture or 3D work."
course.career_prospects = "Career opportunities are many and varied. A high number of craftspeople are self-employed or in a partnership, which can be rewarding. There are also jobs in furniture trades and shop-fitting.."
course.spaces = course_spaces
course.status = :open
puts 'Furniture Restoration HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Jewellery Design HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/jewellery_clamp_lady.jpg').open
else
  course.image.filename = 'jewellery_clamp_lady.jpg'
end
course.description = "This HND course will teach you a comprehensive range of skills in jewellery design and manufacture, with a design-led focus. You'll be able to choose specialisms according to your own interests, as well as the current business environment.\n\nYour course will be delivered by qualified lecturers, all with a degree in Jewellery/Silversmithing, TQFE Certified and have related industry experience and various specialised skill sets.\n\nYou'll learn designing and manufacturing with various precious and non precious metals (please see the 'Materials' section, below, to find out more). \n\nThe course is project based with units usually being integrated. You'll study specialist practical techniques which can be found in the 'What you Study' section, below. We focus on marrying new technology with traditional techniques – pushing boundaries of material exploration, and developing skills in emerging technologies including: 3D Printing, Scanning, Laser Cutting, Smart Materials.\n\nTo reflect the constant changes within the industry, we work closely with a range of industry partners, and update course content to ensure you receive relevant skills and qualifications.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher in Art and Design and English at minimum Intermediate 2; OR\n* NC/NQ in an Art and Design subject.\nYou'll be invited for a group and/or individual interview where you'll find out more about the course and tell us why you're interested in this subject area.\n\nAt the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "You can set up business as a jeweller or gain employment in the creative industries, by utilising the range of skills you'll learn throughout the course.."
course.spaces = course_spaces
course.status = :open
puts 'Jewellery Design HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Travel and Tourism (with option to study languages) HNC'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Tourism_Barcelona_1.jpg').open
else
  course.image.filename = 'Tourism_Barcelona_1.jpg'
end
course.description = "This course will give you the skills, knowledge and understanding to develop your career in the Travel and Tourism Industry. You'll gain the skills and knowledge required to provide high quality customer service and enhance your own employability."
course.entry_requirements = "* One Higher at Grade C or above in appropriate academic subjects (such as English, Modern Studies, Languages, Business Management, History) and three National 5 qualifications including English; OR\n* One Higher at Grade C or above (such as English, Modern Studies, Languages Business Management, History) with three Intermediate 2 courses including English; OR\n* One Higher at Grade C or above (such as English, Modern Studies, Languages Business Management, History,) and three Standard Grades at credit level including English; OR\n* Other equivalent qualifications or experience.\nYou'll be invited to attend a course presentation where you'll get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course.career_prospects = "* National Tourist Organisations.\n* Travel Management Companies.\n* Visitor Centres/Attractions.\n* Tour Operators.\n* Travel Agents.\n* Airlines.\n* Airport Ground Handling.\n* Foreign Exchange Service."
course.spaces = course_spaces
course.status = :closed
puts 'Travel and Tourism (with option to study languages) HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Computer Science HNC'
course.category = Category.find_by_name 'Applied Computing & Digital Technologies'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Computer_Science.jpg').open
else
  course.image.filename = 'Computer_Science.jpg'
end
course.description = "The HNC Computing (Science) course is an SQA qualification which aims to meet the challenges of employers seeking qualified learners who can demonstrate knowledge and skills in a range of technology areas.\nThe course places particular emphasis on software development, data science, project management and soft skills such as team-working.\n\nAccording to research from Tech Partnership (a network of employers working with the Scottish Government and Skills Development Scotland to create skills for the UK's digital economy) the number of UK Digital Businesses has increased 30% in the last 5 years.\n\nTheir forecast shows the number of people working in the UK as technology specialists between 2014 and 2024 will grow by 28%, significantly outstripping that predicted for workers more generally.\n\nThe course is delivered by experienced lecturing staff many of whom have industry experience in IT areas such as software engineering, programming, project management and technical support.\n\nAfter successfully completing the award, you can apply for a range of entry level posts within the IT industry, you may progress to year 2 of the HND Computer Science course or enter a relevant degree course at a range of universities\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* One Higher* and three National 5 qualifications; OR\n* One Higher* and three Intermediate 2 courses (including at least one from Computing or Information Systems); OR\n* One Higher* and three Standard Grades at credit level; OR\n* A national qualification  at SCQF Level 6 in a related subject (such as Digital Media Computing, Computing: Technical Support or Software Development); OR\n* Other equivalent qualifications or experience\n*in one of these subjects: Computing, Information Systems, Mathematics, Physics or any other relevant subject\n\nYou’ll be invited for a group and/or individual interview where you can find out more about the course and tell us why you’re interested in this subject."
course.career_prospects = "The HNC/D in Computing: Computer Science will prepare you for a career in programming, website development or as a support technician or database administrator.."
course.spaces = course_spaces
course.status = :open
puts 'Computer Science HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Marine Engineering - Year 2 Direct Entry HND'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/marine_engineering_2.jpg').open
else
  course.image.filename = 'marine_engineering_2.jpg'
end
course.description = "This one-year program is suitable for those cadets who have completed MNTB/MCA approved HNC in Marine Engineering.\n\nSuccessful completion of HND in Marine Engineering will entitle you to MCA’s Management Level Academic subjects such Mathematics, Engineering Drawing, Electro-technology, Naval Architecture, Applied Heat and Applied Mechanics.\n\nFor further information see http://www.careersatsea.org/."
course.entry_requirements = "* MNTB/MCA Approved HNC in Marine Engineerin"
course.career_prospects = "Successful completion of the course may offer you entry to second year of a four years honours course at university.\n\nThis course prepares you for a career as a Senior Marine Engineering Officer, Ship Manager, or Ship Superintendent.."
course.spaces = course_spaces
course.status = :closed
puts 'Marine Engineering - Year 2 Direct Entry HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Complementary Therapies (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Hair & Beauty'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Beauty_complementary_therapy_massage_1.jpg').open
else
  course.image.filename = 'Beauty_complementary_therapy_massage_1.jpg'
end
course.description = "We are a sector leading provider of training in complementary therapies and our second year HND programme aims to provide everything you need to become a confident practitioner, qualified to an advanced level.\n\nAfter successfully completing the course, you'll be eligible for professional membership and insurance within the field of complementary therapies.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Complementary Therapies (15 credits), must include Reflexology.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. We'll also want to hear why you are interested in undertaking progression of your qualification."
course.career_prospects = "This course prepares you for a career in the field of complementary therapies, for example in healthcare services, cruise ships, spas, hotels or self-employment.."
course.spaces = course_spaces
course.status = :open
puts 'Complementary Therapies (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = '3D Design/ HNC 3D Design: Product Design HNC'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Product_design_boyfix_wheel_0.jpg').open
else
  course.image.filename = 'Product_design_boyfix_wheel_0.jpg'
end
course.description = "Looking to become a qualified Product Designer? This is a challenging course, where you take part in an exciting and comprehensive programme of product design. You’ll learn about new materials, CAD and how to use manufacturing processes, as well as developing 3D prototypes.\n\nYou'll work through all the stages of the design process through a number of projects, producing presentation boards for clients to review.\n\nThe course gives you the skills required for employment in this high demand industry sector (please see further information in the 'after the course' section) and will be delivered by our professional teaching staff with significant product design experience.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC Product Design or related discipline (eg Furniture Design), OR\n* One Higher from Design and Manufacture, Product Design, Graphic Communication or Art and Design, and English at minimum Intermediate 2, OR\n* One Higher from Product Design, Graphic Communication or Art and Design, and English at National 5 level, OR\n* Other equivalent qualifications, or experience.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you'll be asked to provide examples of your art and design work."
course.career_prospects = "Upon graduating, you'll be able to seek employment as a qualified Product Designer, Solidworks 3D Modeller, or Digital Media Designer.."
course.spaces = course_spaces
course.status = :open
puts '3D Design/ HNC 3D Design: Product Design HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = '3D Design: Model Making for the Creative Industries HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Modelmaking_02.jpg').open
else
  course.image.filename = 'Modelmaking_02.jpg'
end
course.description = "This Model Making course is aimed at students who have some practical skills in crafts, art and design and who have an interest in working in the fields of model or prop making for TV, film and theatre, architecture, product design, prototypes, museums, cosplay etc.\n\nYou'll develop skills in the design and construction of a wide variety of types of model through project-based units designed to be relevant to future employment and study routes. Projects are varied to cater for a broad range of interests and to allow as much individual creative input as possible. In addition, by the end of the course you will be encouraged to have a strong online presence to facilitate networking within the industry.\n\nThe dedicated course lecturers bring many years of wide ranging commercial model making experience to the college and have been continually updating and developing the course over the last 10 years. You'll work on projects independently or in groups. Teaching will be through class discussion and demonstrations and one-to-one tutorials in practical and design tasks, with individual feedback, guidance and support.\n\nLinks to relevant companies and practitioners are encouraged and industry guest speakers and visits are frequently arranged. At the end of the course, selected students have the opportunity to show their work at the annual model making trade show in London.\n\nStudents from this course have gone on to study at degree level, gone directly into employment with some of the country’s most prestigious companies e.g. Sir Norman Foster Architects or found success as freelance model makers in various niche markets.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC Model Making, or a NC in a related discipline, OR\n* One Higher from Art, Design &amp; Manufacture, Product Design or Graphic Communication and English at National 5 level, OR\n* Related work experience.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview you're asked to bring your best examples of both 2D and 3D art and design work, in original, photographic or portfolio form."
course.career_prospects = "Many graduates work as model makers all over the world, including New Zealand, Dubai and Australia.."
course.spaces = course_spaces
course.status = :closed
puts '3D Design: Model Making for the Creative Industries HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Legal Services HND'
course.category = Category.find_by_name 'Administration, Human Resources & Law'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Law_debate.jpg').open
else
  course.image.filename = 'Law_debate.jpg'
end
course.description = "The course is recommended for you if you're planning a professional career in the legal field, progressing to study law in depth following the HND, or if you might be interested in consolidating your career in a related field.\n\nThe course will consist of lectures, tutorials, practical based tasks such as mock trials and the presentation of evidence under court conditions. You'll consider numerous common aspects of life and how the law affects individuals every day when facing problems in business, relationships, employment and the courts.\n\nEmphasis is placed on developing both your academic and vocational skills to equip you to progress into employment or further study. You'll be introduced to notions of equality, society, discrimination, prejudice and the rule of law.\n\nThe HND in Legal services is an excellent foundation course in law which, at the end of the two years of study, provides a recognised professional qualification for an application to enter the Scottish paralegal profession.\n\nThe course is full-time covering at least 4 days per week and addresses a broad range of legal topics including business law, private and public law, employment law, criminal law, Sheriff Court procedure and corporate law.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes at band C or above. One Higher must be in English, Modern Studies, History, Psychology or a related subject – other Highers may be considered (including those who have previously achieved Higher grades in sciences and languages and who now are considering a change of possible career path); OR\n* A NC/NQ Level 6 in Legal or Business related subject; OR\n* Relevant experience of employment.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "On successful completion of your HND you may enter a related field, working as a trainee paralegal or as part of an in-house legal team. You can find employment with local authorities, the Sheriff Court, or Procurator Fiscal office.\n\nThere are also opportunities for you in the Banking and Insurance Sectors, and a number of graduates have joined Police Scotland.."
course.spaces = course_spaces
course.status = :open
puts 'Legal Services HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Legal Services (With Criminology and Police Studies) HNC'
course.category = Category.find_by_name 'Administration, Human Resources & Law'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/LegalSerivcesHNC.jpg').open
else
  course.image.filename = 'LegalSerivcesHNC.jpg'
end
course.description = "This course is based around Scottish criminal law and Scottish criminal procedures, criminology, contemporary policing and the criminal justice system in Scotland. In addition to these core subjects, you'll study commercial law, private law and property law, sheriff civil and a communications unit.\n\nDuring the year, you'll look at the role of the citizen within society, the rights and obligations of the private citizen across commercial, property and private matters, the principle of equality, fairness and the role of government and other agencies in maintaining and regulating the rights of the individual.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher at grade C or above, preferably English, History, Modern Studies or a related subject; PLUS\n* Three Intermediate 2 at grade C or above, preferably including English, History, Modern Studies or a related subject; OR\n* An NC Qualification at Level 6.\nIf you don't have the standard entry qualifications but have an employment history and are looking for a career change, you can be considered subject to review of that work experience.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "This course prepares you for a career in the police service, prison service, and other related agencies.."
course.spaces = course_spaces
course.status = :open
puts 'Legal Services (With Criminology and Police Studies) HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Business HNC'
course.category = Category.find_by_name 'Business & Procurement'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_HNC.jpg').open
else
  course.image.filename = 'Business_HNC.jpg'
end
course.description = "Are you looking for a career in banking, insurance, civil service, local government or distribution? This course gives you the skills and knowledge necessary to succeed, with excellent career opportunities and progression routes. \n\nYou'll be taught by staff with relevant industry experience and a proven track record of bringing out the best in their students.\n\nToday, the internet is an important part of business, so we've updated the course to include analysing and using information for strategic purposes.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher pass in a relevant* academic subject OR\n* National Certificate in Business (with at least 3 units at level 6) OR\n* Other appropriate and relevant National Certificate courses (with at least 3 units at level 6) may be considered.\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you're interested in this course and ask any specific questions related to your own application."
course.career_prospects = "You could expect to apply for a trainee management position and/or a team leader in industry or commerce.."
course.spaces = course_spaces
course.status = :open
puts 'Business HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Business HND'
course.category = Category.find_by_name 'Business & Procurement'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_Boy_ipad.jpg').open
else
  course.image.filename = 'Business_Boy_ipad.jpg'
end
course.description = "The course provides you with the skills and knowledge necessary for careers in banking, insurance, civil service, local government and distribution. Today, the internet is an important part of business, so we've updated the course to include analysing and using information for strategic purposes.\n\nYour course will be delivered by our highly professional teaching staff with relevant industry experience and track record of bringing out the best in their students.\n\nThis course accepts year two direct entrants (you must have a completed HNC Business, please see further information in direct entry section).\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7 (year 1) and Level 8 (year 2).  For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "Year 1 Entry\n\n* Two Highers in a relevant* academic subject OR\n* Relevant Work experience may be considered.\n* relevant academic subjects include English, Administration, Business Management, Economics, Geography, History, Mathematics, Modern Studies or a Science subject.\n\nYou'll be invited to attend a group presentation and interview session.  The presentation will give you all of the information you need about the course, this will be followed on the same day by an individual interview where you can tell us why you are interested in this course and ask any specific questions related to your own application."
course.career_prospects = "This course will prepare you for trainee positions in management and administration in industry, financial services and the public sector.."
course.spaces = course_spaces
course.status = :open
puts 'Business HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Marketing HNC'
course.category = Category.find_by_name 'Marketing & Retail'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Business_ipad2.jpg').open
else
  course.image.filename = 'Business_ipad2.jpg'
end
course.description = "This course will help develop the skills you need to work in marketing - an area with excellent career opportunities and progression routes (please see further information in the 'After the Course' section below). You'll cover marketing theory and buyer behaviour, as well as the main operational areas of marketing planning, research, promotion and selling.\n\nYou'll be taught by staff with significant experience in marketing and a proven track record of bringing out the best in their students.\n\nAre you interested in this course and want to know more? Use the 'Contact a Lecturer' link to get in touch.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher at grade C or above (preferably English, Modern Studies, Economics, History or Business) and two other passes at Standard Grade, or equivalent at band 3 or above, OR\n* One Higher at grade C or above (preferably English, Modern Studies, Economics, History or Business) and two other passes at National 4 or above, OR\n* A relevant National Qualification or Certificate including Core Skills Higher Communication and appropriate subject units.\n* You'll need a genuine interest in marketing which should be demonstrated in the applicatio"
course.career_prospects = "This course prepares you for a career in marketing, promotion and export departments of industrial, or commercial companies.."
course.spaces = course_spaces
course.status = :open
puts 'Marketing HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Furniture Craftsmanship with Design HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Furniture_paint_wood_girls.jpg').open
else
  course.image.filename = 'Furniture_paint_wood_girls.jpg'
end
course.description = "This course encourages you to develop practical skills through manufacture, and to express yourself through design. You’ll be encouraged to study in-depth the construction of furniture, to develop and build designs and to hone your skills in cabinet making, upholstery and wood finishing.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC Furniture Making; OR\n* One Higher in Craft and Design, and English at minimum Intermediate 2 or National 5.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. At the interview you'll be asked to provide examples of any design and/or making of furniture or 3D work."
course.career_prospects = "After completing the course youmay go on to become self-employed Designers/Makers of furniture, as well as pursuing jobs in the furniture trades and shop-fitting.."
course.spaces = course_spaces
course.status = :open
puts 'Furniture Craftsmanship with Design HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Art and Design /  Applied Arts  HND'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/applied_arts_display.jpg').open
else
  course.image.filename = 'applied_arts_display.jpg'
end
course.description = "This is a challenging course, where you take part in an exciting and comprehensive programme of design and specialist craft studies. The course is project-based, and you'll be concentrating on designing, exploring and making, drawing and personal expression.\n\nThis course could provide you with a variety of work suitable for a portfolio with an emphasis on applied art techniques in Art Glass, Applied Ceramics, Jewellery, Textiles and Performance Costume.\n\nAlthough we teach making skills on the course, it’s an advantage to have experience in working in 3D, and also making skills in different media.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes at grade C or above, in Art and English and two other passes at Standard Grade (or equivalent) at band 3 or above; OR\n* Two Higher Grade passes at grade C or above, in Art and English and two National 4 qualifications; OR\n* NQ Art and Design (or equivalent).\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject. At the interview, you'll be asked to provide examples of your art and design work."
course.career_prospects = "This course prepares you for a career in:\n\n* 2D or 3D Design.\n* Crafts.\n* Sculpture.\n* Theatre Design.\n* Teaching.\n* Community Art.\n* Art Therap."
course.spaces = course_spaces
course.status = :open
puts 'Art and Design /  Applied Arts  HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Fine Art HNC'
course.category = Category.find_by_name 'Fine Arts & Photography'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HNC_Fine_Art.jpg').open
else
  course.image.filename = 'HNC_Fine_Art.jpg'
end
course.description = "This contemporary course includes both traditional and innovative art practices. It gives you a broad visual education in contemporary art practice.\n\nYou'll develop your skills in a range of specialist disciplines and increase your awareness and knowledge of conceptual thinking. It's also a great opportunity to improve and strengthen your existing portfolio of artwork.\n\nYou'll be awarded an HNC Contemporary Art Practice on successful completion of this course.\n\nFor more information visit Visual Grammar, the department of Fine Art's Facebook page, and other courses on this website with Fine Art i.e. NC Fine Art Portfolio / HND Fine Art / BA (Hons) Contemporary Art Practice.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grade passes at grade C or above, in Art and English and two other passes at Standard Grade (or equivalent) at band 3 or above; OR\n* Two Higher Grade passes at grade C or above, in Art and English and two National 4 qualifications; OR\n* NQ Art and Design (or equivalent).\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject. On the day you'll also be asked to submit a portfolio of your art and design work for assessment and may be given a short interview."
course.career_prospects = "This course prepares you for work as an independent exhibiting artist, depending on the calibre of your work, your motivation and self-promotion skills.."
course.spaces = course_spaces
course.status = :closed
puts 'Fine Art HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Illustration HND'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Illustration.jpg').open
else
  course.image.filename = 'Illustration.jpg'
end
course.description = "This course will help you develop your creative and technical skills to become a commercial illustrator. You'll build projects from initial ideas and sketchbook drawings, through to illustration artwork ready for presentation to a client. You're encouraged to explore individual responses to project briefs.  On completion of the course you'll have produced a broad and exciting portfolio of illustrations and other relevant art and design work.  \n\nDuring your time on the course you'll have the opportunity for study trips at both home and abroad.  \nRecent trips have included Berlin, Amsterdam, the Outer Hebrides, Edinburgh and the art galleries of Glasgow.   \n\nIn addition, the course prides itself in providing relevant industrial experience and you would be expected to complete a range of live and client led projects.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NC in Art and Design or related subject; OR\n* Higher Art and Design and English at minimum Intermediate 2/National 5 level; OR\n* Relevant experience.\n* HNC Illustration OR\n* First year of HND Illustration.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "The HNC/D course can lead to self-employment as a freelance Illustrator working with advertising agencies, design consultants, and book, magazine and newspaper publishers, or in your own private practice.."
course.spaces = course_spaces
course.status = :open
puts 'Illustration HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Creative Industries: Television HND'
course.category = Category.find_by_name 'Media'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/TV_Sound_edit.jpg').open
else
  course.image.filename = 'TV_Sound_edit.jpg'
end
course.description = "This course will help you to further develop skills in all areas of television production, including camera, sound, editing, sound dubbing and lighting. An ideal course if you are interested in TV, film, video, broadcast and working in a studio environment.\n\nThis stimulating, learner-focused course is delivered by highly professional teaching staff, with significant Television Industry experience. (For more help getting started in the television industry, visit the Royal Television Society).\n\nYou'll be awarded a HND in Creative Industries: Television on successful completion of the course.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NQ or NC Media: TV or equivalent SVQ; OR\n* Higher English plus two National 5 Qualifications (or equivalent); OR\n* Relevant television experience\nYou'll be invited for a group and 1 to 1 interview where you can find out more about the course and tell us why you are interested in this subject. You'll also be asked to bring examples of your work.\n\nPlease note, places are very limited for second year entry and might not be available in any given year."
course.career_prospects = "The Television Industry is expanding and there are opportunities for skilled graduates, both in broadcasting and with independent production companies.."
course.spaces = course_spaces
course.status = :open
puts 'Creative Industries: Television HND saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Creative Industries: Television HNC'
course.category = Category.find_by_name 'Media'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Television_camera.jpg').open
else
  course.image.filename = 'Television_camera.jpg'
end
course.description = "If you are interested in television, this one year course allows you to specialise in camera, sound and lighting, including directing on location, location lighting, location sound and production management incorporating film, video, broadcast and editing.\n\nYou'll learn multi-camera TV studio techniques in our industry standard studio, allowing students to operate in a multi camera studio environment, covering roles such as Director, Vision Mixer, or Lighting and Camera Operator.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* NQ or NC Media: TV or equivalent SVQ; OR\n* Higher English plus two National 5 Qualifications (or equivalent); OR\n* Relevant television experience.\nYou'll be invited for a group and 1 to 1 interview where you can find out more about the course and tell us why you are interested in this subject.\n\nIt will enhance your application if you can provide examples of your work."
course.career_prospects = "."
course.spaces = course_spaces
course.status = :open
puts 'Creative Industries: Television HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Creative Industries: Television  (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Media'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/TV_Sound_edit_0.jpg').open
else
  course.image.filename = 'TV_Sound_edit_0.jpg'
end
course.description = "This course will help you to develop skills in all areas of television production, including camera, sound, editing, sound dubbing and lighting. An ideal course if you're interested in TV, film, video, broadcast and working in a studio environment.\n\nCareer prospects and employment opportunities are excellent with many of our students progressing to degree level study or to careers both in broadcasting and with independent production companies (please see After the Course section below for more information). \n\nOn successful completion of the course, you'll be awarded with an HND Creative Industries: Television.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "​HNC Television with 15 credits\n\nOR\n\nRelevant television experience.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. You'll also be asked to bring examples of their work."
course.career_prospects = "The Television Industry is expanding and there are opportunities for skilled graduates, both in broadcasting and with independent production companies.."
course.spaces = course_spaces
course.status = :open
puts 'Creative Industries: Television  (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Media and Communication HNC'
course.category = Category.find_by_name 'Media'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Desktop_Publishing_girl.jpg').open
else
  course.image.filename = 'Desktop_Publishing_girl.jpg'
end
course.description = "This wide-ranging and multi-faceted Media and Communication course will help you to develop a broad base of multi-platform media skills suitable for higher education and employment in the modern, convergent media and communications industries.\n\nEach tutor has a wide variety of media experience, and you'll gain even more knowledge from expert media guest speakers, visits, field trips and professional workshops.\n\nYou’ll be continually assessed and will be working on industry relevant projects, in some cases for real clients.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Higher English or Higher Media Studies at Grade C or above, OR\n* NC Media or a similar NC programme, OR\n* Relevant work experience.\nYou'll be invited for a group pre-entry guidance session and individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n\nAt this interview you'll be given a short written exercise (around 200 words) so we can review your writing style, syntax, spelling and grammar.\n\n It may also strengthen your application to provide evidence of relevant experience or activity in the subject area, e.g. blogging, podcasting, published work, involvement in school newspapers, magazines or radio stations, relevant work experience or volunteering etc. "
course.career_prospects = "This course prepares you for a career in journalism, television and radio production, video production, public relations and advertising.."
course.spaces = course_spaces
course.status = :closed
puts 'Media and Communication HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Media with Journalism HNC'
course.category = Category.find_by_name 'Design Crafts & Graphic Arts'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HNC%20Creative%20Industries%20Media%20and%20Communication%201600x1078_IMAGE1_0.jpg').open
else
  course.image.filename = 'HNC_20Creative_20Industries_20Media_20and_20Communication_201600x1078_IMAGE1_0.jpg'
end
course.description = "This course has a focus on Journalism for learners who are interested in that discipline and might wish to apply for first year entry at University. \n\nIt will help you develop a broad base of multi-platform media and Journalism skills suitable for higher education and employment in the modern, convergent media and communications industries. \n\nEach tutor has a wide variety of media experience, and you'll gain even more knowledge from expert media guest speakers, visits, field trips and professional workshops.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* One Higher at Grade C or above preferably English or Media Studies, OR\n* NC Media or a similar NC programme, OR\n* Relevant work experience.\nYou'll be invited for a group pre-entry guidance session and individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject.\n\nAt this interview you'll be given a short written exercise (around 200 words) so we can review your writing style, syntax, spelling and grammar.\n\n It may also strengthen your application to provide evidence of relevant experience or activity in the subject area, e.g. blogging, podcasting, published work, involvement in school newspapers, magazines or radio stations, relevant work experience or volunteering."
course.career_prospects = "This course prepares you for a career in journalism, television and radio production, video production, public relations and advertising.."
course.spaces = course_spaces
course.status = :open
puts 'Media with Journalism HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Care and Administrative Practice (Clinical Route) HNC'
course.category = Category.find_by_name 'Health, Social Care & Early Education'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Community_Care_elderly_person.jpg').open
else
  course.image.filename = 'Community_Care_elderly_person.jpg'
end
course.description = "This course teaches you the skills and knowledge needed for potential career opportunities within the NHS and the Care Sector, as well as providing a recognised entry qualification for nurse training. The course also offers practical experience, including a mandatory workplace element.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework: visit www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher grades at C or above, English preferable; OR\n* Relevant industry experience and qualifications.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. You'll also need to provide two references, one must be from your most recent educational provider (if you're in education) or employer and a PVG check."
course.career_prospects = "This course can lead to various careers within the care or administrative sector, within the private and public sectors.."
course.spaces = course_spaces
course.status = :open
puts 'Care and Administrative Practice (Clinical Route) HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Childhood Practice HNC'
course.category = Category.find_by_name 'Health, Social Care & Early Education'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HNC%20Childhood%20Practice%201600x1078.jpg').open
else
  course.image.filename = 'HNC_20Childhood_20Practice_201600x1078.jpg'
end
course.description = "This course is for individuals interested in a career in the early education and childcare field or for those wishing to pursue further study for example, within Primary Education or Childhood Practice.\n\nApproved by the Scottish Social Services Council, this course is a suitable qualification for registration as a Child Development Officer.\n\nThe main aim of the HNC is to provide an integrated course of values, skills and knowledge to equip candidates to work effectively within an early education and childcare settings.\n\nMore specifically, the course will enable you to:\n\n\nThe structure of the course includes lectures, research tasks, presentations and group discussions.  This is an interactive course which includes blended learning and encourages your active participation. During your course, industry experts will be invited to speak with student groups. The staff group consists of lecturers from a variety of early education, health and social care backgrounds.  \n\nHNC Childhood Practice full-time students will complete two days per week on placement throughout the duration of the course to allow development of experience and completion of three SVQ3 units.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two or more Highers at C or above including English; OR\n* NC Early Education and Childcare Level 6.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject.\n\nYou'll also need to provide two suitable references, one from your most recent educational provider (if in education) or your employer. \n\nExperience witihn an early education - voluntary or employed - would be extreamly beneficial."
course.career_prospects = "This course prepares you for a career as a practitioner in the Childcare and Early Education sectors.."
course.spaces = course_spaces
course.status = :cancelled
puts 'Childhood Practice HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Social Services HNC'
course.category = Category.find_by_name 'Health, Social Care & Early Education'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/social_services.jpg').open
else
  course.image.filename = 'social_services.jpg'
end
course.description = "This course is for individuals interested in a career in the social care field or those wishing to pursue further study, for example, to the Degree in Social Work.\n\nIt is also suitable for individuals who are employed in the care field and require qualifications for registration with the Scottish Social Services Council and/or continual professional development.\n\nThe main aim of the HNC is to provide an integrated course of values, skills and knowledge to equip candidates to work effectively in a range of care settings.\n\nThe specific aims of the course are to enable you to:\n\nYou'll be taught by qualified lecturing staff from a variety of health and social care backgrounds. The structure of the course includes lectures, research tasks, presentations and group discussions.\n\nThis is an interactive course which includes blended learning and encourages your active participation. Industry experts will also be invited to speak with student groups and there is a yearly Graduate Panel for previous students to share their experiences with those currently studying.  \n\nAs a HNC Social Services student you'll complete two days per week on placement from October/November to June within a social care setting allowing for the opportunity to gain experience working directly with service users, put theory into practice in a care setting and complete the SVQ3 units.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Higher Grades at C or above preferably including English; OR\n* An appropriate Level 6 Group Award and/or an appropriate group of SQA units at level 6.\n* Candidates with SVQ3 in a related area will also be considered.\n* Applicants without these qualifications who have relevant experience may also be considered.\nTwo suitable references will be required, including one from your most recent educational provider and/or employed as appropriate.\n\nYou'll be invited for an interview where there will be the opportunity to find out more about the course and tell us why you're interested in this subject area.\n\nPlease note, for a number of the articulation options, Level 5 Maths is required.  This is offered within City of Glasgow College as Lifeskills Maths."
course.career_prospects = "This course prepares you for a career in:\n\n* Social work.\n* Social care worker.\nSupport worker with various groups such as older adults, people with learning difficulties, adult care, community care, offenders, residential child care, or the addiction field.\n\nVarious careers in Care both within the private and public sector.."
course.spaces = course_spaces
course.status = :open
puts 'Social Services HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Social Sciences Diploma of Higher Education'
course.category = Category.find_by_name 'Social Sciences'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/SocialSciencesDipofHE.jpg').open
else
  course.image.filename = 'SocialSciencesDipofHE.jpg'
end
course.description = "The Diploma of Higher Education in Social Sciences is offered by City of Glasgow College, in association with the University of Strathclyde, Glasgow.\n\nIt is equivalent to the first two years of an Honours Degree at the University of Strathclyde and therefore allows you to apply to there for direct entry to the third year of the BA Politics and/or History Degree.\n\nIn the first year you'll study History, Politics, Economics and Sociology and in the second year Politics and History only. Please note that there is no psychology in this degree.\n\nIf you leave after one year – or don’t meet the requirements for the Diploma after two years – you may be awarded a Certificate of Higher Education in Social Sciences.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Four or more Higher Grade pass at grade C or above, one of which must be in English or ESOL and at least two others in social science subjects such as Sociology, Modern Studies, History, Politics, Psychology, Philosophy, Geography, R.M.P.S or Economics.\n* Two other passes at National 5 or equivalent.\nYou'll be invited for a group and/or individual interview where you will get the opportunity to find out more about the course and tell us why you're interested in this subject area."
course.career_prospects = "This course prepares you for a career in public and private sectors including:\n\n* Health service.\n* Community work.\n* Welfare rights.\n* Social research.\n* Teaching.\n* Aid agencies.\n* Social work.\n* Housing.\n* Local, national and European Governmen."
course.spaces = course_spaces
course.status = :open
puts 'Social Sciences Diploma of Higher Education saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Social Sciences HNC'
course.category = Category.find_by_name 'Social Sciences'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HNC%20Social%20Sciences%201600x1078.jpg').open
else
  course.image.filename = 'HNC_20Social_20Sciences_201600x1078.jpg'
end
course.description = "This course provides you with sound education and training in key areas of social science theory, research and investigation.\n\nKey course objectives are to develop knowledge in the social sciences; to develop analytical, evaluative and problem solving skills; to develop communication skills; and to develop personal effectiveness and critical thinking about social and cultural issues.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two SQA Higher Grade passes or equivalent at first sitting. At least one of the Highers must be in English (or ESOL equivalent) or in a social science subject such as Modern Studies, Sociology, Politics, Psychology, History, Economics or Philosophy.\n* Mature students may be considered based on work and life experience.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. Some applicants may be required to take a short written exercise. Applicants are advised to ensure that their personal statement is written to a very high standard."
course.career_prospects = "The vast majority of our successful HNC students apply for the second year of study – HND Social Sciences but others:\n\n* Enter employment.\n* Apply to university for entry at level 1 or ."
course.spaces = course_spaces
course.status = :cancelled
puts 'Social Sciences HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Social Sciences (Year 2 Direct Entry) HND'
course.category = Category.find_by_name 'Social Sciences'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/HND%20Social%20Sciences%202nd%20Year%20entry%201600x1078.jpg').open
else
  course.image.filename = 'HND_20Social_20Sciences_202nd_20Year_20entry_201600x1078.jpg'
end
course.description = "This course provides you with sound education and training in key areas of social science theory, research and investigation.\n\nThe course is delivered by highly qualified lecturers who have a wealth of experience within the industry. Key course objectives are to develop knowledge in the social sciences; to develop analytical, evaluative and problem solving skills; to develop communication skills; and to develop personal effectiveness and critical thinking about social and cultural issues.\n\nCareer prospects and employment opportunities are excellent with many of our students progressing to 3rd year at university (please see the After the Course section, below, to find out more).\n\nAfter successful completion of the course, you'll be awarded with an HND Social Sciences.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* HNC Social Sciences with 15 credits at SCQF level 7; OR\n* First year of HND Social Sciences with 15 credits as SCQF level 7.\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject. Some applicants may be required to take a short written exercise. You are advised to ensure that you personal statement is written to a very high standard."
course.career_prospects = "."
course.spaces = course_spaces
course.status = :cancelled
puts 'Social Sciences (Year 2 Direct Entry) HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Patisserie HNC'
course.category = Category.find_by_name 'Food, Events, Hospitality & Tourism'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Cook_serving_dessert_0.jpg').open
else
  course.image.filename = 'Cook_serving_dessert_0.jpg'
end
course.description = "This course will develop your culinary skills to an advanced level, focusing on specialist patisserie subjects and providing you with the knowledge you'll need for a supervisory role.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/"
course.entry_requirements = "* Professional Cookery year two / NC Professional Cookery (Level 6) or an appropriate group of National Units, OR\n* Other equivalent qualifications or experience\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "This course prepares you for a career in professional cookery, special event catering, commercial catering or airline catering.."
course.spaces = course_spaces
course.status = :closed
puts 'Patisserie HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Fashion Make-Up HNC'
course.category = Category.find_by_name 'Hair & Beauty'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Beauty_applying_makeup_brush.jpg').open
else
  course.image.filename = 'Beauty_applying_makeup_brush.jpg'
end
course.description = "Are you looking to pursue a career in fashion make-up? This course will enable you to gain the basic skills required for a successful career in the Industry.\n\nYour programme will be delivered by highly professional teaching staff with significant experience in fashion make-up and a proven track record of bringing out the best in their students.\n\nDuring the course you'll have the opportunity to participate in a variety of activities including presentations, workshops and demonstrations (please see further information in the 'what you study' section below).\n\nOn successful completion of this course, you'll be awarded with the HNC Fashion Make-Up.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* SCQF Level 5 or SVQ Level 2 Ladies Hairdresssing or NCGA Level 5 in Beauty Care and Make-up; OR\n* A qualification that combines Hairdressing and Beauty units to a minimum SCQF Level 5 or equivalent VQ.\nEntry is based on a successful interview, where you will be expected to show good communicate skills and an understanding of the Fashion Make-up Industry.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you are interested in this subject."
course.career_prospects = "On successful completion of the course you could gain employment within the make-up, or beauty business, become self employed as a freelance make-up artist, or further your career in hairdressing.."
course.spaces = course_spaces
course.status = :closed
puts 'Fashion Make-Up HNC saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Coaching and Developing Sport HND'
course.category = Category.find_by_name 'Sport & Fitness'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Sport_fitness.jpg').open
else
  course.image.filename = 'Sport_fitness.jpg'
end
course.description = "This course introduces and develops the skills and knowledge you’ll need for a career in sports coaching. The principles of good coaching practice are examined and a wide practical and theoretical knowledge of games and sports is developed (please see further information in the 'what you study' section below).\n\nYou'll be taught by sports coaching staff with significant industry experience and a proven track record of bringing out the best in their students.\n\nThis course accepts direct entrants to year two. On successful completion of this course, you'll be awarded with the HND in Coaching and Deveolping Sport.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Two Highers at grade C or above including English or equivalent.\n* An HNC Sport Coaching qualification with 15 credits.\nThis ensures you do not need to study additional units to complete the 30 credits in second year.\n\nYou'll be invited for a group interview."
course.career_prospects = "."
course.spaces = course_spaces
course.status = :open
puts 'Coaching and Developing Sport HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'Coaching and Developing Sport HNC'
course.category = Category.find_by_name 'Sport & Fitness'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Gym_2boys_workout.jpg').open
else
  course.image.filename = 'Gym_2boys_workout.jpg'
end
course.description = "This course introduces and develops the skills and knowledge you’ll need for a career in sports coaching. Together we'll examine the principles of good coaching practice, as well as developing a wide range of practical and theoretical knowledge of games and sports. Work experience is included on HN programmes and you will also have the opportunity to qualify for Sports Coaching awards from national governing bodies.\n\nYou'll lead practical coaching sessions, in college and in schools. An Enhanced Disclosure Scotland check must be successfully completed before you coach young people in schools.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* At least one Higher at Grade C in English or equivalent.\n* NQ/NC qualification at Level 6.\nYou'll be invited for a group interview."
course.career_prospects = "This course prepares you for a career in sports as a Sports Development Officer, or a Sports Co-ordinator.."
course.spaces = course_spaces
course.status = :open
puts 'Coaching and Developing Sport HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Soft Tissue Therapy HNC'
course.category = Category.find_by_name 'Sport & Fitness'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Beauty_complementary_therapy_massage.jpg').open
else
  course.image.filename = 'Beauty_complementary_therapy_massage.jpg'
end
course.description = "This brand new course will award successful participants with a SMA level 4 qualification. The knowledge and skills taught on the course will advance your knowledge and understanding of anatomy, physiology and management of sports injury.\n\nThe course design focuses heavily on sports massage, with the same layout as the first year of HND Sports Therapy.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* A minimum of two Highers, preferably English and another in science, OR\n* National Qualification at SCQF Level 6 in appropriate subject area, OR\n* Occupationally relevant skills and experience, OR\n* S/NVQ at Level 3 in appropriate subjects.\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "On successful completion, you'll be qualified to work as a Soft Tissue Therapist.."
course.spaces = course_spaces
course.status = :cancelled
puts 'Soft Tissue Therapy HNC saving!'
course.save! validate: false

course = Course.new college_id: 2
course.title = 'Sports Therapy HND'
course.category = Category.find_by_name 'Sport & Fitness'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Sports_knee_injury_1.jpg').open
else
  course.image.filename = 'Sports_knee_injury_1.jpg'
end
course.description = "The sports therapy course will equip you with the skills required to help prevent injury and rehabilitate clients back to full fitness. The first year of the course focuses heavily on sports massage and will give you an industry recognised qualification on completion. The second year of the course focuses on the assessment and treatment of musculoskeletal conditions arising from sporting activity.\n\nYou'll also get the opportunity to work in our sports injury clinic, developing skills in clinical assessment, devising treatment plans and providing physical therapies. You may also be involved in pre and post match and touchline support for sporting events.\n\nThis course is placed on the Scottish Credit Qualifications Framework at Level 8. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* At least two highers at grade C or above in a relevant academic subject; OR\n* Sports related NQ/NC qualificiation, OR\n* Relevant work experience.\n*Relevant academic subjects include: English, Biology, Chemistry, Physics, P.E, Maths and Geography.\n\nYou'll be invited for a group and/or individual interview where you can find out more about the course and tell us why you're interested in this subject."
course.career_prospects = "This course prepares you for a career as a sports therapist working freelance, in sports clubs, or as part of a government health initiative.."
course.spaces = course_spaces
course.status = :cancelled
puts 'Sports Therapy HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Marine Engineering (Cadet Training) HNC'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/marine_engineering_0.jpg').open
else
  course.image.filename = 'marine_engineering_0.jpg'
end
course.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch.  There are a number of elements to the programme and also a compulsory sea time requirement.\n\nThe programme is structured into 5 phases:\n\nThere are two main entry dates into this programme: September and January. \n\nFor course contact details, please email maritime@cityofglasgowcollege.ac.uk."
course.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n* National 5/GCSE or equivalent which must include: English, Maths, Physical Science (e.g. Physics/Chemistry/Technological Studies/Engineering Science) and one other subject\n* NC Shipping and Maritime Operations (SCQF level 6) without optional Engineering Units.\n* Alternative qualifications will be considered on an individual basis in conjunction with the sponsoring company or training provider.\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme.  \n\nInitial applications for this course should be submitted to a training provider or company, please follow the link below for more information: \n\nhttp://www.careersatsea.org/sponsoring-companies/"
course.career_prospects = "On successful completion of the HNC programme, Cadets can gain employment as a fully qualified officer of the watch or choose to progress onto the HND Marine Engineering top up course, which will provide academic exemptions up to management level.."
course.spaces = course_spaces
course.status = :open
puts 'Marine Engineering (Cadet Training) HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Retail Management - January Start HNC'
course.category = Category.find_by_name 'Marketing & Retail'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Retail_marketing.jpg').open
else
  course.image.filename = 'Retail_marketing.jpg'
end
course.description = "This course prepares you for a career in the retail industry, where there's a growing need for people qualified to fill trainee management positions.\n\nDuring the course you'll carry out case studies, projects and assignments, and we'll assess your progress continuously. We also organise industrial visits and study tours.\n\nThis course runs for 6 months from January - June 2017.\n\nThe course is placed on the Scottish Credit Qualifications Framework at Level 7. For more information on the framework visit: www.scqf.org.uk/the-framework/."
course.entry_requirements = "* Higher English at grade C or above (or another relevant Higher).\n* Two other passes at Standard Grade, or equivalent at band 3 or above, OR\n* A National Qualification in a relevant area or an appropriate SVQ\nYou'll be invited for a group and/or individual interview, where you'll get the opportunity to find out more about the course and tell us why you're interested in the subject."
course.career_prospects = "Apply for second year of HND Retail Management. You can also apply for first or second year entry to relevant degree programmes at Glasgow Caledonian University, Stirling University, Queen Margaret University or Robert Gordon University.."
course.spaces = course_spaces
course.status = :open
puts 'Retail Management - January Start HNC saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Nautical Science/ Chief Mate/ Master (Jan) HND'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2020, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/marine_D3_0.jpg').open
else
  course.image.filename = 'marine_D3_0.jpg'
end
course.description = "This course is designed for you to progress from OOW level (deck) to chief mates level. You will also complete the following short courses HELM Management, NAEST Management and a medical care certificate. The course overall will equip you to become a competent and efficient chief mate.\n\nThere are assessments for the HND units and also preparation for the MCA Mates/Masters written exams and also for the MCA Mates oral exam. Students enrol on each of the courses separately."
course.entry_requirements = "* A recognised complete sea time of 12 months at OOW level\n* A MCA approved OOW certificate\n* A NAEST (M) certificate (to be valid when finally applying for your COC). The NAEST(M) course is scheduled within course progr"
course.career_prospects = "."
course.spaces = course_spaces
course.status = :open
puts 'Nautical Science/ Chief Mate/ Master (Jan) HND saving!'
course.save! validate: false

course = Course.new college_id: 3
course.title = 'SPD Marine Engineering Cadet Programme - January Start HND'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 8'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2019, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Marine_Engineering_girl_0.jpg').open
else
  course.image.filename = 'Marine_Engineering_girl_0.jpg'
end
course.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch.  The HND in marine engineering will also give academic exemptions for management level exams further in your career path, while the SPD Marine Management element will give exemptions from the IAMI Engineering Knowledge examination.\n\nThere are a number of elements to the programme and also a compulsory sea time requirement of seven months.\n\nThe programme is structured into 5 phases:\n\nPhase 1 – College phase where you will complete year 1 of HND in Marine Engineering, compulsory STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 2 – Sea Phase where you will start your MNTB training record book in addition to a work based learning course and a distance learning maths course.\n\nPhase 3 - College phase where you will complete year 2 of the HND in Marine Engineering (excluding the graded unit project), STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 4 – Sea Phase where you will complete your MNTB training record book.\n\nPhase 5 - College phase where you will complete an SPD in Marine Management and HND Marine Engineering graded unit 2 projects in addition to preparing for your MCA Oral Examination and completing your final STCW short courses.  Additional Maths tuition in order to aide transition to university will also be provided.\n\nThere are two main entries into this programme: A September entry and also a January entry. "
course.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n·       English\n\n·       Maths\n\n·       Physical Science (e.g. Physics/Chemistry/Technological Studies/Engineering Science)\n\n·       One other subject\n\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme. \n\nInitial applications for this course should be submitted to a training provider or company, please follow the link below for more information.\n\nhttp://www.careersatsea.org/sponsoring-companies/"
course.career_prospects = "On successful completion of the SPD programme, Cadets can gain employment as a fully qualified officer of the watch or choose to progress onto university to study at a higher level.."
course.spaces = course_spaces
course.status = :open
puts 'SPD Marine Engineering Cadet Programme - January Start HND saving!'
course.save! validate: false

course = Course.new college_id: 1
course.title = 'Marine Engineering (Cadet Programme) (Jan) HNC'
course.category = Category.find_by_name 'Nautical Studies & Marine Engineering'
course.level = 'SCQF level 7'
course.start_date = Date.new 2017, 8, 28
course.end_date = Date.new 2018, 6, 13
if upload_images
  course.image = Rails.root.join('app/assets/images/seed_images2/Marine_Engineering_girl.jpg').open
else
  course.image.filename = 'Marine_Engineering_girl.jpg'
end
course.description = "This is a three year training programme aimed at providing the necessary training and qualifications for employment as an Engineering Officer of the Watch.  There are a number of elements to the programme and also a compulsory sea time requirement.\n\nPhase 1 – College phase where you will complete an NC in shipping and Maritime Operations, compulsory STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 2 – Sea Phase where you will start your MNTB training record book in addition to a work based learning course and a distance learning maths course.\n\nPhase 3 - College phase where you will complete an HNC in Marine Engineering, STCW short courses, MCA workshop skills and industrial experience.\n\nPhase 4 – Sea Phase where you will complete your MNTB training record book.\n\nPhase 5 - College phase where you will prepare for your IAMI engineering knowledge examination, MCA Oral Examination and complete your final STCW short courses.\n\nThere are two main entries into this programme: September and January."
course.entry_requirements = "To gain entry to the course you should have any of the following combinations of qualifications:\n\n* English.\n* Maths.\n* Physical Science (e.g. Physics/Chemistry/Technological Studies/Engineering Science).\n* One other subject.\nAlternative qualifications will be considered on an individual basis in conjunction with the sponsoring company or training provider.\n\nStudents must have a sponsoring company in order to fulfil the sea time requirement of this programme. \n\nInitial applications for this course should be submitted to a training provider or company, please follow the link for more information."
course.career_prospects = "On successful completion of the HNC programme, Cadets can gain employment as a fully qualified officer of the watch or choose to progress onto the HND Marine Engineering top up course, which will provide academic exemptions up to management level.."
course.spaces = course_spaces
course.status = :cancelled
puts 'Marine Engineering (Cadet Programme) (Jan) HNC saving!'
course.save! validate: false

