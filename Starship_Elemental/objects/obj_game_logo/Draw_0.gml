draw_self();

draw_insert_coin();
draw_titlescreen_instructions();
draw_mini_credits();

if (logo_state == LOGO_STATES.intro) {
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
}