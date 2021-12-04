function Create_text_interaction_NPC(text_convo_number){
	global.game_interaction_object = false;
	global.game_interaction_npc = true;
	
	global.game_convo_number = text_convo_number;
	
	if instance_exists(obj_dialogbox){
		instance_destroy(obj_dialogbox);	
	}
	
	var textbox = instance_create_depth(x,y,depth,obj_dialogbox);
}