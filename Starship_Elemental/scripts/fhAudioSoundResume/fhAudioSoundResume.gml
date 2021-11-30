function fhAudioSoundResume(sound, _fadeTime)
{
	/// @param sound
	/// @param _fadeTime=0
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundResume()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundResume()", "sound", sound);
		//var record = ds_map_find_value(__fhAudioObjController.playingSoundsMap, sound);
		var record2 = ds_map_find_value(__fhAudioObjController.pausedSoundsMap, sound);
		//if(record == undefined && record2 == undefined)
		if(record2 == undefined)
			__fhAudioThrowError("Called fhAudioSoundResume() with a non valid sound.");
		if(_fadeTime != undefined)
			if(_fadeTime < 0)
				__fhAudioThrowError("Called fhAudioSoundResume() with a negative fading time.");
	}
	__fhAudioSoundResume(sound, _fadeTime);
	return true;
}

function fha_sound_resume(sound)
{
	/// @param sound
	/// @param _fadeTime=0
	
	if(false){return argument[0];}
	if(false){return fha_sound_resume;}
	return fhAudioSoundResume(sound);
}