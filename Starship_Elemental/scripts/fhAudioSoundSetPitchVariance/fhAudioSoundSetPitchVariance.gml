function fhAudioSoundSetPitchVariance(sound, variance)
{
	/// @param sound
	/// @param variance
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundSetPitchVariance()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetPitchVariance()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetPitchVariance()", "variance", variance);
		if(sound >= __fhAudioObjController.soundNum)
		{
			__fhAudioThrowError("Called fhAudioSoundSetPitchVariance() with a non valid sound.");
		}
	}
	__fhAudioObjController.soundList[sound].setPitchVariance(variance);
	return true;
}

function fha_sound_set_pitch_variance(sound, variance)
{
	/// @param sound
	/// @param variance
	
	if(false){return fha_sound_set_pitch_variance;}
	return fhAudioSoundSetPitchVariance(sound, variance);
}