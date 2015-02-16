require 'pry'
class Player
  	MAX_HEALTH = 20
	LOW_HEALTH = 10
	attr_accessor :warrior

  
  def play_turn(warrior)
  	# Ruby or Equal operator. If @health is defined (has a value), don;t do anything
  	# If it's nil (hasnt been assigned a value), assign the value.
  	@captive_needs_rescuing ||= "no"
  	@health ||= MAX_HEALTH
  	self.warrior = warrior

  	if warrior.feel.enemy?
  		warrior.attack!
	elsif healing?
  		warrior.rest!
  	elsif nothing_behind_with_captive?
  		warrior.walk!(:backward)
  		puts '1st'
  	elsif warrior.feel(:backward).captive?
		@captive_needs_rescuing = "yes"
  		warrior.rescue!(:backward)
  	elsif warrior.feel.captive?
  		warrior.rescue!	
  	elsif taking_damage? && needs_to_heal?
  		warrior.walk!(:backward)
  	elsif needs_to_heal?
  		if safe_to_heal?
	  		warrior.rest!
	  	else
	  		warrior.walk!(:backward)
	  	end
  	# warrior.walk!(:backward)
	# warrior.feel(:backward).empty?
   	else
   		warrior.walk!
   	end
   	
   	@health = warrior.health
   	#Concatenate the ruby way
   	puts "Current Health #{@health}"
  	end

  	def needs_to_heal?
  		warrior.health < LOW_HEALTH
	end

  	def safe_to_heal?
  		warrior.health == @health
  	end

	def nothing_behind_with_captive?
		warrior.feel(:backward).empty? && @captive_needs_rescuing == "no"
	end

	def taking_damage?
		warrior.health < @health
	end

	def healing?
		warrior.health < MAX_HEALTH && warrior.health > @health
	end

end
