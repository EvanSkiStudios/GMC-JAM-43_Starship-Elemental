if layer_sequence_is_finished(level_start_sequance){
	if layer_sequence_exists(
	"level_start_sequance",
	level_start_sequance
	) 
	instance_destroy(id);
}

if !keyboard_check_released(ord("R")) &&
!keyboard_check_released(vk_f7)
{
	if ( keyboard_check_released(vk_anykey) || GAMEPAD_START || mobile_user_tap){

			instance_destroy(id);	
	}
}