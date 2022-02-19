if (room != rm_stage_01){
	return;	
}

if (instance_exists(obj_gui_continue)){
	return;
}

if !(global.Player_control_enabled){
	return;	
}

if instance_exists(obj_smartbomb_effect_earth) return;	
if instance_exists(obj_smartbomb_effect_fire) return;	
if instance_exists(obj_smartbomb_effect_lightning) return;	
if instance_exists(obj_smartbomb_effect_ice) return;	

var start = Gamepad_start();

if (GAME_IS_MOBILE){
	double_tap = device_mouse_check_button(0, mb_right);
}else{ double_tap = false;}

if ( keyboard_check_pressed(vk_escape) || (start) || (double_tap) ){
	if !(GAME_IS_MOBILE){
	alarm[1] = GAMESPEED * 3;
	exiting = true; }
	
	if (can_pause){
		initAudio();
		global.GAMEPaused = !global.GAMEPaused;			
		playSound(SND_SFX_PAUSE);
		
		if !(global.IS_GX_EXPORT) && !(GAME_IS_MOBILE){
			if !(file_exists(pause_sprite)){
				pause_png = (working_directory + "\\ScreenShots\\Screen_pause.png");
				screen_save(pause_png);
	
				pause_sprite = sprite_add(pause_png,1,false,false,0,0);
			}
		}else{
			if (global.Pause_Surface == -4){
				global.Pause_Surface = surface_create(display_get_gui_width(),display_get_gui_height());
				surface_copy(global.Pause_Surface,0,0,application_surface);
			}
		}
		alarm[0] = GAMESPEED;
		can_pause = false;
	}
}

if (keyboard_check_released(vk_escape) || (start)){
	exiting = false;	
}

if (global.GAMEPaused){
	
	instance_deactivate_all(true);
	
	//fixes audiobug
	//fhAudioActivate();
	
	//keeps clouds moving
	instance_activate_object(obj_clouds);
	
	//waves pause themselves
	instance_activate_object(obj_enemy_wave_spawner);
	
}else{
	if !(global.IS_GX_EXPORT) && !(GAME_IS_MOBILE){
		if (pause_sprite != -4){
			if (file_exists(pause_sprite)){
				sprite_delete(pause_sprite);
				file_delete(pause_png);
			}
		}
	}else{
		if (global.Pause_Surface != -4){
			if (surface_exists(global.Pause_Surface)){
				surface_free(global.Pause_Surface);
			}
			global.Pause_Surface = -4;
		}
	}
	
	instance_activate_all();	
}