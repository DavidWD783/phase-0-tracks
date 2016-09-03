require 'sqlite3'
require 'faker'


class Insert
  ##insert countries to been_to table
  #open database
  db = SQLite3::Database.open('travel_report.db')

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
    return_to = gets.chomp.downcase

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

  #show final countries
  puts "Here is the list of countries we have on file that you have traveled to..."

  #display been_to table for reference
  dispaly_cmd = <<-CD
    SELECT * FROM been_to;
    CD
  db.execute(dispaly_cmd) do |result|
    puts "Name: #{result[1]}\n\Dates: #{result[2]}\n\Rating: #{result[3]}\n\Return_val: #{result[4]}\n\ "
  end

  ##insert countries into yet_to table
  ## User Interface ##
  #get country name
  puts "Please type the countries you plan to travel to one by one.\n\Hit 'enter' after each one.  When you are finished, type 'done'"
  name = gets.chomp
  run_loop = name
  until run_loop == "done"
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
  puts "Here is what we have on file for you for planning to travel abroad."

  dispaly_cmd = <<-CD
    SELECT * FROM yet_to;
    CD
  db.execute(dispaly_cmd) do |result|
    puts "Name: #{result[1]}\n\ "
  end
end
