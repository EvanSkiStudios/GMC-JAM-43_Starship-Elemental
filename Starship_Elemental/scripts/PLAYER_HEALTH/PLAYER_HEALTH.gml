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
			alarm[1] = (GAMESPEED / (GAMESPEED/2));//reset hp flash
			
			alarm[2] = (GAMESPEED * 8); //regen health
			
			//create explosion
			var offset = random_range(-3,3);
			instance_create_depth(x + offset,y,depth-1,obj_explosion_small);
		}
		last_hp = HP;
	}
	
	switch(HP){
		case 3:{
			//wow you are okay!	
			if instance_exists(obj_smoke_emitter){
				if (obj_smoke_emitter.emitter_state != 0) && (obj_smoke_emitter.emitter_state != 1){
					obj_smoke_emitter.set_damage(0);
				}
			}
		}break;
		
		case 2:{
			//captian we recived damage!!
			if instance_exists(obj_smoke_emitter){
				if (obj_smoke_emitter.emitter_state != 2){
					obj_smoke_emitter.set_damage(2);
				}
			}
		}break;
		
		case 1:{
			//DAMAGE CRITICAL!!
			if instance_exists(obj_smoke_emitter){
				if (obj_smoke_emitter.emitter_state != 3){
					obj_smoke_emitter.set_damage(3);
				}
			}
		}break;
		
		default:
		case 0:{
			if instance_exists(obj_smoke_emitter){
				if (obj_smoke_emitter.emitter_state != 4){
					obj_smoke_emitter.set_damage(4);
				}
			}
			
			//do the die
			if (global.Player_can_die){
				if (global.SEQ_DIE_DO_ONCE){
					//remove old effects
					if instance_exists(obj_smoke_emitter){
						instance_destroy(obj_smoke_emitter);	
					}
					if instance_exists(obj_ship_fire){
						instance_destroy(obj_ship_fire);	
					}
				
					//create effects
					if !instance_exists(obj_explosion){
						instance_create_depth(x,y,depth-1010,obj_explosion);
					}
					if !(instance_exists(obj_seq_player_die)){
						instance_create_depth(x,y,depth-1000,obj_seq_player_die);	
					}
					
					x = start_x;
					y = start_y;
	
					if (instance_exists(obj_ctrl_screenshake)){
						obj_ctrl_screenshake.shake = true;
						obj_ctrl_screenshake.alarm[0] = GAMESPEED * 1;
					}
				}
			}
		}break;
	}
}