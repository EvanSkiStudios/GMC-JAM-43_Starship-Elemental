image_xscale = 0.0001;
image_yscale = 0.0001;


if instance_exists(obj_player_ship){
	//sets x offset to the ships wing
	var x_pos_offset = 6;
	setParent(
		obj_player_ship, 
		-(x_pos_offset),
		0
	)
}else{
	instance_destroy();	
}