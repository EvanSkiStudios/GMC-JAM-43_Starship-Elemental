function PLAYER_MOVE_GAMEPAD(){
	var stick_left = (INPUT_STICK_L_VALS[@ 0][@ 0] < -0.25);
	var stick_right = (INPUT_STICK_L_VALS[@ 0][@ 0] > 0.25);
	
	var stick_up = (INPUT_STICK_L_VALS[@ 0][@ 1] < -0.25);
	var stick_down = (INPUT_STICK_L_VALS[@ 0][@ 1] > 0.25);

	var dpad_right = (INPUT.input_held(0, input_action.right));
	var dpad_left = (INPUT.input_held(0, input_action.left));
	var dpad_up = (INPUT.input_held(0, input_action.up));
	var dpad_down = (INPUT.input_held(0, input_action.down));

//move up and down
	var move_v = ( (stick_down) - (stick_up) );

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
	
		var move_v_alt = ( (dpad_down) - (dpad_up) );
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
	var move_h = ( (stick_right) - (stick_left) );

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
	
	var move_h_alt = ( (dpad_right) - (dpad_left) );
	
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