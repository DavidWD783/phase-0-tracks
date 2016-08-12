def take_block(input)
  puts "Before block status message."
  yield(input)
end
take_block("input") { |user_input| puts "The user input is #{user_input}." }

#Release 1
country_array = %w{China India Japan USA}
puts "Before .each"
p country_array

# .each method on array
country_array.each { |country| puts "#{country} is a great place to visit!" }
puts "After .each"
p country_array

# create hash from countries/cities
city_hash = {China: "Beijing", India: "Kerala", Japan: "Osaka", USA: "Seattle"}
puts "Before .each"
p city_hash

# .each method on hash
city_hash.each { |country, city| puts "#{city}, #{country} is a beautiful place to visit!" }
puts "After .each"
p city_hash

puts "Before .map!"
p country_array
# call .map! on country_array
country_array.map! { |country| country.upcase }
puts "After .map!"
p country_array