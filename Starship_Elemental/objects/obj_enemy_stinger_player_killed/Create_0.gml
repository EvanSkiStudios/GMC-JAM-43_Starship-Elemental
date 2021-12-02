if (global.smartbomb_stinger_kill_count < 7){
	global.smartbomb_stinger_kill_count += 1;
}else{
	instance_create_depth(x,y,depth-1, obj_smartbomb_earth);
	global.smartbomb_stinger_kill_count = 0;
	instance_destroy();
}