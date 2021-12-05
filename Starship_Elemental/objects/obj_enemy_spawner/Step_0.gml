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
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_loopandback);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
			
			case 1:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_3_sync_8sec);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 8;
					can_spawn = false;
				}
			}break;
			
			case 2:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_three);
					Spawn_wave(seq_enemy_stinger_left);	
					alarm[0] = GAMESPEED * 8;
					can_spawn = false;
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
					alarm[0] = GAMESPEED * 5;
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
				
					Spawn_wave(seq_enemy_bee_loopandback);;
				
					Spawn_wave(seq_enemy_bee_bomb);
					alarm[0] = GAMESPEED * 8;
					can_spawn = false;
				}
			}break;
			
			case 9:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					alarm[0] = GAMESPEED * 4;
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
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 1;
					can_spawn = false;
				}
			}break;
			
			case 12:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_lefttoup);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
			
			case 13:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);	
					alarm[0] = GAMESPEED * 3;
					can_spawn = false;
				}
			}break;
			
			case 14:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_lefttoup);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
			
			case 15:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
			
			case 16:{
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 1;
					can_spawn = false;
				}
			}break;
			
			case 17:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bomb_left_top5sec);	
					Spawn_wave(seq_enemy_bomb_left_bottom5sec);	
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
			
			case 18:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 19:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_2_cross_9sec);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
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
				
					Spawn_wave(seq_enemy_bee_three);
					alarm[0] = GAMESPEED * 4;
					can_spawn = false;
				}
			}break;
			
			case 22:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_lefttoup);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
			
			case 23:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 4;
					can_spawn = false;
				}
			}break;
			
			case 24:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_bomb);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 25:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 4;
					can_spawn = false;
				}
			}break;
		
			case 26:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_left);
				
					Spawn_wave(seq_enemy_bee_loopandback);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
		
			case 27:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_2_cross_9sec);
					alarm[0] = GAMESPEED * 3;
					can_spawn = false;
				}
			}break;
		
			case 28:{
				if (can_spawn){
					Spawn_wave(seq_enemy_stinger_right);
				
					Spawn_wave(seq_enemy_bee_2_cross_9sec);
				
					Spawn_wave(seq_enemy_bee_bomb);
					alarm[0] = GAMESPEED * 5;
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
					alarm[0] = GAMESPEED * 8;
					can_spawn = false;
				}
			}break;
			
			case 33:{
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 1;
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
					Spawn_wave(seq_enemy_bee_lefttoup);	
					alarm[0] = GAMESPEED * 3;
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
					Spawn_wave(seq_enemy_bee_2_cross_9sec);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 4;
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
					Spawn_wave(seq_enemy_bee_2_cross_9sec);
					Spawn_wave(seq_enemy_bee_3_sync_8sec);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
			
			case 42:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_loopandback);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 43:{
				//mini break to clear enemies
				if (can_spawn){
					alarm[0] = GAMESPEED * 0.5;
					can_spawn = false;
				}
			}break;
			
			case 44:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_lefttoup);
					alarm[0] = GAMESPEED * 2;
					can_spawn = false;
				}
			}break;
			
			case 45:{
				if (can_spawn){
					Spawn_wave(seq_enemy_bee_3_sync_8sec);
					Spawn_wave(seq_enemy_stinger_right);
					alarm[0] = GAMESPEED * 3;
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
				
					Spawn_wave(seq_enemy_bomb_left_bottom5sec);
					alarm[0] = GAMESPEED * 4;
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
					fha_music_stop(500);
					alarm[0] = GAMESPEED * 5;
					can_spawn = false;
				}
			}break;
			
			case 51:{
				enemy_wave_state = 98;
			}break;
		
		
			case 98:{
				//boss warning
				if (can_spawn){
					playSound(SND_SFX_ALARM,true);
					alarm[0] = GAMESPEED * 6;
					can_spawn = false;
				}
			}break;
		
			case 99:{
				//do boss
				if (can_spawn){
					if audio_is_playing(snd_sfx_alarm){
						audio_stop_sound(snd_sfx_alarm);
					}
					show_message("BOSS SHOWS UP HERE");
					can_spawn = false;
				}
			}break;
		
			case 100:{
				//do game win
			}break;
		}
		#endregion
		}break;
	
	}
}