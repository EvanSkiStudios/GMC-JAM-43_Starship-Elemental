var fire = (INPUT.input_pressed(0, input_action.fire1));
	var keys = invaild_keys();
	if !(keys){
		if ( keyboard_check_pressed(vk_anykey) || GAMEPAD_START || fire){
		if !(instance_exists(obj_gui_fadeout)){
			fadetoroom(rm_mainmenu,60,c_black);
		}
	}
}


switch(stage){
	default:
	case 0:{
	}break;
	
	case 1:{
		Create_text_interaction_NPC(1, 14, 123, 150);
		stage += 1;
	}break;
	
	case 3:{
		Create_text_interaction_NPC(2, 174, 123, 150);
		stage += 1;
	}break;
	
	
	case 5:{
		Create_text_interaction_NPC(3, 	349, 123, 150);
		stage += 1;
	}break;
	
	case 7:{
		Create_text_interaction_NPC(4, 	134, 225, 200);
		stage += 1;
	}break;
	
	case 10:{
		Create_text_interaction_NPC(5, 	35, 245, 100);
		stage += 1;
	}break;
	
	case 12:{
		Create_text_interaction_NPC(6, 	350, 250, 150);
		stage += 1;
	}break;
	
	case 14:{
		instance_destroy(obj_dialogbox);
		stage += 1;
	}break;
}