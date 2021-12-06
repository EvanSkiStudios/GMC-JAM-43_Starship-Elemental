coin_in = false;
titlescreen_insert_coin = "INSERT COIN(S)";
titlescreen_instructions = "HOW TO PLAY\nMOVEMENT: WASD, ARROWS, DPAD, or ANALOG\nFIRE: SPACEBAR, NUMPAD 0, or Gamepad Y\nSMARTBOMB: CTRL or Gamepad B\nPAUSE: ESC or Gamepad START\nTOGGLE VIBRATE: Gamepad SELECT\nREAD THE README FOR MORE INFO!";
titlescreen_mini_credits = "COPYRIGHT 2021 PIXELLATED HAMMERED RACCOON";
titlescreen_press_any = "PRESS ANY KEY TO START";

logo_state = LOGO_STATES.intro;
timer = 0;
shine_delay = 3 * room_speed;

image_speed = 0;
alpha = 1;

enum LOGO_STATES {
	intro,
	idle,
	shining,
}

prepare_rainbow_text = function () {
	draw_set_color(C_PATCOLOR);
	draw_set_halign(fa_center);
	draw_set_font(fnt_titlescreen);
}

draw_insert_coin = function () {
	prepare_rainbow_text();
	draw_text(display_get_gui_width() * .5, display_get_gui_height() * .5, titlescreen_insert_coin);
	draw_set_color(c_white);
}

draw_titlescreen_instructions = function () {
	prepare_rainbow_text();
	draw_text(display_get_gui_width() * .5, display_get_gui_height() * .7, titlescreen_instructions);
	draw_set_color(c_white);
}

draw_mini_credits = function () {
		prepare_rainbow_text();
		draw_text(display_get_gui_width() * .5, display_get_gui_height() * .95, titlescreen_mini_credits);
		draw_set_color(c_white);
}