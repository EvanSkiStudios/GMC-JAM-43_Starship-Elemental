draw_set_alpha(0.75);

draw_rectangle_color(
	0,0,
	surface_get_width(application_surface),
	surface_get_height(application_surface),
	c_black,c_black,c_black,c_black,
	false
)

draw_set_alpha(1);

draw_sprite_ext(spr_gui_continue,9,GAME_RES_WIDTH/2,room_height/2,1,1,image_angle,c_white,1);

draw_set_font(FONT_GALATICA);
draw_set_color(c_white);
draw_set_halign(fa_center);


draw_text(GAME_RES_WIDTH/2,room_height/2 - ( (sprite_get_height(spr_gui_continue)/2) + 40),"CONTINUE?");

draw_set_font(fnt_highscore);
var color = C_RAINBOW;
draw_text_color(GAME_RES_WIDTH/2,room_height/2 + ( (sprite_get_width(spr_gui_continue)/2) + 30),"Press AnyKey or START!",c_white,c_white,color,color,1);

draw_set_default();