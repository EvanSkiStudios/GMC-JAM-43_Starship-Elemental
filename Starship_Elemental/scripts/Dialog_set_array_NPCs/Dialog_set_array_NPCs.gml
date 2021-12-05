function Dialog_set_array_NPCs(){
	//reset array
	text = undefined;
	var i = 0;
	
	switch(my_convo)
	{
		default:{
			text[i] = "ERROR!!";
			text[++i] = "Text in array for npc is not set for current convo number "+string(global.game_convo_number)+" !!";
		}break;
		
		//DEFUALT DEBUG CONVO
		case 0:{
			text[i][TContent] = "\"I can always save the earth another time!\"";
			text[i][TColor] = c_lime;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 0;
			
			text[++i][TContent] = "\"Well crap.\"";
			text[i][TColor] = c_lime;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 0;
		}break;
		
		case 1:{
			text[i][TContent] = "A strange object approches Earth.";
			text[i][TColor] = c_white;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 1;
		}break;
		
		case 2:{
			text[i][TContent] = "An invasion ensues...";
			text[i][TColor] = c_white;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 1;
		}break;
		
		case 3:{
			text[i][TContent] = "\"There's Only one Hope...\"";
			text[i][TColor] = c_white;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 1;
		}break;
		
		case 4:{
			text[i][TContent] = "\"We must launch the prototype!\"";
			text[i][TColor] = c_white;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 1;
		}break;
		
		case 5:{
			text[i][TContent] = "\"Stop that Raccoon!\"";
			text[i][TColor] = c_white;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 1;
		}break;
		
		case 6:{
			text[i][TContent] = "\"Screw this! Im out of Here!\"";
			text[i][TColor] = c_white;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 1;
		}break;
	}
	//sets last array position to the length of the array
	//array length counts 0 as 1 so we remove 1 
	text_last = (array_length(text)-1);
}