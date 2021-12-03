if (image_index > (image_number - 1)){
	image_speed = 0;
	image_index = (image_number - 1);
	fhAudioMusicStop(snd_mus_continue,1000);
}


image_frame = (floor(image_index));

if (image_frame != image_frame_last){
	playSound(SND_SFX_CONTINUE_DRONE,false);
	image_frame_last = (image_frame);
}