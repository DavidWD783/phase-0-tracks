# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# giving the class the link to use the state_data file information
# require relative is a compliment to the built in require method.

require_relative 'state_data'

class VirusPredictor
  # initializing new instance of virus predictor class
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
    # method is used to call on predicted deaths and speed of spread methods



  def virus_effects
    predicted_deaths(@population_density, @population, @state)
    #speed_of_spread(@population_density, @state)
  end

  private
    # Method that predicts the population density
    # predicts the number of deaths based on formula
  def predicted_deaths(population_density, population, state)
    # predicted deaths is solely based on population density
    speed = 0
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
      speed += 0.5
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
      speed += 1
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
      speed += 1.5
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
      speed += 2
    else
      number_of_deaths = (@population * 0.05).floor
      speed += 2.5
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

    puts " and will spread across the state in #{speed} months.\n\n"

  end
    # Speed is calculated by the density in the state
=begin
  def speed_of_spread(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end
=end
end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
#jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
#california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
#alaska.virus_effects

### DRY Report for 50 States ###
STATE_DATA.each do |states, state_data|
  states = VirusPredictor.new(states, STATE_DATA[states][:population_density], STATE_DATA[states][:population])
  states.virus_effects
end


###David Reflection###
#What are the differences between the two different hash syntaxes shown in the state_data file?
# - The differences can be described in the states being a string key in the large hash with the value of the state key as another hash with keys of population and population density with values in their numbers.

#What does require_relative do? How is it different from require?
# - Require_relative allows you to use data from whatever ruby file you are requiring in the class or methods of the file that has require_relative in it.  This is different from require in the way that require allows you to state specific locations where classes and methods are located that you want to use; require_relative gives the file permission to use all classes and methods relative to that file.

#What are some ways to iterate through a hash?
# - You can iterate using .each, .delete, .fetch, .keep_if, .select, .reject.

#When refactoring virus_effects, what stood out to you about the variables, if anything?
# - I noticed that the variables were only set as instance variables and not passed in to the method as class variables.

#What concept did you most solidify in this challenge?
# - I think I solidified the concept of creating instances by iterating over a hash and calling methods from one class to another using require_relative.