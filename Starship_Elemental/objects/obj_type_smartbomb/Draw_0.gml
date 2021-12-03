if (do_white_flash){
	shader_set(shd_white_sprite);
	draw_self();
	shader_reset();
}else{
	draw_self();
}