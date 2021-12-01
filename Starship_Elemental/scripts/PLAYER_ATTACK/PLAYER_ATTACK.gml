function PLAYER_ATTACK(){
	 var attack = keyboard_check(vk_space);
 
	 if (can_shoot && attack){
		 
		 //4 seems to be the golden number for making the sprite align with the ships gun
		//its a magic number but for this jam it will work
		//4 on the x because it makes the bullets closer to the gun and it makes pat happy
		//they are now both 4 not 3.5 beacuse pat will rip my fucking hair off if I dont change it
		 instance_create_depth(
			(x + sprite_width) - 4,
			(y + (sprite_height / 2) + ( sprite_get_width(spr_player_bullet_01) / 4 )),
			depth,
			obj_player_bullet
		);
		
		alarm[0] = (GAMESPEED / 8)
		can_shoot = false;
	 }
}