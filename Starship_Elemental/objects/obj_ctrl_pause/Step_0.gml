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

if keyboard_check_pressed(vk_escape) || (start){
	if (can_pause){
		initAudio();
		global.GAMEPaused = !global.GAMEPaused;	
		playSound(SND_SFX_PAUSE);
		
		if !(global.IS_GX_EXPORT){
			if !(file_exists(pause_sprite)){
				pause_png = (working_directory + "\\ScreenShots\\Screen_pause.png");
				screen_save(pause_png);
	
				pause_sprite = sprite_add(pause_png,1,false,false,0,0);
			}
		}
		alarm[0] = GAMESPEED;
		can_pause = false;
	}
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
	if !(global.IS_GX_EXPORT){
		if (pause_sprite != -4){
			if (file_exists(pause_sprite)){
				sprite_delete(pause_sprite);
				file_delete(pause_png);
			}
		}
	}
	
	instance_activate_all();	
}