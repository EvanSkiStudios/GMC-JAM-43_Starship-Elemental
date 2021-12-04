if (image_index > (image_number - 1)){
	image_speed = 0;
	image_index = (image_number - 1);
	fhAudioMusicStop(snd_mus_continue,1000);
	can_press_any_key = false;
	ended = true;
}


image_frame = (floor(image_index));

if (image_frame != image_frame_last){
	playSound(SND_SFX_CONTINUE_DRONE,false);
	image_frame_last = (image_frame);
}

if (can_press_any_key && !(ended)){
	if ( keyboard_check_pressed(vk_anykey) || GAMEPAD_START){
		fhAudioMusicStop(snd_mus_continue,1000);
		if !instance_exists(obj_seq_restart){
			instance_create_depth(0,0,-12000,obj_seq_restart);
		}
		instance_destroy();
	}
}

if (ended){
	
}