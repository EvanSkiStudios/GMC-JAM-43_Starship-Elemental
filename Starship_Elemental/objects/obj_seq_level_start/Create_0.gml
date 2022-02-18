global.Player_control_enabled = false;
global.Player_ship_visable = false;
global.Player_ship_take_dam = false;

layer_create(-10000,"level_start_sequance");
level_start_sequance = layer_sequence_create("level_start_sequance",0,0,seq_ship_intro_2);
layer_sequence_pause(level_start_sequance);
alarm[0] = GAMESPEED/GAMESPEED;

if !instance_exists(obj_ship_fire){
	instance_create_depth(obj_player_ship.x,obj_player_ship.y,obj_player_ship.depth-1,obj_ship_fire);	
}
if !instance_exists(obj_smoke_emitter){
	instance_create_depth(obj_player_ship.x,obj_player_ship.y,obj_player_ship.depth-1,obj_smoke_emitter);
}

//fhAudioMusicCrossfade(snd_Mus_MM,1000,true);

//mobile
mobile_user_tap = false;