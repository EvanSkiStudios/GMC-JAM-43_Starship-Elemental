function fhAudioListenerSetInstanceToFollow(instanceToFollow, _followVelocity, _velocityMultiplier, _followOrientation, _followIn3d)
{
	/// @param instanceToFollow
	/// @param _followVelocity=false
	/// @param _velocityMultiplier=1
	/// @param _followOrientation=false
	/// @param _followIn3d=false
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetInstanceToFollow()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetInstanceToFollow()", "instanceToFollow", instanceToFollow);
		if(!instance_exists(instanceToFollow))
			__fhAudioThrowError("Called fhAudioListenerSetInstanceToFollow() with a non-existant instance.");
	}
	if(_followVelocity == undefined)
		_followVelocity = false;
	if(_velocityMultiplier == undefined)
		_velocityMultiplier = 1;
	if(_followOrientation == undefined)
		_followOrientation = false;
	if(_followIn3d == undefined)
		_followIn3d = false;
	with(__fhAudioObjController)
	{
		listenerInstanceToFollow = instanceToFollow;
		listenerInstanceToFollow3d = _followIn3d;
		listenerInstanceToFollowVelocity = _followVelocity;
		listenerVelocityMultiplier = _velocityMultiplier;
		listenerInstanceToFollowOrientation = _followOrientation;
	}
	return true;
}

function fha_listener_set_instance_to_follow(instanceToFollow, _followVelocity, _velocityMultiplier, _followOrientation, _followIn3d)
{
	/// @param instanceToFollow
	/// @param _followVelocity=false
	/// @param _velocityMultiplier=1
	/// @param _followOrientation=false
	/// @param _followIn3d=false
	
	if(false){return argument[0];}
	if(false){return fha_listener_set_instance_to_follow;}
	return fhAudioListenerSetInstanceToFollow(instanceToFollow, _followVelocity, _velocityMultiplier, _followOrientation, _followIn3d);
}