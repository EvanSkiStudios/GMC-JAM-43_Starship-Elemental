if !(can_change) return;

do_wave = false;
instance_create_depth(x,y,depth,obj_smartbomb_wind);
instance_destroy(other);
instance_destroy(id);