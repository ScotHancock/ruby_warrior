class Player
  def play_turn(warrior)
	
  	if warrior.feel.enemy?
  		warrior.attack!
	elsif warrior.health < 20 
		warrior.rest!
   	else
   		warrior.walk!
   	#we changed this
   	end
  end
end
