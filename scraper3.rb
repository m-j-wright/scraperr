require ("http")
require ("csv")
require ("nokogiri")

x=5500
y=10501

p "#NAME"

i=y

names = []

x.times do

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

check = parsed_data.css(".field-name-field-display-name .even").text.strip.length
me = parsed_data.css(".field-name-field-display-name .even")

if check>1
  me.each do |match|
  names << match.text.strip  
  end
  File.open("e1names.csv", "w+") do |f| 
  f.puts(names) 
  end 
  
else
  names << i 
  File.open("e1names.csv", "w+") do |f| 
  f.puts(names) 
  end 
end
i = i+1
end

p "#COMPANY"

i=y

companies = []

x.times do

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

check = parsed_data.css(".field-name-user-firm-name .even").text.strip.length
me = parsed_data.css(".field-name-user-firm-name .even")

if check>1
  me.each do |match|
  companies << match.text.strip  
  end
  File.open("e2company.csv", "w+") do |f| 
  f.puts(companies) 
  end 

else
  companies << i 
  File.open("e2company.csv", "w+") do |f| 
  f.puts(companies) 
  end 
end
i = i+1
end

p "#CITY"

i=y

cities = []

x.times do

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

check = parsed_data.css(".locality").text.strip.length
me = parsed_data.css(".locality")

if check>1
  me.each do |match|
  cities << match.text.strip  
  end
  File.open("e3city.csv", "w+") do |f| 
  f.puts(cities) 
  end 
else
  cities << i
  File.open("e3city.csv", "w+") do |f| 
  f.puts(cities) 
  end 
end
i = i+1
end

p "#STATE"

i=y

states = []

x.times do

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

check = parsed_data.css("#bootstrap-panel-body .region").text.strip.length
me = parsed_data.css("#bootstrap-panel-body .region")

if check>1
  me.each do |match|
  states << match.text.strip  
  end
  File.open("e4state.csv", "w+") do |f| 
  f.puts(states) 
  end 
else
  states << i 
  File.open("e4state.csv", "w+") do |f| 
  f.puts(states) 
  end 
end
i = i+1
end

p "#JOB"

i=y

jobs = []

x.times do

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

check = parsed_data.css(".field-name-field-primary-occupation .even:nth-child(1)").text.strip.length
me = parsed_data.css(".field-name-field-primary-occupation .even:nth-child(1)")

if check>1
  me.each do |match|
  jobs << match.text.strip  
  end
  File.open("e5job.csv", "w+") do |f| 
  f.puts(jobs) 
  end 
else
  jobs << i 
   File.open("e5job.csv", "w+") do |f| 
  f.puts(jobs) 
  end 
end
i = i+1
end

p "#INDUSTRIES"

i=y

industries = []

x.times do

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

check = parsed_data.css(".field-name-field-industries .even").text.strip.length
me = parsed_data.css(".field-name-field-industries .even")

if check>1
  me.each do |match|
  industries << match.text.strip  
  end
   File.open("e6industries.csv", "w+") do |f| 
  f.puts(industries) 
  end 
else
  industries << i 
   File.open("e6industries.csv", "w+") do |f| 
  f.puts(industries) 
  end 
end
i = i+1
end

p "#WEBSITE"

i=y

websites = []

x.times do

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

check = parsed_data.css("#bootstrap-panel-3-body a").text.strip.length
me = parsed_data.css("#bootstrap-panel-3-body a")

if check>1
  me.each do |match|
  websites << match.text.strip  
  end
   File.open("e7websites.csv", "w+") do |f| 
  f.puts(websites) 
  end 
else
  websites << i 
  File.open("e7websites.csv", "w+") do |f| 
  f.puts(websites) 
  end 
end
i = i+1
end

p "#EMAIL"

i=y

emails = []

x.times do

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

doc = Nokogiri::HTML(raw_data)
elink = doc.css('a').map { |link| link['href'] }
check = elink[82]

if check==nil
  emails << i 
  File.open("e8emails.csv", "w+") do |f| 
  f.puts(emails) 
  end
else
emails << elink[82].slice(7...).reverse.gsub("&&",".").gsub("&","@")
  File.open("e8emails.csv", "w+") do |f| 
  f.puts(emails) 
  end
end
i = i+1
end