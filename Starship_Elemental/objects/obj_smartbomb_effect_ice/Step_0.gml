if layer_sequence_is_finished(smartbomb_ice_sequance_layer){
	if layer_sequence_exists(
	"smartbomb_ice_sequance",
	smartbomb_ice_sequance_layer
	) 
	instance_destroy(id);
}