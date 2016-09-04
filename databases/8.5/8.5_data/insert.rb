require 'sqlite3'
require 'faker'


class Insert
  ##insert countries to been_to table
  #open database
  $db = SQLite3::Database.open('travel_report.db')

  def initialize
    puts "Initialized"
  end

  #insert traveler info into been_to
  def insert_traveler_info(name, dates, rating, return_v)
    insert_cmd =  <<-SQL
    INSERT INTO been_to(name, dates, rating, return_val) VALUES (?, ?, ?, ?);
    SQL
    #run insert cmd
    $db.execute(insert_cmd, [name, dates, rating, return_v])
  end

  #display been_to table for reference
  def display_been_to
    display_cmd = <<-CD
      SELECT * FROM been_to;
      CD
    $db.execute(display_cmd) do |result|
      puts "Name: #{result[1]}\n\Dates: #{result[2]}\n\Rating: #{result[3]}\n\Return_val: #{result[4]}\n\ "
    end
  end

  ##insert countries into yet_to table
  #insert traveler info into been_to
  def insert_into_yet_to(name)
    insert_cmd =  <<-SQL
    INSERT INTO yet_to(name) VALUES (?);
    SQL
    #run insert cmd
    $db.execute(insert_cmd, [name])
  end


  #display yet_to table upon exiting
  def display_yet_to
    dispaly_cmd = <<-CD
      SELECT * FROM yet_to;
      CD
    $db.execute(dispaly_cmd) do |result|
      puts "Name: #{result[1]}\n\ "
    end
  end

end
