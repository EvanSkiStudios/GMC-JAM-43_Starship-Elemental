function fhAudioSoundSetVolumeVariance(sound, variance)
{
	/// @param sound
	/// @param variance
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundSetVolumeVariance()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetVolumeVariance()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetVolumeVariance()", "variance", variance);
		if(sound >= __fhAudioObjController.soundNum)
		{
			__fhAudioThrowError("Called fhAudioSoundSetVolumeVariance() with a non valid sound.");
		}
	}
	__fhAudioObjController.soundList[sound].setVolumeVariance(variance);
	return true;
}

function fha_sound_set_volume_variance(sound, variance)
{
	/// @param sound
	/// @param variance
	
	if(false){return fha_sound_set_volume_variance;}
	return fhAudioSoundSetVolumeVariance(sound, variance);
}