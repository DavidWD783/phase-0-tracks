#Assign hash name
interior_design = {}

#Prompt the designer for name
puts "What is the client's name?"
interior_design[:name] = gets.chomp

#Prompt the designer for age
puts "What is the client's age?"
interior_design[:age] = gets.chomp.to_i

#Prompt for number of children
puts "How many children does the client have?"
interior_design[:num_children] = gets.chomp.to_i

#Prompt for decor theme
puts "What is the decor theme for the client?"
interior_design[:decor_theme] = gets.chomp

#Print hash back to screen when finished
p interior_design
#Allow user to update a key
puts "Is there anything you would like to update?  (y/n)"
update = gets.chomp.downcase
if update == "y"
  puts "Type in what you would like to update!  (Name, Age, Children, Decor)"
  update = gets.chomp.downcase
  if update == "name"
    puts "Type the new name, then enter."
    update = gets.chomp
    interior_design[:name] = update
  elsif update == "age"
    puts "Type the new age, then enter."
    update = gets.chomp
    interior_design[:age] = update
  elsif update == "children"
    puts "Type the new number of children, then enter."
    update = gets.chomp
    interior_design[:num_children] = update
  else
    puts "Type the new decor theme, then enter."
    update = gets.chomp
    interior_design[:decor_theme] = update
  end
else
  puts "Ok, thanks!"
end
p interior_design
#Print latest version of hash, then exit program.