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
p bike.wheels
p bike.handlebar
p bike.chain
p bike.age
p bike.bike_type("mountain")
p bike.frame_size