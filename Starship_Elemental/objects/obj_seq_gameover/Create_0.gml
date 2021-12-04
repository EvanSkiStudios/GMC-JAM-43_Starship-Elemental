layer_create(-10000,"gameover_sequance");
gameover_sequance_layer = layer_sequence_create("gameover_sequance",0,0,seq_game_over_cutscene);
layer_sequence_pause(gameover_sequance_layer);

wait_for_fade = false;

do_fade = false;