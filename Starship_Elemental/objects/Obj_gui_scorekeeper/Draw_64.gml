draw_set_font(fnt_highscore);

//rainbow
var color = C_RAINBOW;

//so we have the 0's with the score because game maker thinks 00000 == 0 which its right but damn it show my 0s
var real_score = string(global.Player_Score);
var zero_dispaly = "00000000";
var r_score_len = string_length(real_score);
var new_zero_display = string_delete(zero_dispaly,1, r_score_len);

var display_score = new_zero_display+real_score;

draw_set_halign(fa_center);

//background black text
draw_text_color(
	x-1,
	y+1,
	"SCORE"+"\n"+string(display_score),
	c_black,c_black,c_black,c_black,1
);

//actuall text
draw_text_color(
	x,
	y,
	"SCORE"+"\n"+string(display_score),
	c_white,
	c_white,
	color,
	color,
	1
);

//reset
draw_set_default();