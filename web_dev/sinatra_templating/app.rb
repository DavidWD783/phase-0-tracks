# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
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