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

    if ( model == $"mdl/desertlands/construction_bldg_platform_01.rmdl" ) baseAng = < 0, 180, 0 >

    entity findSpacing    = CreatePropDynamic( model, pos, baseAng )
    float width  /* X */  = GetEntWidth( findSpacing )
    float depth  /* Y */  = GetEntDepth( findSpacing )
    float height /* Z */  = GetEntHeight( findSpacing )
    findSpacing.Destroy()

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
        ents.SetParent( script_mover )
        SetTargetName( ents, "returnedProp_" + counter++ )
    }

    script_mover.SetAngles( ang )
    ClearChildren( script_mover, true )

    foreach( ints in destroyArrayInt )
    { returnedProp[ints].Destroy() }

    ArrayRemoveInvalid( returnedProp )

return returnedProp }

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
