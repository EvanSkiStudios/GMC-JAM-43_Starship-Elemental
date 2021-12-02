bullet_dir = 0;

//spawns heat seekers in all 8 directions
for(var i = 0; i < 8; ++i){
	var bullet = instance_create_depth(x,y,depth,obj_stinger_shell);
	with(bullet){
		direction = other.bullet_dir;
		smart_bomb = true;
	}

	if !(bullet_dir >= 315){
		bullet_dir += 45;
	}else{
		bullet_dir = 315;	
	}
}

instance_destroy();