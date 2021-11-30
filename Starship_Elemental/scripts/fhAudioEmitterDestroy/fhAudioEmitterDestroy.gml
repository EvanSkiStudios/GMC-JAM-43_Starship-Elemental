function fhAudioEmitterDestroy(emitter)
{
	/// @param emitter
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterDestroy()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterDestroy()", "emitter", emitter);
		if(!ds_map_exists(__fhAudioObjController.emitterMap, emitter))
			__fhAudioThrowError("You called fhAudioEmitterDestroy() with a non-existent emitter.");
	}
	
	__fhAudioObjController.emitterMap[? emitter].destroy();
	ds_map_delete(__fhAudioObjController.emitterMap, emitter);
	return true;
}

function fha_emitter_destroy(emitter)
{
	/// @param emitter
	
	if(false){return fha_emitter_destroy;}
	return fhAudioEmitterDestroy(emitter);
}