#Hamster's name
puts "What is the hamster's name?"
hname = gets.chomp

#Volume level
puts "On a scale of 1 to 10, how loud is the hamster?"
volume = gets.chomp
volume = volume.to_i

#Fur color
puts "What color is the hamster's fur?"
color = gets.chomp

#Adoption
puts "Is this hamster a good candidate for adoption? Y/N"
adopt = gets.chomp
if adopt == "Y" || adopt == "y"
  adopt = true
else
  adopt = false
end

#Age
puts "Estimate the age of the hamster in years."
age = gets.chomp
if age.empty?
  age = nil
else
  age = age.to_f
end

#Hamster Review
puts "It's nice to meet #{hname}!"
puts "#{volume} is a nice volume."
puts "Your hamster has #{color} fur."
puts "You stated to adopt was a good idea: #{adopt}."
puts "#{hname} is #{age} years old."