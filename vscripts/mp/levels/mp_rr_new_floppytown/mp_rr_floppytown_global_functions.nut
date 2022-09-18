untyped

globalize_all_functions


entity function CreateModel( asset model, vector pos, vector ang )
{
    entity ent = CreatePropDynamic( model, pos, ang, SOLID_VPHYSICS, 20000 )
    ent.kv.fadedist = 20000
    ent.AllowMantle()
    int realm = -1
    if ( realm> -1 )
    { ent.RemoveFromAllRealms(); ent.AddToRealm( realm ) }
    ent.e.gameModeId = realm

return ent }


array<entity> function CreateMultipleModel( asset model, vector pos, vector ang, int x = 1, int y = 1, int z = 1, array< int > destroyArrayInt = [], bool setPosOnCenter = false, vector forceSpacing = < 0, 0, 0 > )
{
    vector baseAng = < 0, 0, 0 > ; int counter = 0 ; entity entitieCreated ; array< entity > returnedProp = []

    entity findSpacing    = CreatePropDynamic( model, pos, baseAng )
    float width  /* X */  = GetEntWidth( findSpacing )
    float depth  /* Y */  = GetEntDepth( findSpacing )
    float height /* Z */  = GetEntHeight( findSpacing )
    findSpacing.Destroy()

    if ( model == $"mdl/desertlands/construction_bldg_platform_01.rmdl" || model == $"mdl/desertlands/construction_bldg_platform_02.rmdl" )
    {   pos = pos - < ( width / 2 ), ( depth / 2 ), 0  > ; baseAng = < 0, 180, 0 > }

    if ( forceSpacing.x != 0 ) width  = forceSpacing.x   ;   if ( x < 1 ) x = 1    // X
    if ( forceSpacing.y != 0 ) depth  = forceSpacing.y   ;   if ( y < 1 ) y = 1    // Y
    if ( forceSpacing.z != 0 ) height = forceSpacing.z   ;   if ( z < 1 ) z = 1    // Z

    entity script_mover = CreateScriptMover( pos, baseAng )

    if ( setPosOnCenter == true )
    {
        float widthCenter = width * ( ( x - 1 ) * 0.5 )
        float depthCenter = depth * ( ( y - 1 ) * 0.5 )
        pos = pos - < widthCenter, depthCenter, 0  >
    }

    for ( int i = 0 ; i < x ; i++ ) { for ( int j = 0 ; j < y ; j++ ) { for ( int k = 0 ; k < z ; k++ )
    {   entitieCreated = CreatePropDynamic( model, pos + < width * i, depth * j, height * k >, baseAng, SOLID_VPHYSICS, 20000 ) ; returnedProp.append( entitieCreated ) } } }
    
    foreach ( ents in returnedProp )
    {
        ents.kv.fadedist = 20000
        ents.AllowMantle()
        int realm = -1
        if ( realm> -1 )
        { ents.RemoveFromAllRealms(); ents.AddToRealm( realm ) }
        ents.e.gameModeId = realm
        SetTargetName( ents, "returnedProp_" + counter++ )
    }

    SetAnglesForBuilding( returnedProp, script_mover, ang )

    foreach( ints in destroyArrayInt )
    { returnedProp[ints].Destroy() }

    ArrayRemoveInvalid( returnedProp )

return returnedProp }

vector function SetOriginForBuilding( vector pos )
{
    vector origin

    if ( pos != DEV_PLATFORM_POS )
        origin = PositionOffsetFromEnt( floppytown.worldspawn, pos.x, pos.y, pos.z )
    else
        origin = DEV_PLATFORM_POS

    return origin
}

void function SetAnglesForBuilding( array< entity > globals, entity script_mover, vector ang )
{
    foreach ( ent in globals )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )

    ClearChildren( script_mover, true )
    if ( IsValid( script_mover ) ) script_mover.Destroy()
}

vector function DevPlatform()
{   return DEV_PLATFORM_POS }

array< entity > function CreateCamera( vector pos, vector ang, float inclination, float leftincl, float leftAng, float rightincl, float rightAng )
{
    entity script_mover = CreateScriptMover( pos, < 0, 0, 0 > )

    entity camera_base = CreatePropDynamic( IMC_BASE_CAMERA_BASE_01, pos, < 0, 0, 0 >, 8, 20000 )
    entity camera = CreateScriptMoverModel( IMC_BASE_CAMERA_01, pos + < 16, 0, 8 >, < 0, 0, 0 >, 8, 20000 )
    
    camera_base.SetParent( script_mover )
    camera.SetParent( script_mover )

    script_mover.SetAngles( ang )

    camera_base.ClearParent()
    camera.ClearParent()

    script_mover.Destroy()

    thread OnMoveCamera( camera, inclination, leftincl, leftAng, rightincl, rightAng )

return [ camera_base, camera ] }


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

array<entity> function CreateMultipleWallTrigger( vector pos, int x = 1, int y = 1, bool setPosOnCenter = false )
{
    entity entitieCreated ; array< entity > returnedProp = []

    float width  /* X */  = 64
    float depth  /* Y */  = 64

    if ( x < 1 ) x = 1    // X
    if ( y < 1 ) y = 1    // Y

    if ( setPosOnCenter == true )
    {
        float widthCenter = width * ( ( x - 1 ) * 0.5 )
        float depthCenter = depth * ( ( y - 1 ) * 0.5 )
        pos = pos - < widthCenter, depthCenter, 0  >
    }

    for ( int i = 0 ; i < x ; i++ ) { for ( int j = 0 ; j < y ; j++ )
    {   entitieCreated = CreateFloppytownWallTrigger( pos + < width * i, depth * j, 0.0 >, 64 ) ; returnedProp.append( entitieCreated ) } }

return returnedProp }

entity function CreateFloppytownWallTrigger( vector pos, float radius = 64 )
{
    entity map_trigger = CreateEntity( "trigger_cylinder" )
    float aboveHeight = floppytown.worldspawnPos.z - pos.z + 8000.0
    map_trigger.SetRadius( radius );map_trigger.SetAboveHeight( aboveHeight );map_trigger.SetBelowHeight( 0 );
    map_trigger.SetOrigin( pos )
    DispatchSpawn( map_trigger )

    thread FloppytownWallTriggerThread( map_trigger )

    SetupOutOfBoundsTrigger( map_trigger )
	map_trigger.SetEnterCallback( OnOOBTriggerEnter )
	map_trigger.SetLeaveCallback( OnOOBTriggerLeave )

return map_trigger }


void function FloppytownWallTriggerThread( entity map_trigger, float speed = 0.1 )
{
    bool active = true

    vector map_center = floppytown.worldspawnPos

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

                        vector velocity = map_center - target_origin
                        velocity = velocity * speed

                        player.SetVelocity(velocity)
            }   }   }
        }
        else
        { active = false ; break }

    wait 0.01 }
}


////

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
        entity script_mover = CreateScriptMover( pos, ang )

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
