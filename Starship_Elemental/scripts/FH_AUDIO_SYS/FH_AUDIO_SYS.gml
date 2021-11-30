//SETS UP FH KEN AUDIO SYS
#region FH AUDIO
//set macro for new sound if want multiple from randomness
#macro SOUNDS global.sounds
#macro SND_EXPLOSION_SMALL 0
#macro SND_EXPLOSION_MEDIUM 1
#macro SND_EXPLOSION_LARGE 2
#macro SND_ROIDBUSTER_SHOOT 3
#macro SND_LASER_SHOOT 4
#macro SND_TESLABOLT_SHOOT 5
#macro SND_EMP_SHOOT 6
#macro SND_GAUSS_SHOOT 7
#macro SND_MATERIAL_MOVE 8
#macro SND_MATERIAL_ABSORB 9
#macro SND_COLLISION_THUD_QUICK 10
#macro SND_SHIP_THRUSTER 11
#macro SND_THING 12


function initAudio()
{
    fhAudioInitialize();
    var array;
    #region explosions
    array = [sndExplosionSmall1, sndExplosionSmall2];
    SOUNDS[SND_EXPLOSION_SMALL] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, array, 0.1, 0.1, FHAUDIO_CHOOSE_RANDOM);
    array = [sndExplosionMedium1];
    SOUNDS[SND_EXPLOSION_MEDIUM] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, array, 0.1, 0.1, FHAUDIO_CHOOSE_RANDOM);
    array = [sndExplosionLarge1];
    SOUNDS[SND_EXPLOSION_LARGE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, array, 0.1, 0.1, FHAUDIO_CHOOSE_RANDOM);
    #endregion
	
	fhAudioCategoryPause()
	
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