image_speed = 0.5;

if instance_exists(obj_player_ship){
	setParent(obj_player_ship,0,0);
}else{
	instance_destroy();	
}