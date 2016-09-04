require 'sqlite3'
require 'faker'


class Traveler_Class
  def initialize
    puts "Initialized"
  end

  #open database
  $db = SQLite3::Database.open('travel_report.db')

  #Insert into traveler table
  def insert_data_traveler(name, age, email, job, birthplace, passport_active)
    insert_cmd = <<-SQ
    INSERT INTO traveler(name, age, email, job, birthplace, passport_active) VALUES (?, ?, ?, ?, ?, ?);
    SQ
    $db.execute(insert_cmd, [name, age, email, job, birthplace, passport_active])
  end
  #Insert random data to populate traveler table
  def insert_random_data
    10.times do
      insert_cmd = <<-SQ
      INSERT INTO traveler(name, age, email, job, birthplace, passport_active) VALUES (?, ?, ?, ?, ?, ?);
      SQ
      $db.execute(insert_cmd, [Faker::Name.name, Faker::Number.between(30, 70), Faker::Internet.email, Faker::Commerce.department, Faker::Address.country, Faker::Boolean.boolean.to_s])
    end
  end

end
