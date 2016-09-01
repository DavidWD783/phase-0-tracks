#require sqlite3, faker, and other classes (...???)
#create_database
  #travel_report db
#create traveler table in db
  #use string delimiter
  #pass in instance variables

require 'sqlite3'
require 'faker'
require_relative 'been_to'
require_relative 'yet_to'
require_relative 'insert'


#create_database travel_report.db
db = SQLite3::Database.new('travel_report.db')

#create instance of been_to table
been_to = Been_To.new

#create instance of yet_to table
yet_to = Yet_To.new

#create_traveler_table
create_table_cmd =  <<-SQL
CREATE TABLE IF NOT EXISTS traveler(
id INTEGER PRIMARY KEY,
name VARCHAR(255),
age INTEGER,
email VARCHAR(255),
job VARCHAR(255),
birthplace VARCHAR(255),
passport_active BOOLEAN,
been_there_id INTEGER,
going_there_id INTEGER,
FOREIGN KEY (been_there_id) REFERENCES been_to(id),
FOREIGN KEY (going_there_id) REFERENCES yet_to(id)
);
SQL

#create all tables
travelers = db.execute(create_table_cmd)
db.execute(been_to.create_been_to_table)
db.execute(yet_to.create_yet_to_table)

#insert into traveler table
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

db = SQLite3::Database.open('travel_report.db')
insert_cmd = <<-SQ
  INSERT INTO traveler(name, age, email, job, birthplace, passport_active) VALUES (?, ?, ?, ?, ?, ?);
  SQ
  db.execute(insert_cmd, [name, age, email, job, birthplace, passport_active])

  10.times do
    db = SQLite3::Database.open('travel_report.db')
    insert_cmd = <<-SQ
    INSERT INTO traveler(name, age, email, job, birthplace, passport_active) VALUES (?, ?, ?, ?, ?, ?);
    SQ
    db.execute(insert_cmd, [Faker::Name.name, Faker::Number.between(30, 70), Faker::Internet.email, Faker::Commerce.department, Faker::Address.country, Faker::Boolean.boolean.to_s])
  end

#insert into been_to table
puts "Tell me one country you have traveled to."
country_name = gets.chomp

puts "What date did you leave for the trip?"
dates = gets.chomp

puts "What number, from 1-low to 5-high, would you rate your trip there?"
rating = gets.chomp

puts "You plan on going back?  (true/false)"
return_to = gets.chomp
db = SQLite3::Database.open('travel_report.db')
insert_cmd = <<-SQ
  INSERT INTO been_to(name, dates, rating, return) VALUES (?, ?, ?, ?);
  SQ
db.execute(insert_cmd, [country_name, dates, rating, return_to])

