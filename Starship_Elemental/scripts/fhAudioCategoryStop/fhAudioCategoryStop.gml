function fhAudioCategoryStop(category, _fadeTime)
{
	/// @param category
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioCategoryStop()");
		__fhAudioAssertArgumentNotUndefined("fhAudioCategoryStop()", "category", category);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("Called fhAudioCategoryStop() with a non-existent category.");
		}
		if(_fadeTime != undefined)
			if(_fadeTime < 0)
				__fhAudioThrowError("Called fhAudioCategoryStop() with a negative fading time.");
	}
	if(_fadeTime == undefined)
	{
		_fadeTime = 0;
	}
	with(__fhAudioObjController)
	{
		var array = __fhAudioMapToArray(playingSoundsMap);
		var size = array_length(array);
		for(var i = 0; i < size; i++)
		{
			if(array[i].myCategory == category)
			{
				if(_fadeTime>0)
				{
					audio_sound_gain(array[i].mySound, 0, _fadeTime);
					var fading = new __fhAudioFadingSound(array[i].mySound, _fadeTime);
					ds_list_add(__fhAudioObjController.fadingSoundsList, fading);
				}
				else
				{
					audio_stop_sound(array[i].mySound);
				}
				ds_map_delete(playingSoundsMap, array[i].mySound);
			}
		}
	}
	return true;
}

function fha_category_stop(category, _fadeTime)
{
	/// @param category
	
	if(false){return fha_category_stop;}
	return fhAudioCategoryStop(category, _fadeTime);
}