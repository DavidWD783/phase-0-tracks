#require sqlite3, faker
#create_database
  #travel_report db
#create traveler, been_to, and yet_to tables in db
  #use string delimiter
  #pass in instance variables

require 'sqlite3'
require 'faker'

#create_database travel_report.db
db = SQLite3::Database.new('travel_report.db')

#create been_to table
db = SQLite3::Database.open('travel_report.db')
been_to_cmd =  <<-SQL
CREATE TABLE IF NOT EXISTS been_to(
id INTEGER PRIMARY KEY,
name VARCHAR(255),
dates VARCHAR(255),
rating INTEGER,
return_val BOOLEAN
);
SQL
db.execute(been_to_cmd)

#create yet_to table
db = SQLite3::Database.open('travel_report.db')
yet_to_cmd =  <<-SQL
CREATE TABLE IF NOT EXISTS yet_to(
id INTEGER PRIMARY KEY,
name VARCHAR(255)
);
SQL
db.execute(yet_to_cmd)

#create_traveler_table
db = SQLite3::Database.open('travel_report.db')
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
db.execute(create_table_cmd)




=begin
been_there_id INTEGER,
going_there_id INTEGER,
FOREIGN KEY (been_there_id) REFERENCES been_to(id),
FOREIGN KEY (going_there_id) REFERENCES yet_to(id)
=end
