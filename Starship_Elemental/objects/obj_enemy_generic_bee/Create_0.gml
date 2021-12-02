image_speed = 1;

var is_shooter = irandom(100);

if (is_shooter < 33){
	bullet_count = 0;
	alarm[1] = GAMESPEED * 2;
}

enemy_hp = 4;
hp_last = enemy_hp;

enemy_attack_speed = 3;

do_hp_flash = false;