if !(spawn_enemies) && !instance_exists(obj_seq_level_start){
	spawn_enemies = true;	
}

if (instance_exists(obj_gui_continue)){
	spawn_enemies = false;	
}


if (spawn_enemies){
	switch(enemy_wave_state){
		default: break;
		case 0:{
			if (can_spawn){
				Spawn_wave(seq_enemy_bee_three);
				alarm[0] = GAMESPEED * 2;
				can_spawn = false;
			}
		}break;
		
		case 1:{
			if (can_spawn){
				Spawn_wave(seq_enemy_stinger_left);
				
				Spawn_wave(seq_enemy_bee_loopandback);
				alarm[0] = GAMESPEED * 2;
				can_spawn = false;
			}
			
		}break;
		
		case 2:{
			if (can_spawn){
				Spawn_wave(seq_enemy_bee_three);
				alarm[0] = GAMESPEED * 2;
				can_spawn = false;
			}
		}break;
		
		case 3:{
			if (can_spawn){
				Spawn_wave(seq_enemy_stinger_right);
				
				Spawn_wave(seq_enemy_bee_three);
				
				Spawn_wave(seq_enemy_bee_bomb);
				alarm[0] = GAMESPEED * 2;
				can_spawn = false;
			}
		}break;
	}
}