#Methods for storing data
def array_counter
  name_array = []

  input = "initialized"
  until input == "quit"

#Prompt user for first name
    puts "Hello spy.\n\ "
    puts "Please type your first name, then hit 'enter'."
    real_first_name = gets.chomp
    first_name = real_first_name.downcase

  #Prompt user for last name
    puts "Please type your last name, then hit 'enter'."
    real_last_name = gets.chomp
    last_name = real_last_name.downcase


  #Method for putting first and last name in arrays
    iterate_name_array = [first_name, last_name]
    iterate_name_array

  #Method for switching first and last names
    iterate_name_array.reverse!
    iterate_name_array

  #Method for getting each element of array and checking for vowels
    vowel_guide = ["a", "e", "i", "o", "u"]
    iterate_name_array.map! do |name|
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
    #Change array name for easier to understand print statements
    alias_name_array = iterate_name_array
    alias_name_array

    #Method for getting each element of array and checking for consonants
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

    #push each new alias/real name pair into name_array
    name_array.push("#{alias_name_array[0]} #{alias_name_array[1]} is actually #{real_first_name} #{real_last_name}")

    #print each alias
    puts "Alias name: #{alias_name_array[0]} #{alias_name_array[1]}\n\ "

    #for end of until loop
    puts "If you are finished, type 'quit' and hit 'enter'.\n\ "
    puts "If you would like to enter another name, hit 'enter'.\n\ "
    input = gets.chomp.downcase
    if input == "quit"
      break
    else
      input
    end
  #end of until loop
  end
  name_array.each do |item|
    p item
  end
end
array_counter