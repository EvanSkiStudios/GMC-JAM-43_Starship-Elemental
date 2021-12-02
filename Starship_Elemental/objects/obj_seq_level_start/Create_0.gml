global.Player_control_enabled = false;
global.Player_ship_visable = false;

layer_create(-10000,"level_start_sequance");
level_start_sequance = layer_sequence_create("level_start_sequance",0,0,seq_ship_intro_2);
layer_sequence_pause(level_start_sequance);
alarm[0] = GAMESPEED/GAMESPEED;

//fhAudioMusicCrossfade(snd_Mus_MM,1000,true);