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