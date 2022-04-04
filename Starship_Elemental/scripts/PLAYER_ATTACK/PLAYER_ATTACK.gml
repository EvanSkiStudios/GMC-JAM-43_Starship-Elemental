function PLAYER_ATTACK(){
	 #region Normal shooting
	 var attack;
	 
	 var fire = (INPUT.input_held(0, input_action.fire1));
	 
	 var fire_two = keyboard_check_pressed(vk_numpad0);
	 
	 attack = keyboard_check(USER_BUTTON_SHOOT) || keyboard_check(USER_BUTTON_SHOOT_ALT) || fire || fire_two;
	 
 
	 if (can_shoot && attack){
		 
		 var width_offset = obj_player_ship.sprite_width;
		 var height_offset = obj_player_ship.sprite_height;
		 
		 //sprite space is the extra white space under the ship in the sprite cause of course it matters T_T
		 var sprite_space_h = 5;
		 var sprite_space_w = 3;
		 
		 var random_offset = 0;
		 
		 var do_offset = irandom(100);
		 if (do_offset < 34){ 
			random_offset = irandom_range(-3,3);
		 }
		 
		 instance_create_depth(
			(x + (width_offset / 2) - sprite_space_w),
			(y + (height_offset / 2) - sprite_space_h) + random_offset,
			depth,
			obj_player_bullet
		);
		playSound(SND_SFX_PLAYER_BULLET_SHOOT,false);	
		
		alarm[0] = (GAMESPEED / 8);
		can_shoot = false;
	 }
	 #endregion
	 
	 #region Smartbomb
	 
		if (global.GAMEPADISCONENCTED){
	 		var smartbomb_attack = (INPUT.input_pressed(0, input_action.fire2));
		}else{
			
				//patch to prevent crash on Opera gx with using smartbombs
				if (global.IS_GX_EXPORT){
					var smartbomb_attack = keyboard_check_released(USER_BUTTON_SMARTBOMB_GXC);
				}else{
					var smartbomb_attack = keyboard_check_released(USER_BUTTON_SMARTBOMB);
				}
		}
	 
		if (can_shoot_smartbomb) && (smartbomb_attack){
			show_debug_message("FIRED");
			if (smartbomb_do_once){
				var active_smartbomb = global.Player_Smartbomb_array[0];
				if (active_smartbomb != smartbomb_types.none){
					switch(active_smartbomb){
					
						case smartbomb_types.earth:{
							instance_create_depth(0,0,depth,obj_smartbomb_effect_earth);
						}break;
					
						case smartbomb_types.fire:{
							var x_offset =( ( sprite_get_width(obj_player_ship.sprite_index) / 2) + ( sprite_get_width(spr_smartbomb_effect_fire) / 2) );
						
							instance_create_depth(
							obj_player_ship.x + ( x_offset ),
							obj_player_ship.y,
							-11000,
							obj_smartbomb_effect_fire);
						}break;
					
						case smartbomb_types.ice:{
							var x_offset =( ( sprite_get_width(obj_player_ship.sprite_index) / 2) + ( sprite_get_width(spr_smartbomb_effect_fire) / 2) );
						
							instance_create_depth(
							obj_player_ship.x + ( x_offset ),
							obj_player_ship.y,
							-11000,
							obj_smartbomb_effect_ice);
						}break;
					
						case smartbomb_types.wind:{
							instance_create_depth(
							obj_player_ship.x,
							obj_player_ship.y,
							-11000,
							obj_smartbomb_effect_lightning);
						}break;
					
						default: show_debug_message("WHAT THE FRICK SMARTBOMB IS THIS?!"); break;
					
					}
					
					smartbomb_do_once = false;
				}
				
				
				//finish
				var array_max = global.Player_smartbomb_max;
				for (var i = 0; i < array_max; ++i){
					if (i != (array_max-1)){
						global.Player_Smartbomb_array[i] = global.Player_Smartbomb_array[i+1];
					}else{
						global.Player_Smartbomb_array[array_max-1] = smartbomb_types.none;
					}
				}
				//reset smartbomb flag
				alarm[3] = (GAMESPEED / 8);
				can_shoot_smartbomb = false;
			}
			
		}
	 #endregion
}