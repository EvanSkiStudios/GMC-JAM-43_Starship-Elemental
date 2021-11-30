function fhAudioSoundPlayOnEmitter(sound, emitter, _looped)
{
	/// @param sound
	/// @param emitter
	/// @param _looped=false
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPlayOnEmitter()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlayOnEmitter()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlayOnEmitter()", "emitter", emitter);
		if(!ds_map_exists(__fhAudioObjController.emitterMap, emitter))
			__fhAudioThrowError("You called fhAudioSoundPlayOnEmitter() with a non-existent emitter");
		if(sound >= __fhAudioObjController.soundNum)
		{
			__fhAudioThrowError("Called fhAudioSoundPlayOnEmitter() with a non valid sound.");
		}
		
	}
	if(_looped == undefined)
		_looped = false;
	var newSound = __fhAudioObjController.soundList[sound].playSound(_looped, emitter);
	if(_looped)
	{
		var add = new __fhAudioPlayingSound(newSound, __fhAudioObjController.soundList[sound].myCategory);
		__fhAudioObjController.playingSoundsMap[? newSound] = add;
	}
	return newSound;
}

function fha_sound_play_on_emitter(sound, emitter, _looped)
{
	/// @param sound
	/// @param emitter
	/// @param _looped=false
	
	if(false){return argument[0];}
	if(false){return fha_sound_play_on_emitter;}
	return fhAudioSoundPlayOnEmitter(sound, emitter, _looped);
}