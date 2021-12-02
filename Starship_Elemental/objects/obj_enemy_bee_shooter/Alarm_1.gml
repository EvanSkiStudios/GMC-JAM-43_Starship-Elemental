///@desc shoot
if !(global.Player_ship_visable) return;

//offset is the amount of pixels in the sprite realitve to where we want it to spawn, 
//and the sprite origin
//we also add the offset of the origin to pixels on the stringer sprite as well
var sprite_x_offset = 3+4;
var sprite_y_offset = 3+4;


var start_direction = 0;
var shoot_direction = 0;

//the shoot directions below are gotten by the code telling me its angle with the correct sprite
//need to make all this auto get its values after the jam

if (image_xscale == 1){
	start_direction = 5;
	shoot_direction = 251.25;
	
	var bullet = instance_create_depth(
		x - sprite_x_offset,
		y + sprite_y_offset,
		depth - 1,
		obj_bullet_enemy_stinger
	);
}

if (image_xscale == -1){
	start_direction = 7; 
	shoot_direction = 318.71;
	
	var bullet = instance_create_depth(
		x + sprite_x_offset,
		y + sprite_y_offset,
		depth - 1,
		obj_bullet_enemy_stinger
	);
}

with(bullet){
	image_index = start_direction;
	direction = shoot_direction;
	
	if !instance_exists(obj_player_ship){
		instance_destroy(id);	
	}
}

bullet_shot = 1;