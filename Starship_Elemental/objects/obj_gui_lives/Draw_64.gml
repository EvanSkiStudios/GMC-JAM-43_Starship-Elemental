for (var i = 0; i < (global.Player_Lives); ++i){
	var x_pos = (x - 30) + (30 * i);
	
	draw_sprite_ext(
		spr_player_ship,0,
		x_pos,
		y + 15,
		0.5,0.5,
		image_angle,c_white,image_alpha
	);
}

draw_set_halign(fa_center);
draw_set_font(fnt_highscore);

draw_text_color(
	x-1,y+1,
	"LIVES",
c_black,c_black,c_black,c_black,1);

var color = C_RAINBOW;
draw_text_color(
	x,y,
	"LIVES",
	c_white,c_white,
	color,color,
1);