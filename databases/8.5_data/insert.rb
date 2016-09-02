##insert countries to been_to table

require 'sqlite3'
require 'faker'

## User Interface ##
puts "Would you like to update your list of countries you have traveled to? (y/n)"
  run_loop = gets.chomp.downcase
while run_loop == "y"
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
  return_to = gets.chomp.downcase

  #open database
  db = SQLite3::Database.open('travel_report.db')

  #insert traveler info into been_to
  insert_cmd =  <<-SQL
  INSERT INTO been_to(name, dates, rating, return_val) VALUES (?, ?, ?, ?);
  SQL
  #run insert cmd
  db.execute(insert_cmd, [name, dates, rating, return_to])

  #run loop again?
  puts "Would you like to enter another country? (y/n)"
  run_loop = gets.chomp.downcase
end

#display been_to table upon exiting
db = SQLite3::Database.open('travel_report.db')

dispaly_cmd = <<-CD
  SELECT * FROM been_to;
  CD
db.execute(dispaly_cmd) do |result|
  puts "ID: #{result[0]}\n\Name: #{result[1]}\n\Dates: #{result[2]}\n\Rating: #{result[3]}\n\Return_val: #{result[4]}\n\ "
end

##insert countries into yet_to table
## User Interface ##
#get country name
puts "Please type the countries you plan to travel to one by one.\n\Hit 'enter' after each one.  When you are finished, type 'done'"
name = gets.chomp
run_loop = name
until run_loop == "done"

  #open database
  db = SQLite3::Database.open('travel_report.db')

  #insert traveler info into been_to
  insert_cmd =  <<-SQL
  INSERT INTO yet_to(name) VALUES (?);
  SQL
  #run insert cmd
  db.execute(insert_cmd, [name])

  name = gets.chomp
  run_loop = name
end

#display yet_to table upon exiting
db = SQLite3::Database.open('travel_report.db')

dispaly_cmd = <<-CD
  SELECT * FROM yet_to;
  CD
db.execute(dispaly_cmd) do |result|
  puts "ID: #{result[0]}\n\Name: #{result[1]}\n\ "
end
