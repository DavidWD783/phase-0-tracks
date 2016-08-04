#Copy/paste Release 3 work from repl.it
#Contains if/elsif/else with loop, case with loop, method for taking multiple names at once with case in method.

=begin # Interview with the Vampire
# Add in loop for multipe employees using if/elsif/else (lines 6-72) and gets.chomp for variables
puts "How many employees to process?"
num_employees = gets.chomp
num_employees = num_employees.to_i
counter = 0
while counter < num_employees
# Ask alleged their name.
puts "What is your name?"
name = gets.chomp

# Ask alleged their age and year of birth.
puts "What is your age?"
age = gets.chomp
age = age.to_i

puts "  What is your year of birth?"
birth_year = gets.chomp
birth_year = birth_year.to_i

if age == (2016 - birth_year)
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
  if name == "Drake Cula"
    puts "#{name}: Definitely a vampire!"
    elsif name == "Tu Fang"
      puts "#{name}: Definitely a vampire!"
  else
    puts "#{name}: Probably not a vampire."
  end
  counter += 1
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
=end

=begin Case Statement Practice(lines 75-139) still using gets.chomp for variables
puts "How many employees to process?"
num_employees = gets.chomp
num_employees = num_employees.to_i
counter = 0
while counter < num_employees
# Ask alleged their name.
puts "What is your name?"
name = gets.chomp

# Ask alleged their age and year of birth.
puts "What is your age?"
age = gets.chomp
age = age.to_i

puts "  What is your year of birth?"
birth_year = gets.chomp
birth_year = birth_year.to_i

if age == (2016 - birth_year)
  age_true = true
else
  age_true = false
end
p age_true

# Ask alleged about garlic bread.
puts "Would you like some garlic bread? (y/n)"
garlic_bread = gets.chomp
if garlic_bread == "y"
  garlic_bread = true
else
  garlic_bread = false
end
p garlic_bread

# Ask alleged about enrolling in health insurance plan.
puts "Would you like to enroll in our health insurance?  (y/n)"
health_insurance = gets.chomp
if health_insurance == "y"
  health_insurance = true
else
  health_insurance = false
end
p health_insurance

# Variables for case
# name
# age
# birth_year
# age_true
# garlic_bread
# health_insurance

vampire = case
  when name == "Drake Cula"; "#{name}: Definitely a vampire."
  when name == "Tu Fang"; "{name}: Definitely a vampire."
  when (age_true && (garlic_bread || health_insurance)); "#{name}: Probably not a vampire."
  when (!age_true && !garlic_bread && !health_insurance); "#{name}: Almost certainly a vampire."
  when (!age_true && (!garlic_bread || !health_insurance)); "#{name}: Probably a vampire."
  else "#{name}: Results inconclusive."
end
counter += 1
puts vampire
end
=end

=begin (Release 3 work lines 141-209)
#Case with Method(Method captures name/age/birth/garlic/health and places boolean on each instead of #using gets.chomp); Case pits each possible vampire in vamps method against each possible case Vampire.

puts "How many employees to process?"
num_employees = gets.chomp
num_employees = num_employees.to_i
counter = 0

while counter < num_employees
# Instead of asking for variables, give in a method and define counter to be number of vamps.
# Print all variables with label to check boolean value
def vamps(name, age, birth_year, garlic_bread, health_insurance)
  p name
  age = age.to_i
  p "age: #{age}"
  birth_year = birth_year.to_i
  p "birth_year: #{birth_year}"
  if age == (2016 - birth_year)
    age_true = true
  else
    age_true = false
  end
  p "age_true: #{age_true}"

  if garlic_bread == "y"
    garlic_bread = true
  else
    garlic_bread = false
  end
  p "garlic_bread: #{garlic_bread}"


  if health_insurance == "y"
    health_insurance = true
  else
    health_insurance = false
  end
  p "health_insurance: #{health_insurance}"


# Variables used in case
# name
# age
# birth_year
# age_true
# garlic_bread
# health_insurance

vampire = case
  when name == "Drake Cula"; "#{name}: Definitely a vampire."
  when name == "Tu Fang"; "#{name}: Definitely a vampire."
  when (age_true && (garlic_bread || health_insurance)); "#{name}: Probably not a vampire."
  when (!age_true && !garlic_bread && !health_insurance); "#{name}: Almost certainly a vampire."
  when (!age_true && (!garlic_bread || !health_insurance)); "#{name}: Probably a vampire."
  else "#{name}: Results inconclusive."
end
puts vampire
end
#Check 7 employees to see all outcomes
vamps("David", 10, 2006, "y", "y") #Probably not
vamps("Drake Cula", 10, 2006, "y", "y") #Definitely
vamps("Tu Fang", 10, 2006, "y", "y") #Definitely
vamps("Mike", 10, 2006, "y", "n") #Probably not
vamps("Erica", 10, 1900, "y", "y") #Inconclusive
vamps("Kate", 10, 1900, "y", "n") #Probably
vamps("Randy", 10, 1900, "n", "n") #Almost certainly
counter += num_employees
end
=end

#Release 4 Start (copy/paste from repl.it lines 211-304)
#Case with Method(Method captures name/age/birth/garlic/health and places boolean on each instead of #using gets.chomp); Case pits each possible vampire in vamps method against each possible case Vampire.

puts "How many employees to process?"
num_employees = gets.chomp
num_employees = num_employees.to_i
counter = 0

while counter < num_employees
# Instead of asking for variables, give in a method and define counter to be number of vamps.
# Print all variables with label to check boolean value
def vamps(name, age, birth_year, garlic_bread, health_insurance)
  p name
  age = age.to_i
  p "age: #{age}"
  birth_year = birth_year.to_i
  p "birth_year: #{birth_year}"
  if age == (2016 - birth_year)
    age_true = true
  else
    age_true = false
  end
  p "age_true: #{age_true}"

  if garlic_bread == "y"
    garlic_bread = true
  else
    garlic_bread = false
  end
  p "garlic_bread: #{garlic_bread}"


  if health_insurance == "y"
    health_insurance = true
  else
    health_insurance = false
  end
  p "health_insurance: #{health_insurance}"

# Add loop for allergies, exit at "sunshine or yes"
loop == "no"
until loop == "yes"
  puts "Please list your allergies.  Type enter after each."
  allergy = gets.chomp
  sunshine = false
  if allergy == "sunshine"
    sunshine = true
    break
  else
    sunshine = false
end
puts "Finished?  (yes/no)"
loop = gets.chomp
if loop == "yes"
  break
else
  loop == "no"
end
end

# Variables used in case
# name
# age
# birth_year
# age_true
# garlic_bread
# health_insurance
# sunshine

vampire = case
# Add allergy case
  when sunshine; "#{name}: Probably a vampire"
  when name == "Drake Cula"; "#{name}: Definitely a vampire."
  when name == "Tu Fang"; "#{name}: Definitely a vampire."
  when (age_true && (garlic_bread || health_insurance)); "#{name}: Probably not a vampire."
  when (!age_true && !garlic_bread && !health_insurance); "#{name}: Almost certainly a vampire."
  when (!age_true && (!garlic_bread || !health_insurance)); "#{name}: Probably a vampire."
  else "#{name}: Results inconclusive."
end
puts vampire
end
#Check 7 employees to see all outcomes
vamps("David", 10, 2006, "y", "y") #Probably not
vamps("Drake Cula", 10, 2006, "y", "y") #Definitely
vamps("Tu Fang", 10, 2006, "y", "y") #Definitely
vamps("Mike", 10, 2006, "y", "n") #Probably not
vamps("Erica", 10, 1900, "y", "y") #Inconclusive
vamps("Kate", 10, 1900, "y", "n") #Probably
vamps("Randy", 10, 1900, "n", "n") #Almost certainly
counter += num_employees
end
puts "Actually, never mind!  What do all these questions have to do with anything?  Let's all be friends."
