global.Player_control_enabled = false;
global.Player_ship_visable = false;
global.Player_ship_take_dam = false;

instance_create_depth(x,y,depth,obj_gxc_ctrl_highscore);

layer_create(-10000,"room_start_sequance");
room_start_sequance_layer = layer_sequence_create("room_start_sequance",0,0,seq_room_restart);
layer_sequence_pause(room_start_sequance_layer);
alarm[0] = GAMESPEED/GAMESPEED;