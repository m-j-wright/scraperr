require ("http")
require ("csv")
require ("nokogiri")

data_arr = []

websites = []
rows = File.read('keywords-test.csv').split
rows.each do |y|
  websites << y
end 

i=0

10.times do
 p websites[i]
 i=i+1
end

CSV.open("data.csv","w") do |csv|
    csv << data_arr
    end

websites.each do |x|
  raw_data = HTTP.get(x).to_s
  parsed_data = Nokogiri::HTML.parse(raw_data)
  matching_elements = parsed_data.css("p")
  matching_elements.each do |match|
  p match.text.strip
  end
end
