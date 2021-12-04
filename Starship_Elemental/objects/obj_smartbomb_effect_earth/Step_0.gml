vibrate_gamepad(1,1);

if (instance_exists(obj_ctrl_screenshake)){
	obj_ctrl_screenshake.shake = true;
	obj_ctrl_screenshake.alarm[0] = GAMESPEED * 1;
}else{
	return(-1);	
}