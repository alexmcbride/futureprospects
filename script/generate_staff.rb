path = 'C:\\Users\\alexm\\Google Drive\\College\\HND Software Development\\Graded Unit\\Stuff\\mock staff.csv'
file = File.open path, 'r'
file.gets #header
while line = file.gets
  tokens = line.split(',')
  puts "Staff.create! first_name: '#{tokens[0]}', family_name: '#{tokens[1]}', email: '#{tokens[2]}', job_title: '#{tokens[3]}', college_id: #{tokens[4]}, password: 'secret', password_confirmation: 'secret'"
end