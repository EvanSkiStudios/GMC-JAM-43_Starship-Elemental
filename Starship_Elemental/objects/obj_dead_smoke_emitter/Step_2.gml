switch (emitter_state) {
	case EMITTER_STATES.idle:
	
	break;
	case EMITTER_STATES.fire_out:
	
		timer ++;
		if (timer >= fire_extinguish_time) {
			timer = 0;
			emitter_state = EMITTER_STATES.idle;	
			return;
		}
	
		for (var i = 0; i < 3; i++) {
			var rand = irandom_range(0, 3);
			if (rand == 2) {
				spawn_smoke();
			}
		}
	break;
	case EMITTER_STATES.damage_1:
		for (var i = 0; i < 2; i++) {
			spawn_smoke();
		}
	break;
	case EMITTER_STATES.damage_2:
	for (var i = 0; i < 3; i++) {
			spawn_smoke();
		}
	
	break;
	case EMITTER_STATES.damage_3:
	for (var i = 0; i < 4; i++) {
			spawn_smoke();
		}
	
	break;
}