untyped

globalize_all_functions


void function Floppytown_MapInit_Global_Function_Library()
{
    printt( "| Floppytown_MapInit_Global_Function_Library:   The file has been called. |" )
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

void function GenerateCraneForFloppytown( vector origin, vector ang_a, vector ang_b, vector ang_c, string name )
{
    FlagSet( "FallingObjectThread()_IsActive" )

    thread ChangePanelState()

    string target_name = "crane_" + name

    entity script_mover_part_b = CreateFloppytownScriptMover( origin + FT_CRANE_PART_B_OFFSET, ZERO_VECTOR, target_name + "_b", true )
    entity script_mover_part_c = CreateFloppytownScriptMover( origin + FT_CRANE_PART_C_OFFSET, ZERO_VECTOR, target_name + "_c", true )
    entity script_mover_part_sling = CreateFloppytownScriptMover( origin + FT_CRANE_PART_SLING_OFFSET, ZERO_VECTOR, target_name + "_sling", true )

    entity moving_part_model_a = CreateFloppytownModel( CRANE_01_A, origin                          , ang_a )
    entity moving_part_model_b = CreateFloppytownModel( CRANE_01_B, origin + FT_CRANE_PART_B_OFFSET , ZERO_VECTOR )
    entity moving_part_model_c = CreateFloppytownModel( CRANE_01_C, origin + FT_CRANE_PART_C_OFFSET , ZERO_VECTOR )

    moving_part_model_b.SetParent( script_mover_part_b )
    moving_part_model_c.SetParent( script_mover_part_c )

    script_mover_part_c.SetParent( moving_part_model_b )

    script_mover_part_sling.SetParent( script_mover_part_c )

        wait 0.1

    script_mover_part_b.NonPhysicsRotateTo( <0,40,0>, 4, 2.0, 2.0 )
    script_mover_part_c.NonPhysicsRotateTo( <0,-155,0>, 4, 2.0, 2.0 )

        wait 4

    FlagClear( "FallingObjectThread()_IsActive" )
}

void function Test_Crane()
{
    /* entity test_mover_1 = CreateFloppytownScriptMover( < 3072, 2816, 200 >, < 0, 0, 0 >, "for_test", true )
    entity test_mover_2 = CreateFloppytownScriptMover( < 3372, 2816, 456 >, < 0, 180, 0 >, "for_test", true )
    entity test_1 = CreateFloppytownModel( THUNDERDOME_WALL_256x256_01, < 3072, 2816, 200 >, < 0, 0, 0 > )

    test_1.SetParent( test_mover_1 )
    test_mover_2.SetParent( test_mover_1 )
    
        wait 2

    //test.NonPhysicsMoveTo( <0,180,0>, 4, 2.0, 2.0 )
    test_mover_1.NonPhysicsRotateTo( <0,180,0>, 4, 2.0, 2.0 )
    test_mover_2.NonPhysicsRotateTo( <0,0,0>, 4, 2.0, 2.0 ) */
}