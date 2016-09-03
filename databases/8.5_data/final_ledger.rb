require 'sqlite3'
require 'faker'
require_relative 'create_database'
require_relative 'traveler'
require_relative 'display'
require_relative 'insert'
require_relative 'remove'

class Final_Ledger
  db = SQLite3::Database.open('travel_report.db')
  puts "Please type your ID one last time, thanks!\n\ "
  id = gets.chomp
  puts "This is your final travel ledger, thanks for your business!\n\ "
  #display traveler with all data
  dispaly_cmd = <<-CD
    SELECT * FROM traveler WHERE id=?;
    CD
  db.execute(dispaly_cmd, id) do |result|
    puts "Traveler info:"
    puts "ID: #{result[0]}\n\Name: #{result[1]}\n\Age: #{result[2]}\n\Email: #{result[3]}\n\Occupation: #{result[4]}\n\Birthplace: #{result[5]}\n\Active Passport: #{result[6]}\n\ "
  end

  #display been_to data
  puts "This is your 'visited' file:"
  dispaly_cmd = <<-CD
    SELECT * FROM been_to;
    CD
  db.execute(dispaly_cmd) do |countries|
    puts "Country: #{countries[1]}\n\Date of Trip: #{countries[2]}\n\Trip Rating: #{countries[3]}\n\ "
  end

  #display yet_to data
  puts "This is your 'desire to visit' file:"
  dispaly_cmd = <<-CD
    SELECT * FROM yet_to;
    CD
  db.execute(dispaly_cmd) do |countries|
    puts "Country: #{countries[1]}."
  end
end

final_ledger = Final_Ledger.new