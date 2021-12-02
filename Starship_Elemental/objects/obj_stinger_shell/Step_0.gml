event_inherited();

if (sprite_index == spr_stinger_shell_open){
	if (image_index >= (image_number - 1)){
		instance_destroy();
	}
}