for (var i = 0; i < (global.Player_Lives); ++i){
	var x_pos = 30 + (40 * i);
	
	draw_sprite_ext(
		spr_player_ship,
		0,
		x_pos,
		5,
		0.5,
		0.5,
		image_angle,
		c_white,
		image_alpha
	);
}

draw_set_font(fnt_highscore);
draw_text(30,5,"PLACEHOLDER LIVES");