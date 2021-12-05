if (global.smartbomb_stinger_kill_count < 7){
	global.smartbomb_stinger_kill_count += 1;
}else{
	
	var smartbomb = choose(obj_smartbomb_earth,obj_smartbomb_fire,obj_smartbomb_ice,obj_smartbomb_wind);
	instance_create_depth(x,y,depth-1, smartbomb);
	global.smartbomb_stinger_kill_count -= 7;
	instance_destroy();
}