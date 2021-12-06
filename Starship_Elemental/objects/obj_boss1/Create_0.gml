//skeleton_collision_draw_set(1);//DEBUG ONLY, draws the Spine's colliders

skeleton_animation_mix("enter_top_right", "circle_lower_right", .4);
skeleton_animation_mix("enter_top_right", "move_to_top_right", .4);
skeleton_animation_mix("enter_top_right", "circle_upper_right", .4);

skeleton_animation_mix("move_to_top_right", "circle_lower_right", .4);
skeleton_animation_mix("move_to_top_right", "move_to_top_right", .2);
skeleton_animation_mix("move_to_top_right", "tail_shoot_bottom", .4);
skeleton_animation_mix("move_to_top_right", "tail_shoot_top", .4);

skeleton_animation_mix("move_to_top_right", "circle_upper_right", .4);
skeleton_animation_mix("circle_lower_right", "move_to_top_right", .4);

skeleton_animation_mix("circle_lower_right", "tail_shoot_top", .4);
skeleton_animation_mix("circle_lower_right", "tail_shoot_bottom", .4);

skeleton_animation_mix("tail_shoot_top", "circle_lower_right", .5);
skeleton_animation_mix("tail_shoot_bottom", "circle_lower_right", .5);

skeleton_animation_mix("circle_upper_right", "move_to_top_right", .4);

skeleton_animation_mix("bullet_hell", "bullet_hell", .2);

skeleton_animation_mix("tail_shoot_bottom", "tail_shoot_bottom", .4);
skeleton_animation_mix("tail_shoot_bottom", "tail_shoot_top", .4);
skeleton_animation_mix("tail_shoot_bottom", "move_to_top_right", .4);



skeleton_skin_set("normal");
//skeleton_skin_set("hit_all");
//skeleton_skin_set("hit_tail");

//boss hps
tail_hit_points = 100;
body_hit_points = 30;

dead = false;

do_hit_body = function () {
	//show_debug_message("BOSS: Do Hit Body");
	//DEDUCT HITS FROM BODY
	
	body_hit_points -= 1;
	
	if (body_hit_points <= 0 && !dead) {
		dead = true;
		skeleton_animation_set_ext("scream", channel_scream);
		skeleton_animation_set_ext("kill", channel_extra);
		boss_state = BOSS1_STATES.defeated;
	}  else {
		hit_body = true;	
	}
	
}

do_hit_tail = function () {
	hit_tail = true;
	//DEDUCT HITS FROM TAIL
	tail_hit_points -= 1;
	
	if ((tail_hit_points <= 0) && !tail_destroyed) {
		tail_destroyed = true;
		audio_play_sound(snd_tail_explo, 1, 0);
		skeleton_animation_clear(channel_tail);
		skeleton_animation_set_ext("idle_no_tail", channel_idle);
		skeleton_animation_set_ext("scream", channel_scream);
		skeleton_animation_set_ext("circle_lower_right", channel_movement);
		skeleton_animation_set_ext("explode_tail", channel_extra);
	}
}


timer = 0;

enter_top_right_time = 2 * room_speed;
move_to_upper_right_time = 2.6 * room_speed;
circle_upper_right_time = skeleton_animation_get_duration("circle_upper_right") * room_speed;
circle_lower_right_time = skeleton_animation_get_duration("circle_lower_right") * room_speed;

boss_state = BOSS1_STATES.enter_level;

channel_idle = 0;
channel_scream = 1;
channel_movement = 2;
channel_tail = 3;
channel_extra = 4;

hit_tail = false;
hit_body = false;

tail_exposed = false;
tail_destroyed = false;

bullet_hell_spawn_point = [0,0];
pelvis_bone = [0,0];

bullet_timer = 0;
bullet_delay = .1 * room_speed;

bullet_angles1 = [280, 260, 240, 220, 200, 180, 160, 140, 120, 130, 150, 170, 190, 210, 230, 250, 270];//180
bullet_angles = bullet_angles1;
current_bullet = 0;
doing_bullet_hell = false;

do_bullet_hell = function () {
	if (doing_bullet_hell) {
		bullet_timer++;
		if (bullet_timer >= bullet_delay) {
			bullet_timer = 0;
			if (current_bullet < array_length(bullet_angles) -1) {
					var bullet = instance_create_layer(bullet_hell_spawn_point[0], bullet_hell_spawn_point[1], "Instances", obj_enemy_bullet_generic);
					audio_stop_sound(snd_boss_bullet);
					audio_play_sound(snd_boss_bullet, 1, 0);
					bullet.depth = -50;
					bullet.speed = 2;
					bullet.direction = bullet_angles[current_bullet];
					current_bullet ++;
			} else {
				doing_bullet_hell = false;	
				current_bullet = 0;
			}
		}
	}
}

skeleton_animation_set_ext("idle", channel_idle);
skeleton_animation_set_ext("enter_top_right", channel_movement);

get_bullet_hell_spawn_point = function () {
	
		var map = ds_map_create();
		
		skeleton_bone_state_get("bullet_hell_spawn_point", map);	
		
		var xx = ds_map_find_value(map, "worldX");
		var yy = ds_map_find_value(map, "worldY");
		
		bullet_hell_spawn_point[0] = xx;
		bullet_hell_spawn_point[1] = yy;
		
		skeleton_bone_state_get("pelvis", map);	
		
		xx = ds_map_find_value(map, "worldX");
		yy = ds_map_find_value(map, "worldY");
		
		pelvis_bone[0] = xx;
		pelvis_bone[1] = yy;
	
		//show_debug_message(string("bullet hell:X:") + string(bullet_hell_spawn_point[0]) + "," + string(bullet_hell_spawn_point[1]));
	
		ds_map_destroy(map);
}

enum BOSS1_STATES {
	enter_level,
	enter_level_complete,
	first_scream,
	bullet_hell_top_right,
	bullet_hell_top_right_complete,
	laser_attack,
	defeated,
}

decide_next_attack = function () {
	
	if !(global.Player_ship_visable){
		boss_state = BOSS1_STATES.enter_level_complete;	
		return;
	}

	
	if (boss_state == BOSS1_STATES.first_scream) {
		
		do_bullet_hell_top_right();
		
	} else {//if (boss_state == BOSS1_STATES.bullet_hell_top_right_complete) {
		
		if (tail_destroyed) {
			
				do_bullet_hell_top_right();
				
		} else {
			
			var rand = irandom_range(1, 3);
		
			if (rand == 1) {
				do_bullet_hell_top_right();
			} else if (rand == 2) {
				do_laser_top();	
			} else if (rand == 3) {
				do_laser_bottom();	
			}
		}
		
		
		//do_bullet_hell_top_right();
	}
}

do_bullet_hell_top_right = function () {
	skeleton_animation_set_ext("move_to_top_right", channel_movement);
	boss_state = BOSS1_STATES.bullet_hell_top_right;
}

do_laser_bottom = function () {
		skeleton_animation_set_ext("tail_shoot_bottom", channel_movement);
		skeleton_animation_set_ext("tail_shoot", channel_tail);
		audio_play_sound(snd_laser_charge, 1, 0);
		boss_state = BOSS1_STATES.laser_attack;
}

do_laser_top = function () {
		skeleton_animation_set_ext("tail_shoot_top", channel_movement);
		skeleton_animation_set_ext("tail_shoot", channel_tail);
		audio_play_sound(snd_laser_charge, 1, 0);
		boss_state = BOSS1_STATES.laser_attack;
}
