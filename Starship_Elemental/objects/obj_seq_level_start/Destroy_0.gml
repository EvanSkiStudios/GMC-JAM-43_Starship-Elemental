audio_stop_sound(snd_sfx_cutscene_flyin);
layer_sequence_destroy(level_start_sequance);	
layer_destroy("level_start_sequance");

global.Player_ship_visable = true;
global.Player_control_enabled = true;
if instance_exists(obj_player_ship){
	obj_player_ship.alarm[4] = (GAMESPEED * 2)	
}