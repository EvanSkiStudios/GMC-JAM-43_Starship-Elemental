///INPUT MANAGER 2.0
///HOW TO USE: PUT THIS OBJECT IN YOUR FIRST ROOM OF THE GAME.
///HOW TO CONFIGURE: SET INPUT ACTIONS, SET INPUT ACTION STRINGS, SET _max_players Instance variable.
///THIS OBJECT REQUIRES EVENT MESSAGER OBJECT IN ASSETS
///THIS OBJECT WILL DETECT GAMEPADS ADDED OR REMOVED.
///THIS OBJECT WILL AUTOMATICALLY CREATE A CONTROLLER SAVE FILE.
///REMAPPER CONTAINS ITS OWN UI FOR REMAPPING CONTROLS.
///REMAPPER CAN OVERWRITE CONTROLS SAVED TO DISK OR RESTORE DEFAULTS.
///HOW TO USE REMAPPER: SPAWN A REMAPPER WHILE THIS OBJECT EXISTS.

globalvar INPUT, MAX_PLAYERS, INPUT_STATES, INPUT_KEYBOARD_KEYS, INPUT_KEYBOARD_KEYS2, INPUT_GAMEPAD_KEYS;
globalvar INPUT_STICK_L_VALS, INPUT_STICK_R_VALS, DEFAULT_KEYBOARD_KEYS, DEFAULT_KEYBOARD_KEYS2, DEFAULT_GAMEPAD_KEYS, INPUT_ACTION_STRINGS, PLAYER_GAMEPAD_IDS;
globalvar CONTROLLER_SAVE_DATA, CONTROLLER_FILE_NAME;

CONTROLLER_FILE_NAME = "controllers.dat";

if (!file_exists(CONTROLLER_FILE_NAME)) {
	CONTROLLER_SAVE_DATA = ds_map_create();
} else {
	CONTROLLER_SAVE_DATA = ds_map_secure_load(CONTROLLER_FILE_NAME);
	do_event_message("CONTROLS LOADED.");
}

///RENAME THESE CONTROLS IN YOUR GAME
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
enum input_action { up, down, left,	right, fire1, fire2, start};                           //
MAX_PLAYERS	= 1;																								 //
INPUT_ACTION_STRINGS = ["UP", "DOWN", "LEFT", "RIGHT", "FIRE", "SMARTBOMB", "START"];   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

INPUT = self;

enum input_state { none, pressed, held,	released };

	// Now we'll set up some global variables to store all of our different bits of information.
	INPUT_STATES		 = 0;	// This will be a 2D array that holds the state of each input action for each player.
	INPUT_KEYBOARD_KEYS	 = 0;	// This will be a 2D array that holds the keyboard hotkey assignments for each input action.
	INPUT_KEYBOARD_KEYS2 = 0;	// This will be a 2D array that holds the keyboard hotkey assignments for each input action.
	INPUT_GAMEPAD_KEYS	 = 0;	// This will be a 2D array that holds the gamepad hotkey assignments for each input action.
	INPUT_STICK_L_VALS = [0,0];
	INPUT_STICK_R_VALS = [0,0];
	

analog_enabled = false;

input_create = function (argument0, argument1, argument2, argument3, argument4) {
	/* This is a script that will initialize an input action by making sure we have given
	it a keyboard key, a gamepad key, and a default state for all players. It's a
	quick way of initializing our inputs before we start to use them. */

	/// @arg input_action
	/// @arg keyboard_hotkey
	/// @arg gamepad_key

	var the_player_id			= argument0;
	var the_input_action		= argument1;
	var the_input_hotkey		= argument2;
	var the_input_hotkey2		= argument3;
	var the_input_gamepad_key	= argument4;
	
	if (the_player_id >= MAX_PLAYERS) return;

	// First we'll assign the keyboard and gamepad keys to this input action.
	INPUT_KEYBOARD_KEYS[the_player_id, the_input_action]	= the_input_hotkey;
	INPUT_KEYBOARD_KEYS2[the_player_id, the_input_action]	= the_input_hotkey2;
	INPUT_GAMEPAD_KEYS[the_player_id, the_input_action]	= the_input_gamepad_key;

	// Then, we'll set this input action's state to "none" for the selected player
	INPUT_STATES[the_player_id, the_input_action]	= input_state.none;
	
	//SET DEFAULTS IN CASE WE NEED TO RESTORE THEM IN THE FUTURE
	DEFAULT_KEYBOARD_KEYS = INPUT_KEYBOARD_KEYS;
	DEFAULT_KEYBOARD_KEYS2 = INPUT_KEYBOARD_KEYS2;
	DEFAULT_GAMEPAD_KEYS = INPUT_GAMEPAD_KEYS;
};

/// @function enable_analog();
enable_analog = function () {
	analog_enabled = true;
	for (var i = 0; i < MAX_PLAYERS; i++) {
		INPUT_STICK_L_VALS[i] = [0,0];
		INPUT_STICK_R_VALS[i] = [0,0];
	}
}

/// @description remaps a key press
/// @function input_remap_key(player_id, the_input_action, the_input_hotkey, which_key);
/// @param player_id the player to remap the control of
/// @param the_input_action the input action
/// @param the_input_hotkey the key
/// @param which_key key 1 or 2
input_remap_key = function (player_id, the_input_action, the_input_hotkey, which_key) {

	if (which_key == 1) {
		INPUT_KEYBOARD_KEYS[player_id, the_input_action] = the_input_hotkey;
	} else {
		INPUT_KEYBOARD_KEYS2[player_id, the_input_action] = the_input_hotkey;
	}
	INPUT_STATES[player_id, the_input_action]	= input_state.none;
}

/// @description finds an action using the hotkey and unnassigns it;
/// @function input_unmap_key(player_id, the_input_hotkey);
/// @param player_id the player to unmap the key for
/// @param the_input_hotkey the key to unmap if previously mapped
/// @param which_key key 1 or 2
input_unmap_key = function (player_id, the_input_hotkey, which_key) {
	
	//GET THE BUTTON STRING
	var input_hotkey_idx = 0;
	for (var i = 0; i < array_length_1d(valid_keys); i++) {
		if (the_input_hotkey == valid_keys[i]) {
				input_hotkey_idx = i;
		}
	}
	
	//CHECK ALL ACTIONS TO SEE IF THIS KEY IS ALREADY MAPPED
	for (var the_input_action = 0; the_input_action < array_length_1d(INPUT_ACTION_STRINGS); the_input_action++) {
		for (var player_id_temp = 0; player_id_temp < MAX_PLAYERS; player_id_temp++) {
			if (the_input_hotkey == INPUT_KEYBOARD_KEYS[player_id_temp, the_input_action]) {
				if (player_id_temp != player_id) {
					show_debug_message("Key " + valid_key_strings[input_hotkey_idx] + " is already used by player " + string(player_id_temp));
					return;
				} else {
					show_debug_message("Key " + valid_key_strings[input_hotkey_idx] + " unmapped for action " + INPUT_ACTION_STRINGS[the_input_action]);
					INPUT_KEYBOARD_KEYS[player_id, the_input_action] = 9999;
				}
			}
			if (the_input_hotkey == INPUT_KEYBOARD_KEYS2[player_id_temp, the_input_action]) {
				if (player_id_temp != player_id) {
					show_debug_message("Key " + valid_key_strings[input_hotkey_idx] + " is already used by player " + string(player_id_temp));
					return;
				} else {
					show_debug_message("Key " + valid_key_strings[input_hotkey_idx] + " unmapped for action " + INPUT_ACTION_STRINGS[the_input_action]);
					INPUT_KEYBOARD_KEYS2[player_id, the_input_action] = 9999;
				}
			}
			
		}
	}
	//show_debug_message("Key " + valid_key_strings[input_hotkey_idx] + " not previously mapped.");
	
}

/// @description finds an action using the Gamepad button and unnassigns it;
/// @function input_unmap_gamepad_key(player_id, the_input_gamepad_key);
/// @param player_id the player to unmap the button for
/// @param the_input_gamepad_key the button to unmap if previously mapped
input_unmap_gamepad_key = function (player_id, the_input_gamepad_key) {
	
	//GET THE BUTTON STRING
	var input_gamepad_key_idx = 0;
	for (var i = 0; i < array_length_1d(valid_buttons); i++) {
		if (the_input_gamepad_key == valid_buttons[i]) {
				input_gamepad_key_idx = i;
		}
	}
	
	//CHECK ALL ACTIONS TO SEE IF THIS BUTTON IS ALREADY MAPPED 
	for (var player_id_temp = 0; player_id_temp < MAX_PLAYERS; player_id_temp++) {
		for (var the_input_action = 0; the_input_action < array_length_1d(INPUT_GAMEPAD_KEYS[player_id_temp]); the_input_action++) {
			if (the_input_gamepad_key == INPUT_GAMEPAD_KEYS[player_id_temp, the_input_action]) {
				if (player_id_temp != player_id) {
					show_debug_message("Can not share button " + valid_button_strings[input_gamepad_key_idx] + " with player " + string(player_id_temp));
					return;
				} else {
					show_debug_message("Button " + valid_button_strings[input_gamepad_key_idx] + " unmapped for action " + INPUT_ACTION_STRINGS[the_input_action]);
					INPUT_GAMEPAD_KEYS[player_id, the_input_action] = 9999;
					return;
				}
			}
		}
	}
}

/// @description remaps a gamepad button press
/// @function input_remap_gamepad_key (player_id, the_input_action, the_input_gamepad_key);
/// @param player_id the player to remap the control of
/// @param the_input_action the input action
/// @param the_input_gamepad_key the gamepad key
input_remap_gamepad_key = function (player_id, the_input_action, the_input_gamepad_key) {
	
	INPUT_GAMEPAD_KEYS[player_id, the_input_action]	= the_input_gamepad_key;
	INPUT_STATES[player_id, the_input_action] = input_state.none;
}

/// @function restore_defaults();
restore_defaults = function (player_id) {
	INPUT_KEYBOARD_KEYS[player_id] = DEFAULT_KEYBOARD_KEYS[player_id];
	INPUT_KEYBOARD_KEYS2[player_id] = DEFAULT_KEYBOARD_KEYS2[player_id];
	INPUT_GAMEPAD_KEYS[player_id] = DEFAULT_GAMEPAD_KEYS[player_id];
}

init_inputs = function () {

	PLAYER_GAMEPAD_IDS	= ds_list_create(); 

	ds_list_add(PLAYER_GAMEPAD_IDS, -1);

	//PLAYER 1
	input_create(0, input_action.up,		ord("W"), vk_up, gp_padu);
	input_create(0, input_action.down,		ord("S"), vk_down, gp_padd);
	input_create(0, input_action.left,		ord("A"), vk_left, gp_padl);
	input_create(0, input_action.right,		ord("D"), vk_right, gp_padr);
	
	input_create(0, input_action.fire1,		vk_numpad0, vk_space, gp_face3);
	input_create(0, input_action.fire2,		vk_control, vk_rshift, gp_face1);

	input_create(0, input_action.start,		vk_enter, vk_enter, gp_start);
	
	enable_analog();
	
	load_controllers();
}

/// @arg player_id
/// @arg input_id
/// @arg [count_press_as_hold=true]
input_held = function () {

	var player_id	= argument[0];
	var input_id	= argument[1];
	var count_press_as_hold = true; if argument_count > 2 { count_press_as_hold = argument[2]; }

	return INPUT_STATES[player_id, input_id] == input_state.held || (INPUT_STATES[player_id, input_id] == input_state.pressed && count_press_as_hold);
}

/// @arg player_id
/// @arg input_id
input_pressed = function (argument0, argument1) {

	var player_id	= argument0;
	var input_id	= argument1;

	return INPUT_STATES[player_id, input_id] == input_state.pressed;
}

/// @arg player_id
/// @arg input_id
/// @arg input_id
input_released = function () {

	var player_id	= argument[0];
	var input_id	= argument[1];

	return INPUT_STATES[player_id, input_id] == input_state.released;
}

/// @arg player_id
LEFT_STICK = function () {
	var player_id	= argument[0];
	return INPUT_STICK_L_VALS[player_id];
}
/// @arg player_id
RIGHT_STICK = function () {
	var player_id	= argument[0];
	return INPUT_STICK_R_VALS[player_id];
}

load_controllers = function (){
	
	for (var _player_id = 0; _player_id < MAX_PLAYERS; _player_id++) {
		for (var the_input_action = 0; the_input_action < array_length_1d(INPUT_KEYBOARD_KEYS[_player_id]); the_input_action++) {
			var this_player_keyboard_key = 	ds_map_find_value(CONTROLLER_SAVE_DATA, "INPUT_KEYBOARD_KEYS_" + string(_player_id) + "_" + string(the_input_action));
			if (is_undefined(this_player_keyboard_key)) {
				ds_map_replace(CONTROLLER_SAVE_DATA, "INPUT_KEYBOARD_KEYS_" + string(_player_id) + "_" + string(the_input_action), INPUT_KEYBOARD_KEYS[_player_id, the_input_action]);
				ds_map_secure_save(CONTROLLER_SAVE_DATA, CONTROLLER_FILE_NAME);
			} else {
				INPUT_KEYBOARD_KEYS[_player_id, the_input_action] = this_player_keyboard_key;	
			}
		}
	}
	
	for (var _player_id = 0; _player_id < MAX_PLAYERS; _player_id++) {
		for (var the_input_action = 0; the_input_action < array_length_1d(INPUT_KEYBOARD_KEYS2[_player_id]); the_input_action++) {
			var this_player_keyboard_key = 	ds_map_find_value(CONTROLLER_SAVE_DATA, "INPUT_KEYBOARD_KEYS2_" + string(_player_id) + "_" + string(the_input_action));
			if (is_undefined(this_player_keyboard_key)) {
				ds_map_replace(CONTROLLER_SAVE_DATA, "INPUT_KEYBOARD_KEYS2_" + string(_player_id) + "_" + string(the_input_action), INPUT_KEYBOARD_KEYS2[_player_id, the_input_action]);
				ds_map_secure_save(CONTROLLER_SAVE_DATA, CONTROLLER_FILE_NAME);
			} else {
				INPUT_KEYBOARD_KEYS2[_player_id, the_input_action] = this_player_keyboard_key;	
			}
		}
	}
	
	for (var _player_id = 0; _player_id < MAX_PLAYERS; _player_id++) {
		for (var the_input_action = 0; the_input_action < array_length_1d(INPUT_GAMEPAD_KEYS[_player_id]); the_input_action++) {
			var this_player_gamepad_key = 	ds_map_find_value(CONTROLLER_SAVE_DATA, "INPUT_GAMEPAD_KEYS_" + string(_player_id) + "_" + string(the_input_action));
			if (is_undefined(this_player_gamepad_key)) {
				ds_map_replace(CONTROLLER_SAVE_DATA, "INPUT_GAMEPAD_KEYS_" + string(_player_id) + "_" + string(the_input_action), INPUT_GAMEPAD_KEYS[_player_id, the_input_action]);
				ds_map_secure_save(CONTROLLER_SAVE_DATA, CONTROLLER_FILE_NAME);
			} else {
				INPUT_GAMEPAD_KEYS[_player_id, the_input_action] = this_player_gamepad_key;
			}
		}
	}
}

save_controllers = function (){
	
	for (var _player_id = 0; _player_id < MAX_PLAYERS; _player_id++) {
		for (var the_input_action = 0; the_input_action < array_length_1d(INPUT_KEYBOARD_KEYS[_player_id]); the_input_action++) {
			ds_map_replace(CONTROLLER_SAVE_DATA, "INPUT_KEYBOARD_KEYS_" + string(_player_id) + "_" + string(the_input_action), INPUT_KEYBOARD_KEYS[_player_id, the_input_action]);
		}
	}
	
	for (var _player_id = 0; _player_id < MAX_PLAYERS; _player_id++) {
		for (var the_input_action = 0; the_input_action < array_length_1d(INPUT_KEYBOARD_KEYS2[_player_id]); the_input_action++) {
			ds_map_replace(CONTROLLER_SAVE_DATA, "INPUT_KEYBOARD_KEYS2_" + string(_player_id) + "_" + string(the_input_action), INPUT_KEYBOARD_KEYS2[_player_id, the_input_action]);
		}
	}
	
	for (var _player_id = 0; _player_id < MAX_PLAYERS; _player_id++) {
		for (var the_input_action = 0; the_input_action < array_length_1d(INPUT_GAMEPAD_KEYS[_player_id]); the_input_action++) {
			ds_map_replace(CONTROLLER_SAVE_DATA, "INPUT_GAMEPAD_KEYS_" + string(_player_id) + "_" + string(the_input_action), INPUT_GAMEPAD_KEYS[_player_id, the_input_action]);
		}
	}
	
	ds_map_secure_save(CONTROLLER_SAVE_DATA, CONTROLLER_FILE_NAME);
	do_event_message("CONTROLS SAVED.");
	
}

init_inputs();

