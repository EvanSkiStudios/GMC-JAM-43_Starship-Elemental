/// @description Insert description here
// You can write your code in this editor

draw_remapper();

switch (remapper_state) {
	
	case remapper_states.init:
	
	break;
	
	case remapper_states.player_selection_menu:
		
		draw_player_selection_menu();
		
	break;
	
	case remapper_states.idle:
	
		draw_controls();
		
	break;
	
	case remapper_states.waiting_for_key1:
	
		draw_controls();
		draw_press_a_key();
	
	break;
	
	case remapper_states.waiting_for_key2:
		draw_controls();
		draw_press_a_key();
	
	break;
	
	case remapper_states.waiting_for_gamepad:
		draw_controls();
		draw_press_a_button();
	
	break;
	
	case remapper_states.exit_pending_changes:
		draw_controls();
		draw_save_changes();
	break;
	
	case remapper_states.restore_defaults:
		draw_controls();
		draw_restore_defaults();
	break;
}
