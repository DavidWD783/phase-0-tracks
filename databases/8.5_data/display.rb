require 'sqlite3'
require 'faker'


#display traveler, ask if updates needed
db = SQLite3::Database.open('travel_report.db')

puts "Do you want to see everyone else in our travel directory? (y/n)"
view_directory = gets.chomp.downcase

if view_directory == 'y'
  #display all travelers
  dispaly_cmd = <<-CD
    SELECT * FROM traveler;
    CD
  db.execute(dispaly_cmd) do |result|
    puts "ID: #{result[0]}\n\Name: #{result[1]}\n\Age: #{result[2]}\n\Email: #{result[3]}\n\Occupation: #{result[4]}\n\Birthplace: #{result[5]}\n\Active Passport: #{result[6]}\n\ "
  end
else
  puts "Please type your name into the system again to find your traveler info, then hit 'enter'."
  name = gets.chomp
  #display all travelers
  dispaly_cmd = <<-CD
    SELECT * FROM traveler where name=?;
    CD
  db.execute(dispaly_cmd, [name]) do |result|
    puts "ID: #{result[0]}\n\Name: #{result[1]}\n\Age: #{result[2]}\n\Email: #{result[3]}\n\Occupation: #{result[4]}\n\Birthplace: #{result[5]}\n\Active Passport: #{result[6]}\n\ "
  end
end
