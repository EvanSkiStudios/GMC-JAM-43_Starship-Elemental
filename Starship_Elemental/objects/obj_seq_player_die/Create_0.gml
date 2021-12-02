global.Player_control_enabled = false;
global.Player_ship_visable = false;

layer_create(-10000,"player_die_sequance");
player_die_sequance = layer_sequence_create("player_die_sequance",x,y,seq_ship_die);
layer_sequence_pause(player_die_sequance);
alarm[0] = GAMESPEED/GAMESPEED;

//fhAudioMusicCrossfade(snd_Mus_MM,1000,true);