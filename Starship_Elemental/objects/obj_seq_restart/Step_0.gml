if layer_sequence_exists(
"restart_sequance",
restart_sequance_layer
){
	if layer_sequence_is_finished(restart_sequance_layer){
		layer_sequence_destroy(restart_sequance_layer)
		INIT();
		room_goto(room);
		instance_destroy();
	}
}