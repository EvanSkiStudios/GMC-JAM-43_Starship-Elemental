speed = 1.8;

var random_flip = irandom(100);

if(random_flip < 50){
	
	var flip_type = choose(0,1,2);
	switch(flip_type){
		
		case 0:{
			image_xscale = -1;
			image_yscale = 1;
		};
		
		case 1:{
			image_xscale = 1;
			image_yscale = -1;
		};
		
		case 2:{
			image_xscale = -1;
			image_yscale = -1;
		};
	}
}

alarm[0] = GAMESPEED * 0.5;