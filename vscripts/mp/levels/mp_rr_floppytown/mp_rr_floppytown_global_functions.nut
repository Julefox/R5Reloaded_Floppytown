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


void function CreateLoopFloppytownModel_X( asset a, vector pos, vector ang, float x_spacing, int x, string script_name = "FloppytownEntities" )
{
    for ( int i = 0 ; i < x ; i++ )
    {   CreateFloppytownModel( a, pos + < x_spacing * i, 0.0, 0.0 >, ang, script_name ) }
}


void function CreateLoopFloppytownModel_Y( asset a, vector pos, vector ang, float y_spacing, int y, string script_name = "FloppytownEntities" )
{
    for ( int i = 0 ; i < y ; i++ )
    {   CreateFloppytownModel( a, pos + < 0.0, y_spacing * i, 0.0 >, ang, script_name ) }
}


void function CreateLoopFloppytownModel_Z( asset a, vector pos, vector ang, float z_spacing, int z, string script_name = "FloppytownEntities" )
{
    for ( int i = 0 ; i < z ; i++ )
    {   CreateFloppytownModel( a, pos + < 0.0, 0.0, z_spacing * i >, ang, script_name ) }
}


void function CreateLoopFloppytownModel_XY( asset a, vector pos, vector ang, float x_spacing, int x, float y_spacing, int y, string script_name = "FloppytownEntities", bool resetAng = false, vector newAng = < 0, 0, 0 > )
{
    if ( resetAng != false )
    {
        entity script_mover = CreateFloppytownScriptMover( pos, ang )

        for ( int i = 0 ; i < x ; i++ )
        {   for ( int j = 0 ; j < y ; j++ )
            {
                entity ent = CreateFloppytownModel( a, pos + < x_spacing * i, y_spacing * j, 0.0 >, ang, script_name )
                ent.SetParent( script_mover )
            }
        }
        script_mover.SetAngles( newAng )
    }
    else
    {
        for ( int i = 0 ; i < x ; i++ )
        {   for ( int j = 0 ; j < y ; j++ )
            {   CreateFloppytownModel( a, pos + < x_spacing * i, y_spacing * j, 0.0 >, ang, script_name ) }
        }
    }
}


void function CreateLoopFloppytownModel_XZ( asset a, vector pos, vector ang, float x_spacing, int x, float z_spacing, int z, string script_name = "FloppytownEntities" )
{
    for ( int i = 0 ; i < x ; i++ )
    {   for ( int j = 0 ; j < z ; j++ )
        {   CreateFloppytownModel( a, pos + < x_spacing * i, 0.0, z_spacing * j >, ang, script_name ) }
    }
}


void function CreateLoopFloppytownModel_YZ( asset a, vector pos, vector ang, float y_spacing, int y, float z_spacing, int z, string script_name = "FloppytownEntities" )
{
    for ( int i = 0 ; i < y ; i++ )
    {   for ( int j = 0 ; j < z ; j++ )
        {   CreateFloppytownModel( a, pos + < 0.0, y_spacing * i, z_spacing * j >, ang, script_name ) }
    }
}


void function CreateLoopFloppytownModel_XYZ( asset a, vector pos, vector ang, float x_spacing, int x, float y_spacing, int y, float z_spacing, int z, string script_name = "FloppytownEntities" )
{
    for ( int i = 0 ; i < x ; i++ )
    {   for ( int j = 0 ; j < y ; j++ )
        {   for ( int k = 0 ; k < z ; k++ )
            {   CreateFloppytownModel( a, pos + < x_spacing * i, y_spacing * j, z_spacing * k >, ang, script_name ) }
}   }   }


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

entity function CreateFloppytownScriptMoverModel( asset model, vector origin = < 0.0, 0.0, 0.0 >, vector angles = < 0.0, 0.0, 0.0 >, int solidType = 0 )
{
	entity script_mover = CreateEntity( "script_mover_lightweight" )
	script_mover.kv.solid = solidType
	script_mover.SetValueForModelKey( model )
	script_mover.kv.SpawnAsPhysicsMover = 0
	script_mover.SetOrigin( origin )
	script_mover.SetAngles( angles )
	DispatchSpawn( script_mover )
	return script_mover
}


void function CreateCamera( vector pos, vector ang, float inclination, float leftincl, float leftAng, float rightincl, float rightAng, string script_name = "FloppytownEntities" )
{
    entity script_mover_01 = CreateFloppytownScriptMover( pos, < 0, 0, 0 > )

    entity camera_base = CreateFloppytownModel( IMC_BASE_CAMERA_BASE_01, pos, < 0, 0, 0 > )
    entity camera = CreateFloppytownScriptMoverModel( IMC_BASE_CAMERA_01, pos + < 16, 0, 8 >, < 0, 0, 0 >, 8 )
    
    camera_base.SetParent( script_mover_01 )
    camera.SetParent( script_mover_01 )

    script_mover_01.SetScriptName( script_name )
    camera_base.SetScriptName( script_name )
    camera.SetScriptName( script_name )

    script_mover_01.SetAngles( ang )

    camera_base.ClearParent()
    camera.ClearParent()

    script_mover_01.Destroy()

    thread OnMoveCamera( camera, inclination, leftincl, leftAng, rightincl, rightAng )
}


void function OnMoveCamera( entity script_mover, float inclination, float leftincl, float leftAng, float rightincl, float rightAng )
{
    float setLeftAng
    float setRightAng
    float setLeftincl
    float setRightincl

    if ( leftAng == 0 )
    { setLeftAng = 90 }
    else
    { setLeftAng = leftAng }

    if ( rightAng == 0 )
    { setRightAng = 90 }
    else
    { setRightAng = rightAng }

    if ( leftincl == 0 )
    { setLeftincl = inclination }
    else
    { setLeftincl = leftincl }

    if ( rightincl == 0 )
    { setRightincl = inclination }
    else
    { setRightincl = rightincl }

    float preInitAng = setLeftAng / 2

    vector getAnglesOrigin = script_mover.GetAngles()

        wait 0.1

    script_mover.NonPhysicsRotateTo( getAnglesOrigin + < inclination, preInitAng, 0 >, 2, 1, 1 )

        wait 2.1

    while ( true )
    {
        float travelTimeRight = RandomFloatRange( 2.0, 8.2 )
        float halfTravelTimeRight = travelTimeRight / 2
        float travelTimeLeft = RandomFloatRange( 2.0, 8.2 )
        float halfTravelTimeLeft = travelTimeLeft / 2

        script_mover.NonPhysicsRotateTo( getAnglesOrigin + < setLeftincl, setLeftAng, 0 >, travelTimeRight, halfTravelTimeRight, halfTravelTimeRight )

            wait RandomFloatRange( travelTimeRight + 0.2, travelTimeRight + 3.6 )

        script_mover.NonPhysicsRotateTo( getAnglesOrigin + < setRightincl, setRightAng, 0 >, travelTimeLeft, halfTravelTimeLeft, halfTravelTimeLeft )

            wait RandomFloatRange( travelTimeLeft + 0.2, travelTimeLeft + 3.6 )
    }
}


entity function CreateFloppytownWallTrigger( vector pos, float radius = 1000 )
{
    entity map_trigger = CreateEntity( "trigger_cylinder" )
    float aboveHeight = FLOPPYTOWN_POS_OFFSET.z - pos.z + 8000.0
    map_trigger.SetRadius( radius );map_trigger.SetAboveHeight( aboveHeight );map_trigger.SetBelowHeight( 0 );
    map_trigger.SetOrigin( pos )
    DispatchSpawn( map_trigger )

    FLOPPYTOWN_ENTITIES.append( map_trigger )

    thread FloppytownWallTriggerThread( map_trigger )

return map_trigger }


void function FloppytownWallTriggerThread( entity map_trigger, float speed = 0.1 )
{
    bool active = true

    vector approx_map_center = FLOPPYTOWN_POS_OFFSET + < 2800, 2400, 2000 >

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

                        vector velocity = approx_map_center - target_origin
                        velocity = velocity * speed

                        //vector angles = target_angles - map_trigger_angles

                        //velocity = velocity + angles
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
