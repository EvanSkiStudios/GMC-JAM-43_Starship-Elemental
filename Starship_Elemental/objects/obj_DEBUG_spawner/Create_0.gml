if !(enabled) instance_destroy();

spawn_enemies = false;
enemy_wave_state = 0;

layer_create(90,"enemy_wave_sequance");

can_spawn = true;

count = 0;