# PHASE 2
def convert_to_int(str)
  
  begin
    Integer(str)
  rescue ArgumentError 
    nil
  end
end

# PHASE 3
class CoffeeError < StandardError; end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee" 
    raise CoffeeError   
  else
    raise StandardError
  end  
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin 
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError => e
    if e.is_a?(CoffeeError)
      puts "retry"
      retry
    else
      puts "wrong fruit"
    end
    # retry 
  end
end  

# PHASE 4
class ImmatureRelationshipError < StandardError; end
class EmptyNameError < StandardError; end
class EmptyPastimeError < StandardError; end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    
    
    begin
      if @yrs_known < 5
        raise ImmatureRelationshipError
      end
      if @name.empty?
        raise EmptyNameError
      end
      if @fav_pastime.empty?
        raise EmptyPastimeError    
      end

    rescue StandardError => e 
      if e.is_a?(ImmatureRelationshipError)
        puts "A real friendship is greater than 5 years, idiot"
      elsif e.is_a?(EmptyNameError)
        puts "Gimme your name!"
      elsif e.is_a?(EmptyPastimeError)
        puts "Gimme your pastime"
      end 
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


