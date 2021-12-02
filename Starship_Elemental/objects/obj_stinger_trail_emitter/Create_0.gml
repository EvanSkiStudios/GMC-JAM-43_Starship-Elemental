//smoke emitter by Pixellated Hammered Raccoon

emitter_state = EMITTER_STATES.idle;

timer = 0;
fire_extinguish_time = 1 * GAMESPEED;


spawn_smoke = function () {
	var rand = irandom_range(-3, 3);
	var smoke = instance_create_depth(x + rand, y, depth, obj_stinger_trail_particle);
	if (emitter_state == EMITTER_STATES.fire_out) {
		smoke.smoke_color = smoke.white_color;
	}
}

set_damage = function (damage) {
	if (damage == 0) {
		if (emitter_state == EMITTER_STATES.damage_1 || emitter_state == EMITTER_STATES.damage_2 || emitter_state == EMITTER_STATES.damage_3) {
			timer = 0;
			emitter_state = EMITTER_STATES.fire_out;
		} else {
			emitter_state = EMITTER_STATES.idle;
		}
	} else if (damage == 1) {
		emitter_state = EMITTER_STATES.damage_1;
	}
	else if (damage == 2) {
		emitter_state = EMITTER_STATES.damage_2;
	}
	else if (damage == 3) {
		emitter_state = EMITTER_STATES.damage_3;
	}
}

if instance_exists(obj_stinger_shell){
	my_object = instance_nearest(x,y,obj_stinger_shell);
}else{
	instance_destroy();	
}

//sets x offset to the ships wing
if instance_exists(my_object){
	var x_pos_offset = 5;
	setParent(
		my_object, 
		( ( -abs(sprite_get_width(my_object.sprite_width)) ) - x_pos_offset),
		0
	);
}else{
	instance_destroy();	
}