if layer_sequence_is_finished(room_start_sequance_layer){
	if layer_sequence_exists(
	"room_start_sequance",
	room_start_sequance_layer
	) 
	instance_destroy(id);
}