#Release 0
#Method that takes a spy's real name
def spy_alias
  puts "Hello spy."
  puts "Please type your first name, then enter."
  first_name = gets.chomp.downcase
  puts "Please type your last name, then enter."
  last_name = gets.chomp.downcase
  #puts "Thank you."
  full_name = [first_name, last_name]
  full_name
end
#spy_alias

#Swaps first and last name
def name_swap(name)
  name.reverse!
  name
end
#name_swap(spy_alias)

#Change all vowels to the next vowel
#iterate through each array item
#if item is a vowel, change to next vowel
def vowel_changer(name)
  vowel_guide = ["a", "e", "i", "o", "u"]
  name.map! do |names|
    name = names.split('')
    name.map! do |char|
      index = 0
      while index < vowel_guide.length
      if char == vowel_guide[index]
        char = vowel_guide[index += 1]
        index += 1
      elsif char == "u"
        char = "a"
        index += 1
      else
        char
        index += 1
      end
      end
      char
    end
    name
  end
end
#vowel_changer(name_swap(spy_alias))

#Change all consonants to the next consonant

def consonant_changer(name)
  consonant_guide = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
  name = [name[0].join(''), name[1].join('')]
  p name
  name.map! do |names|
    name = names.split('')
    name.map! do |chars|
      index = 0
      while index < consonant_guide.length
      if chars == consonant_guide[index]
        chars = consonant_guide[index += 1]
        index += 1
      elsif chars == "z"
        chars = "b"
        index += 1
      else
        chars
        index += 1
      end
      end
      chars
    end
    name
  end
  p name
  #p name[1].join('').capitalize! + " " + name[0].join('').capitalize!
end
consonant_changer(vowel_changer(name_swap(spy_alias)))
