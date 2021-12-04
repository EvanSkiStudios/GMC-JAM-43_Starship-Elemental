if (global.Player_ship_take_dam){
	global.Player_HP -= 1;
	global.Player_ship_take_dam = false;
	alarm[4] = GAMESPEED;
}

instance_destroy(other);