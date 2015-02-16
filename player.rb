class Player
  def play_turn(warrior)
  	if warrior.feel.enemy?
   		warrior.attack!
   	else
   		warrior.walk!
   	#we changed this
   	end
  end
end
