layer_sequence_destroy(player_die_sequance);	
layer_destroy("player_die_sequance");

instance_create_depth(
	GAME_RES_WIDTH /2,
	room_height/2,
	-2000,
	obj_gui_continue
);

global.SEQ_DIE_DO_ONCE = false;