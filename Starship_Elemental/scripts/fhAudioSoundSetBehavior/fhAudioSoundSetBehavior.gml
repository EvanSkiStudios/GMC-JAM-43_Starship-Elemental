function fhAudioSoundSetBehavior(sound, behavior)
{
	/// @param sound
	/// @param behavior
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundSetBehavior()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetBehavior()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetBehavior()", "behavior", behavior);
		if(sound >= __fhAudioObjController.soundNum)
		{
			__fhAudioThrowError("Called fhAudioSoundSetBehavior() with a non valid sound.");
		}
		if(behavior > (__FHAUDIO_NUM_CHOOSE_BEHAVIORS - 1))
		{
			__fhAudioThrowError("Called fhAudioSoundSetBehavior() with an invalid 'behavior' argument.");
		}
	}
	__fhAudioObjController.soundList[sound].setBehavior(behavior);
	return true;
}

function fha_sound_set_behavior(sound, behavior)
{
	/// @param sound
	/// @param behavior
	
	if(false){return fha_sound_set_behavior;}
	return fhAudioSoundSetBehavior(sound, behavior);
}