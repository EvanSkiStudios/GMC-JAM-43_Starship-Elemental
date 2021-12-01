function PLAYER_HEALTH(){
	var HP = global.Player_HP;
	switch(HP){
		default:
		case 3:{
			//wow you are okay!	
		}break;
		
		case 2:{
			//captian we recived damage!!
			if !instance_exists(obj_ship_fire){
				instance_create_depth(x,y,depth-1,obj_ship_fire);	
			}
		}break;
		
		case 1:{
			//DAMAGE CRITICAL!!
		}break;
		
		case 0:{
			//do the die
		}break;
	}
}