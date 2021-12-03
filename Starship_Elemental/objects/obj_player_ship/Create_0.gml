//ship stats
start_x = x;
start_y = y;

last_hp = global.Player_HP;
ship_move_speed = 2;
ship_animation_speed = 0.2;

//flags
can_shoot = true;
can_shoot_smartbomb = true;
do_hp_flash = false;

//ship state
player_ship_state = PLAYER_SHIP_STATES.idle;

//effects
if !instance_exists(obj_ctrl_screenshake){
	instance_create_depth(x,y,-1000,obj_ctrl_screenshake);	
}
if !instance_exists(obj_ship_fire){
	instance_create_depth(x,y,depth-1,obj_ship_fire);	
}
if !instance_exists(obj_smoke_emitter){
	instance_create_depth(x,y,depth-1,obj_smoke_emitter);
}