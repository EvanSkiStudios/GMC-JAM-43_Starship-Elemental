function fhAudioSoundFadeout(sound, fadeTime)
{
	/// @param sound
	/// @param fadeTime
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundFadeout()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundFadeout()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundFadeout()", "fadeTime", fadeTime);
		var record = ds_map_find_value(__fhAudioObjController.playingSoundsMap, sound);
		if(record == undefined)
			__fhAudioThrowError("Called fhAudioSoundFadeout() with a non valid sound.");
		if(fadeTime < 0)
			__fhAudioThrowError("Called fhAudioSoundFadeout() with a negative fading time.");
	}
	audio_sound_gain(sound, 0, fadeTime);
	var fading = new __fhAudioFadingSound(sound, fadeTime);
	ds_list_add(__fhAudioObjController.fadingSoundsList, fading);
	return true;
}

function fha_sound_fadeout(sound, fadeTime)
{
	/// @param sound
	/// @param fadeTime
	
	if(false){return fha_sound_fadeout;}
	return fhAudioSoundFadeout(sound, fadeTime);
}