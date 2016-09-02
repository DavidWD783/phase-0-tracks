require 'sqlite3'
require 'faker'
#require_relative 'traveler'

db = SQLite3::Database.open('travel_report.db')

#insert into been_to table
insert_cmd =  <<-SQL
INSERT INTO yet_to(name, plan_to) VALUES (?, ?);
SQL

10.times do
db.execute(insert_cmd, [Faker::Address.country, Faker::Boolean.boolean.to_s])
end