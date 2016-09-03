require 'sqlite3'
require 'faker'


class Remove
  #update traveler table
  db = SQLite3::Database.open('travel_report.db')

  dispaly_cmd = <<-CD
    SELECT * FROM traveler;
    CD
  db.execute(dispaly_cmd) do |result|
    puts "ID: #{result[0]}  Name: #{result[1]}"
  end

  puts "Please type your traveler ID to check your information one last time.\n\ "
  id = gets.chomp

  dispaly_cmd = <<-CD
    SELECT * FROM traveler WHERE id=?;
    CD
  db.execute(dispaly_cmd, id) do |result|
    puts "Traveler info:"
    puts "ID: #{result[0]}\n\Name: #{result[1]}\n\Age: #{result[2]}\n\Email: #{result[3]}\n\Occupation: #{result[4]}\n\Birthplace: #{result[5]}\n\Active Passport: #{result[6]}\n\ "

    puts "Do you need to update any of your traveler information? (y/n)\n\ "
    answer = gets.chomp
    if answer == 'y'
      puts "Please choose which information: 'name', 'age', 'email', 'job', 'birthplace', 'passport'\n\ "
      information = gets.chomp.downcase
      case information
      when "name"
        puts "Please update your name: \n\ "
        name = gets.chomp

        dispaly_cmd = <<-CD
        UPDATE traveler
        SET name = ?
        WHERE id = #{id};
        CD

        db.execute(dispaly_cmd, name)
      when "age"
        puts "Please update your age: \n\ "
        age = gets.chomp

        dispaly_cmd = <<-CD
        UPDATE traveler
        SET age = ?
        WHERE id = #{id};
        CD

        db.execute(dispaly_cmd, age)
      when "email"
        puts "Please update your email address: \n\ "
        email = gets.chomp

        dispaly_cmd = <<-CD
        UPDATE traveler
        SET email = ?
        WHERE id = #{id};
        CD

        db.execute(dispaly_cmd, email)
      when "job"
        puts "Please update your occupation: \n\ "
        job = gets.chomp

        dispaly_cmd = <<-CD
        UPDATE traveler
        SET job = ?
        WHERE id = #{id};
        CD

        db.execute(dispaly_cmd, job)
      when "birthplace"
        puts "Please update your place of birth: \n\ "
        birthplace = gets.chomp

        dispaly_cmd = <<-CD
        UPDATE traveler
        SET birthplace = ?
        WHERE id = #{id};
        CD

        db.execute(dispaly_cmd, birthplace)
      when "passport"
        puts "Please update your passport status: \n\ "
        passport = gets.chomp

        dispaly_cmd = <<-CD
        UPDATE traveler
        SET passport_active = ?
        WHERE id = #{id};
        CD

        db.execute(dispaly_cmd, passport)
      else
        ''
      end
    else
      ''
    end
  end

  #update been_to
  puts "Here are the countries we have on file that you have visited:\n\ "
  dispaly_cmd = <<-CD
    SELECT * FROM been_to;
    CD
  db.execute(dispaly_cmd) do |result|
    puts "#{result[1]}"
  end
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
      delete_cmd = <<-CMD
      DELETE FROM been_to
      WHERE name = ?;
      CMD
      db.execute(delete_cmd, name)
      puts "Remove another? (y/n)\n\ "
      run_loop = gets.chomp
    end
  else
    ''
  end

  #update yet_to table
  puts "Here are the countries we have on file that you want to visit:\n\ "
  display_cmd = <<-CD
    SELECT * FROM yet_to;
    CD
  db.execute(display_cmd) do |result|
    puts "#{result[1]}"
  end
  puts "Would you like to add any more countries? (y/n)\n\ "
  answer = gets.chomp
  if answer == 'y'
    run_loop = "y"
    while run_loop != "n"
      #get country name
      puts "Please enter the name of the country, then 'enter'."
      name = gets.chomp

      #insert traveler info into been_to
      insert_cmd =  <<-SQL
      INSERT INTO yet_to(name) VALUES (?);
      SQL
      #run insert cmd
      db.execute(insert_cmd, name)

      #run loop again?
      puts "Would you like to enter another country? (y/n)"
      run_loop = gets.chomp.downcase
    end

    #show final countries
    puts "Here is the list of countries we have on file that you want to travel to..."

    #display yet_to table for reference
    display_cmd = <<-CD
      SELECT * FROM yet_to;
      CD
    db.execute(display_cmd) do |result|
      puts "Name: #{result[1]}"
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
      delete_cmd = <<-CMD
      DELETE FROM yet_to
      WHERE name = ?;
      CMD
      db.execute(delete_cmd, name)
      puts "Remove another? (y/n)\n\ "
      run_loop = gets.chomp
    end
  else
    ''
  end

end

remove = Remove.new