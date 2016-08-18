#comment out old code
=begin
module Shout
  #methods go here
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words + "!!!" + " :)"
  end
end

## DRIVER CODE ##
#call and print yell_angrily
p Shout.yell_angrily("meanie")

#call and print yell_happily
p Shout.yell_happily("happy")
=end

module Shout
  def potty_mouth(words)
  puts "Please, keep #{words} to yourself!"
  end
end

class Sister
  include Shout
end

class Bro
  include Shout
end

##DRIVER CODE##
#call sister class and Shout module
sister = Sister.new
sister.potty_mouth("shut-up!")

#call bro class and Shout module
bro = Bro.new
bro.potty_mouth("oh, bro")
