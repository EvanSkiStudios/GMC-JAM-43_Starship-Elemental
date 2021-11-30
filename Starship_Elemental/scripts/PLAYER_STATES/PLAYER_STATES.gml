enum PLAYER_SHIP_STATES{
	idle = 0,
	return_to_idle,
	flying_up,
	flying_down,
}


function PLAYER_STATES(){
	switch(player_ship_state){
	
		default:
		case PLAYER_SHIP_STATES.idle:{
			if (sprite_index != spr_player_ship){
				sprite_index = spr_player_ship;
				image_speed = 0;
				image_index = 0;
			}
		}break;
		
		//does the reverse of current animation to return to idle state
		case PLAYER_SHIP_STATES.return_to_idle:{
			if !(image_index <= 0){
				image_speed = -ship_animation_speed;
			}else{
				player_ship_state = PLAYER_SHIP_STATES.idle;	
			}
		}break;
	
		case PLAYER_SHIP_STATES.flying_up:{

			var pot_move_v = y + (-1 * ship_move_speed);

			//if inbounds move and animate
				if !(pot_move_v <= (0)){
				y = pot_move_v;
				
				//if its not the sprite we need then reset it
				if (sprite_index != spr_player_ship_fly_up){
					sprite_index = spr_player_ship_fly_up;
					image_speed = 0;
					image_index = 0;
				}
				
				//if not at last frame then animate it
				if (image_index != (image_number - 1)){
					image_speed = ship_animation_speed;	
				}else{
					image_speed = 0;
					image_index = image_number-1;
				}
			}
			//return to idle if player lets go of button
			player_ship_state = PLAYER_SHIP_STATES.return_to_idle;
		}break;
	
		case PLAYER_SHIP_STATES.flying_down:{
			//does everything the same as moving up but for down
			var pot_move_v = y + (1 * ship_move_speed);

			if !(pot_move_v >= (room_height - sprite_height)){
				y = pot_move_v;
				
				if (sprite_index != spr_player_ship_fly_down){
					sprite_index = spr_player_ship_fly_down;
					image_speed = 0;
					image_index = 0;
				}
				
				if !(image_index >= (image_number - 1)){
					image_speed = ship_animation_speed ;	
				}else{
					image_speed = 0;
					image_index = image_number - 1;
				}
			}
			player_ship_state = PLAYER_SHIP_STATES.return_to_idle;
		}break;
	
	}
}
