bullet_dir = 0;

//spawns heat seekers in all 8 directions
for(var i = 0; i < 8; ++i){
	var object = obj_sb_effect_earth_rock_tiny;
	
	var rock = instance_create_depth(x,y,depth,object);
	new_speed = (speed);
	with(rock){
		direction = other.bullet_dir;
		speed = other.new_speed;
	}

	if !(bullet_dir >= 270){
		bullet_dir += 90;
	}else{
		bullet_dir = 270;	
	}
}

instance_destroy();