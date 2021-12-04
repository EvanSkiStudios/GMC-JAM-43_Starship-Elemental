if !(global.Player_ship_visable){
		global.Player_can_pickup_bombs = false;	
}else{
	if (global.Player_bombs != global.Player_smartbomb_max){
		if !(global.Player_can_pickup_bombs){
			global.Player_can_pickup_bombs = true;	
		}	
	}	
}
