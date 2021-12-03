//SETS UP FH KEN AUDIO SYS
#region FH AUDIO
//set macro for new sound if want multiple from randomness
#macro SOUNDS global.sounds
#macro SND_SFX_CUTSCENE_FLYIN 0
#macro SND_SFX_PLAYER_BULLET_SHOOT 1
#macro SND_SFX_EXPLOSION 2
#macro SND_SFX_CONTINUE_DRONE 3


function initAudio()
{
    fhAudioInitialize();
    var array;
	
	#region cutscene
		SOUNDS[SND_SFX_CUTSCENE_FLYIN] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_cutscene_flyin, 0.1, 0.1);
	#endregion
	
	#region gui
		SOUNDS[SND_SFX_CONTINUE_DRONE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_continue_drone, 0.0, 0.0);
	#endregion
	
	#region weapon
		SOUNDS[SND_SFX_PLAYER_BULLET_SHOOT] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_player_bullet_shoot, 0.15, 0.15);
	#endregion
	
	#region explosion
		SOUNDS[SND_SFX_EXPLOSION] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_explosion, 0.1, 0.1);
	#endregion
	
	/*
    #region explosions
    array = [sndExplosionSmall1, sndExplosionSmall2];
    SOUNDS[SND_EXPLOSION_SMALL] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, array, 0.1, 0.1, FHAUDIO_CHOOSE_RANDOM);
    array = [sndExplosionMedium1];
    SOUNDS[SND_EXPLOSION_MEDIUM] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, array, 0.1, 0.1, FHAUDIO_CHOOSE_RANDOM);
    array = [sndExplosionLarge1];
    SOUNDS[SND_EXPLOSION_LARGE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, array, 0.1, 0.1, FHAUDIO_CHOOSE_RANDOM);
    #endregion
	
    #region weapons
    SOUNDS[SND_ROIDBUSTER_SHOOT] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndRoidbusterShoot, 0.1, 0.1);
    SOUNDS[SND_LASER_SHOOT] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndLaserShoot, 0.05, 0.05);
    SOUNDS[SND_TESLABOLT_SHOOT] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndBoltShoot, 0.1, 0.1);
    SOUNDS[SND_GAUSS_SHOOT] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndGaussShoot, 0.1, 0.1);
    //SOUNDS[SND_EMP_SHOOT] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndEmpShoot, 0.1, 0.1);
    #endregion
    #region other
    SOUNDS[SND_MATERIAL_MOVE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndMaterialMove, 0.4, 0.1);
    fhAudioSoundSetRepeatDelay(SOUNDS[SND_MATERIAL_MOVE], 0.1);
    SOUNDS[SND_MATERIAL_ABSORB] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndMaterialAbsorb, 0.1, 0.1);
    fhAudioSoundSetRepeatDelay(SOUNDS[SND_MATERIAL_ABSORB], 0.1);
    SOUNDS[SND_SHIP_THRUSTER] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndShipThruster, 0.05, 0.05);
    #endregion
    #region collisions
    SOUNDS[SND_COLLISION_THUD_QUICK] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, sndThudQuick, 0.1, 0.1);
    #endregion
	*/
}

//actuall playsound to use with audio system
function playSound(sound, _looped = false)
{
    return fhAudioSoundPlay(SOUNDS[sound], _looped);
}


//playsound normal asset name,  
//fade time is for the cross fade to new track in millisecs
//from beginning changes the music to play from start or where it left off
//fhAudioMusicCrossfade(snd_mus_music, fade_time, from_begging)
#endregion