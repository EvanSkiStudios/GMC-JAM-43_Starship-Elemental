switch(room){
	case rm_stage_01:{
		if (global.player_at_boss){
			if instance_exists(obj_boss1){
				if (obj_boss1.boss_state != BOSS1_STATES.enter_level){
				if (obj_boss1.boss_state != BOSS1_STATES.enter_level_complete){
				if (obj_boss1.boss_state != BOSS1_STATES.first_scream){
				if (obj_boss1.boss_state != BOSS1_STATES.defeated){
				if !(instance_exists(obj_gui_continue)){
					fha_music_crossfade(snd_mus_boss,1000,true);	
				}}}}}
			}
		}
	}break;
}