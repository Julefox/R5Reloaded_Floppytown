untyped

globalize_all_functions


void function PrinttGlobalFunctionFiles()
{
    printt( "|mp_rr_floppytown_global_function.nut:           file called.|" )
}


void function Floppytown_MapInit_Global_Functions()
{

}


entity function CreateFloppytownModel( asset a, vector pos, vector ang, string script_name = "FloppytownEntities" )
{
    entity prop = CreatePropDynamic( a, pos, ang, SOLID_VPHYSICS, 20000 )
    prop.kv.fadedist = 20000
    prop.AllowMantle()
    int realm = -1
    if ( realm> -1 )
    { prop.RemoveFromAllRealms(); prop.AddToRealm( realm ) }
    prop.e.gameModeId = realm

    FLOPPYTOWN_ENTITIES.append( prop )
    prop.SetScriptName( script_name )

return prop }


array< entity > function CreateFloppytownZiplineModel( vector pos, vector ang )
{
    entity column   = CreateFloppytownModel( SECURITY_FENCE, pos, ang )
    entity support  = CreateFloppytownModel( ZIP_ARM, pos + < 0, 0, 185 >, ang )

return [ column, support ] }


entity function CreateEditorRef( vector pos, vector ang, string name )
{
    entity editor_ref = CreateFloppytownModel( EDITOR_REF, pos, ang )
    SetTargetName( editor_ref, name )
    editor_ref.SetScriptName( "editor_ref" )
return editor_ref }


entity function CreateFloppytownUsableModel( asset model, vector pos, vector ang, string prompt, string name = "" )
{
    entity UsableButton = CreateEntity("prop_dynamic")
    UsableButton.kv.solid = 6
    UsableButton.SetValueForModelKey( model )
    UsableButton.AllowMantle()
    UsableButton.SetOrigin(pos)
    UsableButton.SetAngles(ang)
    SetTargetName( UsableButton, name )
    DispatchSpawn(UsableButton)

    UsableButton.SetUsable()
    UsableButton.SetUsableByGroup("pilot")
    UsableButton.SetUsePrompts(prompt, prompt)
return UsableButton }


entity function CreateFloppytownScriptMover( vector origin = < 0.0, 0.0, 0.0 >, vector angles = < 0.0, 0.0, 0.0 >, string name = "", bool visible = false )
{
    entity script_mover = CreateEntity( "script_mover_lightweight" )
    script_mover.kv.solid = 0

    if ( visible == true)
    { script_mover.SetValueForModelKey( EDITOR_REF ) }
    else
    { script_mover.SetValueForModelKey( $"mdl/dev/empty_model.rmdl" ) }

    script_mover.kv.SpawnAsPhysicsMover = 0
    script_mover.SetOrigin( origin )
    script_mover.SetAngles( angles )

    string target_name = "floppytown_script_mover_" + name
    SetTargetName( script_mover, target_name )

    DispatchSpawn( script_mover )

return script_mover }


entity function CreateFloppytownWallTrigger( vector pos, float radius = 1000 )
{
    entity map_trigger = CreateEntity( "trigger_cylinder" )
    map_trigger.SetRadius( radius );map_trigger.SetAboveHeight( 5000 );map_trigger.SetBelowHeight( 10 );
    map_trigger.SetOrigin( pos )
    DispatchSpawn( map_trigger )

    FLOPPYTOWN_ENTITIES.append( map_trigger )

    thread FloppytownWallTriggerThread( map_trigger )

return map_trigger }


void function FloppytownWallTriggerThread( entity map_trigger, float speed = 0.6 )
{
    bool active = true

    while ( active )
    {
        if( IsValid( map_trigger ) )
        {
            foreach( player in GetPlayerArray() )
            {
                if ( player.GetPhysics() != MOVETYPE_NOCLIP ) // won't affect noclip player
                {
                    if( map_trigger.IsTouching( player ) )
                    {
                        player.Zipline_Stop()

                        vector target_origin = player.GetOrigin()
                        target_origin.z = 0.0
                        vector map_trigger_origin = map_trigger.GetOrigin()
                        vector target_angles = player.GetAngles()
                        vector map_trigger_angles = map_trigger.GetAngles()

                        vector velocity = target_origin - map_trigger_origin
                        velocity = velocity * speed

                        vector angles = target_angles - map_trigger_angles

                        velocity = velocity + angles
                        player.SetVelocity(velocity)
            }   }   }
        }
        else
        { active = false ; break }

    wait 0.01 }
}


entity function CreateFloppytownPlayerTrigger(vector pos, string name = "", float box_radius = 1000 )
{
    entity player_trigger = CreateEntity( "trigger_cylinder" )
    player_trigger.SetRadius( box_radius );player_trigger.SetAboveHeight( 256 );player_trigger.SetBelowHeight( 10 );
    player_trigger.SetOrigin( pos )
    SetTargetName( player_trigger, "player_trigger_" + name )
    DispatchSpawn( player_trigger )

    FLOPPYTOWN_ENTITIES.append( player_trigger )

    thread FloppytownPlayerTriggerThread( player_trigger )

return player_trigger }


void function FloppytownPlayerTriggerThread( entity player_trigger )
{
    bool active = true

    while ( active )
    {
        if( IsValid( player_trigger ) )
        {
            foreach( player in GetPlayerArray() )
            {
                if ( player.GetPhysics() != MOVETYPE_NOCLIP ) // won't affect noclip player
                {
                    if( player_trigger.IsTouching( player ) )
                    {
                        printt( "|====================================================================|" )
                        printt( "| FallingObjectThread(): Thread activate by player trigger" )
                        printt( "|" )
                        printt( "| Player: " + player )

                        if( IsValid( player_trigger ) )
                        { player_trigger.Destroy() }

                        FlagSet( "FallingObjectThread()_IsActive" )

                        thread ChangePanelState()
                        thread FallingObjectThread()
                    }
                }
            }
        }
        else
        { active = false ; break }
        
    wait 0.01 }
}
