///@desc Turn off
if (my_sound != noone){
	fhAudioSoundStop(my_sound);
}

alarm[1] = -1;
instance_destroy();