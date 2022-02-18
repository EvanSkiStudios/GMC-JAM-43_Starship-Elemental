function PLAYER_MOVE_MOBILE(){
	
	//move up and down
	
	//device tilt is between 1 <> -1
	device_tilt_x = device_get_tilt_x();
	
	//default dont move
	var move_v = sign(device_tilt_x);

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
	device_tilt_y = sign(device_get_tilt_y()); 
	
	var move_h = (device_tilt_y);

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