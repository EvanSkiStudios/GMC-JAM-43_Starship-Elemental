///@desc health regen
global.Player_HP += 1;

if (global.Player_HP != 3){
	alarm[2] = (GAMESPEED * 8);	
}