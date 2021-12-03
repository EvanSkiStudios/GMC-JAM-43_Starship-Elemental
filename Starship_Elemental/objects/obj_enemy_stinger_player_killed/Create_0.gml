if (global.smartbomb_stinger_kill_count < 7){
	global.smartbomb_stinger_kill_count += 1;
}else{
	
	var smartbomb = choose(obj_smartbomb_earth);
	instance_create_depth(x,y,depth-1, smartbomb);
	global.smartbomb_stinger_kill_count = 0;
	instance_destroy();
}