//https://www.youtube.com/watch?v=WLQiVE_k5SA

if (state == 0){
	timer++;
	
	if (timer >= duration){
		room_goto(targetroom);
		
		state = 1;
	}
}else{
	if (state == 1){
		timer --;
		
		if (timer <= 0){
			instance_destroy();		
		}
		
	}
}


alpha = timer / duration;