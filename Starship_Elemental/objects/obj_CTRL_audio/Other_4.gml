switch(room){
	
	case rm_intro:{
		//fha_music_crossfade(snd_Mus_MM_intro,100,true);
		fha_music_crossfade(snd_Mus_MM,2000,true);
	}break;
	
	case rm_mainmenu:{
		fha_music_crossfade(snd_Mus_MM,2000,true);
	}break;
	
	case rm_stage_01:{
		fha_music_crossfade(snd_mus_level_1,100,true);	
	}break;
	
	case rm_victory_sequence:{
		fha_music_crossfade(snd_mus_credits,2500,true);
	}break;
	
}