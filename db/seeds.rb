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


# File was getting too big, so split it into smaller sections.
require 'seed_courses'
require 'seed_students'
require 'seed_staff'
