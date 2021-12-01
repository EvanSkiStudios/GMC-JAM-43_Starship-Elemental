if !(spawn_enemies) && !instance_exists(obj_seq_level_start){
	spawn_enemies = true;	
}

if (spawn_enemies){
	switch(enemy_wave_state){
		default: break;
		
		case 0:{
			wave_sequance = layer_sequence_create("enemy_wave_sequance",0,0,seq_enemy_spawn_test);
			layer_sequence_play(wave_sequance);
			enemy_wave_state = 1;
		}break;
		
		case 1:{
			if layer_sequence_is_finished(wave_sequance){
				if layer_sequence_exists("enemy_wave_sequance",wave_sequance){
					layer_sequence_destroy(wave_sequance);
					enemy_wave_state = 2;
				}
			}
		}break;
		
		case 2:{
			show_debug_message("YOU WINNNER!!");
		}break;
	}
}