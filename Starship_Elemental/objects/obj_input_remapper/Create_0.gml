/// @description Input Remapper takes inputManager and reassigns controls

on_close_function = -1;

changed_controls = false;
save_changes_idx = 0;
restore_defaults_idx = 0;
menu_idx = 0;
input_item_idx = 0;
player_idx = -1;
_y = 0;
_x = 0;
y_spacing = 2;
line_height = 0;
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

input_actions_length = array_length(INPUT_ACTION_STRINGS);

show_debug_message("INPUT REMAPPER 2.0");

//LIST OF VALID KEYBOARD KEYS TO REMAP A CONTROL TO
globalvar valid_keys;
valid_keys = 
[
ord("Q"),ord("W"),ord("E"),ord("R"),ord("T"),ord("Y"),ord("U"),ord("I"),ord("O"),ord("P"),
ord("A"),ord("S"),ord("D"),ord("F"),ord("G"),ord("H"),ord("J"),ord("K"),ord("L"),
ord("Z"),ord("X"),ord("C"),ord("V"),ord("B"),ord("N"),ord("M"),
ord("0"),ord("1"),ord("2"),ord("3"),ord("4"),
ord("5"),ord("6"),ord("7"),ord("8"),ord("9"),
vk_left,vk_right,vk_up,vk_down,vk_enter,vk_space,
vk_control,vk_backspace,vk_tab,
vk_home,vk_end,vk_delete,vk_insert,vk_pageup,vk_pagedown,vk_printscreen,
vk_f1,vk_f2,vk_f3,vk_f4,vk_f5,vk_f6,vk_f7,vk_f8,vk_f9,vk_f10,vk_f11,vk_f12,
vk_numpad0,vk_numpad1,vk_numpad2,vk_numpad3,vk_numpad4,
vk_numpad5,vk_numpad6,vk_numpad7,vk_numpad8,vk_numpad9,
vk_multiply,vk_divide,vk_add,vk_subtract,vk_decimal,
vk_lshift,vk_lcontrol,vk_lalt,vk_rshift,vk_rcontrol,vk_ralt,
];

//A LIST OF STRINGS FOR THE VALID KEYS IN READABLE FORM
globalvar valid_key_strings;
valid_key_strings = 
[
"Q","W","E","R","T","Y","U","I","O","P",
"A","S","D","F","G","H","J","K","L",
"Z","X","C","V","B","N","M",
"0","1","2","3","4","5","6","7","8","9",
"LEFT","RIGHT","UP","DOWN","ENTER","SPACE",
"L_CTRL","BK_SPACE","TAB",
"HOME","END","DEL","INS","PG_UP","PG_DN","PR_SCR",
"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12",
"NUM_0","NUM_1","NUM_2","NUM_3","NUM_4",
"NUM_5","NUM_6","NUM_7","NUM_8","NUM_9",
"*","/","+","-",".",
"LSHIFT","LCTRL","LALT","RSHIFT","RCTRL","RALT",
];

_w = display_get_gui_width();
_h = display_get_gui_height();

//THE REMAPPER STATE MACHINE ENUM
enum remapper_states {
	init,
	player_selection_menu,
	idle,
	waiting_for_key1,
	waiting_for_key2,
	waiting_for_gamepad,
	exit_pending_changes,
	restore_defaults,
}

/// @function get_key_string_from_key(_key);
get_key_string_from_key = function (_key) {
	
	for (var i = 0; i < array_length_1d(valid_keys); i++) {
		if (_key == valid_keys[i]) {
			return valid_key_strings[i];	
		}
	}
	return "???";
}

/// @function get_button_string_from_button(_button);
get_button_string_from_button = function (_button) {
	
	for (var i = 0; i < array_length_1d(valid_buttons); i++) {
		if (_button == valid_buttons[i]) {
			return valid_button_strings[i];	
		}
	}
	return "???";
}

//A LIST OF VALID GAMEPAD BUTTONS TO REMAP
globalvar valid_buttons;
valid_buttons =
[
gp_face1, gp_face2, gp_face3, gp_face4,
gp_shoulderl,gp_shoulderr, gp_shoulderlb, gp_shoulderrb,
gp_padu, gp_padd, gp_padl, gp_padr,
gp_select, gp_start, gp_stickl, gp_stickr,
];
//THE LIST OF VALID BUTTONS IN READABLE FORM
globalvar valid_button_strings;
valid_button_strings =
[
"B", "A", "Y", "X",
"L1","R1","L2","R2",
"UP", "DOWN", "LEFT", "RIGHT",
"SELECT", "START", "STICK_L", "STICK_R",
];

remapper_state =  remapper_states.init;

/// @description remaps the action if the keypress matches a valid key
/// @function evaluate_keypress(last_key_press);
/// @param which_key key 1 or key 2
/// @param last_key_press the key to remap

evaluate_keypress = function (player_id, which_key, last_key_press) {
	
	show_debug_message("SHIFT KEY:" + string(vk_lshift));
	show_debug_message("Input Remapper evaluating keypress: " + string(keyboard_lastkey));
	
	for (var i = 0; i < array_length_1d (valid_keys); i++) {
		
		if (last_key_press == valid_keys[i]) {
			
			//CHECK AND REMOVE MAP IF THIS KEY IS ASSIGNED TO ANOTHER ACTION
			INPUT.input_unmap_key(player_id, last_key_press, which_key);
			//REMAP KEY TO ACTION
			INPUT.input_remap_key(player_id, menu_idx, last_key_press, which_key);
			changed_controls = true;
				
			show_debug_message(INPUT_ACTION_STRINGS[menu_idx] + " remapped to key " + valid_key_strings[i]);
			
			remapper_state = remapper_states.idle;
			
			return last_key_press;
		}
	}
	
	show_debug_message("INVALID KEY");
	
	remapper_state = remapper_states.idle;
	
	return -1;
}

/// @description waits for the next key press, then moves the engine
/// @function listen_for_key();
listen_for_key = function (which_key) {
	
	if (which_key != 1 && which_key != 2) {
		show_debug_message("ERROR: must use either 1 or 2");
		return;
	}
	
	//NEED SPECIAL EVAL FOR SHIFT KEYS
	if (keyboard_check_direct(vk_lshift)) {
		show_debug_message("PRESSED " + get_key_string_from_key(vk_lshift));
		evaluate_keypress(player_idx, which_key, vk_lshift);
		return;
	}
	
	if (keyboard_check_direct(vk_rshift)) {
		show_debug_message("PRESSED " + get_key_string_from_key(vk_rshift));
		evaluate_keypress(player_idx, which_key, vk_rshift);
		return;
	}
	
	if (keyboard_check_pressed(vk_anykey)) {
		show_debug_message("PRESSED KEY:" + get_key_string_from_key(keyboard_lastkey));
		evaluate_keypress(player_idx, which_key, keyboard_lastkey);
	}
	
}

/// @function evaluate_gamepad_key(last_button_press);
/// @param last_key_press the key to remap
evaluate_gamepad_key = function (last_button_press) {
	
	show_debug_message("Input Remapper evaluating gamepad press.");
	
	var button_str = "";
	for (var i = 0; i < array_length_1d(valid_buttons); i++) {
		if (last_button_press == valid_buttons[i]) {
			button_str = valid_button_strings[i];
			break;
		}
	}
	
	if (INPUT != undefined) {
				
		//CHECK AND REMOVE MAP IF THIS KEY IS ASSIGNED TO ANOTHER ACTION
		INPUT.input_unmap_gamepad_key(player_idx, last_button_press);
		
		//REMAP BUTTON
		INPUT.input_remap_gamepad_key(player_idx, menu_idx, last_button_press);
				
		show_debug_message(INPUT_ACTION_STRINGS[menu_idx] + " remapped to button " + button_str);
	} else {
		show_debug_message("Input Remapper ERROR: input_manager not assigned.");	
	}
			
	return last_button_press;
}


/// @function listen_for_gamepad_key();
listen_for_gamepad_key = function () {
	
	var this_gamepad_id = ds_list_find_value(PLAYER_GAMEPAD_IDS, player_idx);
	
	if (this_gamepad_id == undefined) {
		show_message("Player " + string(player_idx + 1) + " Gamepad not detected.");
		remapper_state = remapper_states.idle;
		return;
	}
	
	for (var i = 0; i < array_length_1d(valid_buttons); i++) {
		if (gamepad_button_check_pressed(this_gamepad_id, valid_buttons[i])) {
				var last_button_press = valid_buttons[i];
				evaluate_gamepad_key (last_button_press);
				remapper_state = remapper_states.idle;
				break;
		}
	}
}

///@function draw_press_a_key();
draw_press_a_key = function () {
	draw_set_alpha(.75);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_font(remapper_font);
	draw_set_halign(fa_center);
	draw_text_ext_color(gui_w * .5, gui_h * .5, "PRESS A KEY", line_height, gui_w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
		
}

///@function draw_press_a_button();
draw_press_a_button = function () {
	draw_set_alpha(.75);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_font(remapper_font);
	draw_set_halign(fa_center);
	draw_text_ext_color(gui_w * .5, gui_h * .5, "PRESS A BUTTON", line_height, gui_w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
		
}

///@function draw_remapper();
draw_remapper = function () {
	
	draw_set_alpha(.75);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	_y = 0;
	_x = 0;
	draw_set_font(remapper_font);
	line_height = string_height("A") + y_spacing;
}

///@function draw_player_selection_menu();
draw_player_selection_menu = function () {
		//DRAW INPUT REMAPPER TITLE
		draw_set_halign(fa_center);
		draw_text_ext_color(gui_w * .5, _y, "REMAP CONTROLS", line_height, gui_w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
		_y += line_height;	
		
		draw_set_halign(fa_left);
		var c_up = (player_idx == -1) ? color_selected_upper : color_normal_upper;
		var c_down = (player_idx == -1) ? color_selected_lower : color_normal_lower;
		draw_text_ext_color(gui_w * .1, _y, "RETURN", line_height, gui_w, c_up, c_up, c_down, c_down, 1);
		_y += line_height;
		draw_player_names();
		
}

///@function pressed(which);
///@description finds a gamepad to control this menu, independant of Input Manager
pressed = function (which) {
	var max_gamepad_slot = gamepad_get_device_count();
	for ( var gamepad_id = 0; gamepad_id < max_gamepad_slot; gamepad_id++){
		if (gamepad_is_connected(gamepad_id)) {
			if (gamepad_button_check_pressed(gamepad_id, which)) {
				return true;	
			}
		}
	}
	return false;
}

moved_up = function () {
	if (pressed(gp_padu) || keyboard_check_pressed(vk_up)) {
		return true;	
	}
	return false;
}

moved_down = function () {
	if (pressed(gp_padd) || keyboard_check_pressed(vk_down)) {
		return true;	
	}
	return false;
}

made_selection = function () {
	if (keyboard_check_pressed(vk_enter) || pressed(gp_face1) || pressed(gp_face3)) {
		return true;	
	}
	return false;
}

moved_back = function () {
	if (pressed(gp_face2) || pressed(gp_face4) || keyboard_check_pressed(vk_escape)) {
		return true;	
	}
	return false;
}

moved_left = function () {
	if (pressed(gp_padl) || keyboard_check_pressed(vk_left)) {
		return true;	
	}
	return false;
}

moved_right = function () {
	if (pressed(gp_padr) || keyboard_check_pressed(vk_right)) {
		return true;	
	}
	return false;
}

///@function draw_control_labels();
draw_control_labels = function () {
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	
	var c_up = (input_item_idx == 0 && menu_idx != input_actions_length) ? color_selected_upper : color_normal_upper;
	var c_down = (input_item_idx == 0 && menu_idx != input_actions_length) ? color_selected_lower : color_normal_lower;
	_x = display_get_gui_width() * .2;
	draw_text_ext_color(_x, _y, "ACTION", line_height, gui_w, c_up, c_up, c_down, c_down, 1);
	
	_x = display_get_gui_width() * .4;
	c_up = (input_item_idx == 1 && menu_idx != input_actions_length) ? color_selected_upper : color_normal_upper;
	c_down = (input_item_idx == 1 && menu_idx != input_actions_length) ? color_selected_lower : color_normal_lower;
	draw_text_ext_color(_x, _y, "KEY 1", line_height, gui_w, c_up, c_up, c_down, c_down, 1);
	
	_x = display_get_gui_width() * .6;
	c_up = (input_item_idx == 2 && menu_idx != input_actions_length) ? color_selected_upper : color_normal_upper;
	c_down = (input_item_idx == 2 && menu_idx != input_actions_length) ? color_selected_lower : color_normal_lower;
	draw_text_ext_color(_x, _y, "KEY 2", line_height, gui_w, c_up, c_up, c_down, c_down, 1);
	
	_x = display_get_gui_width() * .8;
	c_up = (input_item_idx == 3 && menu_idx != input_actions_length) ? color_selected_upper : color_normal_upper;
	c_down = (input_item_idx == 3 && menu_idx != input_actions_length) ? color_selected_lower : color_normal_lower;
	draw_text_ext_color(_x, _y, "GAMEPAD", line_height, gui_w, c_up, c_up, c_down, c_down, 1);
	_x = display_get_gui_width() * .2;
	_y += line_height;
}

///@function draw_controls();
draw_controls = function () {
	
	var c_up = false;
	var c_down = false;
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	_x = display_get_gui_width() * .2;
	
	//DRAW PLAYER X CONTROLS
	draw_set_halign(fa_center);
	draw_text_ext_color(gui_w * .5, _y, "REMAP PLAYER " + string(player_idx + 1) + " CONTROLS", line_height, gui_w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
	_y += line_height;	
	draw_control_labels();
	var start_y = _y;
	
	for (var i = 0; i < input_actions_length; i++) {
		c_up = (i == menu_idx) ? color_selected_upper : color_normal_upper;
		c_down = (i == menu_idx) ? color_selected_lower : color_normal_lower;
		draw_text_ext_color(_x, _y, INPUT_ACTION_STRINGS[i], line_height, gui_w, c_up, c_up, c_down, c_down, 1);
		_y += line_height;
	}

	//DRAW RESTORE REFAULTS LABEL
	_x = display_get_gui_width() * .5;
	c_up = (menu_idx == input_actions_length) ? color_selected_upper : color_normal_upper;
	c_down = (menu_idx == input_actions_length) ? color_selected_lower : color_normal_lower;
	draw_text_ext_color(_x, _y, "RESTORE DEFAULTS", line_height, gui_w, c_up, c_up, c_down, c_down, 1);
	
	//DRAW KEYS 1
	_y = start_y;
	_x = display_get_gui_width() * .4;
	
	for (var i = 0; i < input_actions_length; i++) {
		
		var theKey = INPUT_KEYBOARD_KEYS[player_idx, i];
		var key_str = get_key_string_from_key(theKey);
		
		c_up = (input_item_idx == 1 && menu_idx == i) ? color_selected_upper : color_normal_upper;
		c_down = (input_item_idx == 1 && menu_idx == i) ? color_selected_lower : color_normal_lower;
		draw_text_ext_color(_x, _y, key_str, line_height, gui_w, c_up, c_up, c_down, c_down, 1);
		_y += line_height;
	}
	
	//DRAW KEYS 2
	_y = start_y;
	_x = display_get_gui_width() * .6;
	
	for (var i = 0; i < input_actions_length; i++) {
		
		var theKey = INPUT_KEYBOARD_KEYS2[player_idx, i];
		var key_str = get_key_string_from_key(theKey);
		
		c_up = (input_item_idx == 2 && menu_idx == i) ? color_selected_upper : color_normal_upper;
		c_down = (input_item_idx == 2 && menu_idx == i) ? color_selected_lower : color_normal_lower;
		draw_text_ext_color(_x, _y, key_str, line_height, gui_w, c_up, c_up, c_down, c_down, 1);
		_y += line_height;
	}
	
	//DRAW GAMEPAD BUTTONS
	_y = start_y;
	_x = display_get_gui_width() * .8;
	
	for (var i = 0; i < input_actions_length; i++) {
		
		var the_button = INPUT_GAMEPAD_KEYS[player_idx, i];
		var btn_str = get_button_string_from_button(the_button);
		
		c_up = (input_item_idx == 3 && menu_idx == i) ? color_selected_upper : color_normal_upper;
		c_down = (input_item_idx == 3 && menu_idx == i) ? color_selected_lower : color_normal_lower;
		draw_text_ext_color(_x, _y, btn_str, line_height, gui_w, c_up, c_up, c_down, c_down, 1);
		_y += line_height;
	}
	
}

///@function draw_player_names();
draw_player_names = function () {
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	_x = display_get_gui_width() * .1;
	for (var i = 0; i < MAX_PLAYERS; i++) {
		var c_up = (i == player_idx) ? color_selected_upper : color_normal_upper;
		var c_down = (i == player_idx) ? color_selected_lower : color_normal_lower;
		draw_text_ext_color(_x, _y, "REMAP CONTROLS FOR PLAYER " + string(i + 1), line_height, gui_w, c_up, c_up, c_down, c_down, 1);
		_y += line_height;
	}
	
	_y += line_height;
}

///@function draw_save_changes();
draw_save_changes = function () {
	draw_set_alpha(.75);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_font(remapper_font);
	draw_set_halign(fa_center);
	draw_text_ext_color(_w * .5, _h * .45, "SAVE CHANGES?", line_height, _w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
	
	if (save_changes_idx == 0) {
		draw_text_ext_color(_w * .4, _h * .5, "YES", line_height, _w, color_selected_upper, color_selected_upper, color_selected_lower, color_selected_lower, 1);
		draw_text_ext_color(_w * .6, _h * .5, "NO", line_height, _w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
	} else if (save_changes_idx == 1) {
		draw_text_ext_color(_w * .4, _h * .5, "YES", line_height, _w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
		draw_text_ext_color(_w * .6, _h * .5, "NO", line_height, _w, color_selected_upper, color_selected_upper, color_selected_lower, color_selected_lower, 1);
	}
}

///@function draw_restore_defaults();
///@description draws "RESTORE DEFAULTS?" with YES or NO
draw_restore_defaults = function () {
	draw_set_alpha(.75);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_font(remapper_font);
	draw_set_halign(fa_center);
	draw_text_ext_color(_w * .5, _h * .45, "RESTORE DEFAULTS?", line_height, _w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
	
	if (restore_defaults_idx == 0) {
		draw_text_ext_color(_w * .4, _h * .5, "YES", line_height, _w, color_selected_upper, color_selected_upper, color_selected_lower, color_selected_lower, 1);
		draw_text_ext_color(_w * .6, _h * .5, "NO", line_height, _w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
	} else if (restore_defaults_idx == 1) {
		draw_text_ext_color(_w * .4, _h * .5, "YES", line_height, _w, color_normal_upper, color_normal_upper, color_normal_lower, color_normal_lower, 1);
		draw_text_ext_color(_w * .6, _h * .5, "NO", line_height, _w, color_selected_upper, color_selected_upper, color_selected_lower, color_selected_lower, 1);
	}
}

///@function play_sfx_move();
play_sfx_move = function () {
	if (ui_move_sound != noone) {
		audio_play_sound(ui_move_sound, 1, 0);	
	}
}
///@function play_sfx_select
play_sfx_select = function () {
	if (ui_select_sound != noone) {
		audio_play_sound(ui_select_sound, 1, 0);	
	}
}