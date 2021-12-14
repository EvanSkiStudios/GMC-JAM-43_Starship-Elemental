#macro GAME_IS_GX_EXPORT false
#macro GX_EXPORT:GAME_IS_GX_EXPORT true

global.IS_GX_EXPORT = GAME_IS_GX_EXPORT;

if (global.IS_GX_EXPORT){
	global.GX_HIGHSCORE = "0db7fcaf-50be-472f-97c0-c8a34c321834";
	
	var _current_challenge = gxc_get_query_param("challenge");

	if (_current_challenge == global.GX_HIGHSCORE){
	    show_debug_message("######## The HIGHSCORE challenge has been activated! ########");
	}
}