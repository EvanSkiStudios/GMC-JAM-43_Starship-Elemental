if event_data[? "name"] == "stop" {
	skeleton_animation_clear(event_data[? "track"]);
	//skeleton_animation_set_frame(event_data[? "track"],skeleton_animation_get_frames(skeleton_animation_get_ext(event_data[? "track"])) );

} else if event_data[? "name"] == "scream" {
	
	//call wasp screetch sound here Evan
	//Maybe make the scream call for reinforcements!!!
	show_debug_message("SCREAM!!!");
	//TO EVEN! Reinforcements
	audio_play_sound(snd_boss1_scream, 1, 0);
	
} else if event_data[? "name"] == "bullet_hell" {
	doing_bullet_hell = true;
} else if event_data[? "name"] == "tail_exposed_false" {
	tail_exposed = false;
	
} else if event_data[? "name"] == "tail_exposed_true" {
	tail_exposed = true;
} else if event_data[? "name"] == "laser" {
	audio_play_sound(snd_tail_laser, 1, 0);
}
