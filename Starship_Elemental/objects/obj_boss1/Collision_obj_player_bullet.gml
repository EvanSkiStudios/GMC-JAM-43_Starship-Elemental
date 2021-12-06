//if (other == ship) {
	//kill ship instantly
//}


if (tail_destroyed) {
	//if (other != ship) {
		do_hit_body();
	//}
		
} else {
	//if (other != ship) {
	if (tail_exposed) {
		do_hit_tail();
	}
	//}
}


instance_destroy(other);
