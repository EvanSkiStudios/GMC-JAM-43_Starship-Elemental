//Run state machine
PLAYER_STATES();

if (global.Player_ship_visable){
	
	if (global.Player_control_enabled){
		//Movement
		PLAYER_MOVE();
		PLAYER_MOVE_GAMEPAD();
	
		//Attack
		PLAYER_ATTACK();	
	}

		//player health
		PLAYER_HEALTH();
}