require ("http")
require ("csv")
require ("nokogiri")

x=1000
y=0

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