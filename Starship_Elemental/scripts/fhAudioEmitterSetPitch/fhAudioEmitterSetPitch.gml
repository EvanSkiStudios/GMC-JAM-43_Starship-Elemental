function fhAudioEmitterSetPitch(emitter, pitch)
{
	/// @param emitter
	/// @param pitch
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetPitch()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPitch()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPitch()", "pitch", pitch);
		if(!ds_map_exists(__fhAudioObjController.emitterMap, emitter))
			__fhAudioThrowError("You called fhAudioEmitterSetPitch() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[? emitter].setPitch(pitch);
	return true;
}

function fha_emitter_set_pitch(emitter, pitch)
{
	/// @param emitter
	/// @param pitch
	
	if(false){return fha_emitter_set_pitch;}
	return fhAudioEmitterSetPitch(emitter, pitch);
}