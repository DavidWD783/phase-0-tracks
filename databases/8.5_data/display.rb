require 'sqlite3'
require 'faker'

class Display
#display traveler, ask if updates needed
db = SQLite3::Database.open('travel_report.db')

puts "If you are planning to travel alone, we can show you who might like a travel partner.\n\ "
puts "Would you like to see who else we have worked with? (y/n)"
view_directory = gets.chomp.downcase

if view_directory == 'y'
  #display all travelers
  dispaly_cmd = <<-CD
    SELECT * FROM traveler;
    CD
  db.execute(dispaly_cmd) do |result|
    puts "Name: #{result[1]}\n\Age: #{result[2]}\n\Birthplace: #{result[5]}\n\Active Passport: #{result[6]}\n\ "
  end
else
  ''
end

end
