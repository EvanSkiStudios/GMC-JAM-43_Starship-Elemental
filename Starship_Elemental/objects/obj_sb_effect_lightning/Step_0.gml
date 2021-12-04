if !(global.Player_ship_visable) instance_destroy();
if !(instance_exists(obj_player_ship)) instance_destroy();

if instance_exists(obj_enemy_parent){
	if !instance_exists(obj_sb_effect_lightning_zapper){
		instance_create_depth(x,y,depth-100,obj_sb_effect_lightning_zapper);
	}
}