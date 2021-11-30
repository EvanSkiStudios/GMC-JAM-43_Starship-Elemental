//system settings
masterVolume = 1;
musicVolume = 1;
realMusicVolume = 1;

for(var i = 0; i < FHAUDIO_NUMBER_SOUND_CATEGORIES; i++)
{
	soundCategoryVolumes[i] = 1;
	realCategoryVolumes[i] = 1;
}

//music stuff
currentMusicTrack = -1;
lastMusicTrack = -1;
currentMusicRef = -1;
fadingMusicTrack = -1;
fadingMusicRef = -1;
fadeTimeEnd = -1;
musicTrackPositions = ds_map_create();
musicStatus = __FHAUDIO_STATUS_STOPPED;
musicPendingFades = ds_list_create();

//emitter stuff
emitterMap = ds_map_create();
emitterNextIndex = 0;


//sound stuff
playingSoundsMap = ds_map_create();
fadingSoundsList = ds_list_create();
pausedSoundsMap = ds_map_create();

soundList = [];
soundNum = 0;

//listener stuff
listenerInstanceToFollow = -1;
listenerInstanceToFollow3d = false;
listenerInstanceToFollowVelocity = false;
listenerVelocityMultiplier = 1;
listenerInstanceToFollowOrientation = false;
listenerPrevX = 0;
listenerPrevY = 0;
listenerPrevZ = 0;
listenerCurrentLookAtX = 0;
listenerCurrentLookAtY = 0;
listenerCurrentLookAtZ = 1;
listenerCurrentUpX = 0;
listenerCurrentUpY = 1;
listenerCurrentUpZ = 0;

//volume stuff
if(FHAUDIO_AUTOSAVE_SETTINGS)
{
	if(!__fhAudioLoadVolumes())
		__fhAudioSaveVolumes();
}

setRealVolumes = function()
{
	realMusicVolume = musicVolume*masterVolume;
	for(var i = 0; i < FHAUDIO_NUMBER_SOUND_CATEGORIES; i++)
	{
		realCategoryVolumes[i] = soundCategoryVolumes[i] * masterVolume;
	}
}

setRealVolumes();

audio_falloff_set_model(audio_falloff_linear_distance);