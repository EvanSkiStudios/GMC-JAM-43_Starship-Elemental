if (global.IS_GX_EXPORT) && !(global.DEBUG){
	room_goto(rm_isGXC);
}else{
	room_goto(rm_intro);
}