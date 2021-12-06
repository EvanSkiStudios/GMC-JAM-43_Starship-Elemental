//DEBUG STUFF
/*
	if (mouse_check_button_pressed(mb_left)) {	
		show_debug_message("HIT");
		skeleton_skin_set("hit_tail");
	} else if (mouse_check_button_pressed(mb_right)) {	
		show_debug_message("HIT");
		skeleton_skin_set("hit_all");
	} else {
		skeleton_skin_set("normal");
	}
	*/
	
	get_bullet_hell_spawn_point();
	do_bullet_hell();
	
	if (hit_tail) {
		skeleton_skin_set("hit_tail");
		hit_tail = false;
	} else if (hit_body) {
		skeleton_skin_set("hit_all");
		hit_body = false;	
	} else {
		skeleton_skin_set("normal");	
	}


switch (boss_state) {
	
	case BOSS1_STATES.enter_level:
		timer ++;
		if (timer >= enter_top_right_time) {
				timer = 0;
				boss_state = BOSS1_STATES.enter_level_complete;
		}
		
	break;
	
	case BOSS1_STATES.enter_level_complete:
		skeleton_animation_set_ext("scream", channel_scream);
		skeleton_animation_set_ext("circle_lower_right", channel_movement);
		boss_state = BOSS1_STATES.first_scream;
		
	break;
	
	case BOSS1_STATES.first_scream:
		timer ++;
		if (timer >= circle_lower_right_time) {
				timer = 0;
				decide_next_attack();
		}
	break;
	
	case BOSS1_STATES.bullet_hell_top_right:
		timer ++;
		if (timer >= .75 * room_speed) {
			timer = 0;
			skeleton_animation_set_ext("bullet_hell", channel_scream);
			boss_state = BOSS1_STATES.bullet_hell_top_right_complete;
		}
	break;
	
	case BOSS1_STATES.bullet_hell_top_right_complete:
		timer ++;
		if (timer >= 2.8 * room_speed) {
			timer = 0;
			decide_next_attack();
		}
	break;
	
	case BOSS1_STATES.laser_attack:
		timer ++;
		if (timer >= 6 * room_speed) {
			timer = 0;
			decide_next_attack();	
		}
	
	break;
	
}