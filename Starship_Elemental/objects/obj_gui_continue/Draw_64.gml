draw_set_alpha(0.75);

draw_rectangle_color(
	0,0,
	surface_get_width(application_surface),
	surface_get_height(application_surface),
	c_black,c_black,c_black,c_black,
	false
)

draw_set_alpha(1);

draw_self();

draw_set_font(FONT_GALATICA);
draw_set_color(c_white);
draw_set_halign(fa_center);


draw_text(x,y - ( (sprite_height/2) + 40),"CONTINUE?");

draw_set_font(fnt_highscore);
var color = C_RAINBOW;
draw_text_color(x,y + ( (sprite_height/2) + 20),"Press AnyKey or START!",c_white,c_white,color,color,1);

draw_set_default();