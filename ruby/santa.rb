#add Santa class
class Santa
  #create an initialize method
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @age = 0
    p "#{@gender}"
    p "#{@ethnicity}"
    p "#{@age}"
  end

  #create speak method that prints "Ho, ho, ho!"
  def speak
    puts "Ho, ho ho!  Haaaappy holidays!"
  end

  #create eat milk and cookies method
  def eat_milk_and_cookes(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  #create reindeer array with default values
    reindeer_array = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
end
#add parameters for calling Santa class and methods
#santa = Santa.new("male", "caucasian")
#santa.speak
#santa.eat_milk_and_cookes("Oreo")

#create santas array
santas = []
#set parameters for genders/ethnicities
santa_genders = ["gender-neutral", "male", "female", "trans-gender", "gender-fluid"]
santa_ethnicities = ["Caucasian", "African-American", "Japanese", "Nordic"]
#iterate over santas array calling new instances
santa_genders.length.times do |x|
  puts "Creating a new santa with gender: #{santa_genders[x]} and ethnicity: #{santa_ethnicities[x]}"
  puts "This is santa number: #{x + 1}."
  santas << Santa.new(santa_genders[x], santa_ethnicities[x])
end
p santas