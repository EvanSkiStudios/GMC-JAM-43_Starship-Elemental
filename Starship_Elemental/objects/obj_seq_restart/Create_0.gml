global.Player_control_enabled = false;
global.Player_ship_visable = false;
global.Player_ship_take_dam = false;


layer_create(-2000000,"restart_sequance");
restart_sequance_layer = layer_sequence_create("restart_sequance",0,0,seq_room_restart);
layer_sequence_play(restart_sequance_layer);