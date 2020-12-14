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

