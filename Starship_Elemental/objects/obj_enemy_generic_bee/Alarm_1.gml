///@desc shoot
var bullet = instance_create_depth(
	x - (sprite_get_width(spr_enemy_generic_bee)/2),
	y + (sprite_get_height(spr_enemy_generic_bee)/2),
	depth,
	obj_enemy_bullet_generic
);

with(bullet){
	if instance_exists(obj_player_ship){
		direction = point_direction(x,y,
			obj_player_ship.x,
			obj_player_ship.y,
		);
		
		speed = other.enemy_attack_speed;
	}else{
		instance_destroy(id);	
	}
}

alarm[1] = GAMESPEED * 2;