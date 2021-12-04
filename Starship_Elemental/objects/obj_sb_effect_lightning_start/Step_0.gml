if !(instance_exists(obj_player_ship)) instance_destroy();

if (image_index >= (image_number - 1)){
	image_speed = 0;
	image_index = image_number;
	instance_destroy();
}