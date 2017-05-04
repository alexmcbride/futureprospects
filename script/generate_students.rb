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

def student(tokens, schools, jobs, refs)
  @first_name = tokens[1]
  @family_name = tokens[2]
  @email = tokens[14]
  @nin = 'NJ' + rand(111111..999999).to_s + (%w(A B C D).sample)

  # Student
  student = 'student'
  puts student + ' = Student.new'
  full_name = "#{tokens[1]} #{tokens[2]}"
  puts student + ".first_name = '#{tokens[1]}'"
  puts student + ".family_name = '#{tokens[2]}'"
  puts student + ".email = '#{tokens[14]}'"
  puts student + ".scottish_candidate_number = '#{StudentValidator.generate_scn}'"
  puts student + ".national_insurance_number = '#{@nin}'"
  puts student + ".password = 'secret'"
  puts student + ".password_confirmation = 'secret'"
  puts student + ".confirmed_at = DateTime.now"
  puts student + '.save! validate: false'
  puts ''

  # App
  app = 'app'
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
  puts app + ".permanent_city = 'Glasgow'"
  puts app + ".permanent_country = '#{tokens[8]}'"
  puts app + ".submitted_date = Date.strptime('#{(Date.new(2016, 10, 1)..Date.today).to_a.sample}')"
  unless tokens[20].empty?
    puts app + ".correspondence_house_number = '#{tokens[17]}'"
    puts app + ".correspondence_address_1 = '#{tokens[18]} #{tokens[19]}'"
    puts app + ".correspondence_address_2 = '#{tokens[20]}'"
    puts app + ".correspondence_postcode = '#{tokens[23]} 2GR'"
    puts app + ".correspondence_city = 'Glasgow'"
    puts app + ".correspondence_country = '#{tokens[21]}'"
  end
  status = [:submitting, :awaiting_payment, :payment_failed, :cancelled, :awaiting_decisions, :awaiting_decisions, :awaiting_decisions, :all_decisions_made].sample
  puts app + ".status = :#{status}"
  puts app + '.current_stage = :submit_stage'
  puts app + '.save! validate: false'
  puts ''

  # Education
  2.times do
    education = 'school'
    puts education + " = School.new application: #{app}"
    puts education + ".name = '#{schools[$schools][0]}'"
    puts education + ".address_1 = '#{schools[$schools][1]} #{schools[$schools][2]} #{schools[$schools][3]}'"
    puts education + ".address_2 = '#{schools[$schools][4]}'"
    puts education + ".country = '#{schools[$schools][5]}'"
    puts education + ".city = 'Glasgow'"
    puts education + ".postcode = '#{schools[$schools][6]} 3FB'"
    puts education + '.save! validate: false'
    puts ''

    3.times do
      qual = 'qualification'#{$qualification}"'
      puts qual + " = Qualification.new school: #{education}"
      puts qual + ".subject = '#{$quals.sample}'"
      puts qual + ".award = '#{$awards.sample}'"
      puts qual + ".grade = '#{$grades.sample}'"
      puts qual + ".start_date = #{$starts.sample}"
      puts qual + ".end_date = #{$ends.sample}"
      puts qual + ".save! validate: false"
      puts ''

      $qualification += 1
    end

    $schools += 1
  end

  # Employment
  2.times do
    job = 'job'#{$jobs}"'
    puts job + " = Job.new application: #{app}"
    puts job + ".employer = '#{jobs[$jobs][0]}'"
    puts job + ".address_1 = '#{jobs[$jobs][1]} #{jobs[$jobs][2]} #{jobs[$jobs][3]}'"
    puts job + ".address_2 = '#{jobs[$jobs][4]}'"
    puts job + ".postcode = '#{jobs[$jobs][5]}'"
    puts job + ".city = 'Glasgow'"
    puts job + ".country = '#{jobs[$jobs][6]}'"
    puts job + ".job_title = '#{jobs[$jobs][7]}'"
    puts job + ".duties = '#{jobs[$jobs][8]}'"
    puts job + ".start_date = Date.parse('#{jobs[$jobs][9]}')"
    puts job + ".end_date = Date.parse('#{jobs[$jobs][10]}')"
    puts job + '.save! validate: false'
    puts ''
    $jobs += 1
  end

  # References
  ref = 'ref'#{$refs}"
  puts ref + " = Reference.new application: #{app}"
  puts ref + ".reference_1_full_name = '#{refs[$refs][0]}'"
  puts ref + ".reference_1_email = '#{refs[$refs][1]}'"
  puts ref + ".reference_1_occupation = '#{refs[$refs][2]}'"
  puts ref + ".reference_1_address_1 = '#{refs[$refs][3]} #{refs[$refs][4]} #{refs[$refs][5]}'"
  puts ref + ".reference_1_address_2 = '#{refs[$refs][6]}'"
  puts ref + ".reference_1_postcode = '#{refs[$refs][7]} 7QW'"
  puts ref + ".reference_1_city = 'Glasgow'"
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
  puts ref + ".reference_2_city = 'Glasgow'"
  puts ref + ".reference_2_country = '#{refs[$refs][8]}'"
  puts ref + ".reference_2_relationship = '#{refs[$refs][9]}'"
  puts ref + ".reference_2_telephone = '#{refs[$refs][10]}'"
  puts ref + '.save! validate: false'
  puts ''
  $refs += 1

  # Courses
  num = rand(1..5)
  ids = $course_ids.sample(num)
  ids.each do |id|
    course = 'course'#{$courses}"'
    puts course + " = CourseSelection.new application_id: #{app}.id, course_id: #{id}"
    puts course + '.save! validate: false'
    puts ''
    $courses += 1
  end

  # Payments
  status = status.to_sym
  if [:awaiting_decisions, :payment_failed, :cancelled, :awaiting_choices].include? status
    last_year = (DateTime.now - 6.months)..DateTime.now
    dates = last_year.to_a.sample(4).sort
    amount = num > 1 ? 2000 : 1000
    failed_payments = ["payment = Payment.new application: #{app}, payment_type: :credit_card, amount: #{amount}, status: :failed, card_holder: '#{full_name}', last_four_digits: '0004', created_at: '#{dates[0]}', updated_at: '#{dates[0]}', description: 'Application Fee (#{num} Courses)'",
                "payment = Payment.new application: #{app}, payment_type: :paypal, amount: #{amount}, status: :failed, card_holder: '#{full_name}', created_at: '#{dates[1]}', updated_at: '#{dates[1]}', description: 'Application Fee (#{num} Courses)'",
                "payment = Payment.new application: #{app}, payment_type: :credit_card, amount: #{amount}, status: :failed, card_holder: '#{full_name}', last_four_digits: '0004', created_at: '#{dates[2]}', updated_at: '#{dates[2]}', description: 'Application Fee (#{num} Courses)'",]
    payment_auth = "payment = Payment.new application: #{app}, payment_type: :paypal, amount: #{amount}, status: :authorized, card_holder: '#{full_name}', created_at: '#{dates[3]}', updated_at: '#{dates[3]}', description: 'Application Fee (#{num} Courses)'"
    failed_payments.sample(rand(1..failed_payments.count)).each do |payment|
      puts payment
      puts 'payment.save! validate: false'
    end
    if status == :awaiting_decisions || status == :awaiting_choices
      puts payment_auth
      puts 'payment.save! validate: false'
    end
    puts ''
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
header = file.gets
# persons = []
while line = file.gets
  tokens = line.chomp.split(',')
  student(tokens, schools, jobs, refs)
end

# persons.each {|p| puts p.inspect}