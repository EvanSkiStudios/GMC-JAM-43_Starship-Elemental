if instance_exists(obj_sb_effect_lightning_start){
	instance_destroy(obj_sb_effect_lightning_start);
}
if instance_exists(obj_sb_effect_lightning){
	instance_destroy(obj_sb_effect_lightning);
}
if instance_exists(obj_sb_effect_lightning_zapper){
	instance_destroy(obj_sb_effect_lightning_zapper);
}


if (instance_exists(obj_player_ship)){
	instance_create_depth(obj_player_ship.x,obj_player_ship.y,depth,obj_sb_effect_lightning_end);
}