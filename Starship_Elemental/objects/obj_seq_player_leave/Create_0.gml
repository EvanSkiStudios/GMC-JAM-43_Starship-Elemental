global.Player_control_enabled = false;
global.Player_ship_visable = false;

layer_create(-10000,"player_leave_sequance");
player_leave_sequance_layer = layer_sequence_create("player_leave_sequance",x,y,seq_ship_leave);
layer_sequence_pause(player_leave_sequance_layer);
alarm[0] = GAMESPEED/GAMESPEED;