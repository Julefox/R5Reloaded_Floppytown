// Credits Time !
// 𝕮𝖗𝖎𝖔𝖘𝕮𝖍𝖆𝖓 クリオスちゃん#0221 -- Main
// sal#3261 -- CUSTOM TDM Main
// @Shrugtal -- CUSTOM TDM score ui

global function Sh_CustomHideAndSeek_Init

global enum eTDMAnnounce
{
	NONE = 0
	WAITING_FOR_PLAYERS = 1
	ROUND_START_SEEKER = 2
	ROUND_START_HIDDEN = 3
	HIDETOSEEK = 4
	END_SEEKER = 5
	END_HIDDEN = 6
}

global struct SpawnLoc
{
    vector origin = <0, 0, 0>
    vector angles = <0, 0, 0>
}

global struct Spawn
{
    string name
    array<SpawnLoc> spawns
}

global struct LocationSpawn
{
    Spawn seeker
    Spawn hide
}

struct {
    var PlayerList
} file;

void function Sh_CustomHideAndSeek_Init()
{
    switch(GetMapName())
    {
        case "mp_rr_floppytown":
            NewLocationSpawn(
                NewSpawn( //For seeker
                    "Floppytown",
                    [
                        NewSpawnLoc(<772, 85, 2846>, <12, 89, 0>)
                    ]
                ),
                NewSpawn( //For hidden
                    "Floppytown",
                    [
                        NewSpawnLoc(<502, 437, 2380>, < 15, 89, 0 >)
                    ]
                )
            )
        default: // Yeah I know it's so sad that there are no other maps
            Assert(false, "No Hide and Seek locations found for this map!")
    }

    RegisterSignal( "ClosePlayerListRUI" )
}

SpawnLoc function NewSpawnLoc(vector origin, vector angles)
{
    SpawnLoc spawnLoc
    spawnLoc.origin = origin
    spawnLoc.angles = angles

    return spawnLoc
}

Spawn function NewSpawn(string name, array<SpawnLoc> spawnloc)
{
    Spawn spawn
    spawn.name = name
    spawn.spawns = spawnloc
    
    return spawnLoc
}

LocationSpawn function NewLocationSpawn(Spawn seeker, Spawn hidden)
{
    LocationSpawn locationSpawn
    locationSpawn.seeker = seeker
    locationSpawn.hidden = hidden
    
    return locationSpawn
}