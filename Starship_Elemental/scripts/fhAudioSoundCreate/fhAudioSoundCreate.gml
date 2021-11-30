function fhAudioSoundCreate(_category, _tracks, _pitchVariance, _volumeVariance, _behavior)
{
	/// @param _category=0
	/// @param _tracks=undefined
	/// @param _pitchVariance=0
	/// @param _volumeVariance=0
	/// @param _behavior=FHAUDIO_CHOOSE_RANDOM
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioCreateSound()");
		if(_tracks!=undefined)
		{
			if(is_array(_tracks))
			{
				for(var i = 0; i < array_length(_tracks)-1; i++)
				{
					if(audio_get_name(_tracks[i])==undefined)
					{
						__fhAudioThrowError("Called fhAudioSoundCreate() with an invalid value in the sounds variable array argument, must only be a sound asset or an array of sound assets.");
					}
				}
			}
			else
			{
				if(audio_get_name(_tracks)==undefined)
				{
					__fhAudioThrowError("Called fhAudioSoundCreate() with an invalid value in the sounds argument, must only be a sound asset or an array of sound assets.");
				}
			}
		}
		if(_behavior != undefined)
		{
			if((_behavior != FHAUDIO_CHOOSE_RANDOM) &&
				(_behavior != FHAUDIO_CHOOSE_RANDOM_NOT_REPEATED) &&
				(_behavior!= FHAUDIO_CHOOSE_SEQUENCE))
			{
				__fhAudioThrowError("Called fhAudioSoundCreate() with an invalid '_behavior' argument.");
			}
		}
	}
	if(_category == undefined)
		_category = 0;
	if(FHAUDIO_DEBUGMODE)
	{
		if(_category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioCreateSound() called with a non-existent category.");
		}
	}
	var newSound = new __fhAudioSound(_category);
	if(_tracks != undefined)
	{
		if(is_array(_tracks))
		{
			for(var i = 0; i < array_length(_tracks); i++)
			{
				newSound.addTrack(_tracks[i]);
			}
		}
		else
			newSound.addTrack(_tracks);
	}
	if(_pitchVariance != undefined)
	{
		newSound.setPitchVariance(_pitchVariance);
	}
	if(_volumeVariance != undefined)
	{
		newSound.setVolumeVariance(_volumeVariance);
	}
	if(_behavior != undefined)
	{
		newSound.setBehavior(_behavior);
	}
	with(__fhAudioObjController)
	{
		soundList[soundNum] = newSound;
		soundNum++;
	}
	return __fhAudioObjController.soundNum - 1;
}

function fha_sound_create(_category, _tracks, _pitchVariance, _volumeVariance, _behavior)
{
	/// @param _category=0
	/// @param _tracks=undefined
	/// @param _pitchVariance=0
	/// @param _volumeVariance=0
	/// @param _behavior=FHAUDIO_CHOOSE_RANDOM
	
	if(false){return argument[0];}
	if(false){return fha_sound_create;}
	return fhAudioSoundCreate(_category, _tracks, _pitchVariance, _volumeVariance, _behavior);
}