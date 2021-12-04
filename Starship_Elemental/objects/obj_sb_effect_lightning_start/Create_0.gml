image_speed = 0.5;

if !(audio_is_playing(snd_sfx_smartbomb_lightning)){
	playSound(SND_SFX_SMARTBOMB_LIGHTNING);
}

if instance_exists(obj_player_ship){
	setParent(obj_player_ship,0,0);
}else{
	instance_destroy();	
}