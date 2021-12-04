x -= move_speed;

if (do_wave){
	y_sway = wave(start_y-5, start_y+5, 3, 0);

	y = y_sway;
}