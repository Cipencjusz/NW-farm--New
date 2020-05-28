#NoEnv

;!!!!!!   PLEASE MAKE A SAFE COPY OF YOUR fallout76prefs.ini and fallout76.ini BEFORE USE !!!!!!

; Setup := 0 -->> 800 x 600
; Setup := 1 -->> Your custom - Please change the values in Fallout76prefsYourCustom(), Fallout76oneYourCustom(), Fallout76twoYourCustom() for Your own.

Setup := 0

; Folder directory with fallout76prefs.ini and fallout76.ini - usually should look like C:\Users\(Your PC username here)\Documents\My Games\Fallout 76"
global dir1 := "C:\Users\Glowny\Documents\My Games\Fallout 76"

; game folder path - usally should look like C:\Program Files (x86)\Bethesda.net Launcher\games\Fallout76
global dir2 := "C:\Program Files (x86)\Bethesda.net Launcher\games\Fallout76"


delateFallout76prefs() 
delateFallout76one()
delateFallout76two()
Sleep, 500
	
if (Setup = 0)
{
	Fallout76prefs800x600()
	Fallout76one800x600()
	Fallout76two800x600()
}
	
if (Setup = 1)
{
	Fallout76prefsYourCustom()
	Fallout76oneYourCustom()
	Fallout76twoYourCustom()
}
ExitApp



;---------------------------------------------------------------------------
delateFallout76prefs() { 
;---------------------------------------------------------------------------
   FileDelete %dir1%\Fallout76prefs.ini 
}

;---------------------------------------------------------------------------
delateFallout76one() { 
;---------------------------------------------------------------------------
    FileDelete, %dir1%\Fallout76.ini
}

;---------------------------------------------------------------------------
delateFallout76two() { 
;---------------------------------------------------------------------------
    FileDelete, %dir2%\Fallout76.ini
}


; 800 x 600 Fallout76prefs.ini
;---------------------------------------------------------------------------
Fallout76prefs800x600() { 
;---------------------------------------------------------------------------
FileAppend, 
(
[Display]
iMaxAnisotropy=0
fShadowDistance=60000
fDirShadowDistance=60000
iShadowMapResolution=1024
uiShadowFilter=1
uiOrthoShadowFilter=1
fBlendSplitDirShadow=0
iMaxFocusShadows=0
iMaxDecalsPerFrame=0
iMaxSkinDecalsPerFrame=0
bVolumetricLightingEnable=0
bSAOEnable=1
uWaterShadowFilter=1
iVolumetricLightingTextureQuality=0
iSize H=600
iSize W=800
iLocation X=0
iLocation Y=0
bFull Screen=0
bBorderless=0
iGraphicPreset=0
[Decals]
bDecals=0
bSkinnedDecals=0
uMaxDecals=0
uMaxSkinDecals=0
[TerrainManager]
fBlockMaximumDistance=100000
fBlockLevel2Distance=75000
fBlockLevel1Distance=25000
fBlockLevel0Distance=15000
[ImageSpace]
bDoDepthOfField=0
bMBEnable=0
[LightingShader]
bScreenSpaceReflections=1
[LOD]
fLODFadeOutMultActors=5
fLODFadeOutMultItems=1.5
fLODFadeOutMultObjects=5
fLODFadeOutMultSkyCell=1
[Grass]
fGrassStartFadeDistance=3500
[Water]
bUseWaterHiRes=0
[Texture]
iLargeTextureArrayMipSkip=2
iTextureMipSkipBC1UNormSrgb=2
iTextureMipSkipBC3UNormSrgb=2
iTextureMipSkipBC1UNorm=2
iTextureMipSkipBC5SNorm=2
iTextureMipSkipBC4UNorm=2
iTextureMipSkipMinDimension=256
iLargeTextureArrayDim=1024
iTextureQualityLevel=0

), %dir1%\Fallout76prefs.ini
}


; 800 x 600 Fallout76.ini - first time
;---------------------------------------------------------------------------
Fallout76one800x600() { 
;---------------------------------------------------------------------------
FileAppend, 
(
[General]
sLanguage = en
bAlwaysActive = 1
bPlayMainMenuMusic = 0
sIntroSequence = 0
fChancesToPlayAlternateIntro=0
uMainMenuDelayBeforeAllowSkip=0
sStreamInstallVideoPlayList = 
sMainMenuMusic = Data\Music\Special\MUS_MainTheme.xwm
uMainMenuMusicFadeTimeMS = 1500
uMainMenuMusicAttnmB = 800
uModMenuMusicAttnmB = 800
bStreamingWallEnabled = 0
bJobifyMagicUpdate = 0
bLegacyFurnitureInteraction = 1
sBabylonMasters = NW.esm

[ScreenSplatter]
bBloodSplatterEnabled = 1

[Display]
bDynamicObjectQueryManager = 1
bMultiThreadedAccumulation = 1
bMultiThreadedRenderingUNP = 1
fDecalLOD0 = 8192
fSAORadius = 108.2
fSAOBias = 0.6
fSunUpdateThreshold = 0.5f
iSize W = 800
iSize H = 600
bFull Screen = 0
bBorderless = 0

[HairLighting]
fHairPrimSpecScale = 0.04
fHairPrimSpecPow = 388
fHairPrimSpecShift = 1.0
fHairSecSpecScale = 0.89
fHairSecSpecPow = 98
fHairSecSpecShift = 1.2

[Audio]
bEnableAudio = 0

[Interface]
iMainMenuStoreState = 1
fDefaultWorldFOV = 70
fDefault1stPersonFOV = 80
fSafeZoneX = 15.0
fSafeZoneY = 15.0
fSafeZoneXWide = 64.0
fSafeZoneXWide16x10 = 64.0
fSafeZoneYWide16x10 = 36.0

[MapMenu]
uLockedObjectMapLOD = 16
uLockedTerrainLOD = 32

[Controls]
fMouseHeadingXScale = .021
fMouseHeadingYScale = .021

[Grass]
iMinGrassSize = 20
bAllowCreateGrass = 1

[ImageSpace]
bDoRadialBlur = 1

[Weather]
bPrecipitation = 1
bFogEnabled = 1
fWindSpeedHighestHighMultiplier = 1.5
bRainOcclusion = 1
bWetnessOcclusion = 1

[Archive]
sResourceIndexFileList = SeventySix - Textures01.ba2, SeventySix - Textures02.ba2, SeventySix - Textures03.ba2, SeventySix - Textures04.ba2, SeventySix - Textures05.ba2, SeventySix - Textures06.ba2
sResourceStartUpArchiveList = SeventySix - Interface.ba2, SeventySix - Localization.ba2, SeventySix - Shaders.ba2, SeventySix - Startup.ba2
SResourceArchiveList = SeventySix - Materials.ba2, SeventySix - Meshes01.ba2, SeventySix - Meshes02.ba2, SeventySix - MiscClient.ba2, SeventySix - Sounds01.ba2, SeventySix - Sounds02.ba2, SeventySix - Startup.ba2, SeventySix - Voices.ba2
SResourceArchiveList2 = SeventySix - Animations.ba2, SeventySix - EnlightenInteriors.ba2, SeventySix - GeneratedTextures.ba2, SeventySix - EnlightenExteriors01.ba2, SeventySix - EnlightenExteriors02.ba2
sResourceDataDirsFinal = STRINGS\, TERRAIN\
SGeometryPackageList = SeventySix - Geometry.csg
SCellResourceIndexFileList = SeventySix.cdx
SResourceArchiveMemoryCacheList = SeventySix - Interface.ba2, SeventySix - Materials.ba2, SeventySix - MiscClient.ba2, SeventySix - Shaders.ba2
sResourceArchive2List = SeventySix - 00UpdateMain.ba2, SeventySix - 01UpdateMain.ba2, SeventySix - 00UpdateStream.ba2, SeventySix - 01UpdateStream.ba2, SeventySix - 00UpdateTextures.ba2, SeventySix - 01UpdateTextures.ba2, SeventySix - MeshesExtra.ba2, SeventySix - 02UpdateMain.ba2, SeventySix - 03UpdateMain.ba2, SeventySix - 04UpdateMain.ba2, SeventySix - 02UpdateStream.ba2, SeventySix - 03UpdateStream.ba2, SeventySix - 04UpdateStream.ba2, SeventySix - 02UpdateTextures.ba2, SeventySix - 03UpdateTextures.ba2, SeventySix - 04UpdateTextures.ba2, SeventySix - GeneratedMeshes.ba2, SeventySix - StaticMeshes.ba2, SeventySix - 05UpdateMain.ba2, SeventySix - 06UpdateMain.ba2, SeventySix - 07UpdateMain.ba2, SeventySix - 08UpdateMain.ba2, SeventySix - 09UpdateMain.ba2, SeventySix - 10UpdateMain.ba2, SeventySix - 11UpdateMain.ba2, SeventySix - 12UpdateMain.ba2, SeventySix - 05UpdateStream.ba2, SeventySix - 07UpdateStream.ba2, SeventySix - 09UpdateStream.ba2, SeventySix - 10UpdateStream.ba2, SeventySix - 11UpdateStream.ba2, SeventySix - 12UpdateStream.ba2, SeventySix - 05UpdateTextures.ba2, SeventySix - 06UpdateTextures.ba2, SeventySix - 07UpdateTextures.ba2, SeventySix - 08UpdateTextures.ba2, SeventySix - 09UpdateTextures.ba2, SeventySix - 10UpdateTextures.ba2, SeventySix - 11UpdateTextures.ba2, SeventySix - 12UpdateTextures.ba2

[LOD]
fLODFadeOutMultObjects = 4.5000
fLODFadeOutMultItems = 2.5000

[Enlighten]
bEnableEnlighten = 1

[Voice]
sVivoxDomain = @fowp.vivox.com
sVivoxEndpoint = https://fowp.www.vivox.com/api2

[Platform]
sCREnv = PROD
sEnvId = prodpc01
		
), (%dir1%\Fallout76.ini)   
}

; 800 x 600 Fallout76.ini - second time
;---------------------------------------------------------------------------
Fallout76two800x600() { 
;---------------------------------------------------------------------------
FileAppend, 
(
[General]
sLanguage = en
bAlwaysActive = 1
bPlayMainMenuMusic = 0
sIntroSequence = 0
fChancesToPlayAlternateIntro=0
uMainMenuDelayBeforeAllowSkip=0
sStreamInstallVideoPlayList = 
sMainMenuMusic = Data\Music\Special\MUS_MainTheme.xwm
uMainMenuMusicFadeTimeMS = 1500
uMainMenuMusicAttnmB = 800
uModMenuMusicAttnmB = 800
bStreamingWallEnabled = 0
bJobifyMagicUpdate = 0
bLegacyFurnitureInteraction = 1
sBabylonMasters = NW.esm

[ScreenSplatter]
bBloodSplatterEnabled = 1

[Display]
bDynamicObjectQueryManager = 1
bMultiThreadedAccumulation = 1
bMultiThreadedRenderingUNP = 1
fDecalLOD0 = 8192
fSAORadius = 108.2
fSAOBias = 0.6
fSunUpdateThreshold = 0.5f
iSize W = 800
iSize H = 600
bFull Screen = 0
bBorderless = 0

[HairLighting]
fHairPrimSpecScale = 0.04
fHairPrimSpecPow = 388
fHairPrimSpecShift = 1.0
fHairSecSpecScale = 0.89
fHairSecSpecPow = 98
fHairSecSpecShift = 1.2

[Audio]
bEnableAudio = 0

[Interface]
iMainMenuStoreState = 1
fDefaultWorldFOV = 70
fDefault1stPersonFOV = 80
fSafeZoneX = 15.0
fSafeZoneY = 15.0
fSafeZoneXWide = 64.0
fSafeZoneXWide16x10 = 64.0
fSafeZoneYWide16x10 = 36.0

[MapMenu]
uLockedObjectMapLOD = 16
uLockedTerrainLOD = 32

[Controls]
fMouseHeadingXScale = .021
fMouseHeadingYScale = .021

[Grass]
iMinGrassSize = 20
bAllowCreateGrass = 1

[ImageSpace]
bDoRadialBlur = 1

[Weather]
bPrecipitation = 1
bFogEnabled = 1
fWindSpeedHighestHighMultiplier = 1.5
bRainOcclusion = 1
bWetnessOcclusion = 1

[Archive]
sResourceIndexFileList = SeventySix - Textures01.ba2, SeventySix - Textures02.ba2, SeventySix - Textures03.ba2, SeventySix - Textures04.ba2, SeventySix - Textures05.ba2, SeventySix - Textures06.ba2
sResourceStartUpArchiveList = SeventySix - Interface.ba2, SeventySix - Localization.ba2, SeventySix - Shaders.ba2, SeventySix - Startup.ba2
SResourceArchiveList = SeventySix - Materials.ba2, SeventySix - Meshes01.ba2, SeventySix - Meshes02.ba2, SeventySix - MiscClient.ba2, SeventySix - Sounds01.ba2, SeventySix - Sounds02.ba2, SeventySix - Startup.ba2, SeventySix - Voices.ba2
SResourceArchiveList2 = SeventySix - Animations.ba2, SeventySix - EnlightenInteriors.ba2, SeventySix - GeneratedTextures.ba2, SeventySix - EnlightenExteriors01.ba2, SeventySix - EnlightenExteriors02.ba2
sResourceDataDirsFinal = STRINGS\, TERRAIN\
SGeometryPackageList = SeventySix - Geometry.csg
SCellResourceIndexFileList = SeventySix.cdx
SResourceArchiveMemoryCacheList = SeventySix - Interface.ba2, SeventySix - Materials.ba2, SeventySix - MiscClient.ba2, SeventySix - Shaders.ba2
sResourceArchive2List = SeventySix - 00UpdateMain.ba2, SeventySix - 01UpdateMain.ba2, SeventySix - 00UpdateStream.ba2, SeventySix - 01UpdateStream.ba2, SeventySix - 00UpdateTextures.ba2, SeventySix - 01UpdateTextures.ba2, SeventySix - MeshesExtra.ba2, SeventySix - 02UpdateMain.ba2, SeventySix - 03UpdateMain.ba2, SeventySix - 04UpdateMain.ba2, SeventySix - 02UpdateStream.ba2, SeventySix - 03UpdateStream.ba2, SeventySix - 04UpdateStream.ba2, SeventySix - 02UpdateTextures.ba2, SeventySix - 03UpdateTextures.ba2, SeventySix - 04UpdateTextures.ba2, SeventySix - GeneratedMeshes.ba2, SeventySix - StaticMeshes.ba2, SeventySix - 05UpdateMain.ba2, SeventySix - 06UpdateMain.ba2, SeventySix - 07UpdateMain.ba2, SeventySix - 08UpdateMain.ba2, SeventySix - 09UpdateMain.ba2, SeventySix - 10UpdateMain.ba2, SeventySix - 11UpdateMain.ba2, SeventySix - 12UpdateMain.ba2, SeventySix - 05UpdateStream.ba2, SeventySix - 07UpdateStream.ba2, SeventySix - 09UpdateStream.ba2, SeventySix - 10UpdateStream.ba2, SeventySix - 11UpdateStream.ba2, SeventySix - 12UpdateStream.ba2, SeventySix - 05UpdateTextures.ba2, SeventySix - 06UpdateTextures.ba2, SeventySix - 07UpdateTextures.ba2, SeventySix - 08UpdateTextures.ba2, SeventySix - 09UpdateTextures.ba2, SeventySix - 10UpdateTextures.ba2, SeventySix - 11UpdateTextures.ba2, SeventySix - 12UpdateTextures.ba2

[LOD]
fLODFadeOutMultObjects = 4.5000
fLODFadeOutMultItems = 2.5000

[Enlighten]
bEnableEnlighten = 1

[Voice]
sVivoxDomain = @fowp.vivox.com
sVivoxEndpoint = https://fowp.www.vivox.com/api2

[Platform]
sCREnv = PROD
sEnvId = prodpc01

), %dir2%\Fallout76.ini   
}

; Your Custom Fallout76prefs.ini
;---------------------------------------------------------------------------
Fallout76prefsYourCustom() { 
;---------------------------------------------------------------------------
FileAppend, 
(
[Display]
iMaxAnisotropy=16
fShadowDistance=90000.0000
fDirShadowDistance=90000.0000
iShadowMapResolution=2048
uiShadowFilter=2
uiOrthoShadowFilter=2
fBlendSplitDirShadow=48.0000
iMaxFocusShadows=1
iMaxDecalsPerFrame=10
iMaxSkinDecalsPerFrame=3
bVolumetricLightingEnable=1
bSAOEnable=1
uWaterShadowFilter=2
iVolumetricLightingTextureQuality=1
iSize H=1080
iSize W=1920
iLocation X=817
iLocation Y=244
bFull Screen=0
bBorderless=1
iGraphicPreset=0
uShadowExpirationMS=5000
uPointLightShadowMapMaxResLog2=10
fShadowBiasScale=1.0000
iDirShadowSplits=2
fTessFactorMaxDistanceScale=500.0000
fTessFactorMinDistanceScale=100.0000
flocalShadowMapHalveEveryXUnit=750.0000
fLeafAnimDampenDistEnd=4600.0000
fLeafAnimDampenDistStart=3600.0000
iMaxFocusShadowsDialogue=4
bComputeShaderDeferredTiledLighting=1
uFaceGenTextureResolution=1024
uPipboyTargetHeight=700
uPipboyTargetWidth=876
sAntiAliasing=TAA
iTiledLightingMinLights=10
fRainOccProjRadiusRejectionSize=0.0100
fRainOccObjRejectionSize=100.0000
fSMProjRadiusRejectionSize=0.0200
fSMObjRejectionSize=250.0000
uSMObjRejectionSplit=2
bEffectShaderAllowPBRShadows=1
iPresentInterval=1
bTopMostWindow=0
bMaximizeWindow=0
iAdapterOutputIndex=0
iAdapterIndex=0
bAllowShadowcasterNPCLights=0
iScreenShotIndex=0
fMaxFocusShadowMapDistance=450.0000
[Decals]
bDecals=1
bSkinnedDecals=1
uMaxDecals=100
uMaxSkinDecals=35
[TerrainManager]
fBlockMaximumDistance=100000.0000
fBlockLevel2Distance=80000.0000
fBlockLevel1Distance=32000.0000
fBlockLevel0Distance=20000.0000
fTreeLoadDistance=25000.0000
fSplitDistanceMult=0.7500
bShowLODInEditor=0
[ImageSpace]
bDoDepthOfField=1
bMBEnable=1
bLensFlare=1
bScreenSpaceBokeh=1
[LightingShader]
bScreenSpaceReflections=1
[LOD]
fLODFadeOutMultActors=7.0000
fLODFadeOutMultItems=3.0000
fLODFadeOutMultObjects=7.0000
fLODFadeOutMultSkyCell=1.0000
[Grass]
fGrassStartFadeDistance=4500.0000
fGrassMaxStartFadeDistance=7000.0000
fGrassMinStartFadeDistance=3500.0000
[Texture]
iLargeTextureArrayMipSkip=1
iTextureMipSkipBC1UNormSrgb=1
iTextureMipSkipBC3UNormSrgb=1
iTextureMipSkipBC1UNorm=1
iTextureMipSkipBC5SNorm=1
iTextureMipSkipBC4UNorm=1
iTextureMipSkipMinDimension=512
iLargeTextureArrayCount=32
iLargeTextureArrayDim=2048
[Water]
bUseWaterHiRes=0
bUseWaterDisplacements=1
bUseWaterRefractions=1
bUseWaterReflections=1
bUseWaterDepth=1
[Weather]
iRainOcclusionMapResolution=512
[General]
fBrightLightColorB=1.0000
fBrightLightColorG=1.0000
fBrightLightColorR=1.0000
bGamepadEnable=1
iStoryManagerLoggingEvent=-1
bEnableStoryManagerLogging=0
bFaceGenTextureDegrading=1
uGridsToLoad=5
[VATS]
fModMenuEffectHighlightPAColorB=0.4100
fModMenuEffectHighlightPAColorG=0.8200
fModMenuEffectHighlightPAColorR=1.0000
fModMenuEffectPAColorB=0.4100
fModMenuEffectPAColorG=0.8200
fModMenuEffectPAColorR=1.0000
fModMenuEffectHighlightColorB=0.0824
fModMenuEffectHighlightColorG=1.0000
fModMenuEffectHighlightColorR=0.0706
fModMenuEffectColorB=0.4200
fModMenuEffectColorG=0.9900
fModMenuEffectColorR=0.4900
uVATSTargetEffectColorB=49
uVATSTargetEffectColorG=100
uVATSTargetEffectColorR=10
[Pipboy]
fPipboyEffectColorB=0.5000
fPipboyEffectColorG=1.0000
fPipboyEffectColorR=0.1000
bQuickboyMode=1
[Enlighten]
fBounceQuality=0.0000
bEnableDirectionalIrradiance=1
[Culling]
bMultiThreadedLODCulling=1
[MAIN]
fImageContrastHDR=1.7500
fImageContrastSDR=1.0000
fHUDOpacity=1.0000
bSaveOnTravel=1
bSaveOnWait=1
bSaveOnRest=1
bCrosshairEnabled=0
fSkyCellRefFadeDistance=150000.0000
[Interface]
bDialogueSubtitles=0
bGeneralSubtitles=0
bDialogueCameraEnable=1
bShowCompass=1
uHUDActiveEffectWidget=2
iHUDColorC=0
iHUDColorV=0
iHUDColorS=0
iHUDColorH=0
iHUDColorB=21
iHUDColorG=255
iHUDColorR=18
[Controls]
fMouseHeadingSensitivity=0.0300
fGamepadHeadingSensitivity=0.6667
bAlwaysRunByDefault=1
bInvertYValues=0
bGamePadRumble=1
[GamePlay]
iDifficulty=2
bShowFloatingQuestMarkers=1
[Particles]
iMaxDesired=750
[SaveGame]
fAutosaveEveryXMins=10.0000
[AudioMenu]
fAudioMasterVolume=1.0000
fVal7=1.0000
uID7=0
fVal6=1.0000
uID6=0
fVal5=1.0000
uID5=0
fVal4=0.3500
uID4=138006
fVal3=0.7500
uID3=1007612
fVal2=1.0000
uID2=94881
fVal1=0.3500
uID1=466532
fVal0=0.6500
uID0=554685
[Voice]
uTransmitPreference=2
uVivoxVoiceVolume=100
[Landscape]
fScrSpaceErrorThreshold=3.0000
fWorldBorderHeight=2048.0000
		
), %dir1%\Fallout76Prefs.ini   
}


; Your Custom Fallout76.ini - first time
;---------------------------------------------------------------------------
Fallout76oneYourCustom() { 
;---------------------------------------------------------------------------
FileAppend, 
(
[General]
sLanguage = en
bAlwaysActive = 1
bPlayMainMenuMusic = 1
sIntroSequence = BGSLogo4k.bk2
sStreamInstallVideoPlayList = 
sMainMenuMusic = Data\Music\Special\MUS_MainTheme.xwm
uMainMenuMusicFadeTimeMS = 1500
uMainMenuMusicAttnmB = 800
uModMenuMusicAttnmB = 800
bStreamingWallEnabled = 0
bJobifyMagicUpdate = 0
bLegacyFurnitureInteraction = 1
sBabylonMasters = NW.esm



[ScreenSplatter]
bBloodSplatterEnabled = 1

[Display]
bDynamicObjectQueryManager = 1
bMultiThreadedAccumulation = 1
bMultiThreadedRenderingUNP = 1
fDecalLOD0 = 8192
fSAORadius = 108.2
fSAOBias = 0.6
fSunUpdateThreshold = 0.5f
iSize W = 1920
iSize H = 1080
bFull Screen = 0
bBorderless = 1

[HairLighting]
fHairPrimSpecScale = 0.04
fHairPrimSpecPow = 388
fHairPrimSpecShift = 1.0
fHairSecSpecScale = 0.89
fHairSecSpecPow = 98
fHairSecSpecShift = 1.2

[Audio]
bEnableAudio = 1

[Interface]
iMainMenuStoreState = 1
fDefaultWorldFOV = 70
fDefault1stPersonFOV = 80
fSafeZoneX = 15.0
fSafeZoneY = 15.0
fSafeZoneXWide = 64.0
fSafeZoneXWide16x10 = 64.0
fSafeZoneYWide16x10 = 36.0

[MapMenu]
uLockedObjectMapLOD = 16
uLockedTerrainLOD = 32

[Controls]
fMouseHeadingXScale = .021
fMouseHeadingYScale = .021

[Grass]
iMinGrassSize = 20
bAllowCreateGrass = 1

[ImageSpace]
bDoRadialBlur = 1

[Weather]
bPrecipitation = 1
bFogEnabled = 1
fWindSpeedHighestHighMultiplier = 1.5
bRainOcclusion = 1
bWetnessOcclusion = 1

[Archive]
sResourceIndexFileList = SeventySix - Textures01.ba2, SeventySix - Textures02.ba2, SeventySix - Textures03.ba2, SeventySix - Textures04.ba2, SeventySix - Textures05.ba2, SeventySix - Textures06.ba2
sResourceStartUpArchiveList = SeventySix - Interface.ba2, SeventySix - Localization.ba2, SeventySix - Shaders.ba2, SeventySix - Startup.ba2
SResourceArchiveList = SeventySix - GeneratedMeshes.ba2, SeventySix - Materials.ba2, SeventySix - Meshes01.ba2, SeventySix - Meshes02.ba2, SeventySix - MeshesExtra.ba2, SeventySix - MiscClient.ba2, SeventySix - Sounds01.ba2, SeventySix - Sounds02.ba2, SeventySix - Startup.ba2, SeventySix - Voices.ba2, SeventySix - ATX_Main.ba2, SeventySix - ATX_Textures.ba2
SResourceArchiveList2 = SeventySix - Animations.ba2, SeventySix - EnlightenInteriors.ba2, SeventySix - GeneratedTextures.ba2, SeventySix - EnlightenExteriors01.ba2, SeventySix - EnlightenExteriors02.ba2
sResourceArchive2List = SeventySix - 00UpdateMain.ba2, SeventySix - 01UpdateMain.ba2, SeventySix - 00UpdateStream.ba2, SeventySix - 01UpdateStream.ba2, SeventySix - 00UpdateTextures.ba2, SeventySix - 01UpdateTextures.ba2, SeventySix - MeshesExtra.ba2, SeventySix - GeneratedMeshes.ba2
sResourceDataDirsFinal = STRINGS\, TERRAIN\
SGeometryPackageList = SeventySix - Geometry.csg
SCellResourceIndexFileList = SeventySix.cdx
SResourceArchiveMemoryCacheList = SeventySix - Interface.ba2, SeventySix - Materials.ba2, SeventySix - MiscClient.ba2, SeventySix - Shaders.ba2

[LOD]
fLODFadeOutMultObjects = 4.5000
fLODFadeOutMultItems = 2.5000

[Enlighten]
bEnableEnlighten = 1

[Voice]
sVivoxDomain = @fowp.vivox.com
sVivoxEndpoint = https://fowp.www.vivox.com/api2

[Platform]
sCREnv = PROD
sEnvId = prodpc01
		
), %dir1%\Fallout76.ini   
}

; Your Custom Fallout76.ini - second time
;---------------------------------------------------------------------------
Fallout76twoYourCustom() { 
;---------------------------------------------------------------------------
FileAppend, 
(
[General]
sLanguage = en
bAlwaysActive = 1
bPlayMainMenuMusic = 1
sIntroSequence = BGSLogo4k.bk2
sStreamInstallVideoPlayList = 
sMainMenuMusic = Data\Music\Special\MUS_MainTheme.xwm
uMainMenuMusicFadeTimeMS = 1500
uMainMenuMusicAttnmB = 800
uModMenuMusicAttnmB = 800
bStreamingWallEnabled = 0
bJobifyMagicUpdate = 0
bLegacyFurnitureInteraction = 1
sBabylonMasters = NW.esm

[ScreenSplatter]
bBloodSplatterEnabled = 1

[Display]
bDynamicObjectQueryManager = 1
bMultiThreadedAccumulation = 1
bMultiThreadedRenderingUNP = 1
fDecalLOD0 = 8192
fSAORadius = 108.2
fSAOBias = 0.6
fSunUpdateThreshold = 0.5f
iSize W = 1920
iSize H = 1080
bFull Screen = 0
bBorderless = 1

[HairLighting]
fHairPrimSpecScale = 0.04
fHairPrimSpecPow = 388
fHairPrimSpecShift = 1.0
fHairSecSpecScale = 0.89
fHairSecSpecPow = 98
fHairSecSpecShift = 1.2

[Audio]
bEnableAudio = 1

[Interface]
iMainMenuStoreState = 1
fDefaultWorldFOV = 70
fDefault1stPersonFOV = 80
fSafeZoneX = 15.0
fSafeZoneY = 15.0
fSafeZoneXWide = 64.0
fSafeZoneXWide16x10 = 64.0
fSafeZoneYWide16x10 = 36.0

[MapMenu]
uLockedObjectMapLOD = 16
uLockedTerrainLOD = 32

[Controls]
fMouseHeadingXScale = .021
fMouseHeadingYScale = .021

[Grass]
iMinGrassSize = 20
bAllowCreateGrass = 1

[ImageSpace]
bDoRadialBlur = 1

[Weather]
bPrecipitation = 1
bFogEnabled = 1
fWindSpeedHighestHighMultiplier = 1.5
bRainOcclusion = 1
bWetnessOcclusion = 1

[Archive]
sResourceIndexFileList = SeventySix - Textures01.ba2, SeventySix - Textures02.ba2, SeventySix - Textures03.ba2, SeventySix - Textures04.ba2, SeventySix - Textures05.ba2, SeventySix - Textures06.ba2
sResourceStartUpArchiveList = SeventySix - Interface.ba2, SeventySix - Localization.ba2, SeventySix - Shaders.ba2, SeventySix - Startup.ba2
SResourceArchiveList = SeventySix - GeneratedMeshes.ba2, SeventySix - Materials.ba2, SeventySix - Meshes01.ba2, SeventySix - Meshes02.ba2, SeventySix - MeshesExtra.ba2, SeventySix - MiscClient.ba2, SeventySix - Sounds01.ba2, SeventySix - Sounds02.ba2, SeventySix - Startup.ba2, SeventySix - Voices.ba2, SeventySix - ATX_Main.ba2, SeventySix - ATX_Textures.ba2
SResourceArchiveList2 = SeventySix - Animations.ba2, SeventySix - EnlightenInteriors.ba2, SeventySix - GeneratedTextures.ba2, SeventySix - EnlightenExteriors01.ba2, SeventySix - EnlightenExteriors02.ba2
sResourceArchive2List = SeventySix - 00UpdateMain.ba2, SeventySix - 01UpdateMain.ba2, SeventySix - 00UpdateStream.ba2, SeventySix - 01UpdateStream.ba2, SeventySix - 00UpdateTextures.ba2, SeventySix - 01UpdateTextures.ba2, SeventySix - MeshesExtra.ba2, SeventySix - GeneratedMeshes.ba2
sResourceDataDirsFinal = STRINGS\, TERRAIN\
SGeometryPackageList = SeventySix - Geometry.csg
SCellResourceIndexFileList = SeventySix.cdx
SResourceArchiveMemoryCacheList = SeventySix - Interface.ba2, SeventySix - Materials.ba2, SeventySix - MiscClient.ba2, SeventySix - Shaders.ba2

[LOD]
fLODFadeOutMultObjects = 4.5000
fLODFadeOutMultItems = 2.5000

[Enlighten]
bEnableEnlighten = 1

[Voice]
sVivoxDomain = @fowp.vivox.com
sVivoxEndpoint = https://fowp.www.vivox.com/api2

[Platform]
sCREnv = PROD
sEnvId = prodpc01
		
), %dir2%\Fallout76.ini   
}
