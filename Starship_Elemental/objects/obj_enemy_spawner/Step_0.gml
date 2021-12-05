if !(spawn_enemies) && !instance_exists(obj_seq_level_start){
	spawn_enemies = true;	
}

if (instance_exists(obj_gui_continue)){
	spawn_enemies = false;	
}


if (spawn_enemies){
	
	switch(room){
		default: break;
		
		case(rm_stage_01):{
		#region
		switch(enemy_wave_state){
			default: break;
			
			case 0:{
				if (can_spawn) && (count != 3){
					Spawn_wave(seq_enemy_bee_loopandback);
					count += 1;
					alarm[1] = GAMESPEED;
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 1:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_three);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 2:{
				if (can_spawn) && (count != 2){
					Spawn_wave(seq_enemy_bee_three);
					alarm[1] = GAMESPEED;
					count += 1;
					can_spawn = false;
				}else{
					if (can_spawn){
						Spawn_wave(seq_enemy_stinger_left);	
						alarm[0] = GAMESPEED * 2;
						can_spawn = false;
					}
				}
			}break;
			
			case 3:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			
			case 4:{
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 5:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_three);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
		
			case 6:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
				
					Spawn_wave(seq_enemy_bee_loopandback);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
		
			case 7:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_three);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
		
			case 8:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
				
					Spawn_wave(seq_enemy_bee_three);
				
					Spawn_wave(seq_enemy_bee_bomb);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 9:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 10:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 11:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 12:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_lefttoup);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 13:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 14:{
				if (can_spawn) && (count != 2){
					Spawn_wave(seq_enemy_bee_lefttoup);
					count += 1
					alarm[1] = GAMESPEED;
					can_spawn = false;
				}else{
					if (can_spawn){
						alarm[0] = GAMESPEED * 2;
						can_spawn = false;
					}
				}
			}break;
			
			case 15:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 16:{
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 17:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 18:{
				if (can_spawn) && (count != 2){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					count += 1;
					alarm[1] = GAMESPEED;
					can_spawn = false;
				}else{
					if (can_spawn){
						alarm[0] = GAMESPEED * 2;
						can_spawn = false;
					}
				}
			}break;
			
			case 19:{
				if (can_spawn) && (count != 4){
					Spawn_wave(seq_enemy_bee_loopandback);
					count += 1;
					alarm[1] = GAMESPEED;
					can_spawn = false;
				}else{
					if (can_spawn){
						alarm[0] = GAMESPEED * 2;
						can_spawn = false;	
					}
				}
			}break;
			
			case 20:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
		
			case 21:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
				
					Spawn_wave(seq_enemy_bee_loopandback);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 22:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_lefttoup);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 23:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 24:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_three);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 25:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_three);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
		
			case 26:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
				
					Spawn_wave(seq_enemy_bee_loopandback);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
		
			case 27:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_three);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
		
			case 28:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
				
					Spawn_wave(seq_enemy_bee_three);
				
					Spawn_wave(seq_enemy_bee_bomb);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 29:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 30:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 31:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 32:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 33:{
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 34:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
		
			case 35:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 36:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 37:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 38:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 39:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 40:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 41:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 42:{
				if (can_spawn) && (count != 4){
					Spawn_wave(seq_enemy_bee_loopandback);
					count += 1;
					alarm[1] = GAMESPEED;
					can_spawn = false;
				}else{
					if (can_spawn){
						alarm[0] = GAMESPEED * 2;
						can_spawn = false;	
					}
				}
			}break;
			
			case 43:{
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 44:{
				if (can_spawn) && (count != 2){
					Spawn_wave(seq_enemy_bee_lefttoup);
					count += 1
					alarm[1] = GAMESPEED;
					can_spawn = false;
				}else{
					if (can_spawn){
						alarm[0] = GAMESPEED * 2;
						can_spawn = false;
					}
				}
			}break;
			
			case 45:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 46:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 47:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
				
					Spawn_wave(seq_enemy_bee_three);
				
					Spawn_wave(seq_enemy_bee_bomb);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 48:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 49:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_three);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 50:{
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
		
		
			case 98:{
				//boss warning
			}break;
		
			case 99:{
				//do boss
			}break;
		
			case 100:{
				//do game win
			}break;
		}
		#endregion
		}break;
	
	}
}