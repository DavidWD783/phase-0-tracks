#Method that takes a spy's real name
def spy_alias  #try first name first
  puts "Hello spy."
  puts "Please type your first name, then enter."
  first_name = gets.chomp.downcase
  first_array = [first_name]
  first = consonant_changer(vowel_changer(first_array))
  puts "Please type your last name, then enter."
  last_name = gets.chomp.downcase
  last_array = [last_name]
  last = consonant_changer(vowel_changer(last_array))
  full_name = [first, last]

  #insert spy name storage data structure

  true_full = name_swap(full_name)
  agent_alias = puts "Secret Agent Name: " + true_full[0] + " " + true_full[1]
end
#spy_alias

#Swaps first and last name
def name_swap(name)
  name.reverse!
  name
end
#name_swap(name)

#Change all vowels to the next vowel
#iterate through each array item
#if item is a vowel, change to next vowel
def vowel_changer(name)
  vowel_guide = ["a", "e", "i", "o", "u"]
  name.each do |names|
    name = names.split('')
    name
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
  name
end
#vowel_changer(name)

#Change all consonants to the next consonant
def consonant_changer(name)
  consonant_guide = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
    name.map! do |chars|
      counter = 0
      while counter < consonant_guide.length
      if chars == consonant_guide[counter]
        chars = consonant_guide[counter += 1]
        counter += 1
      elsif chars == "z"
        chars = "b"
        counter += 1
      else
        chars
        counter += 1
      end
      end
      chars
    end
    name
  name.join('').capitalize!
end
#consonant_changer(name)
#spy_alias

#method for repeating spy_alias until 'quit'
def spy_repeater
  answer = true
  until answer == "quit"
    spy_alias
    puts "If you are done, please type 'quit' and hit enter.\n\If you would like to enter another spy name, please hit 'enter'."
    answer = gets.chomp.downcase
  end
end
spy_repeater

#data structure to store entries
spy_array = []
index = 0
