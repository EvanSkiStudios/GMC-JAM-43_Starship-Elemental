effect_length = (GAMESPEED * 2);

alarm[0] = effect_length;
alarm[1] = 1;

my_sound = noone;
if !(audio_is_playing(snd_sfx_smartbomb_earth_rumble)){
	my_sound = playSound(SND_SFX_SMARTBOMB_EARTH_RUMBLE,true);
}