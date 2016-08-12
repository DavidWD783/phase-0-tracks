#Release 0
def take_block
  puts "This method has not taken the block yet."
  yield("Alert")
end

take_block { |value| puts "*#{value}*  Now it has taken the block."}

#Release 1
letters = ["a", "b", "c", "d", "e"]
letters.keep_if { |letter| letter == "b" }
puts "Original data:"
p letters


# iterate through the array with .each
# use .each with a hash

numbers = {1 => 'one', 2 => 'two', 3 => 'three'}

#num_rej = numbers.reject { |num, str| num > 2 }

p numbers.fetch(1)


# iterate through the hash with .each

numbers.each do |num, str|
  puts "#{num} spelled as #{str}."
end

letters = ["a", "b", "c", "d", "e"]

puts "Original Data:"
p letters

letters.delete_if { |letter| letter.next == "b" || letter.next == "c"}
p letters

letters_new = letters.map do |letter|
  puts letter
  letter.next
end
puts "After map call:"
p letters
p letters_new
