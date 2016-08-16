#add Santa class
class Santa
  #create an initialize method
  def initialize
    puts "Initializing Santa instance ..."
  end

  #create speak method that prints "Ho, ho, ho!"
  def speak
    puts "Ho, ho ho!  Haaaappy holidays!"
  end

  #create eat milk and cookies method
  def eat_milk_and_cookes(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

end
#add parameters for calling Santa class and methods
Chris_Kringle = Santa.new
Chris_Kringle.speak
Chris_Kringle.eat_milk_and_cookes("Oreo")

