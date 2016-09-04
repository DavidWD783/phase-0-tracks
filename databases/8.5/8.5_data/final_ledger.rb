require 'sqlite3'
require 'faker'
require_relative 'create_database'
require_relative 'traveler'
require_relative 'display'
require_relative 'insert'
require_relative 'remove'

class Final_Ledger
  def initialize
    puts "Initialized"
  end

  #open database
  $db = SQLite3::Database.open('travel_report.db')

  #display traveler with all data
  def display_data(id)
    display_cmd = <<-CD
      SELECT * FROM traveler WHERE id=?;
      CD
    $db.execute(display_cmd, id) do |result|
      puts "Traveler info:"
      puts "ID: #{result[0]}\n\Name: #{result[1]}\n\Age: #{result[2]}\n\Email: #{result[3]}\n\Occupation: #{result[4]}\n\Birthplace: #{result[5]}\n\Active Passport: #{result[6]}\n\ "
    end

    #display been_to data
    puts "This is where you have traveled to:\n\ "
    dispaly_cmd = <<-CD
      SELECT * FROM been_to;
      CD
    $db.execute(dispaly_cmd) do |countries|
      puts "Country: #{countries[1]}\n\Date of Trip: #{countries[2]}\n\Trip Rating: #{countries[3]}\n\ "
    end

    #display yet_to data
    puts "This is your 'desire to visit' file:"
    dispaly_cmd = <<-CD
      SELECT * FROM yet_to;
      CD
    $db.execute(dispaly_cmd) do |countries|
      puts "Country: #{countries[1]}."
    end
  end
end

## User Interface && Driver Code ##
#create database
db_create = Database_Create.new

#update traveler info.
## User Interface ##
puts "What is your full name?"
name = gets.chomp

puts "What is your age?"
age = gets.chomp

puts "What is your email address?"
email = gets.chomp

puts "What is your current job title?"
job = gets.chomp

puts "Where were you born?"
birthplace = gets.chomp

puts "Is your passport active?  'y' or 'n'"
passport_active = gets.chomp.downcase
if passport_active == 'y'
  passport_active = "true"
else
  passport_active = "false"
end

traveler_int = Traveler_Class.new
traveler_int.insert_data_traveler(name, age, email, job, birthplace, passport_active)
traveler_int.insert_random_data

#run display class
display = Display.new
display.check_other_travelers

#run insert class
## User Interface ##
puts "Please tell us the countries you have visited.\n\ "
run_loop = "y"
while run_loop != "n"
  #get country name
  puts "Please enter the name of the country, then 'enter'."
  name = gets.chomp
  #get date of departure
  puts "When did you leave for that trip?"
  dates = gets.chomp.to_s
  #get rating of trip
  puts "On a scale of 1-Low to 5-High, rate your trip to #{name}."
  rating = gets.chomp.to_i
  #get return value (true/false)
  puts "You will go to #{name} again. (true/false)"
  return_v = gets.chomp.downcase

  insert = Insert.new
  insert.insert_traveler_info(name, dates, rating, return_v)

  #run loop again?
    puts "Would you like to enter another country? (y/n)"
    run_loop = gets.chomp.downcase
end

#display countries printout
#show final countries
  puts "Here is the list of countries we have on file that you have traveled to..."
insert.display_been_to

## User Interface ##
#get country name
puts "Please type the countries you plan to travel to one by one.\n\Hit 'enter' after each one.  When you are finished, type 'done'"
name = gets.chomp
run_loop = name
until run_loop == "done"
  insert.insert_into_yet_to(name)
  name = gets.chomp
  run_loop = name
end

#display yet_to_table
puts "Here is what we have on file for you for planning to travel abroad."
insert.display_yet_to

#initialize remove class
remove = Remove.new
remove.display_traveler_table

puts "Please type your traveler ID to check your information one last time.\n\ "
id = gets.chomp

remove.update_traveler_table(id)

#update been_to
puts "Here are the countries we have on file that you have visited:\n\ "
remove.display_been_to_table

#update been_to table
puts "Would you like to add any visited countries? (y/n)\n\ "
answer = gets.chomp
if answer == 'y'
  run_loop = "y"
  while run_loop != "n"
    #get country name
    puts "Please enter the name of the country, then 'enter'."
    name = gets.chomp
    #get date of departure
    puts "When did you leave for that trip?"
    dates = gets.chomp.to_s
    #get rating of trip
    puts "On a scale of 1-Low to 5-High, rate your trip to #{name}."
    rating = gets.chomp.to_i
    #get return value (true/false)
    puts "You will go to #{name} again. (true/false)"
    return_val = gets.chomp.downcase

    remove.update_been_to_table(name, dates, rating, return_val)

    #run loop again?
      puts "Would you like to enter another country? (y/n)"
      run_loop = gets.chomp.downcase
    end

else
    ''
end

#remove from been_to
puts "Would you like to remove any countries from your file? (y/n)\n\ "
answer = gets.chomp
if answer == 'y'
  run_loop = "y"
  while run_loop != "n"
    puts "Please type the country, then 'enter'.\n\ "
    name = gets.chomp
    remove.remove_from_been_to_table(name)
    puts "Remove another? (y/n)\n\ "
    run_loop = gets.chomp
  end
else
  ''
end

#display yet_to_table
puts "Here are the countries we have on file that you want to visit:\n\ "
remove.display_yet_to_table

puts "Would you like to add any more countries? (y/n)\n\ "
answer = gets.chomp
if answer == 'y'
  run_loop = "y"
  while run_loop != "n"
    #get country name
    puts "Please enter the name of the country, then 'enter'."
    name = gets.chomp
    remove.insert_into_yet_to_table(name)

    #run loop again?
    puts "Would you like to enter another country? (y/n)"
    run_loop = gets.chomp.downcase
  end
else
  ''
end

#check to remove from yet_to table
puts "Would you like to remove any countries from your file? (y/n)\n\ "
answer = gets.chomp
if answer == 'y'
  run_loop = "y"
  while run_loop != "n"
    puts "Please type the country, then 'enter'.\n\ "
    name = gets.chomp
    remove.remove_from_yet_to_table(name)
    puts "Remove another? (y/n)\n\ "
    run_loop = gets.chomp
  end
else
  ''
end

# print final ledger
final_ledger = Final_Ledger.new

#display traveler data at end
puts "Please type your ID one last time, thanks!\n\ "
  id = gets.chomp
  puts "This is your final travel ledger, thanks for your business!\n\ "
  final_ledger.display_data(id)
