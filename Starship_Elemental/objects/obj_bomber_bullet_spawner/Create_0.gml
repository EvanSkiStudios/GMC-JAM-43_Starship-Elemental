bullet_dir = 0;

//spawns heat seekers in all 8 directions
for(var i; i < 7; ++i){
	var bullet = instance_create_depth(x,y,depth,obj_bullet_enemy_stinger);
	with(bullet){
		direction = other.bullet_dir;	
	}

	if !(bullet_dir >= 315){
		bullet_dir += 45;
	}else{
		bullet_dir = 315;	
	}
	
	bullet_array[i] = bullet;
}