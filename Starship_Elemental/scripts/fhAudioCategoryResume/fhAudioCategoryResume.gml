function fhAudioCategoryResume(category, _fadeTime)
{
	/// @param category
	/// @param _fadeTime=0
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioCategoryResume()");
		__fhAudioAssertArgumentNotUndefined("fhAudioCategoryResume()", "category", category);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioCategoryResume() called with a non-existent category.");
		}
		if(_fadeTime != undefined)
			if(_fadeTime < 0)
				__fhAudioThrowError("Called fhAudioCategoryResume() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		var array = __fhAudioMapToArray(playingSoundsMap);
		var size = array_length(array);
		for(var i = 0; i < size; i++)
		{
			if(array[i].myCategory == category)
			{
				__fhAudioSoundResume(array[i].mySound, _fadeTime);
			}
		}
	}
	return true;
}

function fha_category_resume(category, _fadeTime)
{
	/// @param category
	/// @param _fadeTime=0
	
	if(false){return argument[0];}
	if(false){return fha_category_resume;}
	return fhAudioCategoryResume(category, _fadeTime);
}