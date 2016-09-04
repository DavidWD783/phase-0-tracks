require 'sqlite3'
require 'faker'


class Remove
  #update traveler table
  def initialize
    puts "Initialized"
  end

  #open database
  $db = SQLite3::Database.open('travel_report.db')

  def display_traveler_table
    display_cmd = <<-CD
      SELECT * FROM traveler;
      CD
    $db.execute(display_cmd) do |result|
      puts "ID: #{result[0]}  Name: #{result[1]}"
    end
  end

  def update_traveler_table(id)
    dispaly_cmd = <<-CD
      SELECT * FROM traveler WHERE id=?;
      CD
    $db.execute(dispaly_cmd, id) do |result|
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

          $db.execute(dispaly_cmd, name)
        when "age"
          puts "Please update your age: \n\ "
          age = gets.chomp

          dispaly_cmd = <<-CD
          UPDATE traveler
          SET age = ?
          WHERE id = #{id};
          CD

          $db.execute(dispaly_cmd, age)
        when "email"
          puts "Please update your email address: \n\ "
          email = gets.chomp

          dispaly_cmd = <<-CD
          UPDATE traveler
          SET email = ?
          WHERE id = #{id};
          CD

          $db.execute(dispaly_cmd, email)
        when "job"
          puts "Please update your occupation: \n\ "
          job = gets.chomp

          dispaly_cmd = <<-CD
          UPDATE traveler
          SET job = ?
          WHERE id = #{id};
          CD

          $db.execute(dispaly_cmd, job)
        when "birthplace"
          puts "Please update your place of birth: \n\ "
          birthplace = gets.chomp

          dispaly_cmd = <<-CD
          UPDATE traveler
          SET birthplace = ?
          WHERE id = #{id};
          CD

          $db.execute(dispaly_cmd, birthplace)
        when "passport"
          puts "Please update your passport status: \n\ "
          passport = gets.chomp

          dispaly_cmd = <<-CD
          UPDATE traveler
          SET passport_active = ?
          WHERE id = #{id};
          CD

          $db.execute(dispaly_cmd, passport)
        else
          ''
        end
      else
        ''
      end
    end
  end

  #update been_to table
  def display_been_to_table
    dispaly_cmd = <<-CD
      SELECT * FROM been_to;
      CD
    $db.execute(dispaly_cmd) do |result|
      puts "#{result[1]}"
    end
  end

  #update been_to_table
  def update_been_to_table(name, dates, rating, return_val)
    insert_cmd =  <<-SQL
    INSERT INTO been_to(name, dates, rating, return_val) VALUES (?, ?, ?, ?);
    SQL
    #run insert cmd
    $db.execute(insert_cmd, [name, dates, rating, return_val])
  end

  def remove_from_been_to_table(name)
      delete_cmd = <<-CMD
      DELETE FROM been_to
      WHERE name = ?;
      CMD
      $db.execute(delete_cmd, name)
  end

  def display_yet_to_table
    display_cmd = <<-CD
      SELECT * FROM yet_to;
      CD
    $db.execute(display_cmd) do |result|
      puts "#{result[1]}"
    end
  end


  #insert traveler info into yet_to
  def insert_into_yet_to_table(name)
    insert_cmd =  <<-SQL
    INSERT INTO yet_to(name) VALUES (?);
    SQL
    #run insert cmd
    $db.execute(insert_cmd, name)
  end


  #remove from yet_to
  def remove_from_yet_to_table(name)
    delete_cmd = <<-CMD
    DELETE FROM yet_to
    WHERE name = ?;
    CMD
    $db.execute(delete_cmd, name)
  end

end

remove = Remove.new