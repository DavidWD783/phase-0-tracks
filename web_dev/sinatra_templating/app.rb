# require gems
require 'sinatra'
require 'sqlite3'
#require_relative 'sql_schema'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
SQL_CREATE_CAMPUSES = <<-SQL
CREATE TABLE IF NOT EXISTS campuses (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
SQL

SQL_CREATE_CAMPUSES_STUDENTS = <<-SQL
  CREATE TABLE IF NOT EXISTS campuses_students (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    campus_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (campus_id) REFERENCES campuses(id)
  )
SQL

db.execute(SQL_CREATE_CAMPUSES)
db.execute(SQL_CREATE_CAMPUSES_STUDENTS)
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# create new page to link to students by id and show name
get '/students/student_link' do
  @students = db.execute("SELECT * FROM students")
  erb :student_link
end

#create new page to link individual student details
get '/students/:id' do
  @student = db.execute("SELECT * FROM students WHERE id=?", params[:id].to_i)[0]
  puts @student
  erb :student_details
end

#create new route for new campus

get '/campus/new' do
  erb :new_campus
end

#insert new campus into campuses table
post '/campus' do
  db.execute("INSERT INTO campuses (name) VALUES (?)", [params['name']])
  redirect '/campuses'
end

get '/campuses' do
  @campuses = db.execute("SELECT * FROM campuses")
  erb :campuses
end