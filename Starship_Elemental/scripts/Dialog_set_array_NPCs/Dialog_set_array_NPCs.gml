function Dialog_set_array_NPCs(){
	//reset array
	text = undefined;
	var i = 0;
	
	switch(global.game_convo_number)
	{
		default:{
			text[i] = "ERROR!!";
			text[++i] = "Text in array for npc is not set for current convo number "+string(global.game_convo_number)+" !!";
		}break;
		
		//DEFUALT DEBUG CONVO
		case 0:{
			text[i][TContent] = "I can always save the earth another time!";
			text[i][TColor] = c_lime;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 0;
			
			text[++i][TContent] = "Well crap.";
			text[i][TColor] = c_lime;
			text[i][TSprite] = spr_pilot_evanski_pfp;
			text[i][TVoice] = 0;
		}break;
	}
	//sets last array position to the length of the array
	//array length counts 0 as 1 so we remove 1 
	text_last = (array_length(text)-1);
}