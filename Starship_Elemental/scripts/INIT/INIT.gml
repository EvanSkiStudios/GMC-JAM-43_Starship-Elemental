//############## macros
#macro GAME_RES_WIDTH  480 
#macro GAME_RES_HEIGHT  270

#macro WINDOW_WIDTH  960
#macro WINDOW_HEIGHT 540

#macro C_RAINBOW make_color_hsv(current_time*0.1 mod 255,120,250);

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
global.Player_can_pickup_bombs = true;

global.SEQ_DIE_DO_ONCE = true;

global.smartbomb_stinger_kill_count = 0;

global.Player_Score = 0;
global.Player_Lives = 3;
global.Player_HP = 3;


//SMART BOMBS
enum smartbomb_types{
	none = 0,
	earth,
	fire,
	ice,
	wind
}

global.Player_bombs = 0;
global.Player_smartbomb_max = 9;

global.Player_Smartbomb_array = array_create(global.Player_smartbomb_max,smartbomb_types.none);

//FONTS
var map_string = (" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!.,");
global.font_galatica = font_add_sprite_ext(spr_font_galatica, map_string, true, 3);
#macro FONT_GALATICA global.font_galatica

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


function wave(from, to, duration, offset){
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
	a4 = (to - from) * 0.5;
	return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi*2)) * a4;	
}