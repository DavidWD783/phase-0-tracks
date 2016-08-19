#design class Bike_Builder
class Bike_Builder
  attr_reader :name, :chain, :age, :wheels
  attr_accessor :handlebar, :discipline, :frame, :height, :size
  #must have at least 3 attributes(two different data types)
  def initialize(name, age)
    puts "Initialized a new instance of bicycle..."
    @wheels = 2
    @chain = true
    @handlebar = "carbon"
    @age = age
    @name = name
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
    @discipline
  end

  #change the size of the frame
  def frame_size
    puts "For your height, please type one of the following to help with size."
    puts "Are you 'one', 5'5\"\ or less?  Are you 'two', 5'6\"\- 5'9\"\?  \n\Are you 'three', 5'10\"\ - 6'1\"\?  Are you 'four', 6'2\"\ or taller?"
    @height = gets.chomp.downcase
    if @height == "one"
      @size = 51
    elsif @height == "two"
      @size = 53
    elsif @height == "three"
      @size = 56
    else
      @size = 60
    end
    puts "Based on your height, you should ride a #{@size} cm frame."
    @size
  end
end


### USER INTERFACE ###
#create empty array
array_of_bikes = []
#ask user for name
puts "Hello, please enter your name, then hit 'enter'."
user_name = gets.chomp

#Ask user for age
puts "Please type your age, followed by 'enter'."
user_age = gets.chomp.to_i
until user_age.to_i != 0
  puts "Sorry, we didn't recognize that number.  Please type your age.  Ex: '30'."
  user_age = gets.chomp.to_i
end

#create loop for building instances of bikes
#bike = Bike_Builder.new(user_name, user_age)
puts "Thank you #{user_name}.  How many bicycles would you like to build today?"
user_num_bikes = gets.chomp.to_i
  until user_num_bikes.to_i != 0
    puts "Sorry, we didn't recognize that number.  Please type the number of bicycles you would like to build today.  Ex: '3'."
    user_num_bikes = gets.chomp.to_i
  end

#Create loop and push instances into array
user_num_bikes.times do |bikes|
  instance = Bike_Builder.new(user_name, user_age)
  array_of_bikes.push(instance)
  #puts "Name: #{user_name},  Your age: #{user_age}, Bike #{bikes + 1}, Wheels: #{instance.wheels}, Chain on bike: #{instance.chain}, \n\Handlebar material: #{instance.handlebar},\n\ "

  puts "What is your preferred discipline of biking for Bike No. #{bikes + 1}?"
  puts "Type: 'mountain', 'road', or 'cyclo-cross'.  Then hit 'enter'."
  user_bike_discipline = gets.chomp
  instance.bike_type(user_bike_discipline)
  #puts "Name: #{instance.name},  Your age: #{instance.age}, Bike #{bikes + 1}, Wheels: #{instance.wheels}, Chain on bike: #{instance.chain}, \n\Handlebar material: #{instance.handlebar}, Discipline: #{instance.discipline}\n\ "
  array_of_bikes

  #call frame_size method
  instance.frame_size

  array_of_bikes
end
p array_of_bikes.instance.frame_size