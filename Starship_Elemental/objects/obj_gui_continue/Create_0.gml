image_speed = 0;
alarm[0] = GAMESPEED * 0.25;

depth += -10000;

fhAudioMusicCrossfade(snd_mus_continue,1000,false);
playSound(SND_SFX_CONTINUE_DRONE,false);
image_frame_last = (floor(image_index));