/// @description Insert description here
// You can write your code in this editor
switch (remapper_state) {
	
	case remapper_states.init:
	if (MAX_PLAYERS >= 2) {
		remapper_state = remapper_states.player_selection_menu;
	} else {
		player_idx = 0;
		input_item_idx = 1;
		remapper_state = remapper_states.idle;	
	}
	break;
	
	case remapper_states.player_selection_menu:
	if (moved_up()) {
		play_sfx_move();
		player_idx --;
		if (player_idx <= -2) {
			player_idx = MAX_PLAYERS -1;	
		}
	} else if (moved_down()) {
		play_sfx_move();
		player_idx ++;
		if (player_idx >= MAX_PLAYERS) {
			player_idx = -1;	
		}
	}
	
	if (moved_back()) {
		play_sfx_move();
		if (on_close_function != -1) {
				on_close_function();	
		}
		instance_destroy();
		return;
	}
	
	if (made_selection()) {
		play_sfx_select();
		if (player_idx == -1) {
			if (on_close_function != -1) {
				on_close_function();	
			}
			instance_destroy();
		} else {
			input_item_idx = 1;
			remapper_state = remapper_states.idle;	
		}
	}
	
		
	break;
	
	case remapper_states.idle:
		if (moved_up()) {
			play_sfx_move();
			menu_idx --;
			if (menu_idx <= -1) {
				menu_idx = input_actions_length;	
			}
		} else if (moved_down()) {
			play_sfx_move();
			menu_idx ++;
			if (menu_idx > input_actions_length) {
				menu_idx = 0;	
			}
		}
		if (moved_left()) {
			play_sfx_move();
			input_item_idx --;
		if (input_item_idx <= 0) {
			input_item_idx = 3;	
		}
		} else if (moved_right()) {
			play_sfx_move();
			input_item_idx ++;
		if (input_item_idx >= 4) {
			input_item_idx = 1;	
		}
	}
		if (made_selection()) {
			play_sfx_select();
			if (menu_idx == input_actions_length) {
				remapper_state = remapper_states.restore_defaults;
				return;
			}
			if (input_item_idx == 1) {
				remapper_state = remapper_states.waiting_for_key1;
			} else if (input_item_idx == 2) {
				remapper_state = remapper_states.waiting_for_key2;
			} else if (input_item_idx == 3) {
				remapper_state = remapper_states.waiting_for_gamepad;
			}
		}
		
		if (moved_back()) {
			play_sfx_move();
			if (changed_controls) {
				remapper_state = remapper_states.exit_pending_changes;	
			} else {
				if (MAX_PLAYERS >= 2) {
				remapper_state = remapper_states.player_selection_menu;
				} else {
					if (on_close_function != -1) {
						on_close_function();	
					}
					instance_destroy();
				}
			}
		}

	break;
	
	case remapper_states.waiting_for_key1:
	
		listen_for_key(1);///waiting for a keypress
	
	break;
	
	case remapper_states.waiting_for_key2:
	
		listen_for_key(2);///waiting for a keypress
	
	break;
	
	case remapper_states.waiting_for_gamepad:
	
		listen_for_gamepad_key();//waiting for a gamepad button press
	
	break;
	
	case remapper_states.exit_pending_changes:
		if (moved_left()) {
			play_sfx_move();
			save_changes_idx --;
			if (save_changes_idx <= -1) {
				save_changes_idx = 1;	
			}
		} else if (moved_right()) {
			play_sfx_move();
			save_changes_idx ++;
			if (save_changes_idx >= 2) {
				save_changes_idx = 0;	
			}
		}
		if (made_selection()) {
			play_sfx_select();
			if (save_changes_idx == 0) {
				//SAVED
				INPUT.save_controllers();
				if (MAX_PLAYERS >= 2) {
					remapper_state = remapper_states.player_selection_menu;
					return;
				}
				
			} else {
				//REVERT
				INPUT.load_controllers();
			}
			if (on_close_function != -1) {
				on_close_function();	
			}
			instance_destroy();
		}
	
	break;
	
	case remapper_states.restore_defaults:
	
		if (moved_left()) {
			play_sfx_move();
			restore_defaults_idx --;
			if (restore_defaults_idx <= -1) {
				restore_defaults_idx = 1;	
			}
		} else if (moved_right()) {
			play_sfx_move();
			restore_defaults_idx ++;
			if (restore_defaults_idx >= 2) {
				restore_defaults_idx = 0;	
			}
		}
		
		if (made_selection()) {
			play_sfx_select();
			if (restore_defaults_idx == 0) {
				//RESTORE DEFAULTS YES
				INPUT.restore_defaults(player_idx);
				do_event_message("DEFAULT SETTINGS APPLIED.");
				remapper_state = remapper_states.idle;
			} else {
				remapper_state = remapper_states.idle;	
			}
		}
	
	break;
}
