if !(layer_exists("smartbomb_ice_sequance")){
	layer_create(depth,"smartbomb_ice_sequance");
}

smartbomb_ice_sequance_layer = layer_sequence_create("smartbomb_ice_sequance",(GAME_RES_WIDTH/2),(room_height/2),seq_smart_bomb_ice);
layer_sequence_pause(smartbomb_ice_sequance_layer);
alarm[0] = GAMESPEED/GAMESPEED;

//fhAudioMusicCrossfade(snd_Mus_MM,1000,true);