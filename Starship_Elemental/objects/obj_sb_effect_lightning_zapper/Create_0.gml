if !instance_exists(obj_player_ship){
	instance_destroy();	
}

target = noone;

updatetentacle = function(){
	
	if (target == noone){
		if instance_exists(obj_enemy_parent){
			target = instance_nearest(x,y,obj_enemy_parent);
			//make this so it doesnt kill enemies outside of room - NICE TO HAVE
		}else{
			instance_destroy();	
		}
	}

	if (target != noone){
		if !instance_exists(target){
			target = noone;	
		}else{
			//point at enemy
			image_angle = point_direction(x,y,target.x,target.y);
	
	
				var sprite_offset = 33;
				if instance_exists(obj_player_ship){
					x = obj_player_ship.x + lengthdir_x(sprite_offset,image_angle);
					y = obj_player_ship.y + lengthdir_y(sprite_offset,image_angle);
				}else{
					instance_destroy();	
				}
		
			var distance = point_distance(x,y,target.x,target.y);
	
			image_xscale = distance / 119;
		}
	}
}

updatetentacle();