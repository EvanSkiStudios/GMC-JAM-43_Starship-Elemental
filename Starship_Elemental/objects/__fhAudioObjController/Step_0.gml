#region musicfading
if(musicStatus == __FHAUDIO_STATUS_CROSSFADING || musicStatus == __FHAUDIO_STATUS_SWAPFADING)
{
	if(current_time >= fadeTimeEnd)
	{
		__fhAudioStopFadedTrack();
	}
}
else
{
	if(ds_list_size(musicPendingFades) > 0)
	{
		__fhAudioDoCrossFade(musicPendingFades[| 0]);
		ds_list_delete(musicPendingFades, 0);
	}
}
#endregion
#region handle fading sound effects
for(var i = 0; i < ds_list_size(fadingSoundsList); i++)
{
	if(fadingSoundsList[| i].finishedTime <= current_time)
	{
		if(fadingSoundsList[| i].fadeToPause)
		{
			audio_pause_sound(fadingSoundsList[| i].mySound);
			ds_map_add(pausedSoundsMap, fadingSoundsList[| i].mySound, fadingSoundsList[| i].originalVolume);
		}
		else
		{
			audio_stop_sound(fadingSoundsList[| i].mySound);
			ds_map_delete(playingSoundsMap, fadingSoundsList[| i].mySound);
		}
		
		ds_list_delete(fadingSoundsList, i);
		i--;
	}
}
#endregion
