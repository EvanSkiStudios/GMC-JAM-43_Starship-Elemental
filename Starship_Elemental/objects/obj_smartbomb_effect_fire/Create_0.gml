if !(layer_exists("smartbomb_fire_sequance")){
	layer_create(depth,"smartbomb_fire_sequance");
}

smartbomb_fire_sequance_layer = layer_sequence_create("smartbomb_fire_sequance",x,(room_height/2),seq_smart_bomb_fire);
layer_sequence_pause(smartbomb_fire_sequance_layer);
alarm[0] = GAMESPEED/GAMESPEED;

//fhAudioMusicCrossfade(snd_Mus_MM,1000,true);