if (activated) && layer_sequence_is_finished(enemy_wave_sequance){
	if layer_sequence_exists("enemy_wave_sequance",enemy_wave_sequance){
		layer_sequence_destroy(enemy_wave_sequance);
		instance_destroy(id);
	}
}