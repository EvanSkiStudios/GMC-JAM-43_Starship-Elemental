///@desc spawn rocks

var x_pos = irandom_range(20, (GAME_RES_WIDTH - 40));
var y_pos = irandom_range(-5, 0);

var rock = instance_create_depth(
	x_pos,
	y_pos,
	-10000,
	obj_sb_effect_earth_rock_big
);

random_speed = irandom_range(6,15);

rock.speed = other.random_speed;

alarm[1] = irandom_range(1,(effect_length/2));