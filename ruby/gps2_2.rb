# Method to create a list
#list = "apples oranges mangoes bread"
def create_list(list)
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
  #split string on spaces
  list_array = list.split(' ')

  # create grocery list hash
  grocery_hash = {}
  list_array.each do |items|
    grocery_hash[items.to_sym] = 1
  end
  grocery_hash
end
#list_hash = create_list(list)

# Method to add an item to a list
def add_item(hash)
# input: item name, pass in hash to update
# steps: prompt user for item and quantity to update, iterate through hash and update item and quantity
  print_list(hash)
  puts "If you have any other items to add to the list, please type them in \n\one at a time and hit 'enter' after each.  \n\If not, please type 'done' and hit enter."
  item_input = gets.chomp.downcase
  until item_input == 'done'
# output: updated hash
  puts "How many of that item would you like to add?"
  item_update = gets.chomp.to_i
  hash[item_input.to_sym] = item_update
  puts "Enter another item or type 'done' to stop adding items."
  item_input = gets.chomp.downcase
  end
  print_list(hash)
end
#add_item(list_hash)

# Method to remove an item from the list
# input: item name, hash
# steps: prompt the user for item to remove, remove item from hash
# output: updated hash

def remove_item(hash)
  puts "Are there any items you would like to remove from the list?  \n\If yes, please type the item and hit 'enter'.  \n\Please type 'done' if you wish to keep your list the same."
  item_input = gets.chomp.downcase
  until item_input == 'done'
  hash.delete(item_input.to_sym)
  puts "Enter another item to remove or type 'done' to finish."
  item_input = gets.chomp.downcase
  end
  print_list(hash)
end


# Method to update the quantity of an item
# input: item, quantity, hash
# steps: prompt user for item and quantity to update, find existing item and update quantity
# output: updated hash

def update_list(hash)
  puts "Are there any grocery items you would like to update?  \n\If yes, please type the item name and hit 'enter'.  \n\If not, please type 'done' to finish."
  item_input = gets.chomp.downcase
  until item_input == 'done'
  puts "What is the new quantity for this item?"
  item_quantity = gets.chomp.to_i
  hash[item_input.to_sym] = item_quantity
  puts "Enter another item to update or type 'done' to finish."
  item_input = gets.chomp.downcase
  end
  hash
end

#method for last call (add last second changes after looking at list)
def last_call(hash)
  puts "Alright, last call..."
  puts "Please type 'add', 'update', or 'remove' if you have anything to change.  \n\If it looks good, please type 'done' and hit enter."
  last_input = gets.chomp.downcase
  until last_input == 'done'
  case last_input
  when 'add'
    add_item(hash)
  when 'update'
    update_list(hash)
  when 'remove'
    remove_item(hash)
  else
    hash
  end
  puts "Please type 'add', 'update', or 'remove' if you have anything to change.  \n\If it looks good, please type 'done' and hit enter."
  last_input = gets.chomp.downcase
  end
end
# Method to print a list and make it look pretty
# input: hash
# steps: print item and quantity statement
# output: display of print statements

def print_list(hash)
  puts "Here is your list:"
  hash.each { |item, quantity| puts "#{item} - #{quantity}." }
end

### USER INTERFACE ###
#add interface to ask user for grocery list as string
puts "Please type your grocery list out item by item with spaces in between each item.  \n\For multi-syllable items (Ex: ice cream), please type ice-cream or icecream."
puts "Hit 'enter' when you are finished."
list = gets.chomp


### DRIVER CODE ###
#p list = "apples oranges mangoes bread"
list_hash = create_list(list)
add_item(list_hash)
update_list(list_hash)
remove_item(list_hash)
last_call(list_hash)
print_list(list_hash)