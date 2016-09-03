require 'sqlite3'
require 'faker'


class Traveler_Class
  def initialize(start)
    puts "Initialized"
  end
  ##insert into traveler table
  #open database
  db = SQLite3::Database.open('travel_report.db')

  ## User Interface ##
  puts "What is your full name?"
  name = gets.chomp

  puts "What is your age?"
  age = gets.chomp

  puts "What is your email address?"
  email = gets.chomp

  puts "What is your current job title?"
  job = gets.chomp

  puts "Where were you born?"
  birthplace = gets.chomp

  puts "Is your passport active?  'y' or 'n'"
  passport_active = gets.chomp.downcase
  if passport_active == 'y'
    passport_active = "true"
  else
    passport_active = "false"
  end

  #Insert into traveler table
  insert_cmd = <<-SQ
  INSERT INTO traveler(name, age, email, job, birthplace, passport_active) VALUES (?, ?, ?, ?, ?, ?);
  SQ
  db.execute(insert_cmd, [name, age, email, job, birthplace, passport_active])

  #Insert random data to populate traveler table
  10.times do
    insert_cmd = <<-SQ
    INSERT INTO traveler(name, age, email, job, birthplace, passport_active) VALUES (?, ?, ?, ?, ?, ?);
    SQ
    db.execute(insert_cmd, [Faker::Name.name, Faker::Number.between(30, 70), Faker::Internet.email, Faker::Commerce.department, Faker::Address.country, Faker::Boolean.boolean.to_s])
  end
end
