require ("http")
require ("csv")
require ("nokogiri")

i=19467

info_url = "https://turnaround.org/users/#{i+1}"

raw_data = HTTP.get(info_url).to_s

doc = Nokogiri::HTML(raw_data)
elink = doc.css('a').map { |link| link['href'] }
elink2 = elink[82].slice(7...).reverse.gsub("&&",".").gsub("&","@")
p elink2
