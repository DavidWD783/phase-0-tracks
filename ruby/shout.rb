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