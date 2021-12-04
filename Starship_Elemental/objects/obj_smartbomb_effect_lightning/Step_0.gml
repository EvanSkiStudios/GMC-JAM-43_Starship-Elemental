if !(global.Player_ship_visable) instance_destroy();

if !(instance_exists(obj_player_ship)) instance_destroy();

//set state of lighting effect
if !(instance_exists(obj_sb_effect_lightning_start)) && !(lightning_spawned){
	instance_create_depth(
	obj_player_ship.x,
	obj_player_ship.y,
	(obj_player_ship.depth - 100),
	obj_sb_effect_lightning_start
	);	
	lightning_spawned = true;
}