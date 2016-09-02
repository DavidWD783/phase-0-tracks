require 'sqlite3'
require 'faker'
#require_relative 'traveler'

db = SQLite3::Database.open('travel_report.db')

#insert into been_to table
insert_cmd =  <<-SQL
INSERT INTO been_to(name, dates, rating, return_val) VALUES (?, ?, ?, ?);
SQL

10.times do
db.execute(insert_cmd, [Faker::Address.country, Faker::Date.backward(10).to_s, Faker::Number.between(1, 5), Faker::Boolean.boolean.to_s])
end

