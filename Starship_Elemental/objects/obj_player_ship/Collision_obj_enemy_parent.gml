global.Player_HP -= 1;

with(other){
	instance_create_depth(x,y,depth,obj_explosion_small);
	instance_destroy(id);
}