#require sqlite3, faker, and other classes (...???)
#Create Yet_To class
  #initialize
    #readers: name, plan_to,
  #create been_to table in db
    #use string delimiter
    #pass in instance variables

require 'sqlite3'
require 'faker'
#require_relative 'other classes'

class Yet_To
  attr_reader :name, :plan_to

  def initialize
    @name = Faker::Address.country
    @plan_to = Faker::Boolean.boolean
  end

  #create_yet_to_table
  def create_yet_to_table
    create_yet_to_table_cmd =  <<-SQL
    CREATE TABLE IF NOT EXISTS yet_to(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    plan_to BOOLEAN
    );
    SQL
    create_yet_to_table_cmd
  end
end