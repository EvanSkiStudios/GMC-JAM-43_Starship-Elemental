///@desc shoot
if !(global.Player_ship_visable){
	if (bullet_count < 2){
		alarm[1] = GAMESPEED * 2;
	}
	return;
}

var bullet = instance_create_depth(
	x - (sprite_get_width(spr_enemy_generic_bee)/2),
	y + (sprite_get_height(spr_enemy_generic_bee)/2),
	depth,
	obj_enemy_bullet_generic
);

with(bullet){
	if instance_exists(obj_player_ship){
		
		//randomness
		var random_offset = irandom_range(-5,5);
		var offset_chance = irandom(100);
		
		//if its less then 50 shoot normally
		if (offset_chance < 50){
			direction = point_direction(x,y,
				obj_player_ship.x,
				obj_player_ship.y,
			);
		}else{
			//other wise choose what offset to effect
			var xy_offset = choose(1,2,3);
			
			switch(xy_offset){
				
				default:
				case 1:{
					direction = point_direction(x,y,
						obj_player_ship.x + random_offset,
						obj_player_ship.y,
					);
				}break;
				
				case 2:{
					direction = point_direction(x,y,
						obj_player_ship.x,
						obj_player_ship.y  + random_offset,
					);
				}break;
				
				case 3:{
					direction = point_direction(x,y,
						obj_player_ship.x  + random_offset,
						obj_player_ship.y  + random_offset,
					);
				}break;
			
			}
		}
		
		speed = other.enemy_attack_speed;
	}else{
		instance_destroy(id);	
	}
}

bullet_count += 1;

if (bullet_count < 2){
	alarm[1] = GAMESPEED * 2;
}