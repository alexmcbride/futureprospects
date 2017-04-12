def scrape_page(url, file, index)
  page = Nokogiri::HTML(open(url))

  page.css('br').each{|br| br.replace('\n')}

  promo = page.css('div.promo__text-block')
  title = promo.css('h2.promo__title').text.strip
  level = promo.css('span.promo-course__scqf').text.strip
  category = promo.css('div.promo__body').css('p').last.text.strip
  start_date = page.css('div.mobile-styles-hide').css('h5.element-invisible').text.strip
  image = page.css('div.feat-img').css('img').attribute('src').text.strip

  type = :none

  description = ''
  entry = ''
  career = ''
  page.css('div.col-sm-12').children.each do |e|
    if e.name == 'h2' and e.text == 'Overview'
      type = :desc
    elsif e.name == 'h2' and e.text == 'Entry requirements'
      type = :entry
    elsif e.name == 'h2' and e.text == 'After the course'
      type = :career
    elsif e.name == 'h2'
      type = :none
    end

    if type == :career and e.name == 'h4' and e.text != 'Careers'
      type = :none
    end

    if type == :desc and e.name == 'p'
      text = Rails::Html::FullSanitizer.new.sanitize e.text.strip
      if text.length > 1
        description << text << '\n\n'
      end
    end

    if type == :entry and e.name == 'p'
      text = Rails::Html::FullSanitizer.new.sanitize e.text.strip
      if text.length > 1
        entry << text << '\n\n'
      end
    end

    if type == :entry and e.name == 'ul'
      e.css('li').each do |li|
        text = Rails::Html::FullSanitizer.new.sanitize li.text.strip
        if text.length > 1
          entry << '* ' + text << '\n'
        end
      end
    end

    if type == :career and e.name == 'p'
      text = Rails::Html::FullSanitizer.new.sanitize e.text.strip
      if text.length > 1
        career << text << '\n\n'
      end
    end

    if type == :career and e.name == 'ul'
      e.css('li').each do |li|
        text = Rails::Html::FullSanitizer.new.sanitize li.text.strip
        if text.length > 1
          career << '* ' + text << '\n'
        end
      end
    end
  end

  file.write "Index: #{index}\n"
  file.write "Title: #{title}\n"
  file.write "Category: #{category}\n"
  file.write "Level: #{level}\n"
  file.write "Start Date: #{start_date}\n"
  file.write "Image: #{image}\n"
  file.write "Description: #{description[0..description.length-5]}\n"
  file.write "Entry Requirements: #{entry[0..entry.length-5]}\n"
  file.write "Career Prospects: #{career[0..career.length-5]}.\n"
  file.write "\n"

end

def scrape_courses(file)
  index = 0
  (2..9).each do |page|
    host = 'http://www.cityofglasgowcollege.ac.uk'
    path = "http://www.cityofglasgowcollege.ac.uk/course-search?search_api_views_fulltext=&field_template_reference_field_lookup_coursesubject=All&sort_by=field_runs_from_value&sort_order=ASC&page=#{page}&f[0]=field_template_reference%253Afield_mode_of_study%3A139&f[1]=field_price_band%3A17"
    list = Nokogiri::HTML(open(path))
    list.css('a.panel-course-results__course').each do |a|
      url = host + a['href']
      scrape_page url, file, index

      index += 1
    end
    puts
  end
end

def save_image(uri)
  File.open(File.basename(uri),'wb'){ |f| f.write(open(uri).read) }
end

def scrape_images(file)
  while line = file.gets
    if line.starts_with? 'Image: '
      tokens = line.split(': ')
      tokens = tokens[1].split('?')
      save_image tokens[0]
      puts "done #{tokens[0]}..."
      sleep 1
    end
  end
end


def generate_seed file
  category_names = ['Accounting',
'Administration, Human Resources & Law',
'Applied Computing & Digital Technologies',
'Built Environment',
'Business & Procurement',
'Construction Crafts',
'Design Crafts & Graphic Arts',
'Drama & Creative Writing',
'Engineering, Energy & Gas',
'English as a Second Language (ESOL)',
'Fine Arts & Photography',
'First Aid, Hygiene & Safety',
'Food, Events, Hospitality & Tourism',
'Hair & Beauty',
'Health, Social Care & Early Education',
'Languages',
'Licensing & Security',
'Marketing & Retail',
'Media',
'Nautical Studies & Marine Engineering',
'Social Sciences',
'Sport & Fitness',
'Teacher and Training Development',
'Trade Union Education']

  colleges = %w(cogc kelvin clyde lanark west)

  index = 1
  course = "course#{index}"
  puts "#{course} = Course.new college: #{colleges.sample}"
  title = 0
  while line = file.gets
    line.chomp!
    if line.starts_with? 'Index: '
    elsif line.starts_with? 'Title: '
      tokens = line.split(': ', 2)
      puts "#{course}.title = '#{tokens[1]}'"
      if tokens[1].length > title
        title = tokens[1].length
      end
    elsif line.starts_with? 'Category: '
      tokens = line.split(': ', 2)
      puts "#{course}.category = Category.find_by_name '#{tokens[1]}'"
    elsif line.starts_with? 'Level: '
      tokens = line.split(': ', 2)
      unless tokens[1].empty?
        puts "#{course}.level = '#{tokens[1].slice(1, tokens[1].length - 2)}'"
      end
    elsif line.starts_with? 'Start Date: '
      tokens = line.split(': ', 2)
      tokens = tokens[1].split(', ')
      puts "#{course}.start_date = Date.new 2017, 8, 28"
      if tokens[1].starts_with? '1'
        puts "#{course}.end_date = Date.new 2018, 6, 13"
      elsif tokens[1].starts_with? '2'
        puts "#{course}.end_date = Date.new 2019, 6, 13"
      end
    elsif line.starts_with? 'Image: '
      tokens = line.split(': ', 2)
      filename = File.basename tokens[1]
      filename = filename.split('?')[0]
      puts "#{course}.image = Rails.root.join('app/assets/images/seed_images2/#{filename}').open"
    elsif line.starts_with? 'Description: '
      tokens = line.split(': ', 2)
      puts "#{course}.description = \"#{tokens[1]}\""
    elsif line.starts_with? 'Entry Requirements: '
      tokens = line.split(': ', 2)
      puts "#{course}.entry_requirements = \"#{tokens[1]}\""
    elsif line.starts_with? 'Career Prospects: '
      tokens = line.split(': ', 2)
      puts "#{course}.career_prospects = \"#{tokens[1]}\""
    elsif line == ''
      index += 1
      puts "#{course}.spaces = course_spaces"
      puts "#{course}.save!"
      puts ''
      course = "course#{index}"
      puts "#{course} = Course.new college: #{colleges.sample}"
    end

    puts 'length: ' + title.to_s
  end
end

file = File.open('mock courses.txt', 'r')
generate_seed file

#save_image 'http://www.cityofglasgowcollege.ac.uk/sites/default/files/styles/course_promo/public/course_template/MarineManagementPDA.jpg?itok=OpHKsarr'

#
#
# # scrape_page 'http://www.cityofglasgowcollege.ac.uk/courses/hnc-retail-management-jan-scqf-level-7-2017-01-05'
# #
#  scrape_page 'C:\\Users\\alexm\\Downloads\\course.html', file
# file.close