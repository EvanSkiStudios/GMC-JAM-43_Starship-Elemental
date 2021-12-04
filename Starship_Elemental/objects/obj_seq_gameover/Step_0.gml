if !(instance_exists(obj_gui_fadeout)){
	if !(wait_for_fade){
		alarm[0] = GAMESPEED/GAMESPEED;	
		wait_for_fade = true;
	}
}

if layer_sequence_is_finished(gameover_sequance_layer){
	if layer_sequence_exists(
	"gameover_sequance",
	gameover_sequance_layer
	) 
	layer_sequence_pause(gameover_sequance_layer);
	if (do_fade != true){
		alarm[1] = GAMESPEED / 2;
		do_fade = true;
	}
}