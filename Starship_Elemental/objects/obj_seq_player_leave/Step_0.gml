if layer_sequence_is_finished(player_leave_sequance_layer){
	if layer_sequence_exists(
	"player_leave_sequance",
	player_leave_sequance_layer
	) 
	instance_destroy(id);
}