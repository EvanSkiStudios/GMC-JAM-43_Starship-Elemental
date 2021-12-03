var bomb_array_length = array_length(global.Player_Smartbomb_array);


draw_set_halign(fa_center);
//draw title
var color = c_black;
draw_text_color(
	x - 1,
	y +1,
	"SMART-BOMBS",
	color,color,color,color,
	image_alpha
);

var color = C_RAINBOW;
draw_text_color(
	x,
	y,
	"SMART-BOMBS",
	c_white,c_white,color,color,
	image_alpha
);

draw_set_halign(fa_left);

//add bomb we picked up to array
for (var i = 0; i < bomb_array_length; ++i){
	
	var current_bomb_slot = global.Player_Smartbomb_array[i];	
	var sprite_to_draw;
	switch(current_bomb_slot){
			
		default:
		case smartbomb_types.none:{
			sprite_to_draw = -1;
		}break;
			
		case smartbomb_types.earth:{
			sprite_to_draw = spr_bomb_earth;
		}break;
			
		case smartbomb_types.fire:{
			sprite_to_draw = spr_bomb_fire;
		}break;
			
		case smartbomb_types.ice:{
			sprite_to_draw = spr_bomb_ice;
		}break;
			
		case smartbomb_types.wind:{
			sprite_to_draw = spr_bomb_wind;
		}break;
	};
	
	if (sprite_to_draw != -1){
		//if first draw special
		if (i == 0){
			draw_sprite_ext(
			sprite_to_draw,0,
			draw_start_x - ( ((sprite_get_width(sprite_to_draw) + draw_offset) - 5) ),
			draw_start_y,
			1,1,image_angle,c_white,image_alpha);
		}else{
			//draw rest
			draw_sprite_ext(
			sprite_to_draw,0,
			draw_start_x + (draw_offset * i),
			draw_start_y,
			1,1,image_angle,c_white,image_alpha);
		}
	}
}
draw_set_default();