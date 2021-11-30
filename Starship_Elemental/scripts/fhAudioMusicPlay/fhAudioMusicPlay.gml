function fhAudioMusicPlay(musicTrack, _fadeTime, _fromBeginning)
{
	/// @param musicTrack
	/// @param _fadeTime=0
	/// @param _fromBeginning=false
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicPlay()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicPlay()", "musicTrack", musicTrack);
		if(_fadeTime != undefined)
			if(_fadeTime < 0)
				__fhAudioThrowError("Called fhAudioMusicPlay() with a negative fading time.");
	}
	if(_fadeTime == undefined)
		_fadeTime = 0;
	if(_fromBeginning == undefined)
		_fromBeginning = false;
	with(__fhAudioObjController)
	{
		alarm[0] = 0;
		__fhAudioStoreMusicPos(false);
		currentMusicTrack = musicTrack;
		lastMusicTrack = currentMusicTrack;
		if(currentMusicRef != -1)
			audio_stop_sound(currentMusicRef);
		currentMusicRef = audio_play_sound(musicTrack, 1, true);
		if(ds_map_exists(musicTrackPositions, musicTrack))
		{
			if(!_fromBeginning)
			{
				audio_sound_set_track_position(currentMusicRef, musicTrackPositions[? currentMusicTrack]);
			}
			ds_map_delete(musicTrackPositions, musicTrack);
		}
		audio_sound_gain(currentMusicRef, 0, 0);
		audio_sound_gain(currentMusicRef, realMusicVolume, _fadeTime);
		musicStatus = __FHAUDIO_STATUS_PLAYING;
	}
	return __fhAudioObjController.currentMusicRef;
}

function fha_music_play(musicTrack, _fadeTime, _fromBeginning)
{
	/// @param musicTrack
	/// @param _fadeTime=0
	/// @param _fromBeginning=false
	
	if(false){return argument[0];}
	if(false){return fha_music_play;}
	return fhAudioMusicPlay(musicTrack, _fadeTime, _fromBeginning);
}