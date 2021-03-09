require ("http")

require ("nokogiri")


i=0

firms = []

49.times do

info_url = "https://turnaround.org/membership-directory?search_api_views_fulltext=&field_job_field_person_company=&og_user_node_nid=&field_person_address_city=&search_api_views_fulltext_1=&search_api_views_fulltext_2=&field_primary_occupation=101&field_specializations=All&field_certifications=All&page=#{i+1}"

raw_data = HTTP.get(info_url).to_s

parsed_data = Nokogiri::HTML.parse(raw_data)

matching_elements1 = parsed_data.css(".field-name-field-firm-name .even") #Fund

matching_elements1.each do |match|

p match.text.strip

end

i = i+1

end