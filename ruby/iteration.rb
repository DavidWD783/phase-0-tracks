=begin
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
=end

# iterate through items, delete any that are < 4
arr = [1, 2, 3, 4, 5]
puts "Before .delete_if:"
p arr
arr.delete_if { |number| number < 4 }
puts "After delete_if:"
p arr

hash = {Christian: 25, David: 33, Mary: 70, Bob: 49}
puts "Hash before:"
p hash
hash.delete_if { |name, age| age > 50 }
puts "Hash after:"
p hash

# filters data for only items that do satisfy
arr_alphabet = ["a", "b", "c", "C"]
puts "array before:"
p arr_alphabet
arr_alphabet.keep_if { |char| char == "c" }
puts "array after:"
p arr_alphabet

hash_alpha_index = {a: 0, b: 1, c: 2, d: 3}
puts "Hash before:"
p hash_alpha_index
hash_alpha_index.select! { |letter, index| index > 1 }
puts "Hash after:"
p hash_alpha_index

# find method that filters through array and finds a certain element
arr_filter = [1, 2, 300, 4000, 500]
puts "array before:"
p arr_filter
arr_filter.reject { |number| number < 299 }
puts "array after:"
p arr_filter

hash_alphabet_index = {a: 0, b: 1, c: 2, d: 3}
puts "Hash before:"
p hash_alphabet_index
hash_alphabet_index.reject! { |char, index| char.to_s > "c" }
puts "Hash after:"
p hash_alphabet_index

# remove items from a array until the condition in the block evaluates to false
array_to_nine = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts "Array before:"
p array_to_nine

array_to_nine.delete_if {|num| num < 7 if num < 3 }

puts "Array after:"
p array_to_nine
