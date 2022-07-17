global function Floppytown_MapInit_Generation

void function Floppytown_MapInit_Generation()
{
    printt( "| Floppytown_MapInit_Generation:                The file has been called. |" )
    printt( "|=========================================================================|" )
    printt( "" )

    Map_Generation()
    Props_Generation()
    Dynamic_Build_Generation()
    Zips_Generation()


	if( GetCurrentPlaylistVarBool( "ft_walltrigger_disable", false ) )
    { printt( "wall trigger disable !" ) }
        else
    { CreateWallTriggerAroundTheMap() }

    thread SkyboxAnimation()
	
	SetFloppytownAngles()

}

void function Map_Generation()
{
    Ft_Floor( FT_FLOOR_POS, FT_FLOOR_ANG, 6, 14, 1 )

    North_Wall( FT_NORTH_WALL_POS, FT_NORTH_WALL_ANG )
    South_Wall( FT_SOUTH_WALL_POS, FT_SOUTH_WALL_ANG )
    West_Wall( FT_WEST_WALL_POS, FT_WEST_WALL_ANG )
    East_Wall( FT_EAST_WALL_POS, FT_EAST_WALL_ANG )

    Building_01( FT_BUILDING_POS_01, FT_BUILDING_ANG_01 )
    Building_02( FT_BUILDING_POS_02, FT_BUILDING_ANG_02 )
    Building_03( FT_BUILDING_POS_03, FT_BUILDING_ANG_03 )
    Building_04( FT_BUILDING_POS_04, FT_BUILDING_ANG_04 )
    Building_05( FT_BUILDING_POS_05, FT_BUILDING_ANG_05 )
    Building_06( FT_BUILDING_POS_06, FT_BUILDING_ANG_06 )
    Building_07( FT_BUILDING_POS_07, FT_BUILDING_ANG_07 )
    Building_08( FT_BUILDING_POS_08, FT_BUILDING_ANG_08 )
    Building_09( FT_BUILDING_POS_09, FT_BUILDING_ANG_09 )
    Building_10( FT_BUILDING_POS_10, FT_BUILDING_ANG_10 )
    Building_11( FT_BUILDING_POS_11, FT_BUILDING_ANG_11 )
    Building_12( FT_BUILDING_POS_12, FT_BUILDING_ANG_12 )
    Building_13( FT_BUILDING_POS_13, FT_BUILDING_ANG_13 )
    Building_14( FT_BUILDING_POS_14, FT_BUILDING_ANG_14 )
    Building_15( FT_BUILDING_POS_15, FT_BUILDING_ANG_15 )
    Building_16( FT_BUILDING_POS_16, FT_BUILDING_ANG_16 )
    Building_17( FT_BUILDING_POS_17, FT_BUILDING_ANG_17 )
    Building_18( FT_BUILDING_POS_18, FT_BUILDING_ANG_18 )
    Building_19( FT_BUILDING_POS_19, FT_BUILDING_ANG_19 )
    Building_20( FT_BUILDING_POS_20, FT_BUILDING_ANG_20 )

    cargo_ground_first( FT_CARGO_GROUND_FIRST_POS, FT_CARGO_GROUND_FIRST_ANG )
    cargo_ground_second( FT_CARGO_GROUND_SECOND_POS, FT_CARGO_GROUND_SECOND_ANG )
}

void function Props_Generation()
{
    for ( int i = 0 ; i < 2 ; i++ )
    { CreateFloppytownModel( TRAFFIC_BARREL_01, FLOPPYTOWN_POS_OFFSET + < 26, 2160, 1284 > + < 200 * i, 0, 0 >, < 0, 0, 0 > ) }
    CreateFloppytownModel( CARGO_CONTAINER_LARGE_01, FLOPPYTOWN_POS_OFFSET + < 384, 1012, 1808 >, < 0, 180, 0 > )
    CreateFloppytownModel( UTG_SPIRE, FLOPPYTOWN_POS_OFFSET + < 256, 256, 2320 >, < 0, -45, 0 > )
    CreateFloppytownModel( GONDOLA_CART_01, FLOPPYTOWN_POS_OFFSET + < 896, 80, 2640 >, < 0, 180, 0 > )
    for ( int i = 0 ; i < 2 ; i++ )
    { CreateFloppytownModel( THUNDERDOME_MINI_CEILING, FLOPPYTOWN_POS_OFFSET + < 5060, 318, 1664 > + < 0, 0, 256 * i >, < 0, -45, 0 > ) }
    CreateFloppytownModel( THUNDERDOME_STANDS_AWNING_01, FLOPPYTOWN_POS_OFFSET + < 5168, 700, 1680 >, < 0, 0, 0 > )
    CreateFloppytownModel( CRATE_MD_01, FLOPPYTOWN_POS_OFFSET + < 32, 2988, 1296 >, < 0, 0, 0 > )
    CreateFloppytownModel( UTG_SPIRE, FLOPPYTOWN_POS_OFFSET + < 256, 4608, 1296 >, < 0, 45, 0 > )
    CreateFloppytownModel( DESERTLANDS_SIGN_NEWDAMN_01, FLOPPYTOWN_POS_OFFSET + < 3586, 4832, 0 >, < 0, 90, 0 > )
    for ( int i = 0 ; i < 6 ; i++ )
    {
        CreateFloppytownModel( IMC_TECH_TALLPANEL, FLOPPYTOWN_POS_OFFSET + < 3256, 3992, 320 > + < 0, 0, 256 * i >, < 0, 0, 0 > )
        CreateFloppytownModel( IMC_TECH_TALLPANEL, FLOPPYTOWN_POS_OFFSET + < 2072, 4154, 320 > + < 0, 0, 256 * i >, < 0, 180, 0 > )
    }
    for ( int i = 0 ; i < 2 ; i++ )
    { CreateFloppytownModel( BEACON_SERVER_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5464, 4096, 1792 > + < 0, -64 * i, 0 >, < 0, 0, 0 > ) }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {
            CreateFloppytownModel( BEACON_SERVER_HALF_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5278, 4718, 1792 > + < 128 * i, 0, 128 * j >, < 0, 0, 0 > )
            CreateFloppytownModel( BEACON_SERVER_HALF_STAND_01, FLOPPYTOWN_POS_OFFSET + < 5548, 4576, 1792 > + < 0, -128 * i, 128 * j >, < 0, -90, 0 > )
        }
    }
    MiniBalconyLeft( FLOPPYTOWN_POS_OFFSET + < 5406, 4640, 2176 >, < 0, 0, 0 > )
    CreateFloppytownModel( METAL_BEAM_256, FLOPPYTOWN_POS_OFFSET + < 5302, 4600, 1792 >, < 0, 0, 0 > )
    CreateFloppytownModel( METAL_BEAM_128, FLOPPYTOWN_POS_OFFSET + < 5302, 4600, 2048 >, < 0, 0, 0 > )
    CreateFloppytownModel( RAILING_CORNER_OUT, FLOPPYTOWN_POS_OFFSET + < 5522, 4686, 2409 >, < 0, 180, 0 > )
    for ( int i = 0 ; i < 3 ; i++ )
    { CreateFloppytownModel( RAILING_128, FLOPPYTOWN_POS_OFFSET + < 5394, 4686, 2409 > + < -128 * i, 0, 0 >, < 0, -90, 0 > ) }
    for ( int i = 0 ; i < 6 ; i++ )
    { CreateFloppytownModel( RAILING_128, FLOPPYTOWN_POS_OFFSET + < 5522, 4558, 2409 > + < 0, -128 * i, 0 >, < 0, 180, 0 > ) }
    CreateFloppytownModel( ELECTRICAL_POLE_01, FLOPPYTOWN_POS_OFFSET + < 5504, 4335, 1792 >, < 0, 180, 0 > )
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateFloppytownModel( COLUMN_01_STACK, FLOPPYTOWN_POS_OFFSET + < 4992, 768, 0 > + < 0, 152 * i, 168 * j >, < 0, 0, 0 > )
        }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateFloppytownModel( COLUMN_01_STACK, FLOPPYTOWN_POS_OFFSET + < 5248, 1712, 0 > + < 0, -152 * i, 168 * j >, < 0, 0, 0 > )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        { CreateFloppytownModel( COLUMN_01, FLOPPYTOWN_POS_OFFSET + < 5056, 752, 0 > + < 56 * i, 0, 150 * j >, < 0, 0, 0 > ) }
    }
    CreateFloppytownModel( TRAIN_STATION_SIGN_02, FLOPPYTOWN_POS_OFFSET +  <0, 2967.5, 1792 >, < 0, 0, 0 > ).SetModelScale( 6 )
    CreateFloppytownModel( TRAIN_STATION_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 1536, 520, 1536 >, < 0, 90, 0 > ).SetModelScale( 6 )
    CreateFloppytownModel( BEACON_FENCE_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 2648, 3824-12, 1408 >, < 0, 0, 0 > ).SetModelScale( 3 )
    CreateFloppytownModel( NUMBER_LIT_1, FLOPPYTOWN_POS_OFFSET + < 3822, 3200, 1024 >, < 0, 180, 0 > ).SetModelScale( 40 )
    CreateFloppytownModel( NUMBER_LIT_2, FLOPPYTOWN_POS_OFFSET + < 2368, 2450, 1024 >, < 0, 90, 0 > ).SetModelScale( 40 )
    CreateFloppytownModel( NUMBER_LIT_3, FLOPPYTOWN_POS_OFFSET + < 2560, 1362, 1024 >, < 0, 90, 0 > ).SetModelScale( 40 )
    CreateFloppytownModel( GONDOLA_PLATFORM_SIGN, FLOPPYTOWN_POS_OFFSET + < 432, 4864, 2096 >, < 0, 180, 0 > ).SetModelScale( 3 )
    CreateFloppytownModel( DESERTLANDS_SIGN_01, FLOPPYTOWN_POS_OFFSET + < 5100, 3392, 1288 >, < 0, 90, 0 > ).SetModelScale( 6 )
    CreateFloppytownModel( RELIC_WARNING_01, FLOPPYTOWN_POS_OFFSET + < 5110, 2560, 2048 >, < 0, 90, 0 > ).SetModelScale( 8 )
    CreateFloppytownModel( SERVICE_SHAFT_01, FLOPPYTOWN_POS_OFFSET + < 4312, 0, 2340 >, < 0, 90, 0 > ).SetModelScale( 8 )
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
			LittleBridge( FT_LITTLE_BRIDGE_POS, FT_LITTLE_BRIDGE_ANG )
		break
	}

	// rng_1
	switch ( rng_1 )
	{
		case "none":
			break
		case "left":
			BalconyLeft( FT_BALCONY_LEFT_POS, FT_BALCONY_LEFT_ANG )
			break
		case "right":
			BalconyRight( FT_BALCONY_RIGHT_POS, FT_BALCONY_RIGHT_ANG )
			break
		case "both":
			BalconyLeft( FT_BALCONY_LEFT_POS, FT_BALCONY_LEFT_ANG )
    	    BalconyRight( FT_BALCONY_RIGHT_POS, FT_BALCONY_RIGHT_ANG )
		break
	}
    // rng_2
    switch ( rng_2 )
    {
        case "hide":
            break
        case "visible":
            cargo_ground_third( FT_CARGO_GROUND_THIRD_POS, FT_CARGO_GROUND_THIRD_ANG )
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
        printt( "|============================================================|" ) }
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

	CreateFloppytownModel( ZIP_ARM, FT_BUILDING_POS_01 + < 64, -550, 832 >,   < 0, 180, 0 > )
	CreateFloppytownModel( ZIP_ARM, FT_BUILDING_POS_01 + < -448, -934, 176 >,   < 0, 140, 0 > )
	CreateFloppytownModel( ZIP_ARM, FT_BUILDING_POS_01 + < 576, -934, 176 >,   < 0, -140, 0 > )
    CreateFloppytownModel( ZIP_ARM, FT_BUILDING_POS_02 + < 896, 0, 148 >,   < 0, -90, 0 > )
    CreateFloppytownModel( ZIP_ARM, FT_BUILDING_POS_07 + < 1152, 384, 2176 >,   < 0, -90, 0 > )
    for ( int i = 0 ; i < 2 ; i++)
    {
        CreateFloppytownModel( ZIP_ARM, FT_BUILDING_POS_20 + < 416, -460, 168 > + < 0, 896 * i, 0 >,   < 0, -90, 0 > )
        CreateFloppytownModel( ZIP_ARM, FT_BUILDING_POS_20 + < -416, 460, 168 > + < 0, -896 * i, 0 >,   < 0, 90, 0 > )
    }
}

void function SetFloppytownAngles()
{
	entity script_mover = CreateScriptMover()
    
    foreach ( entities in FLOPPYTOWN_ENTITIES )
    { entities.SetParent( script_mover ) }

    script_mover.SetOrigin( FLOPPYTOWN_POS_OFFSET )
    script_mover.SetAngles( FLOPPYTOWN_ANG_OFFSET )

    //thread Yes( script_mover )
}

void function Yes( entity script_mover )
{
    int i = 0
    int j = 0
    while( true )
    {
        script_mover.SetOrigin( FLOPPYTOWN_POS_OFFSET + < 0 + j, 0, 0 > )
        script_mover.SetAngles( < 0 + i, 0 + i, 0 > )
        j = j+20
        if ( i == 360 )
        {
            i = i-359
        }
    WaitFrame() }
}

void function SkyboxAnimation()
{
    vector pos = < -22156.67, 844.36, -26894.61 >
    vector ang = < 0, 0, 0 >
    wait 10
    while ( true )
    {
        entity Fx = PlayFX( SPACE_DEBRIS_COMET, pos, ang )
        printt("PlayFX( NOW )")

        wait 6
        Fx.Destroy()
        WaitFrame()
    }
}
