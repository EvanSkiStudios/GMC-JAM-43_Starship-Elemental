start_y = y;
move_speed = 0.5;

do_wave = true;

do_white_flash = true;
alarm[0] = 2;

can_change = false;
alarm[1] = GAMESPEED;

playSound(SND_SFX_SMARTBOMB_CHANGE,false);
fhAudioSoundSetRepeatDelay(SOUNDS[SND_SFX_SMARTBOMB_CHANGE],250);