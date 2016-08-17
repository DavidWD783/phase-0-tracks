#design class Bike_Builder
class Bike_Builder
  attr_reader :chain, :age
  attr_accessor :wheels, :handlebar, :discipline, :frame, :height
  #must have at least 3 attributes(two different data types)
  def initialize(age)
    puts "Initialized a new instance of bicycle..."
    @wheels = 2
    @chain = true
    @handlebar = "carbon"
    @age = age
  end

  #change the type of bike(mountain, road, cyclo-cross)
  def bike_type(type)
    if type == 'mountain'
      @discipline = "mountain"
      @frame = "mountain"
    elsif type == 'road'
      @discipline = "road"
      @frame = "road"
    else
      @discipline = "cyclo-cross"
      @frame = "cyclo-cross"
    end
    puts "Based on your preference of #{type} bike, your riding discipline should be #{@discipline} biking!"
    @discipline
  end

  #change the size of the frame
  def frame_size
    puts "For your height, please type one of the following to help with size."
    puts "Are you 'one', 5'5"" or less?  Are you 'two', 5'6""- 5'9""?  \n\Are you 'three', 5'10"" - 6'1""?  Are you 'four', 6'2"" or taller?"
    @height = gets.chomp.downcase
    if @height == "one"
      size = 51
    elsif @height == "two"
      size = 53
    elsif @height == "three"
      size = 56
    else
      size = 60
    end
    puts "Based on your height, you should ride a #{size} cm frame."
    size
  end
end
bike = Bike_Builder.new(33)

#User Interface
#create empty hash
hash_of_bikes = {}
#allow user to create many instances of bikes
puts "Hello.  How many bicycles would you like to build today?"
user_num_bikes = gets.chomp.to_i
  until user_num_bikes.to_i != 0
    puts "Sorry, we didn't recognize that number.  Please type the number of bicycles you would like to build today.  Ex: '3'."
    user_num_bikes = gets.chomp.to_i
  end
puts "Thank you!"

#Ask user for age
puts "Please type your age, followed by 'enter'."
user_age = gets.chomp.to_i
until user_age.to_i != 0
  puts "Sorry, we didn't recognize that number.  Please type your age.  Ex: '30'."
  user_age = gets.chomp.to_i
end
puts "Thank you!"

#Create loop and
user_num_bikes.times do |bikes|
  hash_of_bikes[Bike_Builder.new(user_age).to_sym]
end
p hash_of_bikes

#prompt user for each attribute
  #store class instances in an array
#when finished, loop through array as confirmation