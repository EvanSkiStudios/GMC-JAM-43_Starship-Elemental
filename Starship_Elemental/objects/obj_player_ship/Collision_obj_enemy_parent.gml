if !(global.Player_ship_visable) return;

if (global.Player_ship_take_dam){
	global.Player_HP -= 1;
	global.Player_ship_take_dam = false;
	alarm[4] = GAMESPEED;
}

with(other){
	instance_create_depth(x,y,depth,obj_explosion_small);
	instance_destroy(id);
}