alpha -= fade_inc;
if (image_xscale < max_scale) {
	image_xscale += scale_inc; 
	image_yscale += scale_inc;
}

if (alpha <= 0){
	instance_destroy();	
}