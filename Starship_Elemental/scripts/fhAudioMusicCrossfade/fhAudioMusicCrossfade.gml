function fhAudioMusicCrossfade(musicTrack, _fadeTime, _fromBeginning)
{
	/// @param musicTrack
	/// @param _fadeTime=1000
	/// @param _fromBeginning=false
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicCrossfade()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicCrossfade()", "musicTrack", musicTrack);
		if(_fadeTime != undefined)
			if(_fadeTime < 0)
				__fhAudioThrowError("Called fhAudioMusicCrossfade() with a negative fading time.");
	}
	if(_fadeTime == undefined)
		_fadeTime = 1000;
	if(_fromBeginning == undefined)
		_fromBeginning = false;
	with(__fhAudioObjController)
	{
		alarm[0] = 0;
		ds_list_add(musicPendingFades, new __fhAudioFadeTask(musicTrack, _fadeTime, _fromBeginning));
	}
	return true;
}

function fha_music_crossfade(musicTrack, _fadeTime, _fromBeginning)
{
	/// @param musicTrack
	/// @param _fadeTime=1000
	/// @param _fromBeginning=false
	
	if(false){return argument[0];}
	if(false){return fha_music_crossfade;}
	return fhAudioMusicCrossfade(musicTrack, _fadeTime, _fromBeginning);
}