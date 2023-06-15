draw_self();

titlescreen_instructions = (
	"HOW TO PLAY"+"\n"+
	"MOVEMENT: WASD, ARROWS, DPAD, or ANALOG"+"\n"+
	"FIRE: SPACEBAR, NUMPAD 0, or Gamepad Y"+"\n"+
	"SMARTBOMB: CTRL or Gamepad B"+"\n"+
	"PAUSE: ESC or Gamepad START"+"\n"+
	"You can also play with a controller!!!"+"\n"+
	"READ THE README FOR MORE INFO!"
);

if (global.IS_GX_EXPORT){
	titlescreen_instructions = (
		"HOW TO PLAY"+"\n"+
		"MOVEMENT: WASD, ARROWS"+"\n"+
		"FIRE: SPACEBAR, NUMPAD 0"+"\n"+
		"SMARTBOMB: SHIFT"+"\n"+
		"PAUSE: ESC"+"\n"+
		"You can also play with a controller!!!"+"\n"+
		"READ THE README FOR MORE INFO!"
	);
}


if (GAME_IS_MOBILE){
	titlescreen_instructions = (
	"HOW TO PLAY"+"\n"+
	"MOVEMENT: Tilt your phone where you want to move!"+"\n"+
	"FIRE: Press down anywhere on the screen!"+"\n"+
	"SMARTBOMB: Tap the smartbombs in the top right!"+"\n"+
	"PAUSE: Double Tap anywhere!"+"\n"+
	"You can also play with a bluetooth controller!!!"
	);
}

if (global.GAMEPADISCONENCTED){
	titlescreen_instructions =(
	"HOW TO PLAY"+"\n"+
	"MOVEMENT: DPAD, or ANALOG"+"\n"+
	"FIRE: Gamepad Y/ PS Tri / Joycon X"+"\n"+
	"SMARTBOMB: Gamepad B / PS O / Joycon A"+"\n"+
	"PAUSE: Gamepad START"+"\n"+
	"TOGGLE VIBRATE: Gamepad SELECT"+"\n"+
	"READ THE README FOR MORE INFO!"
	);
}

draw_set_color(C_PATCOLOR);

splash_text_angle = wave(-15,15,2,0);

draw_text_transformed(
x + (sprite_width/2) - (string_width(splash_screen_text)/2)+30,
y + (sprite_height/2),
splash_screen_text,
1,1,
splash_text_angle
);
draw_set_color(c_white);


if (global.IS_GX_EXPORT){
	draw_set_font(fnt_highscore);
	draw_text_color(
	x,y+(sprite_height/2),
	"GX Games Flavor!",
	C_PATCOLOR,C_PATCOLOR,C_PATCOLOR,C_PATCOLOR, 1);
	
	draw_set_font(-1);
}

if (GAME_IS_LINUX){
	draw_set_font(fnt_highscore);
	
	draw_text_color(
	x+(sprite_width/2)-50,y+(sprite_height/2),
	"Linux Flavor!",
	C_PATCOLOR,C_PATCOLOR,C_PATCOLOR,C_PATCOLOR, 1);
	
	draw_set_font(-1);
}

if (GAME_IS_MOBILE){
	draw_set_font(fnt_highscore);
	
	draw_text_color(
	x+(sprite_width/2)-50,y+(sprite_height/2),
	"Android Flavor!",
	C_PATCOLOR,C_PATCOLOR,C_PATCOLOR,C_PATCOLOR, 1);
	
	draw_set_font(-1);
}

draw_insert_coin();
draw_titlescreen_instructions();
draw_mini_credits();

if (logo_state == LOGO_STATES.intro) {
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
}