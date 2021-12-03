function Spawn_wave(wave_to_seq_spawn, spawn_speed = 2){
	//wave sequance is the sequance to use
	//spawn speed is how fast the wave object travels until it hits the wave spawn trigger
	
	//passes agruments to variables as with can not run with local variable scope
	wave_seq = wave_to_seq_spawn;
	spawner_speed = spawn_speed;
	
	var wave = instance_create_depth(x,y,depth,obj_enemy_wave_spawner);
	with(wave){
		wave_sequance = other.wave_seq;
		speed = other.spawner_speed;
	}	
}