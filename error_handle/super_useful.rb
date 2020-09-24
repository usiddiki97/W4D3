# PHASE 2
def convert_to_int(str)
  Integer(str)
  rescue ArgumentError
    puts "Letters cannot be converted to integer. Please enter valid number"
    return -1
end

# PHASE 3

class CoffeeError < StandardError
end

class NotFruitError < StandardError
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError.new("OMG I love coffee and now I'm craving fruit :)")
  else
    raise NotFruitError.new("Bro, this isn't a fruit, cmon now")
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"

  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue NotFruitError => e
    puts e.message
  end

end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new ("Its common knowledge that you have be friends for at least 5 years to be BESTIES!") if yrs_known < 5
    raise ArgumentError.new ("Not enough information about bestie") if (name.empty? || fav_pastime.empty?)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

# Phase 4: Ensure BestFriend is a real best friend

# Overview

# Another use case for raising errors is to enforce correct usage of code. For example,
# if a function requires its arguments to be of certain types in order to execute properly,
# it might be best to check their type before executing any logic. This is useful because
# it allows us to inform the user that they are not using our function properly, rather
# than a runtime error being raised which may seem like a bug in our code or be more difficult to debug.

# Instructions

# If we look at user_script.rb, we see that our dear user thinks you can be besties if
# you've known each other less than a year. We do not agree. Friendships, like a fine wine,
# need at least five years to mature. Update BestFriend#initialize, in super_useful.rb,
# to raise a descriptive error when yrs_known is less than 5.

# Test your code, then assume the role of our dear user and update our call to
# BestFriend#new to create a real friendship (yrs_known>= 5).

# Our dear user also thinks it's okay to leave name and fav_pastime empty when
# creating a new instance of BestFriend. But it's not okay. It leaves #do_friendstuff
# and #give_friendship_bracelet sorely lacking. Poorly formatted text just makes
# us seethe with displeasure. Update the initialize method to raise descriptive
# errors when given strings of length <= 0.

# Test your code, then again assume the role of our dear user and update our call
# to BestFriend#new.

# Recap

# Raising errors for invalid arguments can ensure that our code is used the way
# we want intend. However, be aware that the types of inputs we can receive are
# numerous. We don't want or need to be checking against every possible type for
# each argument we receive.


