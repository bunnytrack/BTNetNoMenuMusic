class NoMenuMusic_20190901 extends Mutator config(NoMenuMusic);

var config string NoMenuMusicMapList[32];
var bool bInitialised, bShouldIgnoreMap;

function PreBeginPlay() {
	if (bInitialised) {
		return;
	}

	Level.Game.BaseMutator.AddMutator(self);
	bInitialised = true;

	// In case it's deleted
	SaveConfig();

	Log("");
	Log("+--------------------------------------------------------------------------+");
	Log("| NoMenuMusic                                                              |");
	Log("| ------------------------------------------------------------------------ |");
	Log("| Author:  Sapphire <sapphire@bunnytrack.net>                              |");
	Log("| Version: 2019-09-01                                                      |");
	Log("| Website: http://www.bunnytrack.net                                       |");
	Log("| ------------------------------------------------------------------------ |");
	Log("| Released under the Creative Commons Attribution-NonCommercial-ShareAlike |");
	Log("| license. See https://creativecommons.org/licenses/by-nc-sa/4.0/          |");
	Log("+--------------------------------------------------------------------------+");
	Log("");

	bShouldIgnoreMap = ShouldIgnoreMap();
}

function Tick(float DeltaTime) {
	if (!bShouldIgnoreMap && Level.Song == none) {
		SilenceMusic();
	}
}

function SilenceMusic() {
	local PlayerPawn P;

	foreach AllActors(class'PlayerPawn', P) {
		P.ClientSetMusic(none, 0, 0, MTRAN_Instant);
	}
}

function bool ShouldIgnoreMap() {
	local int i;
	local string CurrentMap;

	CurrentMap = Left(string(Level), InStr(string(Level), "."));

	for (i = 0; i < ArrayCount(NoMenuMusicMapList); i++) {
		if (NoMenuMusicMapList[i] == CurrentMap) {
			Log("NoMenuMusic: ignoring map " $ CurrentMap);
			Log("");

			return true;
		}
	}

	Log("NoMenuMusic: silencing menu music for " $ CurrentMap);
	Log("");

	return false;
}
