if (x < -20) {
	instance_destroy();	
}
y += y_speed;
x += x_speed;

alpha -= fade_inc;
if (image_xscale < max_scale) {
	image_xscale += scale_inc; 
	image_yscale += scale_inc;
}
