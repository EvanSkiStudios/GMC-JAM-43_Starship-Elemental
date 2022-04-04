surface_resize(application_surface, GAME_RES_WIDTH, GAME_RES_HEIGHT);
window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);
alarm[0] = 1; //center window

if !(global.IS_GX_EXPORT){
	alarm[1] = 3;// go to next room
}else{
	//because GXC is special
	alarm[1] = 2;// go to next room	
}
