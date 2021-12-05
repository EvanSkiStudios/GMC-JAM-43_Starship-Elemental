// Inherit the parent event
event_inherited();

image_speed = 1;

var shoot_time_rng = irandom_range(-10,10);

if !(always_shoot){
	var is_shooter = irandom(100);

	if (is_shooter > 33){
		bullet_count = 0;
		alarm[1] = (GAMESPEED * 2) + shoot_time_rng;
	}
}else{
	bullet_count = 0;
	alarm[1] = (GAMESPEED * 2) + shoot_time_rng;	
}