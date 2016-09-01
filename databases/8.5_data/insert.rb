#insert traveler into traveler table
#insert countries to been_to and yet_to

require 'sqlite3'
require 'faker'
require_relative 'been_to'
require_relative 'yet_to'


class Insert
  db = SQLite3::Database.open('travel_report.db')

  def intialize
  end

  def insert_traveler_data
    insert_cmd = <<-SQ
    INSERT INTO traveler(name, age, email, job, birthplace, passport_active) VALUES (?, ?, ?, ?, ?, ?);
    SQ
    db.execute(insert_cmd, [@name, @age, @email, @job, @birthplace, @passport_active])
  end


end