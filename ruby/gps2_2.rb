# Method to create a list
list = "apples oranges mangoes bread"
def create_list(list)
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
  #split string on spaces
  list_array = list.split(' ')
  #puts string into array

# steps:
  # create grocery list hash
  grocery_hash = {}
  list_array.each do |items|
    grocery_hash[items.to_sym] = 1
  end
  grocery_hash
end
list_hash = create_list(list)

# Method to add an item to a list
def add_item(hash)
# input: item name, pass in hash to update
# steps: prompt user for item and quantity to update, iterate through hash and update item and quantity
  puts "Which grocery item would you like to add to the list?"
  item_input = gets.chomp.downcase
# output: updated hash
  hash[item_input.to_sym] = 1
  hash
end
add_item(list_hash)

# Method to remove an item from the list
# input: item name, hash
# steps: prompt the user for item to remove, remove item from hash
# output: updated hash

# Method to update the quantity of an item
# input: item, quantity, hash
# steps: prompt user for item and quantity to update, find existing item and update quantity
# output: updated hash

# Method to print a list and make it look pretty
# input: hash
# steps: print item and quantity statement
# output: display of print statements