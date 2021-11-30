function fhAudioMusicContinueLastTrack(_fromBeginning)
{
	/// @param _fromBeginning=false
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioContinueLastTrack()");
	}
	var returnValue = -1;
	if(_fromBeginning == undefined)
		_fromBeginning = false;
	with(__fhAudioObjController)
	{
		if(musicStatus != __FHAUDIO_STATUS_STOPPED)
		{
			__fhAudioDebugLog("Attempted to continue last track when music is already playing.");
			break;
		}
		if(lastMusicTrack == -1)
		{
			__fhAudioDebugLog("Attempted to continue last track when no music has been played yet.");
			break;
		}
		currentMusicTrack = lastMusicTrack;
		currentMusicRef = audio_play_sound(currentMusicTrack, 1, true);
		audio_sound_gain(currentMusicRef, realMusicVolume, 0);
		if(!_fromBeginning)
		{
			if(ds_map_exists(musicTrackPositions, currentMusicTrack))
			{
				audio_sound_set_track_position(currentMusicRef, musicTrackPositions[? currentMusicTrack]);
				ds_map_delete(musicTrackPositions, currentMusicTrack);
			}
		}
		else
		{
			if(ds_map_exists(musicTrackPositions, currentMusicTrack))
			{
				ds_map_delete(musicTrackPositions, currentMusicTrack);
			}
		}
		musicStatus = __FHAUDIO_STATUS_PLAYING;
		returnValue = currentMusicRef;
	}
	return returnValue;
}

function fha_music_continue_last_track(_fromBeginning)
{
	/// @param _fromBeginning=false
	
	if(false){return argument[0];}
	if(false){return fha_music_continue_last_track;}
	return fhAudioMusicContinueLastTrack(_fromBeginning);
}