function PLAYER_ATTACK(){
	 var attack = keyboard_check(vk_space);
 
	 if (can_shoot && attack){
		 
		 
		 var width_offset = obj_player_ship.sprite_width;
		 var height_offset = obj_player_ship.sprite_height;
		 
		 //sprite space is the extra white space under the ship in the sprite cause of course it matters T_T
		 var sprite_space_h = 5;
		 var sprite_space_w = 3;
		 
		 instance_create_depth(
			(x + (width_offset / 2) - sprite_space_w),
			(y + (height_offset / 2) - sprite_space_h),
			depth,
			obj_player_bullet
		);
		playSound(SND_SFX_PLAYER_BULLET_SHOOT,false);	
		
		alarm[0] = (GAMESPEED / 8)
		can_shoot = false;
	 }
}