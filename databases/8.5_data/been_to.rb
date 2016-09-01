#require sqlite3, faker, and other classes (...???)
#Create Been_To class
  #initialize
    #readers: name, dates, rating, return
  #create been_to table in db
    #use string delimiter
    #pass in instance variables

require 'sqlite3'
require 'faker'
#require_relative 'other classes'

class Been_To
  attr_reader :name, :dates, :rating, :return

  def initialize
    @name = Faker::Address.country
    @dates = Faker::Date.backward(90)
    @rating = Faker::Number.between(1, 5)
    @return = Faker::Boolean.boolean
  end

  ##create_been_to_table
  def create_been_to_table
    create_been_to_table_cmd =  <<-SQL
    CREATE TABLE IF NOT EXISTS been_to(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    dates VARCHAR(255),
    rating INTEGER,
    return BOOLEAN
    );
    SQL
    create_been_to_table_cmd
  end
end