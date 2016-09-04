#require sqlite3, faker
#create_database
  #travel_report db
#create traveler, been_to, and yet_to tables in db
  #use string delimiter
  #pass in instance variables

require 'sqlite3'
require 'faker'

class Database_Create

  def initialize
    puts "Initialized"
  end
  #create_database travel_report.db
  $db = SQLite3::Database.new('travel_report.db')

  #create been_to table
  been_to_cmd =  <<-SQL
  CREATE TABLE IF NOT EXISTS been_to(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  dates VARCHAR(255),
  rating INTEGER,
  return_val BOOLEAN
  );
  SQL
  $db.execute(been_to_cmd)

  #create yet_to table
  yet_to_cmd =  <<-SQL
  CREATE TABLE IF NOT EXISTS yet_to(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255)
  );
  SQL
  $db.execute(yet_to_cmd)

  #create_traveler_table
  create_table_cmd =  <<-SQL
  CREATE TABLE IF NOT EXISTS traveler(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  email VARCHAR(255),
  job VARCHAR(255),
  birthplace VARCHAR(255),
  passport_active BOOLEAN
  );
  SQL
  $db.execute(create_table_cmd)

end
