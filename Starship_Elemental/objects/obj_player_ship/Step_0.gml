//Run state machine
PLAYER_STATES();

if (global.Player_control_enabled){
	//Movement
	PLAYER_MOVE();
	
	//Attack
	PLAYER_ATTACK();
}