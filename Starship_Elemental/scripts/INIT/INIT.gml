//############## macros
#macro GAME_IS_MOBILE (os_type == os_android)

#macro GAME_RES_WIDTH  480 
#macro GAME_RES_HEIGHT  270

#macro WINDOW_WIDTH  960
#macro WINDOW_HEIGHT 540

#macro C_RAINBOW (make_color_hsv(current_time*0.1 mod 255,120,250))

//8 direction macros cause fuck figuring out the direction
#region directions
#macro DIR_RIGHT 0
#macro DIR_NORTH_EAST 45
#macro DIR_UP 90
#macro DIR_NORTH_WEST 135
#macro DIR_LEFT 180
#macro DIR_SOUTH_WEST 225
#macro DIR_DOWN 270
#macro DIR_SOUTH_EAST 315
#endregion

#macro GAMESPEED game_get_speed(gamespeed_fps)

#macro GAMEPAD_START (INPUT.input_pressed(0, input_action.start))


//############## globals

global.DEBUG = false;
global.DRAW_DEBUG = false;

if (global.DEBUG){
	show_debug_message("################# DEBUG MODE IS ON!! #################");	
}

global.GAMEPaused = false;

global.GAMEPADISCONENCTED = false;


global.Player_control_enabled = true;
global.Player_ship_visable = true;
global.Player_ship_take_dam = false;
global.Player_can_die = false;
global.Player_can_pickup_bombs = true;
global.Gamepad_vibration = true;


global.player_at_boss = false;

global.SEQ_DIE_DO_ONCE = true;

global.smartbomb_stinger_kill_count = 0;

global.Player_Score = 0;
global.Player_Lives = 3;
global.Player_HP = 3;

window_set_cursor(cr_none);


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

function Gamepad_select(){
	var select = gamepad_button_check_pressed(11, gp_select);
	var select = gamepad_button_check_pressed(10, gp_select);
	var select = gamepad_button_check_pressed(9, gp_select);
	var select = gamepad_button_check_pressed(8, gp_select);
	var select = gamepad_button_check_pressed(7, gp_select);
	var select = gamepad_button_check_pressed(6, gp_select);
	var select = gamepad_button_check_pressed(5, gp_select);
	var select = gamepad_button_check_pressed(4, gp_select);
	var select = gamepad_button_check_pressed(3, gp_select);
	var select = gamepad_button_check_pressed(2, gp_select);
	var select = gamepad_button_check_pressed(1, gp_select);
	var select = gamepad_button_check_pressed(0, gp_select);
	
	return(select);
}

function Gamepad_start(){
	var select = gamepad_button_check_pressed(11, gp_start);
	var select = gamepad_button_check_pressed(10, gp_start);
	var select = gamepad_button_check_pressed(9, gp_start);
	var select = gamepad_button_check_pressed(8, gp_start);
	var select = gamepad_button_check_pressed(7, gp_start);
	var select = gamepad_button_check_pressed(6, gp_start);
	var select = gamepad_button_check_pressed(5, gp_start);
	var select = gamepad_button_check_pressed(4, gp_start);
	var select = gamepad_button_check_pressed(3, gp_start);
	var select = gamepad_button_check_pressed(2, gp_start);
	var select = gamepad_button_check_pressed(1, gp_start);
	var select = gamepad_button_check_pressed(0, gp_start);
	
	return(select);
}


function a_gamepad_connected(){
	var gamepad = 0;
	if gamepad_is_connected(0) gamepad += 1;
	if gamepad_is_connected(1) gamepad += 1;
	if gamepad_is_connected(2) gamepad += 1;
	if gamepad_is_connected(3) gamepad += 1;
	if gamepad_is_connected(4) gamepad += 1;
	if gamepad_is_connected(5) gamepad += 1;
	if gamepad_is_connected(6) gamepad += 1;
	if gamepad_is_connected(7) gamepad += 1;
	if gamepad_is_connected(8) gamepad += 1;
	if gamepad_is_connected(9) gamepad += 1;
	if gamepad_is_connected(10) gamepad += 1;
	if gamepad_is_connected(11) gamepad += 1;
	
	if (gamepad > 0) global.GAMEPADISCONENCTED = true;
	if (gamepad <= 0) global.GAMEPADISCONENCTED = false;
}

function vibrate_gamepad(left,right){
	if !(global.Gamepad_vibration) return;
	
	gamepad_set_vibration(0,left,right);
	gamepad_set_vibration(1,left,right);
	gamepad_set_vibration(2,left,right);
	gamepad_set_vibration(3,left,right);
	gamepad_set_vibration(4,left,right);
	gamepad_set_vibration(5,left,right);
	gamepad_set_vibration(6,left,right);
	gamepad_set_vibration(7,left,right);
	gamepad_set_vibration(8,left,right);
	gamepad_set_vibration(9,left,right);
	gamepad_set_vibration(10,left,right);
	gamepad_set_vibration(11,left,right);
	
}

function invaild_keys(){
	if !keyboard_check_released(vk_f7){
	if !keyboard_check_released(vk_f11){
	if !keyboard_check_released(vk_alt){
	if !keyboard_check_released(vk_enter){
	if !keyboard_check_released(vk_escape){
	if !keyboard_check(vk_f7){
	if !keyboard_check(vk_f11){
	if !keyboard_check(vk_alt){
	if !keyboard_check(vk_enter){
	if !keyboard_check(vk_escape){
		return(false);
	}}}}}}}}}}
	return(true);
}

function fadetoroom(gotoroom, dur, _color){
	var inst = instance_create_depth(0,0,0,obj_gui_fadeout);
	
	with (inst){
		targetroom = gotoroom;
		duration = dur;
		color = _color;
	}
}


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