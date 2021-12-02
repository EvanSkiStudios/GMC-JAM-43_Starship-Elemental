if !instance_exists(obj_player_ship){
	instance_destroy();
}


if (seeking){
	speed = seek_speed;
	
	direction = point_direction(x,y,obj_player_ship.x,obj_player_ship.y);
	display_direction = direction;

	var _player_angle = point_direction(x, y, obj_player_ship.x, obj_player_ship.y);
	var _sprite_angle = angle_difference(display_direction, _player_angle) + display_direction;

	if (_sprite_angle < 0) {
		_sprite_angle = (_sprite_angle % 360) + 360;
	} else {
		if (_sprite_angle > 360) {
			_sprite_angle = _sprite_angle % 360;
		}
	}

	var frame_div = 360 / image_number;

	image_index = _sprite_angle div frame_div;
}

if (image_index == 7){
show_debug_message(direction);
}