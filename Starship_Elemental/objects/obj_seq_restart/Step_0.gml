if layer_sequence_exists(
"restart_sequance",
restart_sequance_layer
){
	if layer_sequence_is_finished(restart_sequance_layer){
		layer_sequence_destroy(restart_sequance_layer);
		
		if !(global.player_at_boss){
			INIT();
			room_goto(room);
		}else{
			INIT();
			global.player_at_boss = true;
			room_goto(room);	
		}
		instance_destroy();
	}
}