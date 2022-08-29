untyped

globalize_all_functions


void function PrinttGenerationFiles()
{
    printt( "|mp_rr_floppytown_generation.nut:                file called.|" )
}

void function Floppytown_MapInit_Generation()
{
    Map_Generation()
    Props_Generation()
    Dynamic_Build_Generation()
    thread Scripted_Model()
    AddCallback_EntitiesDidLoad( Zips_Generation )

    Floppytown_MapInit_Crane_Scripts()

    if( GetCurrentPlaylistVarBool( "ft_walltrigger_disable", false ) )
    { printt( "wall trigger disable !" ) }
        else
    { CreateWallTriggerAroundTheMap() }

    thread SkyboxAnimation()
    
    SetFloppytownAngles()
}


void function Map_Generation()
{
    Ft_Floor( FT_FLOOR_POS, FT_FLOOR_ANG )

    North_Wall( FT_NORTH_WALL_POS, FT_NORTH_WALL_ANG, "01" )
    South_Wall( FT_SOUTH_WALL_POS, FT_SOUTH_WALL_ANG, "01" )
    West_Wall( FT_WEST_WALL_POS, FT_WEST_WALL_ANG, "01" )
    East_Wall( FT_EAST_WALL_POS, FT_EAST_WALL_ANG, "01" )

    Building_01( FT_BUILDING_POS_01, FT_BUILDING_ANG_01, "01" )
    Building_02( FT_BUILDING_POS_02, FT_BUILDING_ANG_02, "01" )
    Building_03( FT_BUILDING_POS_03, FT_BUILDING_ANG_03, "01" )
    Building_04( FT_BUILDING_POS_04, FT_BUILDING_ANG_04, "01" )
    Building_05( FT_BUILDING_POS_05, FT_BUILDING_ANG_05, "01" )
    Building_06( FT_BUILDING_POS_06, FT_BUILDING_ANG_06, "01" )
    Building_07( FT_BUILDING_POS_07, FT_BUILDING_ANG_07, "01" )
    Building_08( FT_BUILDING_POS_08, FT_BUILDING_ANG_08, "01" )
    Building_09( FT_BUILDING_POS_09, FT_BUILDING_ANG_09, "01" )
    Building_10( FT_BUILDING_POS_10, FT_BUILDING_ANG_10, "01" )
    Building_11( FT_BUILDING_POS_11, FT_BUILDING_ANG_11, "01" )
    Building_12( FT_BUILDING_POS_12, FT_BUILDING_ANG_12, "01" )
    Building_13( FT_BUILDING_POS_13, FT_BUILDING_ANG_13, "01" )
    Building_14( FT_BUILDING_POS_14, FT_BUILDING_ANG_14, "01" )
    Building_15( FT_BUILDING_POS_15, FT_BUILDING_ANG_15, "01" )
    Building_16( FT_BUILDING_POS_16, FT_BUILDING_ANG_16, "01" )
    Building_17( FT_BUILDING_POS_17, FT_BUILDING_ANG_17, "01" )
    Building_18( FT_BUILDING_POS_18, FT_BUILDING_ANG_18, "01" )
    Building_19( FT_BUILDING_POS_19, FT_BUILDING_ANG_19, "01" )
    Building_20( FT_BUILDING_POS_20, FT_BUILDING_ANG_20, "01" )

    cargo_ground( FT_CARGO_GROUND_FIRST_POS, FT_CARGO_GROUND_FIRST_ANG, "first", "01" )
    cargo_ground( FT_CARGO_GROUND_SECOND_POS, FT_CARGO_GROUND_SECOND_ANG, "second", "01" )
    LilBalcony( FT_LIL_BALCONY_01_POS, FT_LIL_BALCONY_01_ANG, "01" )
    LilBalcony( FT_LIL_BALCONY_02_POS, FT_LIL_BALCONY_02_ANG, "02" )
    LilBalcony( FT_LIL_BALCONY_03_POS, FT_LIL_BALCONY_03_ANG, "03" )
    LittleBridge( FT_LITTLE_BRIDGE_POS, FT_LITTLE_BRIDGE_ANG, "01" )
    BalconyLeft( FT_BALCONY_LEFT_POS, FT_BALCONY_LEFT_ANG, "01" )
    BalconyRight( FT_BALCONY_RIGHT_POS, FT_BALCONY_RIGHT_ANG, "01" )
}


void function Props_Generation()
{
    CreateLoopFloppytownModel_X( INDUSTRIAL_TRAFFIC_BARREL_01, FLOPPYTOWN_POS_OFFSET + < 26, 2160, 1284 >,  < 0, 0, 0 >, 200, 2 )
    CreateFloppytownModel( DESERTLANDS_CARGO_CONTAINER_LARGE_01, FLOPPYTOWN_POS_OFFSET + < 384, 1012, 1808 >, < 0, 180, 0 > )
    CreateFloppytownModel( INDUSTRIAL_UTG_SPIRE, FLOPPYTOWN_POS_OFFSET + < 256, 256, 2320 >, < 0, -45, 0 > )
    CreateFloppytownModel( DESERTLANDS_GONDOLA_CART_01, FLOPPYTOWN_POS_OFFSET + < 896, 80, 2640 >, < 0, 180, 0 > )
    CreateLoopFloppytownModel_Z( THUNDERDOME_CAGE_CEILING_256x128_06, FLOPPYTOWN_POS_OFFSET + < 5060, 318, 1664 >, < 0, -45, 0 >, 256, 2 )
    CreateFloppytownModel( THUNDERDOME_STANDS_AWNING_01, FLOPPYTOWN_POS_OFFSET + < 5168, 700, 1680 >, < 0, 0, 0 > )
    CreateFloppytownModel( COLONY_CRATE_MD_80x64x72_01, FLOPPYTOWN_POS_OFFSET + < 32, 2988, 1296 >, < 0, 0, 0 > )
    CreateFloppytownModel( IMC_BASE_ANTENNA_LARGE, FLOPPYTOWN_POS_OFFSET + < 260, 4604, 1294 >, < 0, 135, 0 > )
    CreateFloppytownModel( SIGNS_CITY_NEWDAMN_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 3586, 4832, 0 >, < 0, 90, 0 > )
    CreateLoopFloppytownModel_Z( IMC_BASE_TALLPANEL_48_02, FLOPPYTOWN_POS_OFFSET + < 3256, 3992, 320 >, < 0, 0, 0 >, 256, 6 )
    CreateLoopFloppytownModel_Z( IMC_BASE_TALLPANEL_48_02, FLOPPYTOWN_POS_OFFSET + < 2072, 4154, 320 >, < 0, 180, 0 >, 256, 6 )
    CreateLoopFloppytownModel_Y( BEACON_SERVER_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5464, 4096, 1792 >, < 0, 0, 0 >, -64, 2 )
    CreateLoopFloppytownModel_XZ( BEACON_SERVER_HALF_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5278, 4718, 1792 >, < 0, 0, 0 >, 128, 2, 128, 3 )
    CreateLoopFloppytownModel_YZ( BEACON_SERVER_HALF_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5548, 4576, 1792 >, < 0, -90, 0 >, -128, 2, 128, 3 )
    MiniBalconyLeft( FLOPPYTOWN_POS_OFFSET + < 5406, 4640, 2176 >, < 0, 0, 0 >, "01" )
    CreateFloppytownModel( BEACON_KODAI_METAL_BEAM_256_02, FLOPPYTOWN_POS_OFFSET + < 5302, 4600, 1792 >, < 0, 0, 0 > )
    CreateFloppytownModel( BEACON_KODAI_METAL_BEAM_128_02, FLOPPYTOWN_POS_OFFSET + < 5302, 4600, 2048 >, < 0, 0, 0 > )
    CreateFloppytownModel( OLA_RAILING_CORNER_OUT_01, FLOPPYTOWN_POS_OFFSET + < 5522, 4686, 2409 >, < 0, 180, 0 > )
    CreateLoopFloppytownModel_X( OLA_RAILING_128_01, FLOPPYTOWN_POS_OFFSET + < 5394, 4686, 2409 >, < 0, -90, 0 >, -128, 3 )
    CreateLoopFloppytownModel_Y( OLA_RAILING_128_01, FLOPPYTOWN_POS_OFFSET + < 5522, 4558, 2409 >, < 0, 180, 0 >, -128, 6 )
    CreateFloppytownModel( EDEN_ELECTRICAL_POLE_01, FLOPPYTOWN_POS_OFFSET + < 5504, 4335, 1792 >, < 0, 180, 0 > )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_BLDG_COLUMN_STACK_01, FLOPPYTOWN_POS_OFFSET + < 4992, 768, 0 >, < 0, 0, 0 >, 152, 5, 168, 2 )
    CreateLoopFloppytownModel_YZ( DESERTLANDS_BLDG_COLUMN_STACK_01, FLOPPYTOWN_POS_OFFSET + < 5248, 1712, 0 >, < 0, 0, 0 >, -152, 4, 168, 2 )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_BLDG_COLUMN_01, FLOPPYTOWN_POS_OFFSET + < 5056, 752, 0 >, < 0, 0, 0 >, 56, 2, 150, 2 )
    CreateFloppytownModel( DESERTLANDS_TS_SIGN_02, FLOPPYTOWN_POS_OFFSET +  <0, 2967.5, 1792 >, < 0, 0, 0 > ).SetModelScale( 6 )
    CreateFloppytownModel( DESERTLANDS_TS_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 1536, 520, 1536 >, < 0, 90, 0 > ).SetModelScale( 6 )
    CreateFloppytownModel( BEACON_FENCE_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 2648, 3812, 1408 >, < 0, 0, 0 > ).SetModelScale( 3 )
    CreateFloppytownModel( SIGNS_NUM_LIT_1, FLOPPYTOWN_POS_OFFSET + < 3822, 3200, 1024 >, < 0, 180, 0 > ).SetModelScale( 40 )
    CreateFloppytownModel( SIGNS_NUM_LIT_2, FLOPPYTOWN_POS_OFFSET + < 2368, 2450, 1024 >, < 0, 90, 0 > ).SetModelScale( 40 )
    CreateFloppytownModel( SIGNS_NUM_LIT_3, FLOPPYTOWN_POS_OFFSET + < 2560, 1362, 1024 >, < 0, 90, 0 > ).SetModelScale( 40 )
    CreateFloppytownModel( DESERTLANDS_GONDOLA_PLATFORM_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 2432, 4864, 2096 >, < 0, 180, 0 > ).SetModelScale( 3 )
    CreateFloppytownModel( DESERTLANDS_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 5100, 3392, 1288 >, < 0, 90, 0 > ).SetModelScale( 6 )
    CreateFloppytownModel( SIGNS_RELIC_WARNING , FLOPPYTOWN_POS_OFFSET + < 5110, 2560, 2048 >, < 0, 90, 0 > ).SetModelScale( 8 )
    CreateFloppytownModel( SIGNS_RELIC_WARNING , FLOPPYTOWN_POS_OFFSET + < 4992, 2314, 128 >, < 0, 0, 0 > ).SetModelScale( 4 )
    CreateFloppytownModel( SIGNS_RELIC_WARNING , FLOPPYTOWN_POS_OFFSET + < 5100, 3584, 256 >, < 0, 90, 0 > ).SetModelScale( 6 )
    CreateFloppytownModel( SIGNS_SERVICE_SHAFT_01, FLOPPYTOWN_POS_OFFSET + < 4312, 0, 2340 >, < 0, 90, 0 > ).SetModelScale( 8 )
    CreateFloppytownModel( FIRSTGEN_PIPE_256_CLOTH_01, FLOPPYTOWN_POS_OFFSET + < 5608, 512, 2300 >, < 0, -90, 0 > )
    CreateFloppytownModel( FIRSTGEN_PIPE_CURVE_CLOTH_01, FLOPPYTOWN_POS_OFFSET + < 5608, 512, 2300 >, < 0, 90, 0 > )
    CreateFloppytownModel( FIRSTGEN_PIPE_CURVE_CLOTH_01, FLOPPYTOWN_POS_OFFSET + < 5608, 256, 2300 >, < -180, 90, 0 > )
    CreateLoopFloppytownModel_X( FIRSTGEN_PIPE_256_CLOTH_01, FLOPPYTOWN_POS_OFFSET + < 1028, 4896, 200 >, < 0, 0, 0 >, 256, 4 )
    CreateFloppytownModel( IMC_BASE_GENERATOR_02, FLOPPYTOWN_POS_OFFSET + < 1344, 1600, 256 >, < 0, 0, 0 > )
    CreateLoopFloppytownModel_Y( IMC_BASE_GENERATOR_01, FLOPPYTOWN_POS_OFFSET + < 5184, 2368, 2304 >, < 0, 0, 0 >, 128, 4 )
    CreateFloppytownModel( INDUSTRIAL_LIGHT_POLE_BFORCE_02, FLOPPYTOWN_POS_OFFSET + < 320, 2176, 0 >, < 0, 0, 0 > )
    CreateFloppytownModel( FOLIAGE_FOREST_TREE_01, FLOPPYTOWN_POS_OFFSET + < 3200, 2956, 0 >, < 0, 0, 0 > )
    //CreateFloppytownModel( FOLIAGE_GRASS_DESERT_02, FLOPPYTOWN_POS_OFFSET + < 3200, 2956, 16 >, < 0, 0, 0 > )

    // test
    //CreateLoopFloppytownModel_X( BARRIERS_SANDBAGS_LARGE_01, FLOPPYTOWN_POS_OFFSET + < 3200, 2956, 0 >, < 0, 0, 0 >, 116, 8 )
    //CreateLoopFloppytownModel_XY( FOLIAGE_GRASS_DESERT_02, FLOPPYTOWN_POS_OFFSET + < 3200-512, 2956-512, 16 >, < 0, 0, 0 >, 256, 5, 256, 5 )
}


void function Dynamic_Build_Generation()
{
    array<string> rng_nessy_choice = [ "1", "2", "3", "4", "5" ]
    string rng_nessy = rng_nessy_choice.getrandom()

    if ( GetCurrentPlaylistVarBool( "ft_rng_is_not_rng", false ) )
    {
        printt( "|============================================================|" )
        printt( "|>>>>>>>>>>>>>>>>>>>  RNG State: DISABLE  <<<<<<<<<<<<<<<<<<<|" )

        rng_nessy = "inDev"
    }
    // rng_nessy
    switch( rng_nessy )
    {
        case "1":
            spawn_nessy(FT_NESSY_1_POS, FT_NESSY_1_ANG)
            break
        case "2":
            spawn_nessy(FT_NESSY_2_POS, FT_NESSY_2_ANG)
            break
        case "3":
            spawn_nessy(FT_NESSY_3_POS, FT_NESSY_3_ANG)
            break
        case "4":
            spawn_nessy(FT_NESSY_4_POS, FT_NESSY_4_ANG)
            break
        case "5":
            spawn_nessy(FT_NESSY_5_POS, FT_NESSY_5_ANG)
            break
        case "inDev":
            spawn_nessy(FT_NESSY_1_POS, FT_NESSY_1_ANG)
            spawn_nessy(FT_NESSY_2_POS, FT_NESSY_2_ANG)
            spawn_nessy(FT_NESSY_3_POS, FT_NESSY_3_ANG)
            spawn_nessy(FT_NESSY_4_POS, FT_NESSY_4_ANG)
            spawn_nessy(FT_NESSY_5_POS, FT_NESSY_5_ANG)
        break
    }

    if ( GetCurrentPlaylistVarBool( "ft_dev_enable", false ) ) { // map editing, do not activate in normal use
        printt( "|============================================================|" )
        printt( "|Dynamic_Build_Generation RNG: Nessy Location      = " + rng_nessy )
        printt( "|============================================================|" )
        printt( "" ) }
}


void function Scripted_Model()
{
    CreateFloppytownModel( LEVELS_TERRAIN_RADAR_SEC_01_DISH_02, FT_SCRIPTED_RADAR_POS, FT_SCRIPTED_RADAR_ANG )

    entity script_mover = CreateFloppytownScriptMover( FT_SCRIPTED_RADAR_POS + < 0, 0, 1600 >, FT_SCRIPTED_RADAR_ANG, "scripted_radar", true )
    entity radar = CreateFloppytownModel( LEVELS_TERRAIN_RADAR_DISH_01, script_mover.GetOrigin(), FT_SCRIPTED_RADAR_ANG )

    radar.SetModelScale( 0.6 )

        wait 0.2

    radar.SetParent( script_mover )

    thread OnMovingRadar( script_mover )
}

void function OnMovingRadar( entity script_mover )
{
    wait 0.1

    while( true )
    {
        script_mover.NonPhysicsRotateTo( < 0, 90, 0 >, 3, 0, 0 )
            wait 3
        script_mover.NonPhysicsRotateTo( < 0, 180, 0 >, 3, 0, 0 )
            wait 3
        script_mover.NonPhysicsRotateTo( < 0, -90, 0 >, 3, 0, 0 )
            wait 3
        script_mover.NonPhysicsRotateTo( < 0, 0, 0 >, 3, 0, 0 )
            wait 3
    }
}


void function Zips_Generation()
{
    // Building 01
    ZiplineUtility zipline_0 = Zipline_CreateZipline(  "zipline_0", FT_BUILDING_POS_01 + < -598, 272, 1792 >, < 0, -170, 0 > )
    Zipline_SetZiplineAngles( zipline_0, < 0, -32, 0 > )
    Zipline_BuildInit( zipline_0 )

    ZiplineUtility zipline_1 = Zipline_CreateZipline(  "zipline_1", FT_BUILDING_POS_01 + < 600, 0, 1792 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_1, < 0, 144, 0 > )
    Zipline_BuildInit( zipline_1 )

    ZiplineUtility zipline_2 = Zipline_CreateZipline(  "zipline_2", FLOPPYTOWN_POS_OFFSET + < 2712, 3810, 896 >, < 0, -90, 0 > )
    Zipline_SetZiplineAngles( zipline_2, < 0, -175, 0 > )
    Zipline_SetSkin( zipline_2, 1 )
    Zipline_BuildInit( zipline_2 )

    ZiplineUtility zipline_35 = Zipline_CreateZipline( "zipline_35", FLOPPYTOWN_POS_OFFSET + < 3160, 3424, 160 >, < 0, -90, 0 >, FLOPPYTOWN_POS_OFFSET + < 2264, 3424, 160 >, < 0, -90, 0 > )
    Zipline_SetSkin( zipline_35, 1, 1 )
    Zipline_BuildInit( zipline_35 )

    // Building 02
    ZiplineUtility zipline_3 = Zipline_CreateZipline(  "zipline_3", FT_BUILDING_POS_02 + < 256, -512, 768 >, < 0, -90, 0 > )
    Zipline_SetZiplineAngles( zipline_3, < 0, 150, 0 > )
    Zipline_BuildInit( zipline_3 )

    ZiplineUtility zipline_4 = Zipline_CreateZipline(  "zipline_4", FT_BUILDING_POS_02 + < 640, 256, 1280 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_4, < 0, 150, 0 > )
    Zipline_BuildInit( zipline_4 )

    ZiplineUtility zipline_31 = Zipline_CreateZipline(  "zipline_31", FLOPPYTOWN_POS_OFFSET + < 1024, 4352, 148 >, < 0, 0, 0 >, FLOPPYTOWN_POS_OFFSET + < 1024, 4892, 148 >, < 0, 0, 0 > )
    Zipline_SetSkin( zipline_31, 1, 1 )
    Zipline_BuildInit( zipline_31 )

    // Building 04
    ZiplineUtility zipline_5 = Zipline_CreateZipline(  "zipline_5", FT_BUILDING_POS_04 + < 128, 256, 512 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_5, < 0, -140, 0 > )
    Zipline_SetArmOffset( zipline_5, 228.0 )
    Zipline_BuildInit( zipline_5 )

    // Building 05
    ZiplineUtility zipline_6 = Zipline_CreateZipline( "zipline_6", FT_BUILDING_POS_05 + < 0, 320, 1280 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_6, < 0, -114, 0 > )
    Zipline_BuildInit( zipline_6 )

    // Building 06
    ZiplineUtility zipline_7 = Zipline_CreateZipline( "zipline_7", FT_BUILDING_POS_06 + < 192, 384, 1792 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_7, < 0, -132, 0 > )
    Zipline_BuildInit( zipline_7 )

    // Building 07
    ZiplineUtility zipline_8 = Zipline_CreateZipline( "zipline_8", FT_BUILDING_POS_07 + < 0, 640, 2304 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_8, < 0, -44, 0 > )
    Zipline_SetArmOffset( zipline_8, 228.0 )
    Zipline_BuildInit( zipline_8 )

    ZiplineUtility zipline_9 = Zipline_CreateZipline( "zipline_9", FLOPPYTOWN_POS_OFFSET + < 896, 576, 2560 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_9, < 0, -90, 0 > )
    Zipline_SetSkin( zipline_9, 2 )
    Zipline_BuildInit( zipline_9 )

    ZiplineUtility zipline_10 = Zipline_CreateZipline( "zipline_10", FT_BUILDING_POS_07 + < 1916, 64, 2048 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_10, < 0, 138, 0 > )
    Zipline_SetArmOffset( zipline_10, 228.0 )
    Zipline_BuildInit( zipline_10 )

    ZiplineUtility zipline_32 = Zipline_CreateZipline(  "zipline_32", FLOPPYTOWN_POS_OFFSET + < 1280, 512, 2176 >, < 0, 0, 0 >, FLOPPYTOWN_POS_OFFSET + < 1280, 16, 2176 >, < 0, 0, 0 > )
    Zipline_SetSkin( zipline_32, 1, 1 )
    Zipline_BuildInit( zipline_32 )

    // Building 08
    ZiplineUtility zipline_11 = Zipline_CreateZipline( "zipline_11", FT_BUILDING_POS_08 + < 256, 256, 1664 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_11, < 0, -132, 0 > )
    Zipline_SetArmOffset( zipline_11, 230.0 )
    Zipline_SetHeightLimit( zipline_11, 800 )
    Zipline_BuildInit( zipline_11 )

    // Building 09
    ZiplineUtility zipline_12 = Zipline_CreateZipline( "zipline_12", FT_BUILDING_POS_09 + < -256, 384, 2048 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_12, < 0, -42, 0 > )
    Zipline_SetArmOffset( zipline_12, 230.0 )
    Zipline_BuildInit( zipline_12 )

    // Building 10
    ZiplineUtility zipline_13 = Zipline_CreateZipline( "zipline_13", FT_BUILDING_POS_10 + < -384, 128, 1280 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_13, < 0, -42, 0 > )
    Zipline_SetHeightLimit( zipline_13, 600 )
    Zipline_SetArmOffset( zipline_13, 230.0 )
    Zipline_BuildInit( zipline_13 )

    ZiplineUtility zipline_14 = Zipline_CreateZipline( "zipline_14", FT_BUILDING_POS_10 + < -384, 128, 1280 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_14, < 0, -42, 0 > )
    Zipline_SetHeightLimit( zipline_14, 600 )
    Zipline_SetArmOffset( zipline_14, 230.0 )
    Zipline_BuildInit( zipline_14 )

    //Building 12
    ZiplineUtility zipline_15 = Zipline_CreateZipline( "zipline_15", FT_BUILDING_POS_12 + < -128, -128, 2304 >, < 0, -90, 0 > )
    Zipline_SetZiplineAngles( zipline_15, < 0, 72, 0 > )
    Zipline_BuildInit( zipline_15 )

    ZiplineUtility zipline_16 = Zipline_CreateZipline( "zipline_16", FT_BUILDING_POS_12 + < -128, 1024, 2304 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_16, < 0, -106, 0 > )
    Zipline_BuildInit( zipline_16 )

    ZiplineUtility zipline_17 = Zipline_CreateZipline( "zipline_17", FT_BUILDING_POS_12 + < -384, 256, 2304 >, < 0, 180, 0 > )
    Zipline_SetZiplineAngles( zipline_17, < 0, -26, 0 > )
    Zipline_BuildInit( zipline_17 )

    // Building 13
    ZiplineUtility zipline_18 = Zipline_CreateZipline( "zipline_18", FT_BUILDING_POS_13 + < -384, 1408, 1792 >, < 0, 180, 0 > )
    Zipline_SetZiplineAngles( zipline_18, < 0, -32, 0 > )
    Zipline_BuildInit( zipline_18 )

    // Building 14
    ZiplineUtility zipline_19 = Zipline_CreateZipline( "zipline_19", FT_BUILDING_POS_14 + < -512, 0, 1024 >, < 0, 180, 0 > )
    Zipline_SetZiplineAngles( zipline_19, < 0, -32, 0 > )
    Zipline_BuildInit( zipline_19 )

    ZiplineUtility zipline_20 = Zipline_CreateZipline( "zipline_20", FT_BUILDING_POS_14 + < 128, -512, 1024 >, < 0, -90, 0 > )
    Zipline_SetZiplineAngles( zipline_20, < 0, 58, 0 > )
    Zipline_BuildInit( zipline_20 )

    // Building 16
    ZiplineUtility zipline_21 = Zipline_CreateZipline( "zipline_21", FT_BUILDING_POS_16 + < -384, -256, 1280 >, < 0, 180, 0 > )
    Zipline_SetZiplineAngles( zipline_21, < 0, 30, 0 > )
    Zipline_SetArmOffset( zipline_21, 230.0 )
    Zipline_BuildInit( zipline_21 )

    ZiplineUtility zipline_22 = Zipline_CreateZipline( "zipline_22", FT_BUILDING_POS_16 + < 0, 384, 1280 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_22, < 0, -120, 0 > )
    Zipline_SetArmOffset( zipline_22, 230.0 )
    Zipline_BuildInit( zipline_22 )

    ZiplineUtility zipline_23 = Zipline_CreateZipline( "zipline_23", FT_BUILDING_POS_16 + < 384, -256, 1280 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_23, < 0, 152, 0 > )
    Zipline_SetArmOffset( zipline_23, 230.0 )
    Zipline_BuildInit( zipline_23 )

    // Building 18
    ZiplineUtility zipline_24 = Zipline_CreateZipline( "zipline_24", FT_BUILDING_POS_18 + < -320, -256, 1280 >, < 0, -90, 0 > )
    Zipline_SetZiplineAngles( zipline_24, < 0, 58, 0 > )
    Zipline_SetHeightLimit( zipline_24, 660.0 )
    Zipline_SetArmOffset( zipline_24, 230.0 )
    Zipline_BuildInit( zipline_24 )

    ZiplineUtility zipline_25 = Zipline_CreateZipline( "zipline_25", FT_BUILDING_POS_18 + < 320, 256, 1280 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_25, < 0, -120, 0 > )
    Zipline_SetArmOffset( zipline_25, 230.0 )
    Zipline_BuildInit( zipline_25 )

    // Building 19
    ZiplineUtility zipline_26 = Zipline_CreateZipline( "zipline_26", FT_BUILDING_POS_19 + < -192, 256, 1280 >, < 0, 180, 0 > )
    Zipline_SetZiplineAngles( zipline_26, < 0, -40, 0 > )
    Zipline_SetArmOffset( zipline_26, 230.0 )
    Zipline_BuildInit( zipline_26 )

    ZiplineUtility zipline_27 = Zipline_CreateZipline( "zipline_27", FT_BUILDING_POS_19 + < 192, -256, 1280 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_27, < 0, 144, 0 > )
    Zipline_SetArmOffset( zipline_27, 230.0 )
    Zipline_BuildInit( zipline_27 )

    ZiplineUtility zipline_28 = Zipline_CreateZipline( "zipline_28", FT_BUILDING_POS_19 + < -1728, -192, 1280 >, < 0, 180, 0 > )
    Zipline_SetZiplineAngles( zipline_28, < 0, -28, 0 > )
    Zipline_SetArmOffset( zipline_28, 230.0 )
    Zipline_BuildInit( zipline_28 )

    ZiplineUtility zipline_29 = Zipline_CreateZipline( "zipline_29", FT_BUILDING_POS_19 + < -960, 0, 1280 >, < 0, 90, 0 > )
    Zipline_SetZiplineAngles( zipline_29, < 0, -118, 0 > )
    Zipline_SetArmOffset( zipline_29, 230.0 )
    Zipline_BuildInit( zipline_29 )

    ZiplineUtility zipline_30 = Zipline_CreateZipline( "zipline_30", FT_BUILDING_POS_19 + < -1472, -384, 1280 >, < 0, -90, 0 > )
    Zipline_SetZiplineAngles( zipline_30, < 0, 62, 0 > )
    Zipline_SetArmOffset( zipline_30, 230.0 )
    Zipline_BuildInit( zipline_30 )

    // Building 20
    ZiplineUtility zipline_33 = Zipline_CreateZipline( "zipline_33", FLOPPYTOWN_POS_OFFSET + < 960, 1152, 160 >, < 0, 180, 0 >, FLOPPYTOWN_POS_OFFSET + < 960, 2048, 160 >, < 0, 180, 0 > )
    Zipline_SetSkin( zipline_33, 1, 1 )
    Zipline_BuildInit( zipline_33 )

    ZiplineUtility zipline_34 = Zipline_CreateZipline( "zipline_34", FLOPPYTOWN_POS_OFFSET + < 1728, 1152, 160 >, < 0, 0, 0 >, FLOPPYTOWN_POS_OFFSET + < 1728, 2048, 160 >, < 0, 0, 0 > )
    Zipline_SetSkin( zipline_34, 1, 1 )
    Zipline_BuildInit( zipline_34 )

    // Others
    ZiplineUtility zipline_36 = Zipline_CreateZipline( "zipline_36", FLOPPYTOWN_POS_OFFSET + < 1176.6416, 8.03125, 2951.6167 >, < 0, 90, 0 >, FLOPPYTOWN_POS_OFFSET + < 5190.79443, 4697.54688, 2338.87305 >, < 0, -90, 0 > )
    Zipline_SetSkin( zipline_36, 1, 1 )
    Zipline_BuildInit( zipline_36 )
}


void function SkyboxAnimation()
{
    vector pos = < -22156.67, 844.36, -26894.61 >
    vector ang = < 0, 0, 0 >
    wait 10
    while ( true )
    {
        entity Fx = PlayFX( SPACE_DEBRIS_COMET, pos, ang )
        //printt("PlayFX( NOW )")

        wait 8
        Fx.Destroy()
        WaitFrame()
    }
}


void function SetFloppytownAngles()
{
    entity script_mover = CreateScriptMover()
    
    foreach ( entities in FLOPPYTOWN_ENTITIES )
    {
        entities.SetParent( script_mover )

        //if ( entities.GetOrigin() == <2176, 2240, 895.900024>) // For an idea later
        //entities.Destroy()
    }

    script_mover.SetAngles( FLOPPYTOWN_ANG_OFFSET )
}
