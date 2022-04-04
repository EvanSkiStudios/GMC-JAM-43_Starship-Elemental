var not_these_keys = invaild_keys();
if !(not_these_keys){
	if keyboard_check_released(vk_anykey){
		room_goto(rm_intro);		
	}
}