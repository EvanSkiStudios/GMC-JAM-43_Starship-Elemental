if instance_exists(obj_boss1){
	if (obj_boss1.boss_state = BOSS1_STATES.defeated){
		global.Player_Score += 99000 + irandom_range(26000,999999);
		playSound(SND_SFX_EXPLOSION);
		obj_enemy_spawner.can_spawn = true;
		obj_enemy_spawner.enemy_wave_state = 100;
		instance_destroy();
	}
}