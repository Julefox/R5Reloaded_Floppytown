untyped

globalize_all_functions


void function Floppytown_Floor ( vector pos, vector ang )
{
    array< entity > GetCenterForFloor = []

    entity refModel = CreateModel( DESERTLANDS_BLDG_PLATFORM_01, < 0, 0, 0 >, < 0, 180, 0 > )
    float width     = GetEntWidth( refModel ) * HARDCODED_FLOOR_WIDTH
    float depth     = GetEntDepth( refModel ) * HARDCODED_FLOOR_DEPTH
    refModel.Destroy()

    entity startEnt = CreateModel( EMPTY, pos - < ( width / 2 ), ( depth / 2 ), 0  >, < 0, 0, 0 > )
    entity endEnt   = CreateModel( EMPTY, pos + < ( width / 2 ), ( depth / 2 ), 0  >, < 0, 0, 0 > )

    vector startPos = startEnt.GetOrigin()

    GetCenterForFloor.append( startEnt ) ; GetCenterForFloor.append( endEnt )

    CreateMultipleModel( DESERTLANDS_BLDG_PLATFORM_01, startPos, < 0, 180, 0 >, HARDCODED_FLOOR_WIDTH, HARDCODED_FLOOR_DEPTH, 0 )
}

void function Building_02 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = PositionOffsetFromEnt( floppytown.worldspawn, pos.x, pos.y, pos.z )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    originEnt.SetParent( script_mover )
    SetTargetName( originEnt, "Building 02" )

    array< entity > AB02_0  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01     , origin + < 256, 0, 0 >, < 0, 90, 0 >, 4, 0, 5, [ 0, 1, 2, 3, 4, 8, 9, 10, 15 ], true )
    array< entity > AB02_1  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01     , origin + < -384, -512, -0.2 >, < 0, 0, 0 >, 2, 0, 3, [], false )
    array< entity > AB02_2  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01     , origin + < 128, -256, -0.2 >, < 0, 0, 0 >, 1, 0, 3, [], false )
    array< entity > AB02_3  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01     , origin + < 0, -384, 0 >, < 0, 90, 0 >, 1, 0, 3, [], false )
    array< entity > AB02_4  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06  , origin + < -128, -256, 753.275 >, < 0, 0, 0 >, 3, 2, 0, [ 4 ], true )
    array< entity > AB02_5  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06  , origin + < -128, 256, 1266.125 >, < 0, 0, 0 >, 3, 2, 0, [], true )
    array< entity > AB02_6  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01     , origin + < -128, 0, 769.255 >, < 0, 0, 0 >, 3, 0, 2, [], true )
    array< entity > AB02_7  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01     , origin + < 512, 256, -96 >, < 0, 90, 0 >, 2, 0, 0, [], true )
    array< entity > AB02_8  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01     , origin + < 384, 256, -96.2 >, < 0, 0, 0 >, 0, 2, 0, [], true, < 0, 512, 0 > )

    // little roof part
    entity mover_roof = CreateScriptMover( origin + < 264, 256, 250 >, < 0, 0, 0 > ) ; vector mover_roofPos = mover_roof.GetOrigin()
    array< entity > AB02_9  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06  , mover_roofPos, < 0, 0, 0 >, 2, 2, 0, [], true )
    array< entity > AB02_10 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06  , mover_roofPos + < 0, 258, -50 >, < 90, 0, 90 >, 0, 2, 0, [], true )
    array< entity > AB02_11 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06  , mover_roofPos + < 0, -242, -50 >, < 90, 0, 90 >, 0, 2, 0, [], true )
    foreach ( ent in AB02_9  ) ent.SetParent( mover_roof ) ; foreach ( ent in AB02_10 ) ent.SetParent( mover_roof ) ; foreach ( ent in AB02_11 ) ent.SetParent( mover_roof )
    mover_roof.SetAngles( < 24, 0, 0 > ) ; ClearChildren( mover_roof, true )
    if ( IsValid( mover_roof ) ) mover_roof.Destroy()
    //

    globals.extend( AB02_0 ) ; globals.extend( AB02_1 ) ; globals.extend( AB02_2 ) ; globals.extend( AB02_3 ) ; globals.extend( AB02_4 )
    globals.extend( AB02_5 ) ; globals.extend( AB02_6 ) ; globals.extend( AB02_7 ) ; globals.extend( AB02_8 ) ; globals.extend( AB02_9 )
    globals.extend( AB02_10 ); globals.extend( AB02_11 )

    foreach ( ent in globals )
    {   ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )

    //ZiplineUtility b02_0 = Zipline_CreateZipline( "b02_0", origin + < 252, 256, 1282.125 >, < 0, 0, 0 > )
    //Zipline_SetZiplineAngles( b02_0, < 0, 150, 0 > )
    //Zipline_BuildInit( b02_0 )
}


