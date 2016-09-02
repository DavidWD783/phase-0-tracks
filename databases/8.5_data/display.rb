require 'sqlite3'
require 'faker'

class Display
#display traveler, ask if updates needed
db = SQLite3::Database.open('travel_report.db')

puts "We process a lot of travelers.\n\Would you like to see who else we have worked with? (y/n)"
view_directory = gets.chomp.downcase

if view_directory == 'y'
  #display all travelers
  dispaly_cmd = <<-CD
    SELECT * FROM traveler;
    CD
  db.execute(dispaly_cmd) do |result|
    puts "ID: #{result[0]}\n\Name: #{result[1]}\n\Age: #{result[2]}\n\Birthplace: #{result[5]}\n\Active Passport: #{result[6]}\n\ "
  end
else
  dispaly_cmd = <<-CD
    SELECT * FROM traveler WHERE id=1;
    CD
  db.execute(dispaly_cmd) do |result|
    puts "Traveler info:\n\ "
    puts "ID: #{result[0]}\n\Name: #{result[1]}\n\Age: #{result[2]}\n\Email: #{result[3]}\n\Occupation: #{result[4]}\n\Birthplace: #{result[5]}\n\Active Passport: #{result[6]}\n\ "
  end
end

end
