//Run state machine
PLAYER_STATES();

var select = Gamepad_select();
if (select){
	global.Gamepad_vibration = !global.Gamepad_vibration;
	
	var setting = global.Gamepad_vibration;
	
	if (setting == false){
		setting = "OFF";	
	}
	if (setting == true){
		setting = "ON";	
	}
	
	do_event_message("Vibration "+string(setting));	
}

if (global.Player_ship_visable){
	
	if (global.Player_control_enabled){
		
		//Movement
		if !(GAME_IS_MOBILE){
			if !(global.GAMEPADISCONENCTED){
				PLAYER_MOVE();
			}
		
			if (global.GAMEPADISCONENCTED){
				PLAYER_MOVE_GAMEPAD();
			}
		}else{
			//game is running on mobile
			PLAYER_MOVE_MOBILE();
		}
	
		//Attack
		PLAYER_ATTACK();	
	}

		//player health
		PLAYER_HEALTH();
}