//SETS UP FH KEN AUDIO SYS
#region FH AUDIO
//set macro for new sound if want multiple from randomness

//CHANGE TO ENUM!!!!!!!!!

#macro SOUNDS global.sounds
#macro SND_SFX_CUTSCENE_FLYIN 0
#macro SND_SFX_PLAYER_BULLET_SHOOT 1
#macro SND_SFX_EXPLOSION 2
#macro SND_SFX_CONTINUE_DRONE 3
#macro SND_SFX_PLAYER_HIT 4
#macro SND_SFX_SMARTBOMB_PICKUP 5
#macro SND_SFX_SMARTBOMB_CHANGE 6
#macro SND_SFX_SMARTBOMB_EARTH_RUMBLE 7
#macro SND_SFX_SMARTBOMB_ICE_WIND 8
#macro SND_SFX_SMARTBOMB_ICE 9
#macro SND_SFX_SMARTBOMB_LIGHTNING 10
#macro SND_SFX_SMARTBOMB_LIGHTNING_ZAP 11
#macro SND_SFX_SMARTBOMB_FIRE 12
#macro SND_SFX_ALARM 13
#macro SND_SFX_PAUSE 14


function initAudio()
{
    fhAudioInitialize();
    var array;
	
	SOUNDS[SND_SFX_PAUSE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_box_showup, 0.0, 0.0);
	
	#region martbombs
	SOUNDS[SND_SFX_SMARTBOMB_FIRE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, 	snd_sfx_smartbomb_fire, 0.0, 0.0);
	SOUNDS[SND_SFX_SMARTBOMB_EARTH_RUMBLE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_smartbomb_earth_rumble, 0.0, 0.0);
	SOUNDS[SND_SFX_SMARTBOMB_ICE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_ice_crackle, 0.15, 0.15);
	SOUNDS[SND_SFX_SMARTBOMB_ICE_WIND] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_smartbomb_ice_wind, 0.0, 0.0);
	SOUNDS[SND_SFX_SMARTBOMB_LIGHTNING_ZAP] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_smartbomb_lightning_zap, 0.15, 0.15);
	SOUNDS[SND_SFX_SMARTBOMB_LIGHTNING] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_smartbomb_lightning, 0.0, 0.0);
	#endregion
	
	#region cutscene
		SOUNDS[SND_SFX_ALARM] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_alarm, 0.1, 0.1);
		SOUNDS[SND_SFX_CUTSCENE_FLYIN] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_cutscene_flyin, 0.1, 0.1);
	#endregion
	
	#region gui
		SOUNDS[SND_SFX_CONTINUE_DRONE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_continue_drone, 0.0, 0.0);
	#endregion
	
	#region smart bomb
		SOUNDS[SND_SFX_SMARTBOMB_PICKUP] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_smartbomb_pickup, 0.0, 0.0);
		SOUNDS[SND_SFX_SMARTBOMB_CHANGE] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_smartbomb_change, 0.025, 0.1);
	#endregion
	
	#region weapon
		SOUNDS[SND_SFX_PLAYER_BULLET_SHOOT] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_player_bullet_shoot, 0.15, 0.15);
	#endregion
	
	#region hit effect
	#endregion
	
	#region explosion
		SOUNDS[SND_SFX_PLAYER_HIT] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_player_hit, 0.1, 0.1);
		SOUNDS[SND_SFX_EXPLOSION] = fhAudioSoundCreate(FHAUDIO_CATEGORY_GAME, snd_sfx_explosion, 0.025, 0.1);
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