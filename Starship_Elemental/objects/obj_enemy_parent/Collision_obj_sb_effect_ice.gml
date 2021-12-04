switch(object_index){
	default:
	case obj_enemy_generic_bee:{
		var bee = instance_create_depth(x,y,depth,obj_enemy_bee_frozen);
		bee.image_xscale = other.image_xscale;
		instance_destroy(id);	
	}break;
	
	case obj_enemy_bee_shooter:{
		if (sprite_index == spr_enemy_bee_shooter_stinger){
			var bee = instance_create_depth(x,y,depth,obj_enemy_bee_frozen);
			bee.image_xscale = other.image_xscale;
		}else{
			var bee = instance_create_depth(x,y,depth,obj_enemy_bee_shooter_frozen);
			bee.image_xscale = other.image_xscale;
		}
		instance_destroy(id);	
	}break;
	
	case obj_enemy_bee_bomber:{
		instance_create_depth(x,y,depth,obj_enemy_bee_bomber_frozen);
		instance_destroy(id);	
	}break;
}