image_xscale = 0.0001;
image_yscale = 0.0001;

if instance_exists(obj_player_ship){
	//sets x offset to the ships wing
	var x_pos_offset = 5;
	setParent(
		obj_player_ship, 
		( ( -abs(sprite_get_width(obj_player_ship.sprite_width)) ) - x_pos_offset),
		0
	)
}else{
	instance_destroy();	
}