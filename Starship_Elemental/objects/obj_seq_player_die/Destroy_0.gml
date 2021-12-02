layer_sequence_destroy(player_die_sequance);	
layer_destroy("player_die_sequance");


if (global.Player_Lives <= 0){
	instance_create_depth(
		GAME_RES_WIDTH /2,
		room_height/2,
		-2000,
		obj_gui_continue
	);
}else{
	instance_create_depth(0,0,depth,obj_create_respawn);
	global.Player_Lives -= 1;
	global.Player_HP = 3;
	global.SEQ_DIE_DO_ONCE = true;
}