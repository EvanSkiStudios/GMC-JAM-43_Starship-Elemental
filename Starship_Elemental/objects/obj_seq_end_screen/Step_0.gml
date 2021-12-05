switch(state){
	case 0: break;
	
	case 1:{
		Create_text_interaction_NPC(7, 42,173);
		state += 1;
	}break;
	
	case 3:{
		instance_destroy(obj_dialogbox);
		state += 1;
	}break;
	
	case 5:{
		instance_create_depth(672,32,depth,obj_CreditScroller);
		instance_destroy(self);
		state += 1;
	}break;
	
	
}