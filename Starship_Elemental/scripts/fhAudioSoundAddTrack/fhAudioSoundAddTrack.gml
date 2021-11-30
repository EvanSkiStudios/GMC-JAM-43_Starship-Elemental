function fhAudioSoundAddTrack(sound, track)
{
	/// @param sound
	/// @param track
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundAddTrack()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundAddTrack()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundAddTrack()", "track", track);
		if(sound >= __fhAudioObjController.soundNum)
		{
			__fhAudioThrowError("Called fhAudioSoundAddTrack() with an invalid sound.");
		}
	}
	__fhAudioObjController.soundList[sound].addTrack(track);
	return true;
}

function fha_sound_add_track(sound, track)
{
	/// @param sound
	/// @param track
	
	if(false){return fha_sound_add_track;}
	return fhAudioSoundAddTrack(sound, track);
}