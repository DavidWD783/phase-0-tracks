#add Santa class
class Santa
  attr_reader :age, :ethnicity
  attr_accessor :gender

  #create an initialize method
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @age = 0
  end

  #create speak method that prints "Ho, ho, ho!"
  def speak
    puts "Ho, ho ho!  Haaaappy holidays!"
  end

  #create eat milk and cookies method
  def eat_milk_and_cookes(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  #celebrate_birthday method
  def celebrate_birthday(age)
    @age = age + 1
    puts "Santa was #{age} but now is #{@age}."
  end

  #get_mad_at method move reindeer to last
  def get_mad_at(reindeer_name)
    #create reindeer array with default values
    reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    reindeer_ranking[reindeer_ranking.index(reindeer_name)] = nil
    reindeer_ranking.compact!
    reindeer_ranking.push(reindeer_name)
    reindeer_ranking
  end
end
#add parameters for calling Santa class and methods
santa = Santa.new("male", "Caucasian")
santa.speak
santa.eat_milk_and_cookes("Oreo")
santa.celebrate_birthday(59)
santa.get_mad_at("Vixen")
santa.gender=("female")
santa.age
santa.ethnicity


#create santas array
santas = []
#set parameters for genders/ethnicities
santa_genders = ["gender-neutral", "male", "female", "trans-gender", "gender-fluid"]
santa_ethnicities = ["Caucasian", "African-American", "Japanese", "Nordic", "Czech"]
santa_names = ["David", "Chris", "Mike", "Emily", "Sarah", "Kathy"]

#iterate over santas array calling new instances
=begin
santa_genders.length.times do |x|
  puts "Creating a new santa with gender: #{santa_genders[x]} and ethnicity: #{santa_ethnicities[x]}"
  puts "This is santa number: #{x + 1}."
  santas << Santa.new(santa_genders[x], santa_ethnicities[x])
end
=end

#create loop for release 4
15.times do |instance|
  puts "This is Santa number #{instance + 1}."
  santa = santa_names.sample
  puts "This Santa is named #{santa}."
  p santa = Santa.new(santa_genders.sample, santa_ethnicities.sample)
  santa.celebrate_birthday(0 + rand(140))
  #santa.speak
  #santa.eat_milk_and_cookes("Oreo")
end
