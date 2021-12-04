layer_sequence_destroy(room_start_sequance_layer);	
layer_destroy("room_start_sequance");

if !(instance_exists(obj_seq_level_start)){
	instance_create_depth(x,y,depth,obj_seq_level_start);	
}