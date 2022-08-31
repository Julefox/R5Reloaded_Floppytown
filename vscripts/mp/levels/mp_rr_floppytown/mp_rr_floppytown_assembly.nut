untyped

globalize_all_functions


void function PrinttAssemblyFiles()
{
    printt( "|mp_rr_floppytown_assembly.nut:                  file called.|" )
}


void function Floppytown_MapInit_Assembly()
{
     
}


void function Ft_Floor( vector pos, vector ang )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    CreateLoopFloppytownModel_XY( DESERTLANDS_BLDG_PLATFORM_01, pos, < 0, 180, 0 >, 1024, 6, 352, 14, "floor" )


    /* array<entity> test = []

    entity zeroPos = CreateLoopFloppytownModel_XY( DESERTLANDS_BLDG_PLATFORM_01, pos, < 0, 180, 0 >, 1024, 6, 352, 14, "floor" )
    entity refModel = CreateFloppytownModel( DESERTLANDS_BLDG_PLATFORM_01, < 0, 0, 4000 >, < 0, 180, 0 > )
    entity startPos = CreateFloppytownModel( EMPTY, pos, < 0, 0, 0 > )
    test.append(startPos)

    float width = GetEntWidth( refModel ) * 6

    float depth = GetEntDepth( refModel ) * 14

    vector calculPos = pos + < width, depth, 0 >

    entity endPos = CreateFloppytownModel( EMPTY, calculPos, < 0, 0, 0 > )
    test.append(endPos)

    CreateFloppytownModel( EDITOR_REF , GetCenter( test ), < 0, 0, 0 > ) */

    foreach ( ent in GetEntArrayByScriptName( "floor" ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function North_Wall( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "north_wall_"
    string script_name = script + name

    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 0, 96, 1200 >, < 0, 180, 0 >, 200, 4, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 529, 96, 0 >, < 0, 180, 0 >, 200, 10, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 144, 58, 2000 >, < 0, 90, 0 >, 256, 4, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 1160, 64, 0 >, < 0, 180, 0 >, 260.7, 4, 224, 10, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 2202.8, 0, 1792 >, < 0, 180, 0 >, 260.7, 4, 224, 2, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 3245.6, 0, 0 >, < 0, 180, 0 >, 260.7, 3, 224, 10, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 2062, 140, 1792 >, < 0, 90, 0 >, 224, 2, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 3900, 0, 0 >, < 0, 180, 0 >, 200, 12, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 4028, -50, 2400 >, < 0, 90, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 4500, -64, 896 >, < 0, 180, 0 >, 260.7, 4, 224, 6, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 5044, -64, 1000 >, < 0, 180, 0 >, 200, 7, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 5172, -114, 2400 >, < 0, 90, 0 >, 256, 2, script_name )
    CreateCamera( pos + < 3520, 0, 1400 >, < 0, 270, 0 >, 0, 18, 62, 35.5, 0.1, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function South_Wall( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "south_wall_"
    string script_name = script + name

    CreateLoopFloppytownModel_XZ( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < -500, -80, 2000 >, < 0, 0, 0 >, 529, 2, 200, 3, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -884, -42, 2600 >, < 0, 90, 0 >, 256, 3, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < -2097.3, 0, 1120 >, < 0, 0, 0 >, 260.7, 5, 224, 7, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < -2358, 0, 2016 >, < 0, 0, 0 >, 224, 3, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_CITY_SLANTED_BLDG_WALL_PILLAR_64_01, pos + < -5840, -32, 2002 >, < 0, 270, 0 >, 128, 19, 286, 4, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < -3400, -64, 1600 >, < 0, 0, 0 >, 529, 3, 200, 6, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -3784, -26, 2800 >, < 0, 90, 0 >, 256, 6, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -2376, -26, 2672 >, < 0, 90, 90 >, 16, 2, script_name )
    CreateCamera( pos + < -1316, 0, 2340 >, < 0, 90, 0 >, 0, 16, 75, 21.3, -81.2, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function West_Wall( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "west_wall_"
    string script_name = script + name

    CreateLoopFloppytownModel_YZ( DESERTLANDS_CITY_SLANTED_BLDG_WALL_PILLAR_64_01, pos + < -32, 0, 1716 >, < 0, 180, 0 >, 128, 13, 286, 4, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, 1664, 1120 >, < 0, -90, 0 >, 260.7, 2, 224, 5, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, 1664, 448 >, < 0, -90, 0 >, 260.7, 6, 224, 8, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, 3228.2, 1120 >, < 0, -90, 0 >, 260.7, 2, 224, 5, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, 3749.6, 672 >, < 0, -90, 0 >, 260.7, 3, 224, 7, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < -89, 4360, 1200 >, < 0, -90, 0 >, 200, 5, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -58, 4494, 2200 >, < 0, 180, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_YZ( COLONY_WALLRUN_PLATE, pos + < -6, 3840, 1340 >, < 0, 180, 0 >, 100, 5, 116, 2, script_name )
    CreateLoopFloppytownModel_YZ( COLONY_WALLRUN_PLATE, pos + < -6, 2320, 1340 >, < 0, 180, 0 >, 100, 6, 116, 2, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function East_Wall( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "east_wall_"
    string script_name = script + name

    CreateLoopFloppytownModel_YZ( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 0, 0, 1600 >, < 0, 90, 0 >, 529, 2, 200, 4, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -46, -384, 2400 >, < 0, 180, 0 >, 256, 4, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 0, -1058, 1600 >, < 0, 90, 0 >, 529, 2, 200, 5, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -46, -1420, 2600 >, < 0, 180, 0 >, 256, 4, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -38, -1420-128, 2488 >, < 0, 0, 90 >, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, -2600, 2240 >, < 0, 90, 0 >, 260.7, 5, 224, 2, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 0, -2730, 0 >, < 0, 90, 0 >, 529, 2, 200, 14, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -34, -3114, 2800 >, < 0, 180, 0 >, 256, 4, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -34, -2202, 2687 >, < 0, 0, 90 >, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, -3500, 0 >, < 0, 90, 0 >, 260.7, 2, 224, 13, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, -4282.1, 2016 >, < 0, 90, 0 >, 260.7, 3, 224, 4, script_name )
    CreateCamera( pos + < -102, -128, 2260 >, < 0, 180, 0 >, 0, 26, 82, 38, -72, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function CreateWallTriggerAroundTheMap()
{
    vector pos = FLOPPYTOWN_POS_OFFSET
    // North_Wall()
    for ( int i = 0 ; i < 16 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 48, 4922, 2000 > + < 64 * i, 0, 0 >, 64 ) }
    for ( int i = 0 ; i < 16 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 1064, 4976, 2240 > + < 64 * i, 0, 0 >, 64 ) }
    for ( int i = 0 ; i < 28 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 2106.80005, 4912, 2240 > + < 64 * i, 0, 0 >, 64 ) }
    for ( int i = 0 ; i < 8 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 3932, 4814, 2400 > + < 64 * i, 0, 0 >, 64 ) }
    for ( int i = 0 ; i < 10 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 4436, 4848, 2240 > + < 64 * i, 0, 0 >, 64 ) }
    for ( int i = 0 ; i < 8 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 5076, 4750, 2400 > + < 64 * i, 0, 0 >, 64 ) }

    // South_Wall()
    for ( int i = 0 ; i < 12 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 5612, -42, 2600 > + < -64 * i, 0, 0 >, 64 ) }
    for ( int i = 0 ; i < 21 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 4833.5, -60, 2688 > + < -64 * i, 0, 0 >, 64 ) }
    for ( int i = 0 ; i < 25 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 3512, -26, 2800 > + < -64 * i, 0, 0 >, 64 ) }
    for ( int i = 0 ; i < 32 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 1968, -32, 3146 > + < -64 * i, 0, 0 >, 64 ) }

    // West_Wall()
    for ( int i = 0 ; i < 24 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < -32, 64, 2860 > + < 0, 64 * i, 0 >, 64 ) }
    for ( int i = 0 ; i < 51 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < -58, 1664, 2200 > + < 0, 64 * i, 0 >, 64 ) }

    // East_Wall()
    for ( int i = 0 ; i < 15 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 5586, 4719, 2400 > + < 0, -64 * i, 0 >, 64 ) }
    for ( int i = 0 ; i < 16 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 5586, 3779, 2600 > + < 0, -64 * i, 0 >, 64 ) }
    for ( int i = 0 ; i < 11 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 5680, 2778, 2688 > + < 0, -64 * i, 0 >, 64 ) }
    for ( int i = 0 ; i < 16 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 5598, 2085, 2800 > + < 0, -64 * i, 0 >, 64 ) }
    for ( int i = 0 ; i < 18 ; i++ )
    {   CreateFloppytownWallTrigger( pos + < 5680, 1096, 2912 > + < 0, -64 * i, 0 >, 64 ) }
}

void function Building_01( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_01_"
    string script_name = script + name

    CreateLoopFloppytownModel_XY( DESERTLANDS_BLDG_PLATFORM_02, pos + < -592, -528, 1792.1 >, < 0, 180, 0 >, 592, 2, 352, 3, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -592, -464, SSB_UP_TO_0 >, < 0, 90, 0 >, 128, 9, 256, 7, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 592, -480, SSB_UP_TO_0 >, < 0, 270, 0 >, 128, 9, 256, 7, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -528, -528, SSB_UP_TO_0 >, < 0, 180, 0 >, 128, 9, 256, 7, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 568, -464, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 256, 7, script_name )
    CreateLoopFloppytownModel_Y( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 584, -864, SSB_UP_TO_0_PATCH >, < 0, -90, 0 >, 128, 3, script_name )
    CreateLoopFloppytownModel_Y( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -456, -850, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 128, 3, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -400, -912, SSB_UP_TO_0_PATCH >, < 0, 180, 0 >, 128, 8, script_name )
    CreateFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 568, -860, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, script_name )
    CreateLoopFloppytownModel_X( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -192, -720, 256 >, < 0, 180, 0 >, 512, 2, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -320, -784, 192 >, < 0, 0, 0 >, 256, 4, 256, 2, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_02( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_02_"
    string script_name = script + name

    // Side of the building not visible //
    //CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 512, 0 >, < 0, 0, 0 >, 256, 3, 256, 5, script_name )
    //CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -128, -384, 0 >, < 0, -90, 0 >, 256, 4, 256, 3, script_name )
    //CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -128, 128, 768 >, < 0, -90, 0 >, 256, 2, 256, 2, script_name )
    // End //
    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 640, -128, 0 >, < 0, -90, 0 >, 256, 3, 256, 3, script_name )
    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 640, 128, 768 >, < 0, -90, 0 >, 256, 2, 256, 2, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, -512, 0 >, < 0, 0, 0 >, 256, 2, 256, 3, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 512, -256, 0 >, < 0, 0, 0 >, 256, 3, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, -384, 0 >, < 0, -90, 0 >, 256, 3, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, -384, 768 >, < 0, 0, 0 >, 256, 2, 256, 2, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 256, -384, 768 > + < 256, 256, 0 >, < 0, 0, 0 >, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 0, 768 >, < 0, 0, 0 >, 256, 3, 256, 2, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 128, 1280 >, < 0, 0, 0 >, 256, 3, 256, 2, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 760, 12, 148 >, < -90, 90, 0 >, -256, 2, 506, 2, script_name, true, < -65, 0, 90 > )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 768, 0, -96.2 >, < 0, 0, 0 >, 512, 2, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 896, 128, -96 >, < 0, 90, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 767.6, 128, 200 >, < 0, 0, 0 >, -256, 2, 256, 2, script_name, true, < 25, 0, 0 > )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_03( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_03_"
    string script_name = script + name

    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x128_06, pos+ < 0, -256, 1280 >, < 0, 0, 0 >, 256, 3, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 64, -320, SSB_UP_TO_0 >, < 0, 270, 0 >, 128, 6, 256, 5, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 64, 448, SSB_UP_TO_0 >, < 0, 270, 0 >, 256, 3, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 0, 384, 768 >, < 0, 0, 0 >, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -128, -384, 640 >, < 0, 180, 0 >, 128, 2, 256, 3, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 0, 384, 896 >, < 0, 0, 0 >, 256, 2, script_name ) // 330 

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_04( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_04_"
    string script_name = script + name

    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 128, -256, 0 >, < 0, 270, 0 >, 256, 3, 256, 2, script_name )
    CreateLoopFloppytownModel_Y( IMC_BASE_FLOORPANEL_DARK_256x256_01, pos + < 0, -256, 512 >, < 0, 0, 0 >, 256, 3, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 384, 0 >, < 0, 0, 0 >, 256, 2, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_05( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_05_"
    string script_name = script + name

    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 128, -256, SSB_UP_TO_0 >, < 0, 270, 0 >, 128, 5, 256, 5, script_name )
    CreateFloppytownModel( LEVELS_TERRAIN_SPACE_ELEVATOR_PLATFORM_01, pos + < 0, 0, 1220 >, < 0, 90, 0 >, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_FRAME_256_01, pos + < 0, -304, 1248 >, < 0, 180, 0 >, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 324, 512 >, < 0, 0, 0 >, 256, 3, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_06( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_06_"
    string script_name = script + name

    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 256, -256, 0 >, < 0, 270, 0 >, 256, 3, 256, 7, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, -256, 1792 >, < 0, 0, 0 >, 256, 3, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 192, -256, 1792 >, < 0, 0, 0 >, 256, 3, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 192, 384, SSB_UP_TO_0 >, < 0, 0, 0 >, 256, 7, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_CARGO_CONTAINER_SMALL_03, pos + < -128, 384, 1279.9 >, < 0, 0, 0 >, 128, 2, 128, 4, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_07( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_07_"
    string script_name = script + name

    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 0, 2304 >, < 0, 0, 0 >, 256, 5, 256, 2, script_name)
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 512, 2304 >, < 0, 0, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 1152, 0, 2048 >, < 0, 90, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 640, 1792 >, < 0, 0, 0 >, 256, 2, 256, 2, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 256, 640, 0 >, < 0, 0, 0 >, 256, 7, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 512, 384, 0 >, < 0, 0, 0 >, 256, 9, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 1024, 384, 0 >, < 0, 0, 0 >, 256, 9, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 1280, 384, 0 >, < 0, 0, 0 >, 256, 3, 256, 8, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, 512, 0 >, < 0, 90, 0 >, 256, 9, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < 1920, 320, 0 >, < 0, 90, 0 >, 128, 16, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < 1904, 320, 0 >, < 0, -90, 0 >, 128, 16, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < 1920, -64, 1536 >, < 0, 90, 0 >, 128, 3, 128, 4, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < 1904, -64, 1536 >, < 0, -90, 0 >, 128, 3, 128, 4, script_name )
    CreateLoopFloppytownModel_X( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < 1344, 128, 2048 >, < 0, -90, 0 >, 384, 2, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 896, 192, SSB_UP_TO_0 >, < 0, 90, 0 >, 128, 2, 256, 9, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 640, 192, SSB_UP_TO_0 >, < 0, 270, 0 >, 128, 2, 256, 9, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 704, 128, SSB_UP_TO_0 >, < 0, 0, 0 >, 128, 2, 256, 9, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_SHELL_BOX_A, pos + < 512, 384, 768 >, < 0, 180, 0 >, 512, 4, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_SHELL_BOX_B , pos + < 1024, 384, 768 >, < 0, 180, 0 >, 512, 4, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 768, 448, 2560 >, < 0, 90, 0 >, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 768, 384, 512 >, < 0, 0, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 768, 384, 1536 >, < 0, 0, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_FRAME_256_01, pos + < 768, 384, 768 >, < 0, 0, 0 >, 1024, 2, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 1280, 0, 2000 >, < 0, 0, 0 >, 256, 3, 256, 2, script_name )

    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {
            if ( j == 1 )
            { CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 768, 256, 256.1 > + < 0 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
            else
            { CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 768, 256, 256 > + < 0 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
        }
    }
    CreateCamera( pos + < 1536, 392, 1920 >, <0,90,0>, 0, 14.5, 52, 19.5, -70, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_08( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_08_"
    string script_name = script + name

    CreateLoopFloppytownModel_X( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -256, 64, 1664 >, < 0, 0, 0 >, 512, 2, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < -448, 256, 0 >, < 0, 0, 0 >, 128, 8, 128, 13, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < -448, 256-16, 0 >, < 0, 180, 0 >, 128, 8, 128, 13, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, -128, 1600 >, < 0, 0, 0 >, 256, 4, 256, 2, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_09( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_09_"
    string script_name = script + name

    CreateLoopFloppytownModel_X( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -192, 128, 2048 >, < 0, 90, 0 >, 384, 2, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -256, 384, 0 >, < 0, 0, 0 >, 256, 3, 256, 8, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, 0, 1984 >, < 0, 0, 0 >, 256, 3, 256, 2, script_name )
    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 0, 1536 >, < 0, 90, 0 >, 256, 2, 256, 2, script_name )
    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, 0, 1280 >, < 0, 90, 0 >, 256, 2, 256, 3, script_name  )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, 256, 0 >, < 0, 90, 0 >, 256, 6, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 256, 0 >, < 0, 90, 0 >, 256, 6, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_10( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_10_"
    string script_name = script + name

    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, 0, 1280 >, < 0, 0, 0 >, 256, 4, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 128, 0 >, < 0, 0, 0 >, 256, 4, 256, 5, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_11( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_11_"
    string script_name = script + name

    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -128, 0, 2048 >, < 0, 0, 0 >, 256, 2, 256, 3, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, 0, 2048 >, < 0, 0, 0 > )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -512, -64, SSB_UP_TO_0 >, < 0, 90, 0 >, 128, 2, 256, 8, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -448, 128, SSB_UP_TO_0 >, < 0, 0, 0 >, 128, 2, 256, 8, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -192, 640, SSB_UP_TO_0 >, < 0, 0, 0 >, 128, 4, 256, 8, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -256, 192, SSB_UP_TO_0 >, < 0, 90, 0 >, 128, 4, 256, 8, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_12( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_12_"
    string script_name = script + name

    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -640, 0, 0 >, < 0, 90, 0 >, 256, 2, 256, 5, script_name )
    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 0, 1280 >, < 0, 90, 0 >, 256, 2, 256, 4, script_name )
    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 512, 0 >, < 0, 90, 0 >, 256, 2, 256, 9, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -256, -128, 0 >, < 0, 0, 0 >, 256, 2, 256, 9, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -512, -128, 0 >, < 0, 0, 0 >, 256, 5, script_name )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -512, 384, 0 >, < 0, 0, 0 >, 256, 5, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -320, 1024, SSB_UP_TO_0_PATCH + 1536 >, < 0, 0, 0 >, 128, 4, 256, 3, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -384, 960, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 256, 9, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -512, 0, 1280 >, < 0, 0, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_Y( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -128, 64, 2304 >, < 0, 0, 0 >, 384, 3, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, 0, 2240 >, < 0, 0, 0 >, 256, 2, 256, 4, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -256, 960, 2240 >, < 0, 90, 0 >, 256, 2, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_13( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_13_"
    string script_name = script + name

    CreateLoopFloppytownModel_Y( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -128, 64, 1792 >, < 0, 0, 0 >, 384, 5, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -384, -64, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 128, 7, 256, 7, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -384, 832, SSB_UP_TO_0_PATCH + 1024 >, < 0, 90, 0 >, 128, 8, 256, 3, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, 0, 1728 >, < 0, 0, 0 >, 256, 2, 256, 8, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -384, 896, 960 >, < 90, 0, 0 >, 256, 4, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_14( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_14_"
    string script_name = script + name

    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -512, -384, 0 >, < 0, 90, 0 >, 256, 4, 256, 4, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, -512, 0 >, < 0, 0, 0 >, 256, 4, 256, 4, script_name )
    CreateLoopFloppytownModel_XY( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -256, -320, 1024 >, < 0, 0, 0 >, 512, 2, 384, 3, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, -384, 960 >, < 0, 0, 0 >, 256, 4, 256, 4, script_name )
    CreateCamera( pos + < 384, -520, 896 >, < 0, -90, 0 >, 0, 35, -7, 33, -85, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_15( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_15_"
    string script_name = script + name

    CreateLoopFloppytownModel_X( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -384, 32, 1024 >, < 0, 0, 0 >, 128, 7, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -384, -32, 1024 >, < 0, 0, 0 >, 128, 7, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -384.1, 31.9, 1024 >, < 0, 0, 180 >, 128, 7, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -384.1, -31.9, 1024 >, < 0, 0, 180 >, 128, 7, script_name )

    CreateLoopFloppytownModel_X( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -640, 96, 1024 >, < 0, 0, 0 >, 128, 11, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -640, -96, 1024 >, < 0, 0, 0 >, 128, 11, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -640.1, 95.9, 1024 >, < 0, 0, 180 >, 128, 11, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -640.1, -95.9, 1024 >, < 0, 0, 180 >, 128, 11, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_16( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_16_"
    string script_name = script + name

    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -256, 384, 0 >, < 0, 0, 0 >, 256, 3, 256, 5, script_name )
    CreateLoopFloppytownModel_XZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -256, -384, 0 >, < 0, 0, 0 >, 256, 3, 256, 5, script_name )
    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, -256, 0 >, < 0, 90, 0 >, 256, 3, 256, 5, script_name )
    CreateLoopFloppytownModel_YZ( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, -256, 0 >, < 0, 90, 0 >, 256, 3, 256, 5, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, -256, 1280 >, < 0, 0, 0 >, 256, 3, 256, 3, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_17( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_17_"
    string script_name = script + name

    CreateFloppytownModel( THUNDERDOME_CAGE_WALL_512x352_01, pos + < -128, -384, 0 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_WALL_256x352_01, pos + < 256, -384, 0 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_WALL_512x352_01, pos + < 128, 384, 0 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_WALL_256x352_01, pos + < -256, 384, 0 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_WALL_512x352_01, pos + < -384, 128, 0 >, < 0, 90, 0 >, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_WALL_256x352_01, pos + < -384, -256, 0 >, < 0, 90, 0 >, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_WALL_512x352_01, pos + < 384, -128, 0 >, < 0, 90, 0 >, script_name )
    CreateFloppytownModel( THUNDERDOME_CAGE_WALL_256x352_01, pos + < 384, 256, 0 >, < 0, 90, 0 >, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, -256, 352 >, < 0, 0, 0 >, 256, 3, 256, 3, script_name )
    CreateCamera( pos + < 392, 128, 320 >, <0,0,0>, 0, 13, 85, 11.5, -75, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_18( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_18_"
    string script_name = script + name

    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -512, -192, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 128, 4, 256, 5, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 512, -192, SSB_UP_TO_0_PATCH >, < 0, -90, 0 >, 128, 4, 256, 5, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -448, 256, SSB_UP_TO_0_PATCH >, < 0, 0, 0 >, 128, 8, 256, 5, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -448, -256, SSB_UP_TO_0_PATCH >, < 0, 180, 0 >, 128, 8, 256, 5, script_name )
    CreateLoopFloppytownModel_X( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -320, 0, 1280 >, < 0, 90, 0 >, 640, 2, script_name )
    CreateFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < 0, 0, 1280.1 >, < 0, 90, 0 >, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, -128, 1216 >, < 0, 90, 0 >, 256, 4, 256, 2, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_19( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_19_"
    string script_name = script + name

    CreateLoopFloppytownModel_Y( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < 0, -256, 1280 >, < 0, 90, 0 >, 512, 2, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 192, -448, SSB_UP_TO_0_PATCH >, < 0, -90, 0 >, 128, 8, 256, 5, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -128, -512, SSB_UP_TO_0_PATCH >, < 0, 180, 0 >, 128, 3, 256, 5, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -128, 512, SSB_UP_TO_0_PATCH >, < 0, 0, 0 >, 128, 3, 256, 5, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -1664, 0, SSB_UP_TO_0_PATCH >, < 0, 0, 0 >, 128, 12, 256, 5, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -1664, -384, SSB_UP_TO_0_PATCH >, < 0, 180, 0 >, 128, 12, 256, 5, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -192, 64, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 128, 4, 256, 5, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -192, -448, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 256, 5, script_name )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -1728, -320, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 128, 3, 256, 5, script_name )
    CreateLoopFloppytownModel_X( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -1472, -192, 1280 >, < 0, 0, 0 >, 512, 3, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 128, -384, 1216 >, < 0, 0, 0 >, 256, 4, script_name )
    CreateLoopFloppytownModel_Y( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -64, -384, 1216 >, < 0, 0, 0 >, 256, 4, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -1600, -256, 1216 >, < 0, 0, 0 >, 256, 6, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -1600, -64, 1216 >, < 0, 90, 0 >, 256, 6, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_20( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_20_"
    string script_name = script + name

    CreateLoopFloppytownModel_XY( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -192, -256, 256 >, < 0, 90, 0 >, 384, 2, 512, 2, script_name )
    CreateLoopFloppytownModel_Y( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 384, -448, SSB_UP_TO_0_PATCH >, < 0, -90, 0 >, 128, 8, script_name )
    CreateLoopFloppytownModel_Y( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -384, -448, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, 128, 8, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -320, 512, SSB_UP_TO_0_PATCH >, < 0, 0, 0 >, 128, 6, script_name )
    CreateLoopFloppytownModel_X( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -320, -512, SSB_UP_TO_0_PATCH >, < 0, 180, 0 >, 128, 6, script_name )
    CreateLoopFloppytownModel_XY( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, -384, 190 >, < 0, 0, 0 >, 256, 3, 256, 4, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function LittleBridge( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "little_bridge_"
    string script_name = script + name

    CreateFloppytownModel( IMC_BASE_CARGO_CONTAINER_WHITE_01, pos + < -128, 0, 0 >, < 0, 90, 0 >, script_name )
    CreateLoopFloppytownModel_XY( INDUSTRIAL_SUPPORT_BEAM_256_01, pos + < -96, -48, -2 >, < 0, 90, 0 >, 256, 2, 72, 2, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function BalconyLeft( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "balcony_left_"
    string script_name = script + name

    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 0, 0 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < -128, -128, 7 >, < 0, -90, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_64_01, pos + < -128, -32, 7 >, < 0, 180, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_32_01, pos + < -128, 16, 7 >, < 0, 180, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_128_01, pos + < 0, -128, 7 >, < 0, -90, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_64_01, pos + < 96, -128, 7 >, < 0, -90, 0 >, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function BalconyRight( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "balcony_right_"
    string script_name = script + name

    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 0, 0 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < 128, -128, 7 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_64_01, pos + < 128, -32, 7 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_32_01, pos + < 128, 16, 7 >, < 0, 0, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_128_01, pos + < 0, -128, 7 >, < 0, -90, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_64_01, pos + < -96, -128, 7 >, < 0, -90, 0 >, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function MiniBalconyLeft( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "mini_balcony_left_"
    string script_name = script + name

    CreateFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 0, 0, 0 >, < 0, 90, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < -128, -64, 9 >, < 0, -90, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_64_01, pos + < -128, 32, 9 >, < 0, 180, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_128_01, pos + < 0, -64, 9 >, < 0, -90, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_64_01, pos + < 96, -64, 9 >, < 0, -90, 0 >, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function LilBalcony( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "lil_balcony_"
    string script_name = script + name

    CreateFloppytownModel( PLAYBACK_BRIDGE_PANEL_128x64_01, pos + < 64, 0, 0 >, < 0, 90, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < -64, 64, 4 >, < 0, 180, 0 >, script_name )
    CreateFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < 64, 64, 4 >, < 0, 90, 0 >, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function cargo_ground( vector pos, vector ang, string type, string number )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "cargo_ground_"
    string script_name = script + type + "_" + number

    switch( type )
    {
        case "first":
            CreateFloppytownModel( DESERTLANDS_CARGO_CONTAINER_320_01, pos + < 0, 0, 0 >, < 0, 90, 0 >, script_name )
            CreateFloppytownModel( DESERTLANDS_CARGO_CONTAINER_320_01, pos + < 0, 137, 0 >, < 0, 90, 0 >, script_name )
            break
        case "second":
            CreateFloppytownModel( DESERTLANDS_CARGO_CONTAINER_LARGE_01, pos + < 0, 0, 0 >, < 0, 90, 0 >, script_name )
            CreateFloppytownModel( DESERTLANDS_CARGO_CONTAINER_LARGE_01, pos + < 0, 137, 0 >, < 0, 90, 0 >, script_name )
            CreateFloppytownModel( DESERTLANDS_CARGO_CONTAINER_320_OPEN_01, pos + < 55, 137, 137 >, < 0, 90, 0 >, script_name )
            break
        default:
        break
    }
    
    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function spawn_nessy( vector pos, vector ang )
{
    CreateFloppytownModel( DOMESTIC_NESSY_DOLL, pos, ang)
}

void function AreaBuildAreVisible()
{
    entity script_mover = CreateFloppytownScriptMover( FT_BUILD_AREA_POS )

    CreateLoopFloppytownModel_XY( DESERTLANDS_BLDG_PLATFORM_01, FT_BUILD_AREA_POS, < 0, 180, 0 >, 1024, 3, 352, 7, "area_build" )
    
    foreach ( ent in GetEntArrayByScriptName( "area_build" ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( FT_BUILD_AREA_ANG )
}

void function EditorRefAreVisible()
{
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    CreateEditorRef( FLOPPYTOWN_POS_OFFSET, FLOPPYTOWN_ANG_OFFSET, "Spawn Point Floppytown Origin" )

    CreateEditorRef( FT_FLOOR_POS, FT_FLOOR_ANG, "Floor Origin" )

    CreateEditorRef( FT_NORTH_WALL_POS, FT_NORTH_WALL_ANG, "North Wall Origin" )
    CreateEditorRef( FT_SOUTH_WALL_POS, FT_SOUTH_WALL_ANG, "South Wall Origin" )
    CreateEditorRef( FT_WEST_WALL_POS,  FT_WEST_WALL_ANG, "West Wall Origin" )
    CreateEditorRef( FT_EAST_WALL_POS,  FT_EAST_WALL_ANG, "East Wall Origin" )

    CreateEditorRef( FT_BUILDING_POS_01, FT_BUILDING_ANG_01, "Build 01 Origin" )
    CreateEditorRef( FT_BUILDING_POS_02, FT_BUILDING_ANG_02, "Build 02 Origin" )
    CreateEditorRef( FT_BUILDING_POS_03, FT_BUILDING_ANG_03, "Build 03 Origin" )
    CreateEditorRef( FT_BUILDING_POS_04, FT_BUILDING_ANG_04, "Build 04 Origin" )
    CreateEditorRef( FT_BUILDING_POS_05, FT_BUILDING_ANG_05, "Build 05 Origin" )
    CreateEditorRef( FT_BUILDING_POS_06, FT_BUILDING_ANG_06, "Build 06 Origin" )
    CreateEditorRef( FT_BUILDING_POS_07, FT_BUILDING_ANG_07, "Build 07 Origin" )
    CreateEditorRef( FT_BUILDING_POS_08, FT_BUILDING_ANG_08, "Build 08 Origin" )
    CreateEditorRef( FT_BUILDING_POS_09, FT_BUILDING_ANG_09, "Build 09 Origin" )
    CreateEditorRef( FT_BUILDING_POS_10, FT_BUILDING_ANG_10, "Build 10 Origin" )
    CreateEditorRef( FT_BUILDING_POS_11, FT_BUILDING_ANG_11, "Build 11 Origin" )
    CreateEditorRef( FT_BUILDING_POS_12, FT_BUILDING_ANG_12, "Build 12 Origin" )
    CreateEditorRef( FT_BUILDING_POS_13, FT_BUILDING_ANG_13, "Build 13 Origin" )
    CreateEditorRef( FT_BUILDING_POS_14, FT_BUILDING_ANG_14, "Build 14 Origin" )
    CreateEditorRef( FT_BUILDING_POS_15, FT_BUILDING_ANG_15, "Build 15 Origin" )
    CreateEditorRef( FT_BUILDING_POS_16, FT_BUILDING_ANG_16, "Build 16 Origin" )
    CreateEditorRef( FT_BUILDING_POS_17, FT_BUILDING_ANG_17, "Build 17 Origin" )
    CreateEditorRef( FT_BUILDING_POS_18, FT_BUILDING_ANG_18, "Build 18 Origin" )
    CreateEditorRef( FT_BUILDING_POS_19, FT_BUILDING_ANG_19, "Build 19 Origin" )
    CreateEditorRef( FT_BUILDING_POS_20, FT_BUILDING_ANG_20, "Build 20 Origin" )

    CreateEditorRef( FT_BUILD_AREA_POS, FT_BUILD_AREA_ANG, "Spawn Point Area Build Origin" )
}
