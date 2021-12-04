bullet_dir = 0;

//spawns heat seekers in all 8 directions
for(var i = 0; i < 8; ++i){
	var object = choose(obj_sb_effect_earth_rock_small,obj_sb_effect_earth_rock_tiny);
	
	var rock = instance_create_depth(x,y,depth,object);
	new_speed = (speed - 1);
	with(rock){
		direction = other.bullet_dir;
		speed = other.new_speed;
	}

	if !(bullet_dir >= 315){
		bullet_dir += 45;
	}else{
		bullet_dir = 315;	
	}
}

instance_destroy();