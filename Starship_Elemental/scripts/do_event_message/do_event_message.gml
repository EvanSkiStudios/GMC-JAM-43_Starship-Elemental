/// @description does event message on bottom of screen
/// @function do_event_message(str);
/// @param str the string message to show

function do_event_message (str){
	
	if (!instance_exists(obj_event_messager)) {
		
		var evt_msgr = instance_create_depth(0,0, depth, obj_event_messager);
		evt_msgr.do_message(str);
		
	} else {
			obj_event_messager.do_message(str);
	}
}