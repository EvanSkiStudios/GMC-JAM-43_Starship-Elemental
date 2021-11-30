function fhAudioEmitterSetVelocity(emitter, newVelX, newVelY, _newVelZ)
{
	/// @param emitter
	/// @param newVelX
	/// @param newVelY
	/// @param _newVelZ=0
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetVelocity()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVelocity()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVelocity()", "newVelX", newVelX);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVelocity()", "newVelY", newVelY);
		if(!ds_map_exists(__fhAudioObjController.emitterMap, emitter))
			__fhAudioThrowError("Called fhAudioEmitterSetVelocity() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[? emitter].setVelocity(newVelX, newVelY, _newVelZ);
	return;
}

function fha_emitter_set_velocity(emitter, newVelX, newVelY, _newVelZ)
{
	/// @param emitter
	/// @param newVelX
	/// @param newVelY
	/// @param _newVelZ=0
	
	if(false){return argument[0];}
	if(false){return fha_emitter_set_velocity;}
	return fhAudioEmitterSetVelocity(emitter, newVelX, newVelY, _newVelZ);
}