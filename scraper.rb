require ("http")

require ("nokogiri")


info_url = "https://businessvaluationassociation.org/members-forum/"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

matching_elements1 = parsed_data.css(".flex-table__tr--header+ a .flex-table-td") 

matching_elements1.each do |match|

p match.text.strip

end