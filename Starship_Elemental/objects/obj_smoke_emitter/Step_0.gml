switch (emitter_state) {
	case EMITTER_STATES.idle:
	
	break;
	case EMITTER_STATES.fire_out:
	
		timer ++;
		if (timer >= fire_extinguish_time) {
			timer = 0;
			emitter_state = EMITTER_STATES.idle;	
			return;
		}
	
		for (var i = 0; i < 3; i++) {
			var rand = irandom_range(0, 3);
			if (rand == 2) {
				spawn_smoke();
			}
		}
	break;
	case EMITTER_STATES.damage_1:
		for (var i = 0; i < 2; i++) {
			spawn_smoke();
		}
	break;
	case EMITTER_STATES.damage_2:
	for (var i = 0; i < 3; i++) {
			spawn_smoke();
		}
	
	break;
	case EMITTER_STATES.damage_3:
	for (var i = 0; i < 4; i++) {
			spawn_smoke();
		}
	
	break;
}

//sets offset of sprite depedning on ships sprite
var wearing_sprite = obj_player_ship.sprite_index;
switch(wearing_sprite){
	
	case spr_player_ship:{
		//sets x offset to the ships wing
		var x_pos_offset = 5;
		setParent(
			obj_player_ship, 
			( ( -abs(sprite_get_width(obj_player_ship.sprite_width)) ) - x_pos_offset),
			0
		)
	}break;
	
	case spr_player_ship_fly_up:{
		if (image_index <= 0){
			var pos_offset = 5;
			setParent(
				obj_player_ship, 
				( ( -abs(sprite_get_width(obj_player_ship.sprite_width)) ) - pos_offset),
				-abs(pos_offset)
			)
		}
		
		if (image_index <= 1){
			var x_pos_offset = 5;
			var pos_offset = 5;
			setParent(
				obj_player_ship, 
				( ( -abs(sprite_get_width(obj_player_ship.sprite_width)) ) - x_pos_offset),
				-abs(pos_offset)
			)
		}
	}break;
	
		
	case spr_player_ship_fly_down:{
		if (image_index <= 0){
			var pos_offset = 5;
			setParent(
				obj_player_ship, 
				( ( -abs(sprite_get_width(obj_player_ship.sprite_width)) ) - pos_offset),
				abs(pos_offset)
			)
		}
		
		if (image_index <= 1){
			var x_pos_offset = 5;
			var pos_offset = 5;
			setParent(
				obj_player_ship, 
				( ( -abs(sprite_get_width(obj_player_ship.sprite_width)) ) - x_pos_offset),
				abs(pos_offset)
			)
		}
	}break;
	
}
//set pos with offset
followParent();