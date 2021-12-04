//reset draw
draw_set_default();
draw_set_color(c_white);

//draw_background box
//draw_sprite_ext(spr_text_background,0,0,352,30,6,0,c_white,1);
/*
draw_set_alpha(0.6);
draw_rectangle_color(0,y-20,room_width,room_height,c_black,c_black,c_black,c_black,false);
draw_set_alpha(1.0);
*/


//What logo we want
talker_sprite = text[text_current][TSprite];

//draw_talker_outline
//draw_sprite(spr_talker_logo_box,0,20,400);
//draw_talker
draw_sprite(talker_sprite,0,25,405);


/*
With that done, it's time to actually draw our dialogue text! First, we need to check the current last character of the text being drawn,
and if it's not the last character of the whole text, advance it by the speed that we set in the create event:
*/

var len = string_length(text[text_current][TContent]); 
if (char_current < len) { 
	char_current += char_speed;
	
	voice_profile = text[text_current][TVoice];
	//play audio
	typewriter_audio(voice_profile);
}


/*
To draw the text, we simply use the string_copy() function to copy the section of the 
total text from the beginning to the current last character and then draw that, like this:
*/

//draw text settings
draw_set_halign(display_text_H_align);
draw_set_valign(fa_top);
draw_set_color(text[text_current][TColor]);
draw_set_font(text_font);

text_color = text[text_current][TColor];


var _str = string_copy(text[text_current][TContent], 1, char_current);
draw_text_color(text_x, text_y,  _str, text_color,text_color,text_color,text_color,1);


//reset draw
draw_set_default();