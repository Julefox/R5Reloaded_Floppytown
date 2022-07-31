untyped

globalize_all_functions


void function PrinttAssemblyFiles()
{
    printt( "|mp_rr_floppytown_assembly.nut:                  file called.|" )
}


void function Floppytown_MapInit_Assembly()
{
    
}


void function Ft_Floor( vector pos, vector ang, int Xaxis, int Yaxis )
{
    entity script_mover = CreateScriptMover( pos )

    int checker = 0
    float m = 0.00
    float n = -0.20

    for ( int i = 0 ; i < Xaxis ; i++ )
    {
        for ( int j = 0 ; j < Yaxis ; j++ )
        {
            //CreateSingleFloppytownModel( LEVELS_TERRAIN_MIL_BASE_SOUTH_RUNWAY_01, FT_FLOOR_POS + < 0, 0, m > + < 0, 700 * i, 0 >, < 0, 270, 0 >, "floor" ).SetModelScale( 2 )            //1
            //CreateSingleFloppytownModel( LEVELS_TERRAIN_MIL_BASE_SOUTH_RUNWAY_01, FT_FLOOR_POS + < -1600, -200, n > + < 0, 700 * i, 0 >, < 0, 90, 0 >, "floor" ).SetModelScale( 2 )      //1

            //m = m-0.06 // 1
            //n = n+0.06 // 1
            CreateSingleFloppytownModel( LEVELS_TERRAIN_MIL_BASE_SOUTH_RUNWAY_01, FT_FLOOR_POS + < 0, 0, -0.01 > + < 0, 700 * i, 0 >, < 0, 270, 0 >, "floor" )       //2
            CreateSingleFloppytownModel( LEVELS_TERRAIN_MIL_BASE_SOUTH_RUNWAY_01, FT_FLOOR_POS + < -1600, -200, -0.01 > + < 0, 700 * i, 0 >, < 0, 90, 0 >, "floor" ) //2
        }
    }
    CreateSingleFloppytownModel( LEVELS_TERRAIN_MIL_BASE_SOUTH_RUNWAY_01, FT_FLOOR_POS + < -680, -1000, 0 >, < 0, 90, 0 >, "floor" ).SetModelScale( 10 )     //2

    foreach ( ent in GetEntArrayByScriptName( "floor" ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function North_Wall( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "north_wall_"
    string script_name = script + name

    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 0, 96, 1200 > + < 529 * i, 0, 200 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 10 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 529, 96, 0 > + < 529 * i, 0, 200 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 144, 58, 2000 > + < 256 * i, 128 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 10 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 1160, 64, 0 > + < 260.7 * i, 0, 224 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 2202.8, 0, 1792 > + < 260.7 * i, 0, 224 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 10 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 3245.6, 0, 0 > + < 260.7 * i, 0, 224 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int j = 0 ; j < 2 ; j++ )
    {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 2062, 140, 1792 > + < 0, 0, 224 * j >, < 0, 90, 0 >, script_name ) }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 12 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 3900, 0, 0 > + < 529 * i, 0, 200 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 4028, -50, 2400 > + < 256 * i, 128 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 6 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 4500, -64, 896 > + < 260.7 * i, 0, 224 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 5044, -64, 1000 > + < 529 * i, 0, 200 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 5172, -114, 2400 > + < 256 * i, 128 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function South_Wall( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "south_wall_"
    string script_name = script + name

    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < -500, -80, 2000 > + < 529 * i, 0, 200 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -884, -42, 2600 > + < 256 * i, 128 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < -2097.3, 0, 1120 > + < 260.7 * i, 0, 224 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < -2358, 0, 2016 > + < 260.7 * i, 0, 224 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 19 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_WALL_PILLAR_64_01, pos + < -5840, -32, 2002 > + < 128 * i, 0, 286 * j >, < 0, 270, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 6 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < -3400, -64, 1600 > + < 529 * i, 0, 200 * j >, < 0, 0, 0 >, script_name ) }
    }
    //CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -3784+1408, -26, 2800-128 >, < 0, 90, 90 >, script_name )
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -3784, -26, 2800 > + < 256 * i, 128 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -3784+1408, -26, 2800-128 > + < 16 * i, 0 * j, 0 >, < 0, 90, 90 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function West_Wall( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "west_wall_"
    string script_name = script + name

    for ( int i = 0 ; i < 13 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_WALL_PILLAR_64_01, pos + < -32, 0, 1716 > + < 0, 128 * i, 286 * j >, < 0, 180, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, 1664, 1120 > + < 0, 260.7 * i, 224 * j >, < 0, -90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, 1664, 448 > + < 0, 260.7 * i, 224 * j >, < 0, -90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, 3228.2, 1120 > + < 0, 260.7 * i, 224 * j >, < 0, -90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, 3749.6, 672 > + < 0, 260.7 * i, 224 * j >, < 0, -90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_WALL_PILLAR_64_01, pos + < -32, 1536, 1144 > + < 0, 128 * i, 286 * j >, < 0, 180, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < -89, 4360, 1200 > + < 0, 529 * i, 200 * j >, < 0, -90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -58, 4494, 2200 > + < 128 * i, 256 * j, 0 >, < 0, 180, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function East_Wall( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "east_wall_"
    string script_name = script + name

    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 0, 0, 1600 > + < 0, 529 * i, 200 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -46, -384, 2400 > + < 128 * i, 256 * j, 0 >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 0, -1058, 1600 > + < 0, 529 * i, 200 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -46, -1420, 2600 > + < 128 * i, 256 * j, 0 >, < 0, 180, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -38, -1420-128, 2488 >, < 0, 0, 90 >, script_name )
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < 0, -2600, 2240 > + < 0, 260.7 * i, 224 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 14 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, pos + < 0, -2730, 0 > + < 0, 529 * i, 200 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -34, -3114, 2800 > + < 128 * i, 256 * j, 0 >, < 0, 180, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -34, -2202, 2687 >, < 0, 0, 90 >, script_name )
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 13 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < -64, -3500, 0 > + < 0, 260.7 * i, 224 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, pos + < -64, -4282.1, 2016 > + < 0, 260.7 * i, 224 * j >, < 0, 90, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function CreateWallTriggerAroundTheMap()
{
    // North_Wall()
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownWallTrigger( < 100, 5858, 0 > + < 190 * i, 0 * j, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownWallTrigger( < 1160, 5928, 0 > + < 200 * i, 0 * j, 0 > ) }
    }
    for ( int i = 0 ; i < 7 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownWallTrigger( < 2404, 5864, 0 > + < 200 * i, 0 * j, 0 > ) }
    }
    CreateFloppytownWallTrigger( < 4156, 5364, 0 >, 500 )
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownWallTrigger( < 4500, 5800, 0 > + < 250 * i, 0 * j, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownWallTrigger( < 5230, 5800, 0 > + < 500 * i, 0 * j, 0 > ) }
    }

    // South_Wall()
    for ( int i = 0 ; i < 12 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownWallTrigger( < 0, -1000, 0 > + < 500 * i, 0 * j, 0 > ) }
    }

    // West_Wall()
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 11 ; j++ )
        {   CreateFloppytownWallTrigger( < -1000, 0, 0 > + < 0 * i, 500 * j, 0 > ) }
    }

    // East_Wall()
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateFloppytownWallTrigger( < 6529.8, 3215, 0 > + < 0 * i, 250 * j, 0 > ) }
    }
    CreateFloppytownWallTrigger( < 5746, 2915, 0 >, 200 )
    CreateFloppytownWallTrigger( < 5746, 2795, 0 >, 100 )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownWallTrigger( < 6632, 2257, 0 > + < 0 * i, 250 * j, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownWallTrigger( < 6568, 1400, 0 > + < 0 * i, 250 * j, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownWallTrigger( < 6580, 53, 0 > + < 0 * i, 250 * j, 0 > ) }
    }
}

void function Building_01( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_01_"
    string script_name = script + name

    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_BLDG_PLATFORM_02, pos + < -592, -528, 1792.1 > + < 592 * i, 352 * j, 0 >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 9 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -592, -464, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 592, -480, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 270, 0 >, script_name )  
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -528, -528, SSB_UP_TO_0 > + < 128 * i, 0, 256 * j >, < 0, 180, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 568, -464, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 584, -864, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, -90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -456, -850, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -400, -912, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 180, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 568, -860, SSB_UP_TO_0_PATCH >, < 0, 90, 0 >, script_name )
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -192, -720, 256 > + < 512 * i, 0 * j, 0 >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -320, -784, 192 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_02( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_02_"
    string script_name = script + name

    //for ( int i = 0 ; i < 3 ; i++ )  // Side of the building not visible //
    //{   for ( int j = 0 ; j < 5 ; j++ )
    //    { CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 512, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    //}
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 640, -128, 0 > + < 0, 256 * i, 256 * j >, < 0, -90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 640, 128, 768 > + < 0, 256 * i, 256 * j >, < 0, -90, 0 >, script_name ) }
    }
    //for ( int i = 0 ; i < 4 ; i++ )  // Side of the building not visible //
    //{   for ( int j = 0 ; j < 6 ; j++ )
    //    { CreateFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -128, -384, 0 > + < 0, 256 * i, 256 * j >, < 0, -90, 0 >, script_name ) }
    //}
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, -512, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 512, -256, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        { CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, -384, 0 > + < 256 * i, 0, 256 * j >, < 0, -90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, -384, 768 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 256, -384, 768 > + < 256, 256, 0 >, < 0, 0, 0 >, script_name )
    //for ( int i = 0 ; i < 2 ; i++ ) // Side of the building not visible //
    //{   for ( int j = 0 ; j < 2 ; j++ )
    //    { CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -128, 128, 768 > + < 0, 256 * i, 256 * j >, < 0, -90, 0 >, script_name ) }
    //}
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 0, 768 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 128, 1280 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 768, 0, -96 > , < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 760, 12, 148 > , < -65, 0, 90 >, script_name )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 896, 128, -96 > + < 256 * i, 256 * j, 0 >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 767.6, 128, 200 > + < 256 * i, 256 * j, 0 >, < 25, 0, 0 >, script_name )
        }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_03( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_03_"
    string script_name = script + name

    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos+ < 0, -256, 0 > + < 0 * i, 256 * j, 1280 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 64, -320, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 270, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 64, 448, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 270, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 0, 384, 768 >, < 0, 0, 0 >, script_name )
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -128, -384, 640 > + < 128 * i, 0, 256 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        { CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 0, 384, 896 > + < 0, 128 * i, 256 * j >, < 0, 0, 0 >, script_name ) } // 330 
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_04( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_04_"
    string script_name = script + name

    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 128, -256, 0 > + < 0, 256 * i, 256 * j >, < 0, 270, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, -256, 512 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 384, 0 > + < 0, 256 * i, 256 * j >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_05( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_05_"
    string script_name = script + name

    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        { CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 128, -256, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 270, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( LEVELS_TERRAIN_SPACE_ELEVATOR_PLATFORM_01, pos + < 0, 0, 1220 >, < 0, 90, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_FRAME_256_01, pos + < 0, -304, 1248 >, < 0, 180, 0 >, script_name )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 324, 512 > + < 0, 256 * i, 256 * j >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_06( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_06_"
    string script_name = script + name

    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 256, -256, 0 > + < 0, 256 * i, 256 * j >, < 0, 270, 0 >, script_name ) }
    }
    //CreateSingleFloppytownModel( LEVELS_TERRAIN_SPACE_ELEVATOR_PLATFORM_01, pos + < 0, 0, 1220 >, < 0, 90, 0 >, script_name )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, -256, 1792 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 192, -256, 1792 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 192, 384, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_SMALL_03, pos + < -128, 384, 1279.9 > + < 128 * i, 0, 128 * j >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_07( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_07_"
    string script_name = script + name

    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 0, 2304 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 512, 2304 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 1152, 0, 2048 > + < 256 * i, 256 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 0, 640, 1792 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 256, 640, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 512, 384, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 1024, 384, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 1280, 384, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, 512, 0 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 16 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < 1920, 320, 0 > + < 0, 128 * i, 128 * j >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < 1904, 320, 0 > + < 0, 128 * i, 128 * j >, < 0, -90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < 1920, -64, 1536 > + < 0, 128 * i, 128 * j >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < 1904, -64, 1536 > + < 0, 128 * i, 128 * j >, < 0, -90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < 1344, 128, 2048 > + < 384 * i, 384 * j, 0 >, < 0, -90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 896, 192, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 640, 192, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 270, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 704, 128, SSB_UP_TO_0 > + < 128 * i, 0, 256 * j >, < 0, 0, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_A, pos + < 512, 384, 768 > + < 0, 0 * i, 512 * j >, < 0, 180, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_B , pos + < 1024, 384, 768 > + < 0, 0 * i, 512 * j >, < 0, 180, 0 >, script_name )
        }
    }
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 768, 448, 2560 >, < 0, 90, 0 >, script_name )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {
            if ( j == 1 )
            { CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 768, 256, 256.1 > + < 0 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
            else
            { CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 768, 256, 256 > + < 0 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 768, 384, 512 > + < 0, 256 * i, 256 * j >, < 0, 0, 0 >, script_name )
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 768, 384, 1536 > + < 0, 256 * i, 256 * j >, < 0, 0, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_FRAME_256_01, pos + < 768, 384, 768 > + < 0, 256 * i, 1024 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 1280, 0, 2016 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_08( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_08_"
    string script_name = script + name

    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -256, 64, 1664 > + < 512 * i, 0 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 13 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < -448, 256, 0 > + < 128 * i, 0, 128 * j >, < 0, 0, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, pos + < -448, 256-16, 0 > + < 128 * i, 0, 128 * j >, < 0, 180, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, -128, 1600 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_09( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_09_"
    string script_name = script + name

    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -192, 128, 2048 > + < 384 * i, 384 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -256, 384, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, 0, 1984 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 0, 1536 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, 0, 1280 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 6 ; j++ )
        { 
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, 256, 0 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 256, 0 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name )
        }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_10( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_10_"
    string script_name = script + name

    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, 0, 1280 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 128, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_11( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_11_"
    string script_name = script + name

    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -128, 0, 2048 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, 0, 2048 >, < 0, 0, 0 > )
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -512, -64, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -448, 128, SSB_UP_TO_0 > + < 128 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -192, 640, SSB_UP_TO_0 > + < 128 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -256, 192, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_12( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_12_"
    string script_name = script + name

    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -640, 0, 0 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 0, 1280 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, 512, 0 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -256, -128, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -512, -128, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -512, 384, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -320, 1024, SSB_UP_TO_0_PATCH + 1536 > + < 128 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -384, 960, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }

    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -512, 0, 1280 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -128, 64, 2304 > + < 0 * i, 384 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, 0, 2272-32 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -256, 960, 2272 > + < 256 * i, 256 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_13( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_13_"
    string script_name = script + name

    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -128, 64, 1792 > + < 0 * i, 384 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 7 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -384, -64, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -384, 832, SSB_UP_TO_0_PATCH + 1024 > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0; i < 2 ; i++ )
    {   for ( int j = 0; j < 8 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, 0, 1728 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_14( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_14_"
    string script_name = script + name

    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -512, -384, 0 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, -512, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -256, -320, 1024 > + < 512 * i, 384 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, -384, 960 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_15( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_15_"
    string script_name = script + name

    for ( int i = 0 ; i < 7 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -384, 32, 1024 > + < 128 * i, 0 * j, 0 >, < 0, 0, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -384, -32, 1024 > + < 128 * i, 0 * j, 0 >, < 0, 0, 0 >, script_name )

            CreateSingleFloppytownModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -384.1, 31.9, 1024 > + < 128 * i, 0 * j, 0 >, < 0, 0, 180 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -384.1, -31.9, 1024 > + < 128 * i, 0 * j, 0 >, < 0, 0, 180 >, script_name )
        }
    }
    for ( int i = 0 ; i < 11 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -640, 96, 1024 > + < 128 * i, 0 * j, 0 >, < 0, 0, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -640, -96, 1024 > + < 128 * i, 0 * j, 0 >, < 0, 0, 0 >, script_name )

            CreateSingleFloppytownModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -640.1, 95.9, 1024 > + < 128 * i, 0 * j, 0 >, < 0, 0, 180 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, pos + < -640.1, -95.9, 1024 > + < 128 * i, 0 * j, 0 >, < 0, 0, 180 >, script_name )
        }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_16( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_16_"
    string script_name = script + name

    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -256, 384, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name )
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -256, -384, 0 > + < 256 * i, 0, 256 * j >, < 0, 0, 0 >, script_name )
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < 384, -256, 0 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x256_01, pos + < -384, -256, 0 > + < 0, 256 * i, 256 * j >, < 0, 90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, -256, 1280 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 > ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_17( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_17_"
    string script_name = script + name

    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_512x352_01, pos + < -128, -384, 0 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x352_01, pos + < 256, -384, 0 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_512x352_01, pos + < 128, 384, 0 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x352_01, pos + < -256, 384, 0 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_512x352_01, pos + < -384, 128, 0 >, < 0, 90, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x352_01, pos + < -384, -256, 0 >, < 0, 90, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_512x352_01, pos + < 384, -128, 0 >, < 0, 90, 0 >, script_name )
    CreateSingleFloppytownModel( THUNDERDOME_CAGE_WALL_256x352_01, pos + < 384, 256, 0 >, < 0, 90, 0 >, script_name )
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -256, -256, 352 > + < 256 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_18( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_18_"
    string script_name = script + name

    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -512, -192, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 512, -192, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, -90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -448, 256, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 0, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -448, -256, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 180, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -320, 0, 1280 > + < 640 * i, 384 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < 0, 0, 1280.1 >, < 0, 90, 0 >, script_name )
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -384, -128, 1216 > + < 256 * i, 256 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_19( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_19_"
    string script_name = script + name

    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < 0, -256, 1280 > + < 0 * i, 512 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 192, -448, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, -90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -128, -512, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 180, 0 >, script_name ) } // droit
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -128, 512, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 12 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -1664, 0, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 12 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {    CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -1664, -384, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 180, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -192, 64, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -192, -448, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -1728, -320, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -1472, -192, 1280 > + < 512 * i, 0 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 128, -384, 1216 > + < 0 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -64, -384, 1216 > + < 0 * i, 256 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < -1600, -256, 1216 > + < 256 * i, 0 * j, 0 >, < 0, 0, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < -1600, -64, 1216 > + < 256 * i, 0 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function Building_20( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "bldg_20_"
    string script_name = script + name

    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, pos + < -192, -256, 256 > + < 384 * i, 512 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < 384, -448, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, -90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -384, -448, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, < 0, 90, 0 >, script_name )
        }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -320, 512, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 0, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, pos + < -320, -512, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, < 0, 180, 0 >, script_name )
        }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function LittleBridge( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "little_bridge_"
    string script_name = script + name

    CreateSingleFloppytownModel( IMC_BASE_CARGO_CONTAINER_WHITE_01, pos + < -128, 0, 0 >, < 0, 90, 0 >, script_name )
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateSingleFloppytownModel( INDUSTRIAL_SUPPORT_BEAM_256_01, pos + < -96, -48, -2 > + < 256 * i, 72 * j, 0 >, < 0, 90, 0 >, script_name ) }
    }

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function BalconyLeft( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "balcony_left_"
    string script_name = script + name

    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 0, 0 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < -128, -128, 7 >, < 0, -90, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_64_01, pos + < -128, -32, 7 >, < 0, 180, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_32_01, pos + < -128, 16, 7 >, < 0, 180, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_128_01, pos + < 0, -128, 7 >, < 0, -90, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_64_01, pos + < 96, -128, 7 >, < 0, -90, 0 >, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function BalconyRight( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "balcony_right_"
    string script_name = script + name

    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x256_06, pos + < 0, 0, 0 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < 128, -128, 7 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_64_01, pos + < 128, -32, 7 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_32_01, pos + < 128, 16, 7 >, < 0, 0, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_128_01, pos + < 0, -128, 7 >, < 0, -90, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_64_01, pos + < -96, -128, 7 >, < 0, -90, 0 >, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function MiniBalconyLeft( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "mini_balcony_left_"
    string script_name = script + name

    CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, pos + < 0, 0, 0 >, < 0, 90, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < -128, -64, 9 >, < 0, -90, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_64_01, pos + < -128, 32, 9 >, < 0, 180, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_128_01, pos + < 0, -64, 9 >, < 0, -90, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_64_01, pos + < 96, -64, 9 >, < 0, -90, 0 >, script_name )

    foreach ( ent in GetEntArrayByScriptName( script_name ) )
    { ent.SetParent( script_mover ) }
    script_mover.SetAngles( ang )
}

void function LilBalcony( vector pos, vector ang, string name )
{
    entity script_mover = CreateFloppytownScriptMover( pos )

    string script = "lil_balcony_"
    string script_name = script + name

    CreateSingleFloppytownModel( PLAYBACK_BRIDGE_PANEL_128x64_01, pos + < 64, 0, 0 >, < 0, 90, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < -64, 64, 4 >, < 0, 180, 0 >, script_name )
    CreateSingleFloppytownModel( OLA_RAILING_CORNER_IN_01, pos + < 64, 64, 4 >, < 0, 90, 0 >, script_name )

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
            CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_320_01, pos + < 0, 0, 0 >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_320_01, pos + < 0, 137, 0 >, < 0, 90, 0 >, script_name )
            break
        case "second":
            CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_LARGE_01, pos + < 0, 0, 0 >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_LARGE_01, pos + < 0, 137, 0 >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_320_OPEN_01, pos + < 55, 137, 137 >, < 0, 90, 0 >, script_name )
            break
        case "third":
            CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_320_01, pos + < 0, 0, 0 >, < 0, 90, 0 >, script_name )
            CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_320_01, pos + < 10, 137*2, 120 >, < 0, 270, 45 >, script_name )
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
    CreateSingleFloppytownModel( DOMESTIC_NESSY_DOLL, pos, ang)
}

void function AreaBuildAreVisible()
{
    entity script_mover = CreateFloppytownScriptMover( FT_BUILD_AREA_POS )
    for ( int i = 0 ; i <  3 ; i++ )
    {   for ( int j = 0 ; j <  7 ; j++ )
        {   CreateSingleFloppytownModel( DESERTLANDS_BLDG_PLATFORM_02, FT_BUILD_AREA_POS + < 1024 * i, 352 * j, 0 >, < 0, 180, 0 >, "area_build" ) }
    }
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
