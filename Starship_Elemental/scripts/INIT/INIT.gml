//############## macros
#macro GAME_RES_WIDTH  480 
#macro GAME_RES_HEIGHT  270

#macro WINDOW_WIDTH  960
#macro WINDOW_HEIGHT 540

//############## globals
global.Player_control_enabled = true;


//############## FUNCTIONS
function ScreenShot()
{
	static num = 0;
	
	var filename = (working_directory + "\\ScreenShots\\Screen_");
	
	do{
		//check to see if there is already a png
		var new_filename = (filename+string(num)+".png");
		if (file_exists(new_filename)){
			//if there is add one to the number until there isnt one
			++num;
		}
	}
	until (!file_exists(new_filename));
	
	//save the png
	screen_save(new_filename)
	//add to the number for a future png
	show_debug_message("Screen shot "+string(num)+" saved");
	++num;
}

function draw_set_default(){
//Sets all Draw options to there default states.

draw_set_alpha(1);
draw_set_circle_precision(24);
draw_set_color(c_black);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_lighting(false);
draw_set_valign(fa_top);

}