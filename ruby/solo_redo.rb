#design class Bike_Builder
class Bike_Builder
  attr_reader :name, :chain, :age, :wheels, :height
  attr_accessor :handlebar, :discipline, :frame, :size
  #must have at least 3 attributes(two different data types)
  def initialize(name, age, height)
    puts "Initialized a new bike build!"
    @wheels = 2
    @chain = true
    @handlebar = "carbon"
    @age = age
    @name = name
    @height = height
  end

  #change the type of bike(mountain, road, cyclo-cross)
  def bike_type(type)
    if type == 1
      @discipline = "mountain"
      @frame = "mountain"
    elsif type == 2
      @discipline = "road"
      @frame = "road"
    else
      @discipline = "cyclo-cross"
      @frame = "cyclo-cross"
    end
    @discipline
    @frame
  end

  #change the size of the frame based on bike type
  def frame_size(height)
    case @height
    when @height == "small"
      puts "Based on your height, you should ride a size Small."
      if @frame == 'mountain'
        @size == 'small mountain frame'
      elsif @frame == 'road'
        @size == 'small road frame'
      else
        @size == 'small cyclo-cross frame'
      end
    when @height == "medium"
      puts "Based on your height, you should ride a size Medium."
      if @frame == 'mountain'
        @size == 'medium mountain frame'
      elsif @frame == 'road'
        @size == 'medium road frame'
      else
        @size == 'medium cyclo-cross frame'
      end
    when @height == "large"
      puts "Based on your height, you should ride a size Large."
      if @frame == 'mountain'
        @size == 'large mountain frame'
      elsif @frame == 'road'
        @size == 'large road frame'
      else
        @size == 'large cyclo-cross frame'
      end
    else
      puts "Based on your height, you should ride an XL frame."
      if @frame == 'mountain'
        @size == 'XL mountain frame'
      elsif @frame == 'road'
        @size == 'XL road frame'
      else
        @size == 'XL cyclo-cross frame'
      end
    end
    @size
  end

  #change any attribute
  def change_any_feature
    feature = 'initialized'
    until feature == 'none'
      puts "Is there any feature you would like to go back and change for this bike?"
      puts "Type 'frame', 'discipline', 'handlebar', or 'none' then enter."
      feature = gets.chomp.downcase
      case feature
      when "frame"
        puts "What is your new frame size?  \n\'small', 'medium', 'large', or 'XL'?"
        @size = gets.chomp.downcase
      when "discipline"
        puts "Type: '1' for mountain-biking, '2' for road-biking, or '3' for cyclo-cross riding.  Then hit 'enter'."
        @discipline = gets.chomp.to_i
        bike_type(@discipline)
      when "handlebar"
        puts "Do you prefer 'carbon', 'aluminum', 'titanium', or 'steel' for your handlebar?"
        @handlebar = gets.chomp.downcase
      else
        puts "Ok."
      end
      puts "Thank you."
    end
  end

end


### USER INTERFACE ###
#ask user for name
puts "Hello, please type your name, then 'enter'."
user_name = gets.chomp

#Ask user for age
puts "Please type your age, then 'enter'."
user_age = gets.chomp.to_i
until user_age.to_i != 0
  puts "Sorry, we didn't recognize that number.  Please type your age.  Ex: '30'."
  user_age = gets.chomp.to_i
end

#ask user for height
puts "Please select the range which best describes your height.  \n\In the event of a toss-up, go small as the fit will be better.\n\ "
puts "'small': 5'3\"\ or smaller.\n\'medium': 5'4\"\ - 5'9\"\.\n\'large': 5'10\"\ - 6'2\"\.\n\'XL': 6'3\"\ or taller."
user_height = gets.chomp.downcase

#ask user for number of bikes to build
puts "Thank you #{user_name}.  How many bicycles would you like to build today?"
user_num_bikes = gets.chomp.to_i
until user_num_bikes.to_i != 0
  puts "Sorry, we didn't recognize that number.  Please type the number of bicycles you would like to build today.  Ex: '3'."
  user_num_bikes = gets.chomp.to_i
end


### DRIVER CODE ###
#create empty array
hash_of_bikes = {}

#Create loop and push instances into hash
user_num_bikes.times do |build_bikes|
   bike = Bike_Builder.new(user_name, user_age, user_height)
  hash_of_bikes[bike] = "Bike: #{build_bikes + 1}"

  #ask about discipline for each bike
  puts "What is your preferred discipline of biking for Bike No. #{build_bikes + 1}?"
  puts "Type: '1' for mountain-biking, '2' for road-biking, or '3' for cyclo-cross riding.  Then hit 'enter'."
  user_bike_discipline = gets.chomp.to_i
  bike.bike_type(user_bike_discipline)

  #call frame_size method
  bike.frame_size(user_height)
  p hash_of_bikes

  #call feature_to_change method
  bike.change_any_feature
  hash_of_bikes
end

hash_of_bikes.each do |attributes|
  p attributes
end