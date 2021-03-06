# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET route that retrieves a particular student, id, and gives them an address(use campus location)
get '/students/:id/contact' do
  campus = params[:campus]
  name = params[:name]
  response = ""
  student = db.execute("SELECT * FROM students WHERE id=?", [params['id']])[0]
  response << "#{student['name']}<br>"
  response << "Address:  1234 Main St. #{student['campus']}<br>"
end

# write a /great_job route that takes name as query param and says "Good job, [persons name]!"
#if param not present, returns "Good job!"
get '/:name/great_job' do
  name = params[:name]
  if name == ' '
    "Good job!"
  else
    "Good job, #{name}!"
  end
end

# write /:param_1/:param_2 route that adds two numbers (as parameters) and responds with the results
get '/:num_1/:num_2' do
  num_1 = params[:num_1]
  num_2 = params[:num_2]
  #change string params to ints, compute sum
  num_1_i = num_1.to_i
  num_2_i = num_2.to_i
  sum = num_1_i + num_2_i
  "#{num_1} + #{num_2} =  #{sum}"
end

# write a GET route that allows user to search for a name in the database using first name...
get '/students/:campus' do
  students = db.execute("SELECT * FROM students WHERE campus=?", [params[:campus]])[0]
  students.to_s
  # students.each do |student|
  #   "#{student['name']}<br>"
  #   "Address:  1234 Main St. #{student['campus']}<br>"
  # end
end

