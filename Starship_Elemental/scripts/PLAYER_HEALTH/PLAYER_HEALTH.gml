function PLAYER_HEALTH(){
	
	//clamp that sucker
	if (global.Player_HP < 0) global.Player_HP = 0;
	if (global.Player_HP > 3) global.Player_HP = 3;
	
	var HP = global.Player_HP;
	
	if (HP != last_hp){
		if (HP < last_hp){
			//screen shake MF
			if (instance_exists(obj_ctrl_screenshake)){
				obj_ctrl_screenshake.shake = true;
				obj_ctrl_screenshake.alarm[0] = GAMESPEED * 1;
			}else{
				return(-1);	
			}
			
			do_hp_flash = true;
			alarm[1] = (GAMESPEED / (GAMESPEED/2));
			//create explosion
			var offset = random_range(-3,3);
			instance_create_depth(x + offset,y,depth-1,obj_explosion_small);
		}
		last_hp = HP;
	}
	
	switch(HP){
		case 3:{
			//wow you are okay!	
			if (obj_smoke_emitter.emitter_state != 0) && (obj_smoke_emitter.emitter_state != 1){
				obj_smoke_emitter.set_damage(0);
			}
		}break;
		
		case 2:{
			//captian we recived damage!!
			if (obj_smoke_emitter.emitter_state != 2){
				obj_smoke_emitter.set_damage(2);
			}
		}break;
		
		case 1:{
			//DAMAGE CRITICAL!!
			if (obj_smoke_emitter.emitter_state != 3){
				obj_smoke_emitter.set_damage(3);
			}
		}break;
		
		default:
		case 0:{
			if (obj_smoke_emitter.emitter_state != 4){
				obj_smoke_emitter.set_damage(4);
			}
			
			//do the die
			if (global.Player_can_die){
				
			}
		}break;
	}
}