#alternate version showing how to use puts and gets.chomp instead of method with known # of vampires
#lines 1- 66
=begin
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

#Final Vampire Program (lines 68-143)
#Case with Method (Method captures name/age/birth/age_true/garlic/health and places boolean on each instead of using gets.chomp)
#Case pits each possible vampire in vamps method against each possible case of Vampire to give output statements
#allergy test added later needs to be typed in for each vamps entry as opposed to method entries done at one time.

puts "How many employees to process?"   # 7 employees were tested using a method, type 7 here
num_employees = gets.chomp
num_employees = num_employees.to_i
counter = 0
while counter < num_employees
  def vamps(name, age, birth_year, garlic_bread, health_insurance)
    p name                            #prints name
    age = age.to_i
    p "age: #{age}"                   #prints age
    birth_year = birth_year.to_i
    p "birth_year: #{birth_year}"     #prints birth year
    if age == (2016 - birth_year)
      age_true = true
    else
      age_true = false
    end
    p "age_true: #{age_true}"         #prints if age given was true or false
    if garlic_bread == "y"
      garlic_bread = true
    else
      garlic_bread = false
    end
    p "garlic_bread: #{garlic_bread}" #prints garlic break choice
    if health_insurance == "y"
      health_insurance = true
    else
      health_insurance = false
    end
    p "health_insurance: #{health_insurance}"
# Add loop for allergies, break at "yes" and break at "sunshine"
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

    vampire = case
      when sunshine; "#{name}: Probably a vampire"
      when name == "Drake Cula"; "#{name}: Definitely a vampire."
      when name == "Tu Fang"; "#{name}: Definitely a vampire."
      when (age_true && (garlic_bread || health_insurance)); "#{name}: Probably not a vampire."
      when (!age_true && !garlic_bread && !health_insurance); "#{name}: Almost certainly a vampire."
      when (!age_true && (!garlic_bread || !health_insurance)); "#{name}: Probably a vampire."
      else "#{name}: Results inconclusive."
    end
    p vampire
  end #end of vamps method
#Check 7 employees to see all outcomes
vamps("David", 10, 2006, "y", "y") #Probably not
vamps("Drake Cula", 10, 2006, "y", "y") #Definitely
vamps("Tu Fang", 10, 2006, "y", "y") #Definitely
vamps("Mike", 10, 2006, "y", "n") #Probably not
vamps("Erica", 10, 1900, "y", "y") #Inconclusive
vamps("Kate", 10, 1900, "y", "n") #Probably
vamps("Randy", 10, 1900, "n", "n") #Almost certainly
counter += num_employees  #this statement added to end the while loop
end   #end of while loop
puts "Actually, never mind!  What do all these questions have to do with anything?  Let's all be friends."
