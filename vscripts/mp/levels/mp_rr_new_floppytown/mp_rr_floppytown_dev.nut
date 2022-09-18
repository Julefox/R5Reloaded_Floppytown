untyped

globalize_all_functions


void function Floppytown_MapInit_Dev()
{
    if ( GetCurrentPlaylistVarBool( "ft_dev_enable", false ) ) // map editing, do not activate in normal use
    {
        AddClientCommandCallback( "god",    ClientCommand_Invulnerable )
        AddClientCommandCallback( "test",   ClientCommand_Test )
        AddClientCommandCallback( "cyl",    ClientCommand_DebugCylender )
        //AddClientCommandCallback( "asset",  ClientCommand_AssetViewerActive )
        //AddClientCommandCallback( "fall",   ClientCommand_FallingObjectActiveThread )
        AddClientCommandCallback( "clTest", ClientCommand_Cl_Test )
    }
}

bool function ClientCommand_Invulnerable( entity player, array<string> args )
{
    if ( player.IsInvulnerable() )
    {
        player.ClearInvulnerable()
        printt( player.GetPlayerName() + " is now vulnerable." )
    }
    else
    {
        player.SetInvulnerable()
        player.SetHealth( 100 )

        printt( player.GetPlayerName() + " is invulnerable !")
    }

return true }

bool function ClientCommand_Test( entity player, array<string> args )
{
    
return true }

bool function ClientCommand_DebugCylender( entity player, array<string> args )
{
    foreach( ent in GetEntArrayByClass_Expensive( "trigger_cylinder" ) )
    {
        DebugDrawCylinder( ent.GetOrigin(), ent.GetAngles() + < -90, 0, 0 >, ent.GetRadius(), ent.GetAboveHeight(), 55, 120, 194, false, 40.0 )
        DebugDrawCylinder( ent.GetOrigin(), ent.GetAngles() + < -90, 45, 0 >, ent.GetRadius(), ent.GetAboveHeight(), 55, 120, 194, false, 40.0 )
    }
return true }

bool function ClientCommand_Cl_Test( entity player, array<string> args )
{
    Remote_CallFunction_NonReplay( player, "ServerCallback_Cl_Test" )
return true }

