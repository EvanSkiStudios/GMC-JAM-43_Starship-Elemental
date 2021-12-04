if !(instance_exists(obj_player_ship)) instance_destroy();

//set state of lighting effect
switch(lightning_state){
	default:
	case 0:{
		if !(instance_exists(obj_sb_effect_lightning_start)) && !(lightning_spawned){
			instance_create_depth(
			obj_player_ship.x,
			obj_player_ship.y,
			(obj_player_ship.depth - 100),
			obj_sb_effect_lightning_start
			);	
			lightning_spawned = true;
		}else{
			if (lightning_spawned){
				if instance_exists(obj_sb_effect_lightning){
					lightning_state = 2;	
				}
			}
		}
	}break;
	
	case 2:{
		
	}break;
}