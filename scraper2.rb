require ("http")
require ("csv")
require ("nokogiri")

data_arr = []

info_url = "https://www.30acap.com/"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

matching_elements = parsed_data.css(".color_15")

matching_elements.each do |match|

data_arr << match.text.strip

CSV.open('data.csv', "w") do |csv|
  csv << data_arr

end