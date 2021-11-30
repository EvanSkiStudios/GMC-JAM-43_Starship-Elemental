function fhAudioSoundPlay(sound, _looped)
{
	/// @param sound
	/// @param _looped=false
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPlay()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay()", "sound", sound);
		if(sound >= __fhAudioObjController.soundNum)
		{
			__fhAudioThrowError("Called fhAudioSoundPlay() with a non valid sound.");
		}
	}
	if(_looped == undefined)
		_looped = false;
	var newSound = __fhAudioObjController.soundList[sound].playSound(_looped);
	if(_looped)
	{
		var add = new __fhAudioPlayingSound(newSound, __fhAudioObjController.soundList[sound].myCategory);
		__fhAudioObjController.playingSoundsMap[? newSound] = add;
	}
	return newSound;
}

function fha_sound_play(sound, _looped)
{
	/// @param sound
	/// @param _looped=false
	
	if(false){return argument[0];}
	if(false){return fha_sound_play;}
	return fhAudioSoundPlay(sound, _looped);
}