if (activated) && !layer_sequence_is_finished(enemy_wave_sequance){
	if (global.GAMEPaused){
		layer_sequence_pause(enemy_wave_sequance);	
	}
	
	if !(global.GAMEPaused){
		if (layer_sequence_is_paused(enemy_wave_sequance)){
			layer_sequence_play(enemy_wave_sequance);
		}
	}
}

if (activated) && layer_sequence_is_finished(enemy_wave_sequance){
	if layer_sequence_exists("enemy_wave_sequance",enemy_wave_sequance){
		layer_sequence_destroy(enemy_wave_sequance);
		instance_destroy(id);
	}
}