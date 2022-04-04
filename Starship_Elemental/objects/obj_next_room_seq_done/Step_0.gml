if (global.DEBUG){
	var fire = (INPUT.input_pressed(0, input_action.fire1));
		var keys = invaild_keys();
		if !(keys){
			if ( keyboard_check_pressed(vk_anykey) || GAMEPAD_START || fire){
			if !(instance_exists(obj_gui_fadeout)){
				fadetoroom(rm_mainmenu,2,c_white);;
			}
		}
	}
}


if layer_sequence_is_finished(sequance_id){
	if !(instance_exists(obj_gui_fadeout)){	
		fadetoroom(rm_mainmenu,2,c_white);
	}
}