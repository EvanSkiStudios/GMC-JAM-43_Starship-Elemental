if (global.IS_GX_EXPORT){
	var _current_challenge = gxc_get_query_param("challenge");

	if (_current_challenge == global.GX_HIGHSCORE){
	    gxc_challenge_submit_score(global.Player_Score);

	    // Debug only
	    show_debug_message("######## Score submitted for the HIGH SCORE challenge! ########");
	}	
}