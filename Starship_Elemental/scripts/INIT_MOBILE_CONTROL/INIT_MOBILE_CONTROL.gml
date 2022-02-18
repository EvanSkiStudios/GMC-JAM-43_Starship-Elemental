if !(GAME_IS_MOBILE) exit;

//get starting x tilt
global.Mobile_x_tilt_start = 1.0;
var mxts = global.Mobile_x_tilt_start;

//create deadzone for device tilt
global.Mobile_x_tilt_deadzone_min = (0.75);
global.Mobile_x_tilt_deadzone_max = (-0.75);

//get starting y tilt
global.Mobile_y_tilt_start = device_get_tilt_y();
var myts = global.Mobile_y_tilt_start;

//create deadzone for device tilt
global.Mobile_y_tilt_deadzone_min = -(myts - 0.25);
global.Mobile_y_tilt_deadzone_max = (myts + 0.25);