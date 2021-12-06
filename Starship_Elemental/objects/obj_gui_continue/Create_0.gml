image_speed = 0;
alarm[0] = GAMESPEED * 0.25;

depth += -10000;

can_press_any_key = false;
ended = false;
do_fade = 0;

fha_music_stop(snd_mus_boss);
fhAudioMusicCrossfade(snd_mus_continue,1000,false);
playSound(SND_SFX_CONTINUE_DRONE,false);
image_frame_last = (floor(image_index));