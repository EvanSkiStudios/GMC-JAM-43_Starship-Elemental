function PLAYER_ATTACK(){

	//3.5 seems to be the golden number for making the sprite align with the ships gun
	//its a magic number but for this jam it will work

	 var attack = keyboard_check(vk_space);
 
	 if (can_shoot && attack){
		 instance_create_depth(
			(x + sprite_width),
			(y + (sprite_height / 2) + ( sprite_get_width(spr_player_bullet_01) / 3.5 )),
			depth,
			obj_player_bullet
		);
		alarm[0] = (GAMESPEED / 4)
		can_shoot = false;
	 }
}