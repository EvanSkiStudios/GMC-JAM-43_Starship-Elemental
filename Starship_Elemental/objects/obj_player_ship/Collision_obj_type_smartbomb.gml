if !(global.Player_can_pickup_bombs) return;

var bomb_array_length = array_length(global.Player_Smartbomb_array);

//add bomb we picked up to array
for (var i = 0; i < bomb_array_length; ++i){
	var current_bomb_slot = global.Player_Smartbomb_array[i];	
	if (current_bomb_slot == smartbomb_types.none){
		global.Player_Smartbomb_array[i] = other.smartbomb_type;
		i = bomb_array_length + 1;
	}
}

playSound(SND_SFX_SMARTBOMB_PICKUP,false);
global.Player_bombs += 1;
instance_destroy(other);