star_count = 100;

screen_width = display_get_gui_width();
screen_height = display_get_gui_height();

min_speed = 0.25;
max_speed = 2;

randomize();

spawn_nebulas = function () {
	var star = instance_create_layer(irandom_range(screen_width * .1, screen_width + .35), irandom_range(screen_height * .25, screen_height * .75), "Instances", obj_star);
	star.sprite_index = spr_nebula1;
	star.depth = 20;
	star.x_speed = -0.2;
	star.x += screen_width * .5;
	star = instance_create_layer(irandom_range(screen_width * .65, screen_width + .9), irandom_range(screen_height * .25, screen_height * .75), "Instances", obj_star);
	star.depth = 20;
	star.x += screen_width;
	star.sprite_index = spr_nebula2;
	star.x_speed = -0.2;
}

spawn_star = function () {
	var star = instance_create_layer(irandom_range(0, screen_width), irandom_range(0, screen_height), "Instances", obj_star);
	
	star.x_speed = random_range(-min_speed, -max_speed);
	//star.image_index = irandom_range(1, 5);
	//star.my_color = choose(c_white, c_white, c_white, c_white, c_white, c_red, c_white, c_blue, c_green);
	star.alpha = max_speed / abs(star.x_speed);
}

spawn_static_star = function () {
	var star = instance_create_layer(irandom_range(screen_width * .1, screen_width + .9), irandom_range(screen_height * .1, screen_height * .9), "Instances", obj_star);
	star.image_index = irandom_range(1, 5);
	star.x_speed = -0.2;
}

spawn_nebulas();

for (var i = 0; i < star_count; i++) {
		spawn_star();
}
for (var i = 0; i < 8; i++) {
		spawn_static_star();
}


