require ("http")

require ("nokogiri")

info_url = "https://www.bing.com/search?q=Vercor+investment+bank"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

p parsed_data.class

matching_elements = parsed_data.css(".b_algo:nth-child(1) cite")

matching_elements.each do |match|

p match.text.strip

end