global.Player_Score += 200;

instance_destroy(other);
instance_create_depth(x,y,depth,obj_explosion_small);
instance_destroy();