x += x_speed;
y += y_speed;

if (x < -sprite_width) {
	x = display_get_gui_width() + sprite_width;	
	y = irandom_range(0, display_get_gui_height());
}

