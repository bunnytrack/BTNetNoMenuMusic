class NoMenuMusic extends Mutator config(NoMenuMusic);

simulated event PostBeginPlay() {

	Super.PostBeginPlay();

	Log("");
	Log("+--------------------------------------------------------------------------+");
	Log("| BTNetNoMenuMusic                                                         |");
	Log("| ------------------------------------------------------------------------ |");
	Log("| Authors:     Dizzy    <dizzy@bunnytrack.net>                             |");
	Log("|              Sapphire <sapphire@bunnytrack.net>                          |");
	Log("| Description: Prevents UT's default menu music from being played          |");
	Log("|              on maps which do not have a music track set.                |");
	Log("| Version:     2017-05-12                                                  |");
	Log("| Website:     http://www.bunnytrack.net                                   |");
	Log("| ------------------------------------------------------------------------ |");
	Log("| Released under the Creative Commons Attribution-NonCommercial-ShareAlike |");
	Log("| license. See https://creativecommons.org/licenses/by-nc-sa/4.0/          |");
	Log("+--------------------------------------------------------------------------+");

}

function tick(float DeltaTime) {

	local int    i;
	local string CurrentMusicTrack;

	Super.tick(DeltaTime);

	// Get the current level's audio track
	CurrentMusicTrack = string(Level.Song);

	if (CurrentMusicTrack == "None") {
		BlankMusic();
	}

} 

function BlankMusic() {

	local PlayerPawn PP; 
	local Music      BlankTrack;
	
	// Set each player's music to blank.umx
	foreach AllActors(class 'PlayerPawn', PP) {

		if(PP.Player != None) {
			BlankTrack = Music(DynamicLoadObject("blank.blank", class'Music'));
			PP.ClientSetMusic(BlankTrack, 0, 0, MTRAN_Instant);
		}

	}

}

defaultproperties {
}