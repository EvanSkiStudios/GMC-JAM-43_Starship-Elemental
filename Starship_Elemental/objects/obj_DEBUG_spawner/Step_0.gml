if !(spawn_enemies) && !instance_exists(obj_seq_level_start){
	spawn_enemies = true;	
}

if (spawn_enemies){
	switch(enemy_wave_state){
		default: break;
		case 0:{
			if (can_spawn){
				var wave = instance_create_depth(x,y,depth,obj_enemy_wave_spawner);
				with(wave){
					wave_sequance = seq_enemy_bee_bomb;
					speed = 2;
				}
				can_spawn = false;
			}
		}break;
		
		case 1:{
		}break;
		
		case 2:{
		}break;
	}
}