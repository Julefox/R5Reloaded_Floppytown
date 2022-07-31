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
    Zips_Generation()

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
    Ft_Floor( FT_FLOOR_POS, FT_FLOOR_ANG, 6, 1 )

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
}


void function Props_Generation()
{
    for ( int i = 0 ; i < 2 ; i++ )
    { CreateSingleFloppytownModel( INDUSTRIAL_TRAFFIC_BARREL_01, FLOPPYTOWN_POS_OFFSET + < 26, 2160, 1284 > + < 200 * i, 0, 0 >, < 0, 0, 0 > ) }
    CreateSingleFloppytownModel( DESERTLANDS_CARGO_CONTAINER_LARGE_01, FLOPPYTOWN_POS_OFFSET + < 384, 1012, 1808 >, < 0, 180, 0 > )
    CreateSingleFloppytownModel( INDUSTRIAL_UTG_SPIRE, FLOPPYTOWN_POS_OFFSET + < 256, 256, 2320 >, < 0, -45, 0 > )
    CreateSingleFloppytownModel( DESERTLANDS_GONDOLA_CART_01, FLOPPYTOWN_POS_OFFSET + < 896, 80, 2640 >, < 0, 180, 0 > )
    for ( int i = 0 ; i < 2 ; i++ )
    { CreateSingleFloppytownModel( THUNDERDOME_CAGE_CEILING_256x128_06, FLOPPYTOWN_POS_OFFSET + < 5060, 318, 1664 > + < 0, 0, 256 * i >, < 0, -45, 0 > ) }
    CreateSingleFloppytownModel( THUNDERDOME_STANDS_AWNING_01, FLOPPYTOWN_POS_OFFSET + < 5168, 700, 1680 >, < 0, 0, 0 > )
    CreateSingleFloppytownModel( COLONY_CRATE_MD_80x64x72_01, FLOPPYTOWN_POS_OFFSET + < 32, 2988, 1296 >, < 0, 0, 0 > )
    CreateSingleFloppytownModel( INDUSTRIAL_UTG_SPIRE, FLOPPYTOWN_POS_OFFSET + < 256, 4608, 1296 >, < 0, 45, 0 > )
    CreateSingleFloppytownModel( SIGNS_CITY_NEWDAMN_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 3586, 4832, 0 >, < 0, 90, 0 > )
    for ( int i = 0 ; i < 6 ; i++ )
    {
        CreateSingleFloppytownModel( IMC_BASE_TALLPANEL_48_02, FLOPPYTOWN_POS_OFFSET + < 3256, 3992, 320 > + < 0, 0, 256 * i >, < 0, 0, 0 > )
        CreateSingleFloppytownModel( IMC_BASE_TALLPANEL_48_02, FLOPPYTOWN_POS_OFFSET + < 2072, 4154, 320 > + < 0, 0, 256 * i >, < 0, 180, 0 > )
    }
    for ( int i = 0 ; i < 2 ; i++ )
    { CreateSingleFloppytownModel( BEACON_SERVER_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5464, 4096, 1792 > + < 0, -64 * i, 0 >, < 0, 0, 0 > ) }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {
            CreateSingleFloppytownModel( BEACON_SERVER_HALF_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5278, 4718, 1792 > + < 128 * i, 0, 128 * j >, < 0, 0, 0 > )
            CreateSingleFloppytownModel( BEACON_SERVER_HALF_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5548, 4576, 1792 > + < 0, -128 * i, 128 * j >, < 0, -90, 0 > )
        }
    }
    MiniBalconyLeft( FLOPPYTOWN_POS_OFFSET + < 5406, 4640, 2176 >, < 0, 0, 0 >, "01" )
    CreateSingleFloppytownModel( BEACON_KODAI_METAL_BEAM_256_02, FLOPPYTOWN_POS_OFFSET + < 5302, 4600, 1792 >, < 0, 0, 0 > )
    CreateSingleFloppytownModel( BEACON_KODAI_METAL_BEAM_128_02, FLOPPYTOWN_POS_OFFSET + < 5302, 4600, 2048 >, < 0, 0, 0 > )
    CreateSingleFloppytownModel( OLA_RAILING_CORNER_OUT_01, FLOPPYTOWN_POS_OFFSET + < 5522, 4686, 2409 >, < 0, 180, 0 > )
    for ( int i = 0 ; i < 3 ; i++ )
    { CreateSingleFloppytownModel( OLA_RAILING_128_01, FLOPPYTOWN_POS_OFFSET + < 5394, 4686, 2409 > + < -128 * i, 0, 0 >, < 0, -90, 0 > ) }
    for ( int i = 0 ; i < 6 ; i++ )
    { CreateSingleFloppytownModel( OLA_RAILING_128_01, FLOPPYTOWN_POS_OFFSET + < 5522, 4558, 2409 > + < 0, -128 * i, 0 >, < 0, 180, 0 > ) }
    CreateSingleFloppytownModel( EDEN_ELECTRICAL_POLE_01, FLOPPYTOWN_POS_OFFSET + < 5504, 4335, 1792 >, < 0, 180, 0 > )
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_BLDG_COLUMN_STACK_01, FLOPPYTOWN_POS_OFFSET + < 4992, 768, 0 > + < 0, 152 * i, 168 * j >, < 0, 0, 0 > )
        }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateSingleFloppytownModel( DESERTLANDS_BLDG_COLUMN_STACK_01, FLOPPYTOWN_POS_OFFSET + < 5248, 1712, 0 > + < 0, -152 * i, 168 * j >, < 0, 0, 0 > )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        { CreateSingleFloppytownModel( DESERTLANDS_BLDG_COLUMN_01, FLOPPYTOWN_POS_OFFSET + < 5056, 752, 0 > + < 56 * i, 0, 150 * j >, < 0, 0, 0 > ) }
    }
    CreateSingleFloppytownModel( DESERTLANDS_TS_SIGN_02, FLOPPYTOWN_POS_OFFSET +  <0, 2967.5, 1792 >, < 0, 0, 0 > ).SetModelScale( 6 )
    CreateSingleFloppytownModel( DESERTLANDS_TS_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 1536, 520, 1536 >, < 0, 90, 0 > ).SetModelScale( 6 )
    CreateSingleFloppytownModel( BEACON_FENCE_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 2648, 3824-12, 1408 >, < 0, 0, 0 > ).SetModelScale( 3 )
    CreateSingleFloppytownModel( SIGNS_NUM_LIT_1, FLOPPYTOWN_POS_OFFSET + < 3822, 3200, 1024 >, < 0, 180, 0 > ).SetModelScale( 40 )
    CreateSingleFloppytownModel( SIGNS_NUM_LIT_2, FLOPPYTOWN_POS_OFFSET + < 2368, 2450, 1024 >, < 0, 90, 0 > ).SetModelScale( 40 )
    CreateSingleFloppytownModel( SIGNS_NUM_LIT_3, FLOPPYTOWN_POS_OFFSET + < 2560, 1362, 1024 >, < 0, 90, 0 > ).SetModelScale( 40 )
    CreateSingleFloppytownModel( DESERTLANDS_GONDOLA_PLATFORM_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 2432, 4864, 2096 >, < 0, 180, 0 > ).SetModelScale( 3 )
    CreateSingleFloppytownModel( DESERTLANDS_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 5100, 3392, 1288 >, < 0, 90, 0 > ).SetModelScale( 6 )
    CreateSingleFloppytownModel( SIGNS_RELIC_WARNING , FLOPPYTOWN_POS_OFFSET + < 5110, 2560, 2048 >, < 0, 90, 0 > ).SetModelScale( 8 )
    CreateSingleFloppytownModel( SIGNS_RELIC_WARNING , FLOPPYTOWN_POS_OFFSET + < 4992, 2314, 128 >, < 0, 0, 0 > ).SetModelScale( 4 )
    CreateSingleFloppytownModel( SIGNS_RELIC_WARNING , FLOPPYTOWN_POS_OFFSET + < 5100, 3648-64, 128+128 >, < 0, 90, 0 > ).SetModelScale( 6 )
    CreateSingleFloppytownModel( SIGNS_SERVICE_SHAFT_01, FLOPPYTOWN_POS_OFFSET + < 4312, 0, 2340 >, < 0, 90, 0 > ).SetModelScale( 8 )
    CreateSingleFloppytownModel( FIRSTGEN_PIPE_256_CLOTH_01, FLOPPYTOWN_POS_OFFSET + < 5544, 512, 2300 >, < 0, -90, 0 > )
    CreateSingleFloppytownModel( FIRSTGEN_PIPE_CURVE_CLOTH_01, FLOPPYTOWN_POS_OFFSET + < 5544, 512, 2300 >, < 0, 90, 0 > )
    CreateSingleFloppytownModel( FIRSTGEN_PIPE_CURVE_CLOTH_01, FLOPPYTOWN_POS_OFFSET + < 5544, 256, 2300 >, < -180, 90, 0 > )
    for ( int i = 0 ; i < 4 ; i++ )
    { CreateSingleFloppytownModel( FIRSTGEN_PIPE_256_CLOTH_01, FLOPPYTOWN_POS_OFFSET + < 1028, 4896, 200 > + < 256 * i, 0, 0 >, < 0, 0, 0 > ) }
    CreateSingleFloppytownModel( IMC_BASE_GENERATOR_02, FLOPPYTOWN_POS_OFFSET + < 1344, 1600, 256 >, < 0, 0, 0 > )
    for ( int i = 0 ; i < 4 ; i++ )
    { CreateSingleFloppytownModel( IMC_BASE_GENERATOR_01, FLOPPYTOWN_POS_OFFSET + < 5184, 2368, 2304 > + < 0, 128 * i, 0 >, < 0, 0, 0 > ) }
}


void function Dynamic_Build_Generation()
{
    array<string> rng_0_choice = [ "hide", "visible" ]
    string rng_0 = rng_0_choice.getrandom()
    array<string> rng_1_choice = [ "none", "none", "left", "left", "right", "right", "both", "both", "both", "both" ]
    string rng_1 = rng_1_choice.getrandom()
    array<string> rng_2_choice = [ "hide", "hide", "visible" ]
    string rng_2 = rng_2_choice.getrandom()
    array<string> rng_3_choice = []
    if(rng_0 == "hide") {
        rng_3_choice = [ "1", "2", "3", "5" ]
    } else {
        rng_3_choice = [ "1", "2", "3", "4", "5" ]
    }
    string rng_3 = rng_3_choice.getrandom()

    if ( GetCurrentPlaylistVarBool( "ft_rng_is_not_rng", false ) )
    {
        printt( "|============================================================|" )
        printt( "|>>>>>>>>>>>>>>>>>>>  RNG State: DISABLE  <<<<<<<<<<<<<<<<<<<|" )

        rng_0 = "visible"
        rng_1 = "both"
        rng_2 = "visible"
        rng_3 = "inDev"
    }

    // rng_0
    switch ( rng_0 )
    {
        case "hide":
            break
        case "visible":
            LittleBridge( FT_LITTLE_BRIDGE_POS, FT_LITTLE_BRIDGE_ANG, "01" )
        break
    }

    // rng_1
    switch ( rng_1 )
    {
        case "none":
            break
        case "left":
            BalconyLeft( FT_BALCONY_LEFT_POS, FT_BALCONY_LEFT_ANG, "01" )
            break
        case "right":
            BalconyRight( FT_BALCONY_RIGHT_POS, FT_BALCONY_RIGHT_ANG, "01" )
            break
        case "both":
            BalconyLeft( FT_BALCONY_LEFT_POS, FT_BALCONY_LEFT_ANG, "01" )
            BalconyRight( FT_BALCONY_RIGHT_POS, FT_BALCONY_RIGHT_ANG, "01" )
        break
    }
    // rng_2
    switch ( rng_2 )
    {
        case "hide":
            break
        case "visible":
            cargo_ground( FT_CARGO_GROUND_THIRD_POS, FT_CARGO_GROUND_THIRD_ANG, "third", "01" )
        break
    }
    // rng_3
    switch( rng_3 )
    {
        case "inDev":
            spawn_nessy(FT_NESSY_1_POS, FT_NESSY_1_ANG)
            spawn_nessy(FT_NESSY_2_POS, FT_NESSY_2_ANG)
            spawn_nessy(FT_NESSY_3_POS, FT_NESSY_3_ANG)
            spawn_nessy(FT_NESSY_4_POS, FT_NESSY_4_ANG)
            spawn_nessy(FT_NESSY_5_POS, FT_NESSY_5_ANG)
            break
        case "none":
            break
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
    }

    if ( GetCurrentPlaylistVarBool( "ft_dev_enable", false ) ) { // map editing, do not activate in normal use
        printt( "|============================================================|" )
        printt( "|Dynamic_Build_Generation RNG: Little Bridge       = " + rng_0 )
        printt( "|Dynamic_Build_Generation RNG: Balcony             = " + rng_1 )
        printt( "|Dynamic_Build_Generation RNG: Cargo on the ground = " + rng_2 )
        printt( "|Dynamic_Build_Generation RNG: Nessy Location      = " + rng_3 )
        printt( "|============================================================|" )
        printt( "" ) }
}


void function Scripted_Model()
{
    CreateSingleFloppytownModel( LEVELS_TERRAIN_RADAR_SEC_01_DISH_02, FT_SCRIPTED_RADAR_POS, FT_SCRIPTED_RADAR_ANG )

    entity script_mover = CreateFloppytownScriptMover( FT_SCRIPTED_RADAR_POS + < 0, 0, 1600 >, FT_SCRIPTED_RADAR_ANG, "scripted_radar", true )
    entity radar = CreateSingleFloppytownModel( LEVELS_TERRAIN_RADAR_DISH_01, script_mover.GetOrigin(), FT_SCRIPTED_RADAR_ANG )

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
    CreateFloppytownZiplineModel( FT_BUILDING_POS_01 + < 600, 0, 1792.1 >, < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_01 + < -600, 256, 1792.1 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_02 + < 640, 256, 1280 >, < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_02 + < 256, -512, 768 >, < 0, 180, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_04 + < 128, 256, 512 >, < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_05 + < 0, 320, 1280 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_06 + < 192, 384, 1792 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_07 + < 1920, 64, 2048 >, < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_07 + < 0, 640, 2304 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_08 + < 256, 256, 1664 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_09 + < -256, 384, 2048 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_10 + < -384, 128, 1280 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_12 + < -128, 1024, 2304 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_12 + < -384, 256, 2304 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_12 + < -640, 0, 1280 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_12 + < -128, -128, 2304 >, < 0, 180, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_13 + < -384, 1408, 1792 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_14 + < -512, 0, 1024 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_14 + < 128, -512, 1024 >, < 0, 180, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_16 + < -384, -256, 1280 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_16 + < 384, -256, 1280 >, < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_16 + < 0, 384, 1280 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_18 + < -320, -256, 1280 >, < 0, 180, 0 > ) //
    CreateFloppytownZiplineModel( FT_BUILDING_POS_18 + < 320, 256, 1280 >, < 0, 0, 0 > ) //
    CreateFloppytownZiplineModel( FT_BUILDING_POS_19 + < -192, 256, 1280 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_19 + < 192, -256, 1280 >, < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_19 + < -1728, -192, 1280 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_19 + < -960, 0, 1280 >, < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_19 + < -1472, -384, 1280 >, < 0, 180, 0 > )

    CreateSingleFloppytownModel( INDUSTRIAL_ZIPLINE_ARM, FT_BUILDING_POS_01 + < 64, -550, 832 >,   < 0, 180, 0 > )
    CreateSingleFloppytownModel( INDUSTRIAL_ZIPLINE_ARM, FT_BUILDING_POS_01 + < -448, -934, 176 >,   < 0, 140, 0 > )
    CreateSingleFloppytownModel( INDUSTRIAL_ZIPLINE_ARM, FT_BUILDING_POS_01 + < 576, -934, 176 >,   < 0, -140, 0 > )
    CreateSingleFloppytownModel( INDUSTRIAL_ZIPLINE_ARM, FT_BUILDING_POS_02 + < 896, 0, 148 >,   < 0, -90, 0 > )
    CreateSingleFloppytownModel( INDUSTRIAL_ZIPLINE_ARM, FT_BUILDING_POS_07 + < 1152, 384, 2176 >,   < 0, -90, 0 > )
    for ( int i = 0 ; i < 2 ; i++)
    {
        CreateSingleFloppytownModel( INDUSTRIAL_ZIPLINE_ARM, FT_BUILDING_POS_20 + < 416, -460, 168 > + < 0, 896 * i, 0 >,   < 0, -90, 0 > )
        CreateSingleFloppytownModel( INDUSTRIAL_ZIPLINE_ARM, FT_BUILDING_POS_20 + < -416, 460, 168 > + < 0, -896 * i, 0 >,   < 0, 90, 0 > )
    }
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

    script_mover.SetOrigin( FLOPPYTOWN_POS_OFFSET )
    script_mover.SetAngles( FLOPPYTOWN_ANG_OFFSET )
}
/* //test #if CLIENT
void function Sewers_ShowRadioInterfaceHUD()
{
	array<var> ruis = []
	array<var> ruiTextArray
	entity player = GetLocalViewPlayer()

	ToggleHudIcons( false )

	// HUD overlay
	var borderRui = CreateCockpitRui( $"ui/helmet_border.rpak", 100 )
	ruis.append( borderRui )

	wait 1.5

	// LINE 1
	var titleRui = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 0 )
	RuiSetInt( titleRui, "maxLines", 30 )
	RuiSetInt( titleRui, "lineNum", 0 )
	RuiSetString( titleRui, "msgText", Localize( "#SEWERS_RADIO_HUD_TITLE", "" ) )
	RuiSetFloat( titleRui, "msgFontSize", 30.0 )
	RuiSetFloat( titleRui, "msgAlpha", textAlpha )
	RuiSetFloat3( titleRui, "msgColor", textColor )
	RuiSetFloat2( titleRui, "msgPos", < 0.75, 0.1, 0.0 > )
	ruis.append( titleRui )

	RuiSetString( titleRui, "msgText", "#SEWERS_RADIO_HUD_TITLE" )
	Sewers_RuiFlickerIn( titleRui )

	wait 1.5

	// LINE 2
	var line2Rui = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 0 )
	RuiSetInt( line2Rui, "maxLines", 30 )
	RuiSetInt( line2Rui, "lineNum", 2 )
	RuiSetString( line2Rui, "msgText", Localize( "#SEWERS_RADIO_HUD_DESC1a", "" ) )
	RuiSetFloat( line2Rui, "msgFontSize", 28.0 )
	RuiSetFloat( line2Rui, "msgAlpha", textAlpha )
	RuiSetFloat3( line2Rui, "msgColor", textColor )
	RuiSetFloat2( line2Rui, "msgPos", < 0.75, 0.1, 0.0 > )
	ruis.append( line2Rui )

	Sewers_BlinkRui( line2Rui, "#SEWERS_RADIO_HUD_DESC1a", 8 )
	RuiSetString( line2Rui, "msgText", "#SEWERS_RADIO_HUD_DESC1b" )

	wait 2.0

	// LINE 3
	var line3Rui = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 0 )
	RuiSetInt( line3Rui, "maxLines", 30 )
	RuiSetInt( line3Rui, "lineNum", 3 )
	RuiSetString( line3Rui, "msgText", Localize( "#SEWERS_RADIO_HUD_DESC2a", "" ) )
	RuiSetFloat( line3Rui, "msgFontSize", 28.0 )
	RuiSetFloat( line3Rui, "msgAlpha", textAlpha )
	RuiSetFloat3( line3Rui, "msgColor", textColor )
	RuiSetFloat2( line3Rui, "msgPos", < 0.75, 0.1, 0.0 > )
	ruis.append( line3Rui )

	thread AnimateDots( line3Rui, "#SEWERS_RADIO_HUD_DESC2a", "msgText", 2.0, "#SEWERS_RADIO_HUD_DESC2b" )

	// HEX DUMP
	hexSetStruct hexSet
	hexSet.lineNum = 0
	hexSet.msgFontSize = 18
	hexSet.msgColor = <0.1, 0.23, 0.4>
	hexSet.msgAlpha = 0.75

	for( int i=0; i<10; i++ )
	{
		var rui = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 200 )
		RuiSetInt( rui, "maxLines", 30 )
		RuiSetInt( rui, "lineNum", i )
		RuiSetString( rui, "msgText", "#BLANK_TEXT" )
		RuiSetFloat( rui, "msgFontSize", 28.0 )
		RuiSetFloat( rui, "msgAlpha", textAlpha )
		RuiSetFloat3( rui, "msgColor", textColor )
		RuiSetFloat2( rui, "msgPos", < 0.75, 0.1, 0.0 >  )
		ruiTextArray.append(rui)
	}
	ruis.extend( ruiTextArray )

	wait 0.5

	// top right
	hexSet.maxLines = 12
	hexSet.colums = 6
	hexSet.alignment = 1
	hexSet.msgPos = < 0.94, 0.25, 0.0 >
	HexDump( clone hexSet, 2.0 )

	//wait 2

	StopAnimateDots()

	wait 1

	//wait 0.2
	thread Sewers_ToxicSludgeHUD_FlickerOut( titleRui )
	//wait 0.2
	thread Sewers_ToxicSludgeHUD_FlickerOut( line2Rui )
	//wait 0.2
	thread Sewers_ToxicSludgeHUD_FlickerOut( line3Rui )

	wait 0.5

	// LINE 4
	var line4Rui = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 0 )
	RuiSetInt( line4Rui, "maxLines", 30 )
	RuiSetInt( line4Rui, "lineNum", 4 )
	RuiSetString( line4Rui, "msgText", Localize( "#SEWERS_RADIO_HUD_DESC3", "" ) )
	RuiSetFloat( line4Rui, "msgFontSize", 28.0 )
	RuiSetFloat( line4Rui, "msgAlpha", textAlpha )
	RuiSetFloat3( line4Rui, "msgColor", <0.96, 0.0, 0.0> )
	RuiSetFloat2( line4Rui, "msgPos", < 0.75, 0.1, 0.0 > )
	ruis.append( line4Rui )

	Sewers_BlinkRui( line4Rui, "#SEWERS_RADIO_HUD_DESC3", 3, "", 0.4 )
	wait 0.5
	Sewers_ToxicSludgeHUD_FlickerOut( line4Rui )

	wait 1

	foreach( rui in ruis )
	{
		RuiDestroyIfAlive( rui )
	}

	wait 1

	ToggleHudIcons( true )
} */
