def take_block(input)
  puts "Before block status message."
  yield(input)
end
take_block("input") { |user_input| puts "The user input is #{user_input}." }