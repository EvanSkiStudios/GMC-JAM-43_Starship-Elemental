if (seeking){

	global.Player_Score += 10;

	if (smart_bomb){
		instance_create_depth(x,y,depth,obj_enemy_stinger_player_killed);
	}

	instance_destroy(other);
	instance_destroy(id);
	
}