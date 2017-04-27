doc = Nokogiri::HTML(File.open("app\\doc\\Application.html"))

type, title = @doc.xpath('//main/h1').text.strip.split
description = @doc.xpath('//section[@class="description"]').text.strip

puts "Type: #{type}"
puts "Title: #{title}"
puts "Description: #{description}"
puts ''

# constants
constants = []
doc.xpath('//section[@class="constants-list"]/dl').each do |a|
  a.xpath('dt').each do |b|
    constants << [b.text.strip, '']
  end
  a.xpath('dd/p').each_with_index do |b, i|
    constants[i][1] = b.text.strip
  end
end
puts 'Constants'
puts '---------'
constants.each do |k, v|
  puts "#{k}: '#{v}'"
end
puts ''

puts 'Methods'
puts '-------'
doc.xpath('//div[@class="method-detail "]').each do |a|
  name = a.xpath('div[@class="method-heading"]/span[@class="method-name"]').text.strip
  args = a.xpath('div[@class="method-heading"]/span[@class="method-args"]').text.strip
  params = []
  d = a.xpath('div[@class="method-description"]')
  d.xpath('p | ul/li').each do |p|
    if p.name == 'p'
      description << p.text + ' '
    elsif p.name == 'li'
      params << p.xpath('p').text.strip + ' '
    end
  end
  puts "#{name}#{args}: #{description}"
  params.each {|p| puts "* #{p}"}
  puts ''
end
puts ''
