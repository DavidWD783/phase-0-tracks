# Interview with the Vampire
# Add in loop for Release 3
puts "How many employees to process?"
num_employees = gets.chomp
num_employees = num_employees.to_i
counter = 1
while counter < num_employees
# Ask alleged their name.
puts "What is your name?"
name = gets.chomp

# Ask alleged their age and year of birth.
puts "What is your age?"
age = gets.chomp
age = age.to_i
p age

puts "  What is your year of birth?"
birth_year = gets.chomp
birth_year = birth_year.to_i
p birth_year

if age = birth_year
  age_true = true
else
  age_true = false
end

# Ask alleged about garlic bread.
puts "Would you like some garlic bread? (y/n)"
garlic_bread = gets.chomp
if garlic_bread == "y"
  garlic_bread = true
else
  garlic_bread = false
end

# Ask alleged about enrolling in health insurance plan.
puts "Would you like to enroll in our health insurance?  (y/n)"
health_insurance = gets.chomp
if health_insurance == "y"
  health_insurance = true
else
  health_insurance = false
end
# End release 1 questions.

# Release 2

if (age_true) && (garlic_bread || health_insurance)
  if name == ("Drake Cula" || "Tu Fang")
    puts "Definitely a vampire."
  else
  puts "#{name}: Probably not a vampire."
  counter += 1
end
elsif (!age_true) && (!garlic_bread || !health_insurance)
  puts "#{name}: Probably a vampire."
  counter += 1
elsif (!age_true) && (!garlic_bread && !health_insurance)
  puts "#{name}: Almost certainly a vampire."
  counter += 1
else
  puts "#{name}: Results inconclusive..."
  counter += 1
end
# End Release 2
end