if (!coin_in) {
	if (keyboard_check_pressed(ord("1"))) {
		coin_in = true;
		playSound(SND_SFX_SMARTBOMB_PICKUP);
		instance_create_depth(x,y,depth,obj_gui_fadeout_short_norm);
		titlescreen_insert_coin = titlescreen_press_any;
		return;
	}
}
switch (logo_state) {
	case LOGO_STATES.intro:
		alpha -= .01;
		if (alpha <= 0) {
			alpha = 0;
			logo_state = LOGO_STATES.idle;
		}
	break;
	
	case LOGO_STATES.idle:
	
	timer++;
	
	if (timer >= shine_delay) {
		image_speed = 1;
		timer = 0;
		logo_state = LOGO_STATES.shining;
	}
	
	//any key to continue
	var start = (INPUT.input_pressed(0, input_action.start));
	var fire = (INPUT.input_pressed(0, input_action.fire1));
	
	var keys = invaild_keys();
	if !(keys){
		if !(keyboard_check_released(ord("1"))){
			if (keyboard_check_released(vk_anykey) || start || fire){
				if !(instance_exists(obj_seq_titlescreen_trans)){
					instance_create_depth(x,y,depth,obj_seq_titlescreen_trans)
				}
			}
		}
	}
	
	break;
	
	case LOGO_STATES.shining:
	if (image_index >= sprite_get_number(sprite_index) -1) {
		image_speed = 0;
		image_index = 0;	
		logo_state = LOGO_STATES.idle;
	}
		
	break;
}