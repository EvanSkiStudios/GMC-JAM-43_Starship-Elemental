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

killed_score = 50;

enemy_hp = 4;
hp_last = enemy_hp;

create_explosion = true;

enemy_attack_speed = 3;

do_hp_flash = false;