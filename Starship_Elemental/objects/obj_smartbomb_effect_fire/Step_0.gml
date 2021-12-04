if layer_sequence_is_finished(smartbomb_fire_sequance_layer){
	if layer_sequence_exists(
	"smartbomb_fire_sequance",
	smartbomb_fire_sequance_layer
	) 
	instance_destroy(id);
}