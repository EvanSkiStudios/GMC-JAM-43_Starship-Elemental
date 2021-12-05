if (create_explosion){
	instance_create_depth(x,y,depth,obj_explosion);
	var bomb = choose(obj_smartbomb_earth,obj_smartbomb_fire,obj_smartbomb_ice,obj_smartbomb_wind);
	instance_create_depth(x,y,depth,bomb);
}