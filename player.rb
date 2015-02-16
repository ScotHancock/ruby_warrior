class Player
  	MAX_HEALTH = 20
	LOW_HEALTH = 20

  
  def play_turn(warrior)
  	# Ruby or Equal operator. If @health is defined (has a value), don;t do anything
  	# If it's nil (hasnt been assigned a value), assign the value.
  	@health ||= MAX_HEALTH

  	if warrior.feel.enemy?
  		warrior.attack!
  	elsif warrior.feel.captive?
  		warrior.rescue!	
  	elsif warrior.health < @health
  		warrior.walk!
  	elsif warrior.health < MAX_HEALTH
  		warrior.rest!
  	
	
   	else
   		warrior.walk!
   	#we changed this
   	end
   	
   	@health = warrior.health
   	#Concatenate the ruby way
   	puts "Current Health #{@health}"
  end
end
