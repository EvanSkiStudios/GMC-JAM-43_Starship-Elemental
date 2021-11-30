function fhAudioEmitterSetVolume(emitter, volume)
{
	/// @param emitter
	/// @param volume
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetVolume()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVolume()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVolume()", "volume", volume);
		if(!ds_map_exists(__fhAudioObjController.emitterMap, emitter))
			__fhAudioThrowError("Called fhAudioEmitterSetVolume() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[? emitter].setVolume(volume);
	return true;
}

function fha_emitter_set_volume(emitter, volume)
{
	/// @param emitter
	/// @param volume
	
	if(false){return fha_emitter_set_volume;}
	return fhAudioEmitterSetVolume(emitter, volume);
}