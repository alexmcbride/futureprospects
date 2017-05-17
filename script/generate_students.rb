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

$course_ids = Course.order(:id).map {|c| c.id}

def student(file, tokens, schools, jobs, refs)
  @first_name = tokens[1]
  @family_name = tokens[2]
  @email = tokens[14]
  @nin = 'NJ' + rand(111111..999999).to_s + (%w(A B C D).sample)

  # Student
  student = 'student'
  file.puts student + ' = Student.new'
  full_name = "#{tokens[1]} #{tokens[2]}"
  file.puts student + ".first_name = '#{tokens[1]}'"
  file.puts student + ".family_name = '#{tokens[2]}'"
  file.puts student + ".email = '#{tokens[14]}'"
  file.puts student + ".scottish_candidate_number = '#{StudentValidator.generate_scn}'"
  file.puts student + ".national_insurance_number = '#{@nin}'"
  file.puts student + ".password = 'secret'"
  file.puts student + ".password_confirmation = 'secret'"
  file.puts student + ".confirmed_at = DateTime.now"
  file.puts student + '.save! validate: false'
  file.puts ''

  # App
  app = 'app'
  file.puts app + " = #{student}.create_application"
  file.puts app + ".title = '#{tokens[10]}'"
  file.puts app + ".middle_name = '#{tokens[9]}'"
  unless tokens[11].empty?
    file.puts app + ".previous_name = '#{tokens[11]}'"
  end
  file.puts app + ".gender = :#{tokens[3].downcase}"
  file.puts app + ".telephone = '#{tokens[12]}'"
  unless tokens[13].empty?
    file.puts app + ".mobile = '#{tokens[13]}'"
  end
  unless tokens[15].empty?
    file.puts app + ".disability = '#{tokens[15]}'"
  end
  file.puts app + ".personal_statement = '#{tokens[16]}'"
  file.puts app + ".permanent_house_number = '#{tokens[4]}'"
  file.puts app + ".permanent_address_1 = '#{tokens[5]} #{tokens[6]}'"
  unless tokens[7].empty?
    file.puts app + ".permanent_address_2 = '#{tokens[7]}'"
  end
  file.puts app + ".permanent_postcode = '#{tokens[22]} 2GR'"
  file.puts app + ".permanent_city = 'Glasgow'"
  file.puts app + ".permanent_country = '#{tokens[8]}'"
  submitted = Application.current_year([2016, 2017, 2017].sample).to_a.sample
  file.puts app + ".created_at = Date.strptime('#{submitted}')"
  file.puts app + ".submitted_date = Date.strptime('#{submitted}')"
  unless tokens[20].empty?
    file.puts app + ".correspondence_house_number = '#{tokens[17]}'"
    file.puts app + ".correspondence_address_1 = '#{tokens[18]} #{tokens[19]}'"
    file.puts app + ".correspondence_address_2 = '#{tokens[20]}'"
    file.puts app + ".correspondence_postcode = '#{tokens[23]} 2GR'"
    file.puts app + ".correspondence_city = 'Glasgow'"
    file.puts app + ".correspondence_country = '#{tokens[21]}'"
  end

  status = [:submitting, :awaiting_payment, :payment_failed, :cancelled, :awaiting_decisions, :all_rejected,
            :awaiting_replies, :replies_overdue, :clearance, :completed, :completed, :completed, :completed].sample

  file.puts app + ".status = :#{status}"
  file.puts app + '.current_stage = :submit_stage'

  if [:awaiting_replies, :all_rejected, :completed, :replies_overdue].include? status
    file.puts app + ".replies_due = '#{Application.calculate_replies_due(submitted.year)}'"
  end

  file.puts app + '.save! validate: false'
  file.puts ''

  # Education
  2.times do
    education = 'school'
    file.puts education + " = School.new application: #{app}"
    file.puts education + ".name = '#{schools[$schools][0]}'"
    file.puts education + ".address_1 = '#{schools[$schools][1]} #{schools[$schools][2]} #{schools[$schools][3]}'"
    file.puts education + ".address_2 = '#{schools[$schools][4]}'"
    file.puts education + ".country = '#{schools[$schools][5]}'"
    file.puts education + ".city = 'Glasgow'"
    file.puts education + ".postcode = '#{schools[$schools][6]} 3FB'"
    file.puts education + '.save! validate: false'
    file.puts ''

    3.times do
      qual = 'qualification'#{$qualification}"'
      file.puts qual + " = Qualification.new school: #{education}"
      file.puts qual + ".subject = '#{$quals.sample}'"
      file.puts qual + ".award = '#{$awards.sample}'"
      file.puts qual + ".grade = '#{$grades.sample}'"
      file.puts qual + ".start_date = #{$starts.sample}"
      file.puts qual + ".end_date = #{$ends.sample}"
      file.puts qual + ".save! validate: false"
      file.puts ''

      $qualification += 1
    end

    $schools += 1
  end

  # Employment
  2.times do
    job = 'job'#{$jobs}"'
    file.puts job + " = Job.new application: #{app}"
    file.puts job + ".employer = '#{jobs[$jobs][0]}'"
    file.puts job + ".address_1 = '#{jobs[$jobs][1]} #{jobs[$jobs][2]} #{jobs[$jobs][3]}'"
    file.puts job + ".address_2 = '#{jobs[$jobs][4]}'"
    file.puts job + ".postcode = '#{jobs[$jobs][5]}'"
    file.puts job + ".city = 'Glasgow'"
    file.puts job + ".country = '#{jobs[$jobs][6]}'"
    file.puts job + ".job_title = '#{jobs[$jobs][7]}'"
    file.puts job + ".duties = '#{jobs[$jobs][8]}'"
    file.puts job + ".start_date = Date.parse('#{jobs[$jobs][9]}')"
    file.puts job + ".end_date = Date.parse('#{jobs[$jobs][10]}')"
    file.puts job + '.save! validate: false'
    file.puts ''
    $jobs += 1
  end

  # References
  ref = 'ref'#{$refs}"
  file.puts ref + " = Reference.new application: #{app}"
  file.puts ref + ".reference_1_full_name = '#{refs[$refs][0]}'"
  file.puts ref + ".reference_1_email = '#{refs[$refs][1]}'"
  file.puts ref + ".reference_1_occupation = '#{refs[$refs][2]}'"
  file.puts ref + ".reference_1_address_1 = '#{refs[$refs][3]} #{refs[$refs][4]} #{refs[$refs][5]}'"
  file.puts ref + ".reference_1_address_2 = '#{refs[$refs][6]}'"
  file.puts ref + ".reference_1_postcode = '#{refs[$refs][7]} 7QW'"
  file.puts ref + ".reference_1_city = 'Glasgow'"
  file.puts ref + ".reference_1_country = '#{refs[$refs][8]}'"
  file.puts ref + ".reference_1_relationship = '#{refs[$refs][9]}'"
  file.puts ref + ".reference_1_telephone = '#{refs[$refs][10]}'"
  $refs += 1
  file.puts ref + ".reference_2_full_name = '#{refs[$refs][0]}'"
  file.puts ref + ".reference_2_email = '#{refs[$refs][1]}'"
  file.puts ref + ".reference_2_occupation = '#{refs[$refs][2]}'"
  file.puts ref + ".reference_2_address_1 = '#{refs[$refs][3]} #{refs[$refs][4]} #{refs[$refs][5]}'"
  file.puts ref + ".reference_2_address_2 = '#{refs[$refs][6]}'"
  file.puts ref + ".reference_2_postcode = '#{refs[$refs][7]} 3TR'"
  file.puts ref + ".reference_2_city = 'Glasgow'"
  file.puts ref + ".reference_2_country = '#{refs[$refs][8]}'"
  file.puts ref + ".reference_2_relationship = '#{refs[$refs][9]}'"
  file.puts ref + ".reference_2_telephone = '#{refs[$refs][10]}'"
  file.puts ref + '.save! validate: false'
  file.puts ''
  $refs += 1

  # Courses
  num = rand(1..5)
  ids = $course_ids.sample(num)
  count = CourseSelection.student_choices.count
  choices = CourseSelection.student_choices.map{|k,v|k}.sample(num < count ? num : count - 1)
  ids.each_with_index do |id, index|
    course = 'course'#{$courses}"'
    file.puts course + " = CourseSelection.new application_id: #{app}.id, course_id: #{id}"

    offer = nil
    if status == :awaiting_replies or status == :completed
      offer = [:definite_offer, :conditional_offer].sample
      file.puts "course.college_offer = :#{offer}"
    elsif status == :all_rejected || status == :clearance
      file.puts "course.college_offer = :rejected"
      file.puts "course.student_choice = :skipped"
    elsif status != :awaiting_decisions
      offer = CourseSelection.college_offers.map {|k, v| k}.sample.to_sym
      file.puts "course.college_offer = :#{offer}"
    end

    if status == :completed
      if index < choices.count
        file.puts "course.student_choice = :#{choices[index]}"
      else
        file.puts "course.student_choice = :declined"
      end
    end

    file.puts "course.note = 'Ut vel sem vel urna rutrum rutrum non quis augue.'"
    file.puts course + '.save! validate: false'
    file.puts ''
    $courses += 1
  end

  file.puts "app.course_selections_count = #{num}"
  # file.puts "app.current_selections_count = #{num}" if Application.current_year.include? submitted
  file.puts 'app.save validate: false'
  file.puts ''

  def payment(file, status, full_name)
    file.puts 'payment = app.create_application_payment'
    file.puts "payment.status = :#{status}"
    file.puts "payment.paid_at = '#{(Date.new(2016, 6, 1)..Date.today).to_a.sample}'"
    type = Payment.payment_types.map{|k,v|k}.sample.to_sym
    file.puts "payment.payment_type = :#{type}"
    if type == :credit_card
      file.puts 'payment.last_four_digits = 1234'
      file.puts "payment.card_holder = '#{full_name}'"
    end
    file.puts 'payment.save! validate: false'
    file.puts ''
  end

  # Payments
  status = status.to_sym
  if status == :awaiting_payment
    file.puts 'app.create_application_payment.save!'
    file.puts ''
  elsif status == :payment_failed || status == :cancelled
    payment file, :failed, full_name
  elsif [:awaiting_decisions, :awaiting_replies, :all_rejected, :completed].include? status
    payment file, :authorized, full_name
  end

  $counter += 1
end

root = 'C:\\Users\\alexm\\Google Drive\\College\\HND Software Development\\Graded Unit\\Stuff\\'

path2 = root + 'mock schools.csv'
file2 = File.new(path2)
schools = []
while line2 = file2.gets
  schools << line2.chomp.split(',')
end

path3 = root + 'mock jobs.csv'
file3 = File.new(path3)
jobs = []
while line3 = file3.gets
  jobs << line3.chomp.split(',')
end

path4 = root + 'mock references.csv'
file4 = File.new(path4)
refs = []
while line4 = file4.gets
  refs << line4.chomp.split(',')
end

path = root + 'mock students application.csv'
file = File.new(path, 'r')

student_file = File.open 'lib\\seed_students.rb', 'w'
student_file.puts '# This file is auto-generated by scripts/generate_students.rb'

header = file.gets
while line = file.gets
  tokens = line.chomp.split(',')
  student(student_file, tokens, schools, jobs, refs)
end

file.close
student_file.close

# persons.each {|p| puts p.inspect}