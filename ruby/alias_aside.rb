#Methods for getting first and last names
def array_counter
  counter = 1
  blank_array = []

#Prompt user for first name
  puts "Hello spy."
  puts "Please type your first name, then hit 'enter'."
  real_first_name = gets.chomp.downcase
  real_first_name

#Prompt user for last name
  puts "Please type your last name, then hit 'enter'."
  real_last_name = gets.chomp.downcase
  real_last_name

#Store first and last names
blank_array.push("#{real_first_name} #{real_last_name}")

#Method for putting first and last name in arrays
  real_name_array = [real_first_name, real_last_name]
  real_name_array

#Method for switching first and last names
  real_name_array.reverse!
  real_name_array
#Method for getting each element of array and checking for vowels
  vowel_guide = ["a", "e", "i", "o", "u"]
  real_name_array.map! do |name|
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
  alias_name_array = real_name_array
  alias_name_array

#Method for getting each element of array and checking for vowels
  consonant_guide = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
  alias_name_array.map! do |name|
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
alias_name_array
blank_array.push("#{alias_name_array}")
counter += 1
p blank_array
p counter
end
array_counter