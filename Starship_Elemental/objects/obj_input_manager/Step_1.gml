/* Welcome to the input manager, where the magic happens!

This object has two jobs:

1. To decide which device controls which player, and
2. To standardize all the inputs in a way that is easy to read.

Notice that this object is Persistent (the checkbox to the left, under "Visible").
This means the object can be created once at the start of the game, and it will live forever,
even between rooms.

Also notice that we are handling all of the inputs in the Begin Step event. This way, we can figure
out our input situation before we get to other things, like the normal Step event.

So, now it's on to the first job of the Input Manager: Assigning input devices to players!

First, we need to know how many gamepads we should be checking. */

var max_gamepad_slot = gamepad_get_device_count();
// Next, we'll check each gamepad and watch for buttons to be pressed.

for ( var gamepad_id = 0; gamepad_id < max_gamepad_slot; gamepad_id++){
	if gamepad_is_connected(gamepad_id) {
		
		
		/* When the player presses Start, "A", any of the Dpad buttons, or wiggles the joystick,
		we will assign the gamepad to a player, unless that gamepad is already in use. */
		
		if	gamepad_button_check_pressed(gamepad_id, gp_start) ||
			gamepad_button_check_pressed(gamepad_id, gp_face1) ||
			gamepad_button_check_pressed(gamepad_id, gp_padu) ||
			gamepad_button_check_pressed(gamepad_id, gp_padd) ||
			gamepad_button_check_pressed(gamepad_id, gp_padr) ||
			gamepad_button_check_pressed(gamepad_id, gp_padl) ||
			abs(gamepad_axis_value(gamepad_id, gp_axislh)) > .5 ||
			abs(gamepad_axis_value(gamepad_id, gp_axislv)) > .5 {
				
			var this_gamepad_player_id		= ds_list_find_index(PLAYER_GAMEPAD_IDS, gamepad_id);
			var gamepad_is_already_in_use	= (this_gamepad_player_id >= 0);
			
			if (!gamepad_is_already_in_use) {
				/* This gamepad hasn't been assigned to any players yet, so we want to assign it now
				because it has been activated! */
				
				var first_player_is_using_keyboard = (ds_list_find_value(PLAYER_GAMEPAD_IDS, 0) == -1);
				
				do_event_message(string(gamepad_get_description(gamepad_id)) + " CONNECTED.");
				
				if first_player_is_using_keyboard {
					/* We will also check whether the first player is using a keyboard.
					If they are, we will swap them to the gamepad, allowing player 1
					to seamlessly switch between keyboard and controller. */
					
					ds_list_replace(PLAYER_GAMEPAD_IDS, 0, gamepad_id);
				}
				else if ds_list_size(PLAYER_GAMEPAD_IDS) < MAX_PLAYERS {
					/* This is a whole new player, so we'll add this gamepad to the list. */
					
					ds_list_add(PLAYER_GAMEPAD_IDS, gamepad_id); 
				}
			}
		}
	}
}

for ( var player_id = ds_list_size(PLAYER_GAMEPAD_IDS)-1; player_id >= 0; player_id--){
	var this_player_gamepad_id = PLAYER_GAMEPAD_IDS[|player_id];
	if (this_player_gamepad_id >= 0) {
		if !gamepad_is_connected(this_player_gamepad_id) {
			do_event_message("GAMEPAD UNPLUGGED");
			// Then we will remove this gamepad from our list by deleting the current player slot.
			ds_list_delete(PLAYER_GAMEPAD_IDS, player_id);
		}
	}
}

///CHECK ALL KEYBOARD CONTROLS FOR ENABLED PLAYERS
for (var player_id = 0; player_id < MAX_PLAYERS; player_id++) {
	
	for ( var this_input_action = 0; this_input_action < array_length_1d(INPUT_STATES[player_id]); this_input_action++){
	
		var this_keyboard_button = INPUT_KEYBOARD_KEYS[player_id, this_input_action];
		var this_keyboard_button2 = INPUT_KEYBOARD_KEYS2[player_id, this_input_action];
		
		INPUT_STATES[player_id, this_input_action] = input_state.none;
		
		if (this_keyboard_button == -1) return;//Can be this if we remapped an already mapped button.
		if (this_keyboard_button2 == -1) return;//Can be this if we remapped an already mapped button.
		
		if (keyboard_check_pressed(this_keyboard_button) || keyboard_check_pressed(this_keyboard_button2)) {
			INPUT_STATES[player_id, this_input_action] = input_state.pressed;	
		}
		else if (keyboard_check(this_keyboard_button) || keyboard_check(this_keyboard_button2)) {
			INPUT_STATES[player_id, this_input_action] = input_state.held;	
		}
		else if (keyboard_check_released(this_keyboard_button) || keyboard_check_released(this_keyboard_button2)) {
			INPUT_STATES[player_id, this_input_action] = input_state.released;	
		}
	}		
}

///CHECK ALL GAMEPAD CONTROLS FOR ACTIVE GAMEPADS
for ( var player_id = 0; player_id < ds_list_size(PLAYER_GAMEPAD_IDS); player_id++){

	var this_gamepad_id = ds_list_find_value(PLAYER_GAMEPAD_IDS, player_id);
	
	if (analog_enabled) {
		INPUT_STICK_L_VALS[player_id] = [gamepad_axis_value(this_gamepad_id, gp_axislh), gamepad_axis_value(this_gamepad_id, gp_axislv)];
		INPUT_STICK_R_VALS[player_id] = [gamepad_axis_value(this_gamepad_id, gp_axisrh), gamepad_axis_value(this_gamepad_id, gp_axisrv)];
	}
	
	for ( var this_input_action = 0; this_input_action < array_length_1d(INPUT_STATES[player_id]); this_input_action++){
			
			var this_input_button = INPUT_GAMEPAD_KEYS[player_id, this_input_action];
			
			if (this_input_button == -1) return;//Can be this if we remapped an already mapped button.
			
			if gamepad_button_check_pressed(this_gamepad_id, this_input_button) {
				INPUT_STATES[player_id, this_input_action] = input_state.pressed;	
			}
			else if gamepad_button_check(this_gamepad_id, this_input_button) {
				INPUT_STATES[player_id, this_input_action] = input_state.held;	
			}
			else if gamepad_button_check_released(this_gamepad_id, this_input_button) {
				INPUT_STATES[player_id, this_input_action] = input_state.released;	
			}

	}
}
