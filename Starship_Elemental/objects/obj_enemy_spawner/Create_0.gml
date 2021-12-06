if !(enabled) instance_destroy();

spawn_enemies = false;
enemy_wave_state = 0;

count = 0;

layer_create(90,"enemy_wave_sequance");

can_spawn = true;

//player dies at boss, respawn at boss
if (global.player_at_boss){
	enemy_wave_state = 72;
	can_spawn = true;
	alarm[0] = -1;
	alarm[1] = -1;	
}