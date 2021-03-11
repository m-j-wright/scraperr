require ("http")
require ("csv")
require ("nokogiri")

x=5
y=10560

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