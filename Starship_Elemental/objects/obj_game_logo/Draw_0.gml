draw_self();

if (global.IS_GX_EXPORT){
	draw_set_font(fnt_highscore);
	
	draw_text_color(
	x+(sprite_width/2)-50,y+(sprite_height/2),
	"Opera GXC Flavor!",
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