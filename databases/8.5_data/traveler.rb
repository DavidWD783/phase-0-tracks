#require sqlite3, faker, and other classes (...???)
#Create Traveler class
  #initialize
    #readers: name, age, email, job, birthplace, passport_active?
  #create_database
    #travel_report db
  #create traveler table in db
    #use string delimiter
    #pass in instance variables

require 'sqlite3'
require 'faker'
require_relative 'been_to'
require_relative 'yet_to'

class Traveler
  attr_reader :name, :age, :email, :job, :birthplace, :passport_active

  def initialize(name, age, email, job, birthplace, passport_active)
    @name = name
    @age = age
    @email = email
    @job = job
    @birthplace = birthplace
    @passport_active = passport_active
  end

  #create_database
  db = SQLite3::Database.new('travel_report.db')

  #create instance of been_to
  been_to = Been_To.new

  #create instance of yet_to
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
  create_table_cmd

  #create all tables
  travelers = db.execute(create_table_cmd)
  db.execute(been_to.create_been_to_table)
  db.execute(yet_to.create_yet_to_table)

end

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


## Driver Code ##
#create instance of Traveler
traveler = Traveler.new(name, age, email, job, birthplace, passport_active)


