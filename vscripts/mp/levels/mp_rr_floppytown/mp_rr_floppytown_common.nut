global function Floppytown_MapInit_Common

global function OnEntitiesTeleporters

#if SERVER
global function SpawnMapTeleporters
global function CreateFloppytownUsableModel
global function TeleportPlayer
#endif

const string BUTTON_SOUND = "UI_Menu_back"

void function Floppytown_MapInit_Common()
{
	printt( "| Floppytown_MapInit_Common:                    The file has been called. |" )
	Teleporters_Init()
}

void function Teleporters_Init()
{
	#if SERVER
		AddCallback_EntitiesDidLoad( OnEntitiesTeleporters )
	#endif
}

void function OnEntitiesTeleporters()
{
	#if SERVER
	// Map Teleporters
	SpawnMapTeleporters()
	#endif
}

#if SERVER
///////////////////////////////////////////////////////////////////////////////////
//// CREATE IN GAME TELEPORTER FUNCTION
///////////////////////////////////////////////////////////////////////////////////
void function SpawnMapTeleporters()
{
	entity script_mover = CreateScriptMover( <1600, 3008, 60> )
	entity tp_test = CreateFloppytownUsableModel( CORE_ENERGY, <1600, 3008, 60>, <0,90,0>, "%&use% ???")
	AddCallback_OnUseEntity( tp_test, void function(entity panel, entity user, int input) 
	{
		EmitSoundOnEntityOnlyToPlayer( user, user, BUTTON_SOUND )
		TeleportPlayer(user,<1152, 3008, 600>, <0,180,0>)
	})
	tp_test.SetParent( script_mover )
	thread MovingTP( script_mover )
}

///////////////////////////////////////////////////////////////////////////////////
//// CREATE ENTITY FUNCTION
///////////////////////////////////////////////////////////////////////////////////
entity function CreateFloppytownUsableModel( asset model, vector pos, vector ang, string prompt )
{
 	entity TeleporterButton = CreateEntity("prop_dynamic")
	TeleporterButton.kv.solid = 6
	TeleporterButton.SetValueForModelKey( model )
	TeleporterButton.SetOrigin(pos)
	TeleporterButton.SetAngles(ang)
	DispatchSpawn(TeleporterButton)

	TeleporterButton.SetUsable()
	TeleporterButton.SetUsableByGroup("pilot")
	TeleporterButton.SetUsePrompts(prompt, prompt)
	return TeleporterButton 
}

///////////////////////////////////////////////////////////////////////////////////
//// TELEPORT PLAYER FUNCTION
///////////////////////////////////////////////////////////////////////////////////
void function TeleportPlayer( entity player, vector pos, vector ang )
{
 	player.SetOrigin(pos)
	player.SetAngles(ang)
	EmitSoundOnEntityOnlyToPlayer( player, player,		"weapon_stickylauncher_windup_1p" /*"PhaseGate_Enter_1p"*/ )
	EmitSoundOnEntityExceptToPlayer( player, player,	"weapon_stickylauncher_windup_1p" /*"PhaseGate_Enter_3p"*/ )
}
///////////////////////////////////////////////////////////////////////////////////
//// THREAD //// TEST
///////////////////////////////////////////////////////////////////////////////////
void function MovingTP( entity script_mover )
{
	//Music( script_mover )
	script_mover.NonPhysicsMoveTo( <3136, 3008, 60>, 30, 0.0, 0.0 )
		wait 30
	script_mover.NonPhysicsMoveTo( <3200, 2368, 60>, 10, 0.0, 0.0 )
		wait 10
	script_mover.NonPhysicsMoveTo( <3200, 1536, 60>, 20, 0.0, 0.0 )
}

void function Music( entity script_mover )
{

	EmitSoundOnEntity( script_mover, "Titan_Legion_Smart_Core_ActiveLoop_1P" )

}


#endif