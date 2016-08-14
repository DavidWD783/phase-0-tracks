#Methods for getting first and last names
def first_name
  puts "Hello spy."
  puts "Please type your first name, then hit 'enter."
  real_first_name = gets.chomp.downcase
  real_first_name
end

def last_name
  puts "Please type your last name, then hit 'enter."
  real_last_name = gets.chomp.downcase
  real_last_name
end

#Method for putting first and last name in arrays
def name_array(name1, name2)
  real_name_array = [name1, name2]
  real_name_array
end
#name_array(first_name, last_name)
#return value is array with first and last name

#Method for switching first and last names
def name_order(array)
  array.reverse!
end
#name_order(name_array(first_name, last_name))

#Method for getting each element of array and checking for vowels
def vowel_checker(array)
  vowel_guide = ["a", "e", "i", "o", "u"]
  array.map! do |name|
    name_split = name.split('')
    name_split.map! do |char|
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
      char
      end
      char
    end
    name_split
    name_join = name_split.join('')
    name_join
  end
  array
end
#vowel_checker(name_order(name_array(first_name, last_name)))

#Method for getting each element of array and checking for vowels
def consonant_checker(array)
  consonant_guide = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
  array.map! do |name|
    name_split = name.split('')
    name_split.map! do |char|
      index = 0
      while index < consonant_guide.length
      if char == consonant_guide[index]
        char = consonant_guide[index += 1]
        index += 1
      elsif char == "z"
        char = "b"
        index += 1
      else
        char
        index += 1
      end
      char
      end
      char
    end
    name_split
    name_join = name_split.join('').capitalize!
    name_join
  end
  p array
end
#consonant_checker(vowel_checker(name_order(name_array(first_name, last_name))))

#Create method for repeating process
def process_repeat(input)
  input == "initialized"
  until input == "quit"
    consonant_checker(vowel_checker(name_order(name_array(first_name, last_name))))
    puts "If you are finished, type 'quit' and hit 'enter'."
    puts "If you would like to enter another name, hit 'enter'."
  input = gets.chomp.downcase
  end
end
process_repeat("start")