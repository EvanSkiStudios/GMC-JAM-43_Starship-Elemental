// Inherit the parent event
event_inherited();

playSound(SND_SFX_SMARTBOMB_ICE);

killed_score = 200;

start_y = y;
move_speed = 0.5;

enemy_hp = 1;
hp_last = enemy_hp;