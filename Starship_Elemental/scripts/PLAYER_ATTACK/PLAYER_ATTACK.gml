function PLAYER_ATTACK(){
	 #region Normal shooting
	 var attack = keyboard_check(vk_space);
 
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
		var smartbomb_attack = keyboard_check_released(vk_control);
	 
		if (can_shoot_smartbomb) && (smartbomb_attack){
			var active_smartbomb = global.Player_Smartbomb_array[0];
			if (active_smartbomb != smartbomb_types.none){
				show_message("WOAH WOW! DID YOU SEE THAT EFFECT?!?!");
				
				
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