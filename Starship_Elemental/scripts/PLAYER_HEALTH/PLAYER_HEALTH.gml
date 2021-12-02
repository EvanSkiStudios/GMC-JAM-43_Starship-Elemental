function PLAYER_HEALTH(){
	var HP = global.Player_HP;
	
	if (HP != last_hp){
		//screen shake MF
		if instance_exists(obj_ctrl_screenshake){
			instance_destroy(obj_ctrl_screenshake);
		}
		instance_create_depth(x,y,depth,obj_ctrl_screenshake);	
		do_hp_flash = true;
		alarm[1] = (GAMESPEED / (GAMESPEED/2));
		//create explosion
		instance_create_depth(x,y,depth-1,obj_explosion_small);
		last_hp = global.Player_HP;
	}
	
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
			if (global.Player_can_die){
				
			}
		}break;
	}
}