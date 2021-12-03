//if we cant spawn enemies and the start sequance does not exist then lets start spawning
if !(spawn_enemies) && !instance_exists(obj_seq_level_start){
	spawn_enemies = true;	
}else{
	spawn_enemies = false;	
}

if (spawn_enemies){
	switch(enemy_wave_state){
		default: break;
		case 0:{
			if (can_spawn){
				Spawn_wave(seq_enemy_bee_bomb);
				can_spawn = false;
			}
		}break;
		
		case 1:{
		}break;
		
		case 2:{
		}break;
	}
}