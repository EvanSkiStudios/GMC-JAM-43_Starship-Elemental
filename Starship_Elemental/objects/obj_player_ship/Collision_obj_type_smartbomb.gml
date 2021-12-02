if !(global.Player_can_pickup_bombs) return;

global.Player_bombs += 1;

//add smart bomb to array
for (var i = 0; i < (global.smartbomb_max); ++i){
	var bomb_current = global.Player_bomb_array[i];
	
	if (bomb_current == smartbomb_types.none){
		global.Player_bomb_array[i] = other.smartbomb_type;	
		
		//exit for loop
		i = global.smartbomb_max+1;
	}
}

instance_destroy(other);