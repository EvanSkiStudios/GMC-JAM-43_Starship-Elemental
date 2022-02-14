draw_set_halign(fa_center);

draw_set_font(global.font_galatica);
draw_text(GAME_RES_WIDTH/2,30,"WARNING!");

draw_set_font(fnt_highscore);
draw_text_color(GAME_RES_WIDTH/2,100,"This is the Opera GX export of the GMC Jam 43 Edition!\nSome gameplay effects will be affected by this export!\nFor the full intended experience,\nPlease play the itch.io version.\nOtherwise we still hope you have fun!\n\nMAKE SURE FULLSCREEN IS TURNED ON!!!",
c_white,c_white,C_RAINBOW,C_RAINBOW,1);

if (can_press_anykey){
	draw_text_color(GAME_RES_WIDTH/2,200,"Press anykey to start!",
	c_white,c_white,C_RAINBOW,C_RAINBOW,1);		
}