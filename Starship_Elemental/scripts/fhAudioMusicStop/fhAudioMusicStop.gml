function fhAudioMusicStop(_fadeTime)
{
	/// @param _fadeTime=1000
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicStop()");
		if(_fadeTime != undefined)
			if(_fadeTime < 0)
				__fhAudioThrowError("Called fhAudioMusicStop() with a negative fading time.");
	}
	if(_fadeTime == undefined)
		_fadeTime = 0;
	with(__fhAudioObjController)
	{
		__fhAudioStopFadedTrack();
		if(currentMusicRef != -1)
		{
			__fhAudioStoreMusicPos(false);
			if(_fadeTime > 0)
			{
				alarm[0] = _fadeTime/1000*room_speed;
				audio_sound_gain(currentMusicRef, 0, _fadeTime);
			}
			else
			{
				audio_stop_sound(currentMusicRef);
				currentMusicRef = -1;
				currentMusicTrack = -1;
			}
		}
		musicStatus = __FHAUDIO_STATUS_STOPPED;
	}
	return true;
}

function fha_music_stop(_fadeTime)
{
	/// @param _fadeTime=1000
	
	if(false){return argument[0];}
	if(false){return fha_music_stop;}
	return fhAudioMusicStop(_fadeTime);
}