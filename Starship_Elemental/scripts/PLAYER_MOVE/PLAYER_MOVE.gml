function PLAYER_MOVE(){
	
	//move up and down
	var move_v = ( (keyboard_check(USER_BUTTON_DOWN)) - (keyboard_check(USER_BUTTON_UP)) );

	switch(move_v){
		default: break;
	
		case -1:{
			player_ship_state = PLAYER_SHIP_STATES.flying_up;
		}break;
	
		case 1:{
			player_ship_state = PLAYER_SHIP_STATES.flying_down;
		}break;
	
	}
	
	if (move_v == 0){
	
		var move_v_alt = ( (keyboard_check(USER_BUTTON_DOWN_ARROWS)) - (keyboard_check(USER_BUTTON_UP_ARROWS)) );
		switch(move_v_alt){
			default: break;
	
			case -1:{
				player_ship_state = PLAYER_SHIP_STATES.flying_up;
			}break;
	
			case 1:{
				player_ship_state = PLAYER_SHIP_STATES.flying_down;
			}break;
	
		}
	}

	//move left and right
	//not tied to state machine as we dont have animations for left and right
	//if in state machine we'd need more logic or not allow player to move horizontal while moving vertiacl
	var move_h = ( (keyboard_check(USER_BUTTON_RIGHT)) - (keyboard_check(USER_BUTTON_LEFT)) );

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
	
	var move_h_alt = ( (keyboard_check(USER_BUTTON_RIGHT_ARROWS)) - (keyboard_check(USER_BUTTON_LEFT_ARROWS)) );
	
	if (move_h == 0){
	
	switch(move_h_alt){
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
}