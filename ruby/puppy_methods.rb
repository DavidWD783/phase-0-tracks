class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

end

spot = Puppy.new
#spot.fetch("ball")

class Language
  def initialize
    puts "Initialized a new instance of Language..."
  end

  def verbs(input)
    puts "Verbs are tough to learn..."
  end

  def nouns(input)
    puts "Nouns are also confusing"
  end
end
English = Language.new
#English.verbs("swimming")

arr = []
50.times.each do |index|
  arr.push(Language.new)
end
p arr[3]
  arr.each do |index|
    index.verbs("swimming")
    index.nouns("people")
  end
