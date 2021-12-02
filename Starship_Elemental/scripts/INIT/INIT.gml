//############## macros
#macro GAME_RES_WIDTH  480 
#macro GAME_RES_HEIGHT  270

#macro WINDOW_WIDTH  960
#macro WINDOW_HEIGHT 540

//8 direction macros cause fuck figuring out the direction
#macro DIR_RIGHT 0
#macro DIR_RIGHT_UP 45
#macro DIR_UP 90
#macro DIR_UP_LEFT 135
#macro DIR_LEFT 180
#macro DIR_LEFT_DOWN 225
#macro DIR_DOWN 270
#macro DIR_DOWN_LEFT 315


#macro GAMESPEED game_get_speed(gamespeed_fps)

//############## globals
global.Player_control_enabled = true;
global.Player_ship_visable = true;
global.Player_ship_take_dam = true;
global.Player_can_die = true;

global.SEQ_DIE_DO_ONCE = true;

global.Player_Score = 0;
global.Player_Lives = 3;
global.Player_HP = 3;

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

function followParent()
{
    if(instance_exists(myParent))
    {
        x = myParent.x + lengthdir_x(myParentChildDistance, myParentChildAngle + myParent.image_angle);
        y = myParent.y + lengthdir_y(myParentChildDistance, myParentChildAngle + myParent.image_angle);
        image_angle = myParent.image_angle;
    }
    else
        instance_destroy();
}

function setParent(newParent, xOffset, yOffset)
{
    myParent = newParent;
    myParentChildDistance = point_distance(0, 0, xOffset, yOffset);
    myParentChildAngle = point_direction(0, 0, xOffset, yOffset);    
    followParent();
}
