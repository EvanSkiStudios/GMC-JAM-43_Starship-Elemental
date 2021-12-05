if (enemy_hp <= 0){
	global.Player_Score += killed_score;
	do_stingers=false;
	player_killed = true;
	instance_destroy();
}

if !(do_hp_flash) && (enemy_hp != hp_last){
	alarm[0] = (GAMESPEED / (GAMESPEED/2));
	hp_last = enemy_hp;
	do_hp_flash = true;	
}