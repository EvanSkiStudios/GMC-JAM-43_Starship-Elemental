if (debug_mode) || (global.DRAW_DEBUG){
	
	draw_set_color(c_white);
	draw_set_font(fnt_highscore);
	
	draw_text(10,room_height - 20,"wryd Step-Speed?: "+string(game_get_speed(gamespeed_fps)));
	draw_text(10,room_height - 30,"FPS: "+string(fps));
	draw_text(10,room_height - 40,"FPS RL: "+string(fps_real));
	
	draw_set_default();
}