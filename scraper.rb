require ("http")

require ("nokogiri")


i = 0
firms = "https://swisscows.com/web?query=vercor%20investment%20bank&region=en-US"
1.times do
raw_data = HTTP.get(firms).to_s
parsed_data = Nokogiri::HTML.parse(raw_data)
p parsed_data.class
matching_elements = parsed_data.css(".site")
matching_elements.each do |match|
p match.text.strip
end
end