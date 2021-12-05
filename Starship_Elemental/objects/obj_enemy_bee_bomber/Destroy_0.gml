instance_create_depth(x,y,depth,obj_explosion);

if (do_stingers){
	instance_create_depth(x,y,depth,obj_bomber_bullet_spawner);
}else{
	if (player_killed){
		var bomb = choose(obj_smartbomb_earth,obj_smartbomb_fire,obj_smartbomb_ice,obj_smartbomb_wind);
		instance_create_depth(x,y,depth,bomb);	
	}
}