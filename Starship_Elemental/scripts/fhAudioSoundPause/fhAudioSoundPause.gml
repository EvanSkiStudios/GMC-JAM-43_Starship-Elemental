function fhAudioSoundPause(sound, _fadeTime)
{
	/// @param sound
	/// @param _fadeTime=0
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPause()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPause()", "sound", sound);
		var record = ds_map_find_value(__fhAudioObjController.playingSoundsMap, sound);
		if(record == undefined)
			__fhAudioThrowError("Called fhAudioSoundPause() with a non valid sound.");
		if(_fadeTime != undefined)
			if(_fadeTime < 0)
				__fhAudioThrowError("Called fhAudioSoundPause() with a negative fading time");
	}
	__fhAudioSoundPause(sound, _fadeTime);
	return true;
}

function fha_sound_pause(sound, _fadeTime)
{
	/// @param sound
	/// @param _fadeTime=0
	
	if(false){return argument[0];}
	if(false){return fha_sound_pause;}
	return fhAudioSoundPause(sound, _fadeTime);
}