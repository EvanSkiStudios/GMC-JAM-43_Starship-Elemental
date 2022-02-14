///@desc Quit timer
var start = Gamepad_start();
if (keyboard_check(vk_escape) || (start)){
	game_end();	
}