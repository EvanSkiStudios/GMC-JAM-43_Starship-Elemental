function PLAYER_MOVE_MOBILE(){
	
	//move up and down
	
	//device tilt is between 1 <> -1
	device_tilt_z = device_get_tilt_z();
	
	var ZTD_U = global.Mobile_Z_tilt_deadzone_up;
	var ZTD_D = global.Mobile_Z_tilt_deadzone_down;
	
	fixed_device_tilt_z = 0;
	if (device_tilt_z > ZTD_U) fixed_device_tilt_z = -1;
	if (device_tilt_z < ZTD_D) fixed_device_tilt_z = 1;
	
	//show_debug_message(device_tilt_z);
	
	//default dont move
	var move_v = (fixed_device_tilt_z);

	switch(move_v){
		default: break;
	
		case -1:{
			player_ship_state = PLAYER_SHIP_STATES.flying_up;
		}break;
	
		case 1:{
			player_ship_state = PLAYER_SHIP_STATES.flying_down;
		}break;
	}

	//move left and right
	//not tied to state machine as we dont have animations for left and right
	//if in state machine we'd need more logic or not allow player to move horizontal while moving vertiacl
	device_tilt_y = device_get_tilt_y();
	
	var YTD_L = global.Mobile_Y_tilt_deadzone_left;
	var YTD_R = global.Mobile_Y_tilt_deadzone_right;
	
	fixed_device_tilt_y = 0;
	if (device_tilt_y < YTD_L) fixed_device_tilt_y = -1;
	if (device_tilt_y > YTD_R) fixed_device_tilt_y = 1;
	
	//show_debug_message(device_tilt_y);
	
	//default dont move
	var move_h = (fixed_device_tilt_y);

	switch(move_h){
		default: break;
	
		case -1:{
			var pot_move_h = x + (-1 * ship_move_speed);
			if !(pot_move_h < 0 + (sprite_width / 2)){
				x = pot_move_h;
			}
		}break;
	
		case 1:{
			var pot_move_h = x + (1 * ship_move_speed);
			//we use game res width here, as its the width of the view port, 
			//not the room, so the ship doesnt go out of bounds
			if !(pot_move_h >= (GAME_RES_WIDTH - sprite_width)){
				x = pot_move_h;
			}
		}break;
	}
}