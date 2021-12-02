sprite_index = spr_stinger_shell_open;
image_speed = 0.2;
speed = 0;

var bullet = instance_create_depth(x,y,depth,obj_bullet_enemy_stinger);
with(bullet){
	direction = other.direction;
	smart_bomb = true;
	speed = 0;
	alarm[1] = 5;
}