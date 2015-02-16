class Player
  def play_turn(warrior)
  	if warrior.feel.enemy?
   		warrior.attack!
   		warrior.rest until health = full
   	else 
   		warrior.walk!
   	end
  end
end
