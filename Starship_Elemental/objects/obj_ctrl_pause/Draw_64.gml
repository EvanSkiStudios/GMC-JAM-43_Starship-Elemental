if !(global.GAMEPaused) return;

if !(global.IS_GX_EXPORT){
	draw_sprite_ext(pause_sprite,0,0,0,0.5,0.5,image_angle,c_white,1);
}else{
	
	if (!(surface_exists(global.GXC_Pause_Surface))){
		global.GXC_Pause_Surface = surface_create(display_get_gui_width(),display_get_gui_height());
		surface_copy(global.GXC_Pause_Surface,0,0,	view_surface_id[0]);	
	}
	
	draw_surface(global.GXC_Pause_Surface,0,0);
	
	/*
	draw_set_alpha(1);

	draw_rectangle_color(
		0,0,
		surface_get_width(application_surface),
		surface_get_height(application_surface),
		c_black,c_black,c_red,c_red,
		false
	);
	*/
}

draw_set_alpha(0.75);

draw_rectangle_color(
	0,0,
	surface_get_width(application_surface),
	surface_get_height(application_surface),
	c_black,c_black,c_black,c_black,
	false
);

draw_set_alpha(1);

draw_set_font(FONT_GALATICA);
draw_set_color(c_white);
draw_set_halign(fa_center);

draw_text(GAME_RES_WIDTH/2,( (room_height/2) - 40),"PAUSED");


draw_set_font(fnt_highscore);

var color = C_RAINBOW;
draw_text_color(GAME_RES_WIDTH/2,( (room_height/2) + 20),
"Press ESC or START to unpause!\nHold ESC or START for 3 secs to quit!!",
c_white,c_white,color,color,1);

if (exiting){
	draw_set_halign(fa_left);
	draw_text_color(100,10,
	"Keep Holding ESC or START to quit!!",
	c_white,c_white,color,color,1);	
}

draw_set_default();