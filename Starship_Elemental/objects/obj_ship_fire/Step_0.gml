if !instance_exists(obj_player_ship) instance_destroy(id);


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


//image scaling
var HP = global.Player_HP;
switch(HP){
	case 2:{
		image_xscale = 0.25;
		image_yscale = 0.25;
	}break;
	
	case 1:{
		image_xscale = 0.5;
		image_yscale = 0.5;	
	}break;
	
	default:
	case 0:{
		image_xscale = 1;
		image_yscale = 1;
	}break;
}