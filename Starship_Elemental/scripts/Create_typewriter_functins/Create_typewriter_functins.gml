function Create_text_interaction_NPC(text_convo_number,_x = x, _y =y, _text_wrap = 400){
	global.game_interaction_object = false;
	global.game_interaction_npc = true;
	
	global.text_wrap = _text_wrap
	
	global.game_convo_number = text_convo_number;
	
	//if instance_exists(obj_dialogbox){
	//	instance_destroy(obj_dialogbox);	
	//}
	
	var textbox = instance_create_depth(_x,_y,depth,obj_dialogbox);
}