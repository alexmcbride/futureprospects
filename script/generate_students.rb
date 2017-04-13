$index = 0
def get(tokens)
  token = tokens[$index]
  $index += 1
  token
end

$counter = 1
$schools = 1
$qualification = 1
$jobs = 1
$refs = 1
$courses = 1

$quals = ['Maths', 'English', 'Physics', 'Geography', 'Biology', 'Chemistry', 'Technological Studies', 'Art', 'Computing', 'PE', 'Woodworking']
$grades = ['A', 'B', 'C', 'D', 'Pass']
$awards = ['Higher', 'Standard', 'NQ', 'HNC', 'HND']
$starts = ['Date.new(2015, 8, 23)', 'Date.new(2014, 8, 23)', 'Date.new(2013, 8, 23)', 'Date.new(2012, 8, 23)']
$ends = ['Date.new(2016, 6, 8)', 'Date.new(2015, 6, 8)', 'Date.new(2014, 6, 8)', 'Date.new(2013, 6, 8)']

$course_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24]

def student(tokens, schools, jobs, refs)
  @first_name = tokens[1]
  @family_name = tokens[2]
  @email = tokens[14]
  @nin = 'NJ' + rand(111111..999999).to_s + (%w(A B C D).sample)

  # Student
  student = "student#{$counter}"
  puts student + ' = Student.new'
  puts student + ".first_name = '#{tokens[1]}'"
  puts student + ".family_name = '#{tokens[2]}'"
  puts student + ".email = '#{tokens[14]}'"
  puts student + ".scottish_candidate_number = '#{StudentValidator.generate_scn}'"
  puts student + ".national_insurance_number = '#{@nin}'"
  puts student + ".password = 'secret'"
  puts student + ".password_confirmation = 'secret'"
  puts student + ".confirmed_at = DateTime.now"
  puts student + '.save!'
  puts ''

  # App
  app = "app#{$counter}"
  puts app + " = #{student}.create_application"
  puts app + ".title = '#{tokens[10]}'"
  puts app + ".middle_name = '#{tokens[9]}'"
  unless tokens[11].empty?
    puts app + ".previous_name = '#{tokens[11]}'"
  end
  puts app + ".gender = :#{tokens[3].downcase}"
  puts app + ".telephone = '#{tokens[12]}'"
  unless tokens[13].empty?
    puts app + ".mobile = '#{tokens[13]}'"
  end
  puts app + ".email = '#{tokens[14]}'"
  unless tokens[15].empty?
    puts app + ".disability = '#{tokens[15]}'"
  end
  puts app + ".personal_statement = '#{tokens[16]}'"
  puts app + ".permanent_house_number = '#{tokens[4]}'"
  puts app + ".permanent_address_1 = '#{tokens[5]} #{tokens[6]}'"
  unless tokens[7].empty?
    puts app + ".permanent_address_2 = '#{tokens[7]}'"
  end
  puts app + ".permanent_postcode = '#{tokens[22]} 2GR'"
  puts app + ".permanent_country = '#{tokens[8]}'"
  unless tokens[20].empty?
    puts app + ".correspondence_house_number = '#{tokens[17]}'"
    puts app + ".correspondence_address_1 = '#{tokens[18]} #{tokens[19]}'"
    puts app + ".correspondence_address_2 = '#{tokens[10]}'"
    puts app + ".correspondence_postcode = '#{tokens[23]} 2GR'"
    puts app + ".correspondence_country = '#{tokens[21]}'"
  end
  puts app + ".state = :completed"
  puts app + '.save!'
  puts ''

  # Education
  2.times do
    education = "school#{$schools}"
    puts education + " = School.new application: #{app}"
    puts education + ".name = '#{schools[$schools][0]}'"
    puts education + ".address_1 = '#{schools[$schools][1]} #{schools[$schools][2]} #{schools[$schools][3]}'"
    puts education + ".address_2 = '#{schools[$schools][4]}'"
    puts education + ".country = '#{schools[$schools][5]}'"
    puts education + ".postcode = '#{schools[$schools][6]} 3FB'"
    puts education + '.save!'
    puts ''

    3.times do
      qual = "qualification#{$qualification}"
      puts qual + " = Qualification.new school: #{education}"
      puts qual + ".subject = '#{$quals.sample}'"
      puts qual + ".award = '#{$awards.sample}'"
      puts qual + ".grade = '#{$grades.sample}'"
      puts qual + ".start_date = #{$starts.sample}"
      puts qual + ".end_date = #{$ends.sample}"
      puts qual + ".save!"
      puts ''

      $qualification += 1
    end

    $schools += 1
  end

  # Employment
  2.times do
    job = "job#{$jobs}"
    puts job + " = Job.new application: #{app}"
    puts job + ".employer = '#{jobs[$jobs][0]}'"
    puts job + ".address_1 = '#{jobs[$jobs][1]} #{jobs[$jobs][2]} #{jobs[$jobs][3]}'"
    puts job + ".address_2 = '#{jobs[$jobs][4]}'"
    puts job + ".postcode = '#{jobs[$jobs][5]}'"
    puts job + ".country = '#{jobs[$jobs][6]}'"
    puts job + ".job_title = '#{jobs[$jobs][7]}'"
    puts job + ".duties = '#{jobs[$jobs][8]}'"
    puts job + ".start_date = Date.parse('#{jobs[$jobs][9]}')"
    puts job + ".end_date = Date.parse('#{jobs[$jobs][10]}')"
    puts job + '.save!'
    puts ''
    $jobs += 1
  end

  # References
  ref = "ref#{$refs}"
  puts ref + " = Reference.new application: #{app}"
  puts ref + ".reference_1_full_name = '#{refs[$refs][0]}'"
  puts ref + ".reference_1_email = '#{refs[$refs][1]}'"
  puts ref + ".reference_1_occupation = '#{refs[$refs][2]}'"
  puts ref + ".reference_1_address_1 = '#{refs[$refs][3]} #{refs[$refs][4]} #{refs[$refs][5]}'"
  puts ref + ".reference_1_address_2 = '#{refs[$refs][6]}'"
  puts ref + ".reference_1_postcode = '#{refs[$refs][7]} 7QW'"
  puts ref + ".reference_1_country = '#{refs[$refs][8]}'"
  puts ref + ".reference_1_relationship = '#{refs[$refs][9]}'"
  puts ref + ".reference_1_telephone = '#{refs[$refs][10]}'"
  $refs += 1
  puts ref + ".reference_2_full_name = '#{refs[$refs][0]}'"
  puts ref + ".reference_2_email = '#{refs[$refs][1]}'"
  puts ref + ".reference_2_occupation = '#{refs[$refs][2]}'"
  puts ref + ".reference_2_address_1 = '#{refs[$refs][3]} #{refs[$refs][4]} #{refs[$refs][5]}'"
  puts ref + ".reference_2_address_2 = '#{refs[$refs][6]}'"
  puts ref + ".reference_2_postcode = '#{refs[$refs][7]} 3TR'"
  puts ref + ".reference_2_country = '#{refs[$refs][8]}'"
  puts ref + ".reference_2_relationship = '#{refs[$refs][9]}'"
  puts ref + ".reference_2_telephone = '#{refs[$refs][10]}'"
  puts ref + '.save!'
  puts ''
  $refs += 1

  # Courses
  num = rand(1..5)
  ids = $course_ids.sample(num)
  ids.each do |id|
    course = "course#{$courses}"
    puts course + " = CourseSelection.new application_id: #{app}.id, course_id: #{id}"
    puts course + '.save!'
    puts ''
    $courses += 1
  end

  $counter += 1
end


path2 = 'C:\\Users\\alexm\\Downloads\\mock schools.csv'
file2 = File.new(path2)
schools = []
while line2 = file2.gets
  schools << line2.chomp.split(',')
end


path3 = 'C:\\Users\\alexm\\Downloads\\mock jobs.csv'
file3 = File.new(path3)
jobs = []
while line3 = file3.gets
  jobs << line3.chomp.split(',')
end


path4 = 'C:\\Users\\alexm\\Downloads\\mock references.csv'
file4 = File.new(path4)
refs = []
while line4 = file4.gets
  refs << line4.chomp.split(',')
end


path = 'C:\\Users\\alexm\\Downloads\\mock students application.csv'
file = File.new(path, 'r')
header = file.gets
persons = []
while line = file.gets
  tokens = line.chomp.split(',')
  student(tokens, schools, jobs, refs)
end

persons.each {|p| puts p.inspect}