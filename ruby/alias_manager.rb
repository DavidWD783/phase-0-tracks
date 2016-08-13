#Method that takes a spy's real name
def spy_alias  #try first name first
  puts "Hello spy."
  #Ask user for first name and store it
  puts "Please type your first name, then enter."
  first_name = gets.chomp.downcase

  #Create array to work with characters of first_name
  first_array = [first_name]

  #use consonant and vowel changer methods on first name array
  first = consonant_changer(vowel_changer(first_array))

  #Ask user for last name and store it
  puts "Please type your last name, then enter."
  last_name = gets.chomp.downcase

  #Create array to work with characters of last name
  last_array = [last_name]

  #use consonant and vowel changer methods on last name array
  last = consonant_changer(vowel_changer(last_array))

  #Create full name array
  full_name = [first, last]

  #Use name swap method
  alias_name = name_swap(full_name)

  #Print secret agent name
  secret_name = puts "Secret Agent Name: " + alias_name[0] + " " + alias_name[1]

  real_entry = [first_name.capitalize, last_name.capitalize]
  index = 0
  real_entry.map do |inputs|
    arr = Array.new
    arr[(index)] = inputs
    p arr
    index += 1
  end

  alias_entry = [alias_name[0], alias_name[1]]


end
#spy_alias

#Method that swaps first and last name
def name_swap(name)
  name.reverse!
  name
end
#name_swap(name)

#Method to change all vowels to the next vowel
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

#Method to change all consonants to the next consonant
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
def spy_array(x)
  #spy_repeater
  p real_entry
  p alias_entry
end
#spy_array(spy_repeater)
