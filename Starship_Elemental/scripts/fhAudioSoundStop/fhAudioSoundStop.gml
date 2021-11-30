function fhAudioSoundStop(sound)
{
	/// @param sound
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundStop()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundStop()", "sound", sound);
		var record = ds_map_find_value(__fhAudioObjController.playingSoundsMap, sound);
		if(record == undefined)
			__fhAudioThrowError("Called fhAudioSoundStop() with a non valid sound.");
	}
	audio_stop_sound(sound);
	ds_map_delete(__fhAudioObjController.playingSoundsMap, sound);
	return true;
}

function fha_sound_stop(sound)
{
	/// @param sound
	
	if(false){return fha_sound_stop;}
	return fhAudioSoundStop(sound);
}