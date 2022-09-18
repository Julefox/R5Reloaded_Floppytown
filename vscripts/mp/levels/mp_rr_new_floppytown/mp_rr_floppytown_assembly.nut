untyped

globalize_all_functions


void function Floppytown_Floor ( vector pos, vector ang )
{   CreateMultipleModel( DESERTLANDS_BLDG_PLATFORM_01, pos, < 0, 180, 0 >, HARDCODED_FLOOR_WIDTH, HARDCODED_FLOOR_DEPTH, 0, [], true ) }

void function Developper_Floor ()
{
    array< entity > globals = [] ; vector origin = DEV_PLATFORM_POS ; vector ang = < 0, 0, 0 >

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Builder_Platform" )

    array< entity > platform = CreateMultipleModel( DESERTLANDS_BLDG_PLATFORM_01, origin, < 0, 180, 0 >, 2, 5, 0, [], true )

    // Arrays
    globals.extend( platform )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_01 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 01" )

    array< entity > AB01_0  = CreateMultipleModel( DESERTLANDS_BLDG_PLATFORM_02, origin + < 0, 0, 1792 >, < 0, 180, 0 >, 2, 3, 0, [], true )
    array< entity > AB01_1  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -584.22, 47.58, 128 >, < 0, 90, 0 >, 9, 0, 7, [], true )
    array< entity > AB01_2  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 584.22, -158.74, 128 >, < 0, -90, 0 >, 12, 0, 7, [ 64, 65, 66, 67, 68, 69, 71, 72, 73, 74, 75, 76, 78, 79, 80, 81, 82, 83 ], true )
    array< entity > AB01_3  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, -524.7242, 128 >, < 0, 180, 0 >, 9, 0, 7, [], true )
    array< entity > AB01_4  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -560.33, -461.03084, 1663.99878 >, < 180, -90, 0 >, 0, 0, 7, [], false )
    array< entity > AB01_5  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -433.051484, -726.972656, 128 >, < 0, 90, 0 >, 3, 0, 0, [], true )
    array< entity > AB01_6 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 74.1684, -910.2042, 128 >, < 0, 180, 0 >, 8, 0, 0, [], true )
    array< entity > AB01_7 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 74.1684, -724.989258, 256.2 >, < 0, 180, 0 >, 2, 0, 0, [], true )

    array< entity > AB01_8 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 74.1684, -657.788958, 200.7653 >, < 0, 0, 0 >, 2, 0, 0, [], true, < 512, 0, 0 > )
    foreach ( ents in AB01_8 ) ents.SetModelScale( 2 )

    // balcony
    array< entity > AB01_9 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 74.1684, -577.789108, 639.999512 >, < 0, 0, 0 >, 2, 0, 0, [], true, < 628, 0, 0 > )
    if ( IsValid( AB01_9[0] ) ) // Left
    {
        vector leftBalc = AB01_9[0].GetOrigin()
        entity lb_0 = CreateModel( OLA_RAILING_CORNER_IN_01, leftBalc + < -128, -128, 7 >, < 0, -90, 0 > )
        entity lb_1 = CreateModel( OLA_RAILING_64_01, leftBalc + < -128, -32, 7 >, < 0, 180, 0 > )
        entity lb_2 = CreateModel( OLA_RAILING_32_01, leftBalc + < -128, 16, 7 >, < 0, 180, 0 > )
        entity lb_3 = CreateModel( OLA_RAILING_128_01, leftBalc + < 0, -128, 7 >, < 0, -90, 0 > )
        entity lb_4 = CreateModel( OLA_RAILING_64_01, leftBalc + < 96, -128, 7 >, < 0, -90, 0 > )
        globals.append( lb_0 ) ; globals.append( lb_1 ) ; globals.append( lb_2 ) ; globals.append( lb_3 ) ; globals.append( lb_4 )
    }

    if ( IsValid( AB01_9[1] ) ) // Right
    {
        vector rightBalc = AB01_9[1].GetOrigin()
        entity rb_0 = CreateModel( OLA_RAILING_CORNER_IN_01, rightBalc + < 128, -128, 7 >, < 0, 0, 0 > )
        entity rb_1 = CreateModel( OLA_RAILING_64_01, rightBalc + < 128, -32, 7 >, < 0, 0, 0 > )
        entity rb_2 = CreateModel( OLA_RAILING_32_01, rightBalc + < 128, 16, 7 >, < 0, 0, 0 > )
        entity rb_3 = CreateModel( OLA_RAILING_128_01, rightBalc + < 0, -128, 7 >, < 0, -90, 0 > )
        entity rb_4 = CreateModel( OLA_RAILING_64_01, rightBalc + < -96, -128, 7 >, < 0, -90, 0 > )
        globals.append( rb_0 ) ; globals.append( rb_1 ) ; globals.append( rb_2 ) ; globals.append( rb_3 ) ; globals.append( rb_4 )
    }

    array< entity > AB01_10 = CreateMultipleModel( IMC_BASE_TALLPANEL_48_02,  origin + < -584.267578, -206.727539, 298.666423 >, < 0, 180, 0 >, 0, 0, 6, [], true, < 0, 0, 256 > )
    array< entity > AB01_11 = CreateMultipleModel( IMC_BASE_TALLPANEL_48_02,  origin + < 584.228516, -349.491699, 298.666423 >, < 0, 0, 0 >, 0, 0, 6, [], true, < 0, 0, 256 > )

    entity sign = CreateModel( BEACON_FENCE_SIGN_01, origin + < 0, -540.775879, 1407.99902 >, < 0, 0, 0 > )
    sign.SetModelScale( 3 )

    // Arrays
    globals.extend( AB01_0 ) ; globals.extend( AB01_1 ) ; globals.extend( AB01_2 ) ; globals.extend( AB01_3 ) ; globals.extend( AB01_4 )
    globals.extend( AB01_5 ) ; globals.extend( AB01_6 ) ; globals.extend( AB01_7 ) ; globals.extend( AB01_8 ) ; globals.extend( AB01_9 )
    globals.extend( AB01_10 ); globals.extend( AB01_11 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( sign )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_02 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 02" )

    array< entity > AB02_0  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 256, 0, 0 >, < 0, 90, 0 >, 4, 0, 5, [ 0, 1, 2, 3, 4, 8, 9, 10, 15 ], true )
    array< entity > AB02_1  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -384, -512, -0.2 >, < 0, 0, 0 >, 2, 0, 3, [], false )
    array< entity > AB02_2  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 128, -256, -0.2 >, < 0, 0, 0 >, 1, 0, 3, [], false )
    array< entity > AB02_3  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 0, -384, 0 >, < 0, 90, 0 >, 1, 0, 3, [], false )
    array< entity > AB02_4  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < -128, -256, 753.275 >, < 0, 0, 0 >, 3, 2, 0, [ 4 ], true )
    array< entity > AB02_5  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < -128, 256, 1266.125 >, < 0, 0, 0 >, 3, 2, 0, [], true )
    array< entity > AB02_6  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -128, 0, 769.255 >, < 0, 0, 0 >, 3, 0, 2, [], true )
    array< entity > AB02_7  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 512, 256, -96 >, < 0, 90, 0 >, 2, 0, 0, [], true )
    array< entity > AB02_8  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 384, 256, -96.2 >, < 0, 0, 0 >, 0, 2, 0, [], true, < 0, 512, 0 > )

    entity antenna = CreateModel( COLONY_ANTENNA_05, origin + < -264, 262, 1282.125 >, < 0, -135, 0 > )

    // little roof part
    entity mover_roof = CreateScriptMover( origin + < 264, 256, 250 >, < 0, 0, 0 > ) ; vector mover_roofPos = mover_roof.GetOrigin()
    array< entity > AB02_9  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, mover_roofPos, < 0, 0, 0 >, 2, 2, 0, [], true )
    array< entity > AB02_10 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, mover_roofPos + < 0, 258, -50 >, < 90, 0, 90 >, 0, 2, 0, [], true )
    array< entity > AB02_11 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, mover_roofPos + < 0, -242, -50 >, < 90, 0, 90 >, 0, 2, 0, [], true )
    foreach ( ent in AB02_9  ) ent.SetParent( mover_roof ) ; foreach ( ent in AB02_10 ) ent.SetParent( mover_roof ) ; foreach ( ent in AB02_11 ) ent.SetParent( mover_roof )
    mover_roof.SetAngles( < 24, 0, 0 > ) ; ClearChildren( mover_roof, true )
    if ( IsValid( mover_roof ) ) mover_roof.Destroy()
    //

    // Arrays
    globals.extend( AB02_0 ) ; globals.extend( AB02_1 ) ; globals.extend( AB02_2 ) ; globals.extend( AB02_3 ) ; globals.extend( AB02_4 )
    globals.extend( AB02_5 ) ; globals.extend( AB02_6 ) ; globals.extend( AB02_7 ) ; globals.extend( AB02_8 ) ; globals.extend( AB02_9 )
    globals.extend( AB02_10 ); globals.extend( AB02_11 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( antenna )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_03 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 03" )

    array< entity > AB03_0  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 0, -63.58, 1265.275 >, < 0, 0, 0 >, 0, 3, 0, [], true )
    array< entity > AB03_1  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 64, 0, 127.16 >, < 0, -90, 0 >, 7, 0, 5, [ 3, 4 ], true )
    array< entity > AB03_2  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, -446.060957, 639.159424 >, < 0, 180, 0 >, 2, 0, 3, [], false )
    array< entity > AB03_3  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, 317.9, 895.15918 >, < 0, 0, 0 >, 0, 0, 2, [], true )

    entity floor = CreateModel( THUNDERDOME_CAGE_FLOOR_64x64_01, origin + < 0, 388.480957, 753.275 >, < 0, 0, 0 > )
    entity crate = CreateModel( COLONY_CRATE_MD_80x64x72_01, origin + < -32, -320.249023-82.5211, 1281.2751 >, < 0, 0, 0 > )

    // Arrays
    globals.extend( AB03_0 ) ; globals.extend( AB03_1 ) ; globals.extend( AB03_2 ) ; globals.extend( AB03_3 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( floor ) ; globals.append( crate )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_04 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 04" )

    array< entity > AB04_0  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 128, 0, 0 >, < 0, 90, 0 >, 3, 0, 2, [], true )
    array< entity > AB04_1  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 0, 384, 0 >, < 0, 0, 0 >, 0, 0, 2, [], true )
    array< entity > AB04_2  = CreateMultipleModel( IMC_BASE_FLOORPANEL_DARK_256x256_01, origin + < 0, 0, 512.85 >, < 0, 0, 0 >, 0, 3, 0, [], true )

    // Arrays
    globals.extend( AB04_0 ) ; globals.extend( AB04_1 ) ; globals.extend( AB04_2 )
    
    // Solo
    globals.append( originEnt )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_05 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 05" )

    array< entity > AB05_0  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 127.9995, 0, 127.16 >, < 0, -90, 0 >, 5, 0, 5, [], true )
    array< entity > AB05_1  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 0, 328, 509.741268 >, < 0, 0, 0 >, 0, 0, 3, [], true )
    array< entity > AB05_2  = CreateMultipleModel( INDUSTRIAL_TRAFFIC_BARREL_01, origin + < 0, 288+14, 1282.125 >, < 0, 0, 0 >, 2, 0, 0, [], true, < 200, 0, 0 > )

    entity floor = CreateModel( LEVELS_TERRAIN_SPACE_ELEVATOR_PLATFORM_01, origin + < 0, 0, 1219.9984 >, < 0, 90, 0 > )
    entity geofix0 = CreateModel( THUNDERDOME_CAGE_FRAME_256_01, origin + < -0.2, -306, 1236.9984 >, < 0, 180, 0 > )
    entity geofix1 = CreateModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < -0.2, -306, 1262.59013 >, < 0, 90, 0 > )

    // Arrays
    globals.extend( AB05_0 ) ; globals.extend( AB05_1 ) ; globals.extend( AB05_2 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( floor ) ; globals.append( geofix0 ) ; globals.append( geofix1 )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_06 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 06" )

    array< entity > AB06_0  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 1780.25 >, < 0, 0, 0 >, 0, 3, 0, [], true )
    array< entity > AB06_1  = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 192.005, 0, 1780.25 >, < 0, 0, 0 >, 0, 3, 0, [], true )
    array< entity > AB06_2  = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 256.01, 0, 0 >, < 0, 90, 0 >, 3, 0, 7, [], true )
    array< entity > AB06_3  = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 192, 384, 127.16 >, < 0, 0, 0 >, 0, 0, 7, [], true )
    array< entity > AB06_4  = CreateMultipleModel( DESERTLANDS_CARGO_CONTAINER_SMALL_03, origin + < -64, 362, 1217.02979 >, < 0, 0, 0 >, 2, 0, 4, [], true )

    entity geofix0 = CreateModel( THUNDERDOME_CAGE_FRAME_256_01, origin + < 0, 389.999512, 1794.2503 >, < 0, 0, 180 > )
    entity container = CreateModel( DESERTLANDS_CARGO_CONTAINER_LARGE_01, origin + < 256.004883, -147.112667, 1796.2502 >, < 0, 180, 0 > )

    // Arrays
    globals.extend( AB06_0 ) ; globals.extend( AB06_1 ) ; globals.extend( AB06_2 ) ; globals.extend( AB06_3 ) ; globals.extend( AB06_4 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( geofix0 ) ; globals.append( container )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_07 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 07" )

    array< entity > AB07_0 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 2293.1 >, < 0, 0, 0 >, 5, 3, 0, [ 8, 11, 14 ], true )
    array< entity > AB07_1 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 640.025, 128, 0 >, < 0, 0, 0 >, 6, 0, 9, [ 9, 10, 13, 14, 17, 35, 44, 53 ], true )
    array< entity > AB07_2 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -128.005, 256, 0 >, < 0, 90, 0 >, 0, 0, 9, [], true )
    array< entity > AB07_3 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -384.015, 384, 0 >, < 0, 0, 0 >, 2, 0, 9, [ 0, 1, 2, 3, 4, 5, 6 ], true )
    array< entity > AB07_4 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 1023.962, -129, 2051.4 >, < 0, -90, 0 >, 0, 2, 0, [], true )
    array< entity > AB07_5 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 1023.937055, -128.024414, 2001.9652 >, < 0, 0, 0 >, 3, 2, 0, [], true )
    array< entity > AB07_6 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 128.005, 0, 127.16 >, < 0, -90, 0 >, 2, 0, 9, [], true )
    array< entity > AB07_7 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 384.015, 12.0213, 127.16 >, < 0, 90, 0 >, 2, 0, 9, [], true )
    array< entity > AB07_8 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 251.94735, -128, 127.16 >, < 0, 0, 0 >, 2, 0, 9, [], true )
    array< entity > AB07_9 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 256.010742, 0, 241.7 >, < 0, 0, 0 >, 0, 0, 2, [], true, < 0, 0, 270.15 > )
    array< entity > AB07_10 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 256.010742, 0, 1010.975 >, < 0, 0, 0 >, 0, 0, 2, [], true, < 0, 0, 526.575 > )
    array< entity > AB07_11 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 256.010742, 0, 1267.4 >, < 0, 0, 0 >, 0, 0, 2, [], true, < 0, 0, 769.275 > )
    array< entity > AB07_12 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 640, -128, 2051.39697 >, < 0, 90, 0 >, 2, 0, 0, [], true )
    array< entity > AB07_13 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_A, origin + < 3.565879, 128, 769.275 >, < 0, 180, 0 >, 0, 0, 4, [], true )
    array< entity > AB07_14 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_B, origin + < 508.484902, 128, 769.275 >, < 0, 180, 0 >, 0, 0, 4, [], true )
    array< entity > AB07_15 = CreateMultipleModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_128_01, origin + < 1400.02393, 64, 0 >, < 0, 90, 0 >, 0, 2, 12, [], true )
    array< entity > AB07_16 = CreateMultipleModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_192_01, origin + < 1400.02393, -160, 1536 >, < 0, 90, 0 >, 3, 2, 4, [], true )
    array< entity > AB07_17 = CreateCamera( origin + < 1024.02441, 134, 1922.97241 >, < 0, 90, 0 >, 0, 14.5, 52, 19.5, -70 )

    entity top = CreateModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 256, 192, 2561.2436 >, < 0, 90, 0 > )
    entity sign = CreateModel( DESERTLANDS_TS_SIGN_01, origin + < 896.024414, 136, 1538.54785 >, < 0, 90, 0 > )
    sign.SetModelScale( 6 )
    entity antenna = CreateModel( IMC_BASE_ANTENNA_LARGE, origin + < -382.020508, -126, 2293.1001 >, < 0, -135, 0 > )

    // Arrays
    globals.extend( AB07_0 ) ; globals.extend( AB07_1 ) ; globals.extend( AB07_2 ) ; globals.extend( AB07_3 ) ; globals.extend( AB07_4 ) ; globals.extend( AB07_5 )
    globals.extend( AB07_6 ) ; globals.extend( AB07_7 ) ; globals.extend( AB07_8 ) ; globals.extend( AB07_9 ) ; globals.extend( AB07_10 ); globals.extend( AB07_11 )
    globals.extend( AB07_12 ); globals.extend( AB07_13 ); globals.extend( AB07_14 ); globals.extend( AB07_15 ); globals.extend( AB07_16 ); globals.extend( AB07_17 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( top ) ; globals.append( sign ) ; globals.append( antenna )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_08 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 08" )

    array< entity > AB08_0 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 1663.99707 >, < 0, 0, 0 >, 2, 0, 0, [], true )
    array< entity > AB08_1 = CreateMultipleModel( DESERTLANDS_WALL_CITY_PANEL_CONCRETE_192_01, origin + < 0, 191.981, 0 >, < 0, 0, 0 >, 6, 2, 13, [], true )
    array< entity > AB08_2 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, -64, 1614.56237 >, < 0, 0, 0 >, 2, 0, 0, [], true, < 512, 0, 0 > )
    foreach ( ents in AB08_2 ) ents.SetModelScale( 2 )

    // Arrays
    globals.extend( AB08_0 ) ; globals.extend( AB08_1 ) ; globals.extend( AB08_2 )
    
    // Solo
    globals.append( originEnt )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_09 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 09" )

    array< entity > AB09_0 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 2051.4 >, < 0, 90, 0 >, 0, 2, 0, [], true )
    array< entity > AB09_1 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 0, 255.8495, -0.2 >, < 0, 0, 0 >, 3, 0, 8, [], true )
    array< entity > AB09_2 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 383.962, 0, 0 >, < 0, 90, 0 >, 2, 0, 8, [ 0, 1, 2, 3, 4 ], true )
    array< entity > AB09_3 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -383.962, 0, 0 >, < 0, 90, 0 >, 2, 0, 8, [ 0, 1, 2, 3, 4, 5 ], true )
    array< entity > AB09_4 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -383.962, 0, 0 >, < 0, 90, 0 >, 2, 0, 8, [ 0, 1, 2, 3, 4, 5 ], true )
    array< entity > AB09_5 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 2001.9653 >, < 0, 0, 0 >, 3, 2, 0, [], true )
    array< entity > AB09_6 = CreateMultipleModel( INDUSTRIAL_SUPPORT_BEAM_256_01, origin + < 383.981445, -164, 2048.3999 >, < 0, 90, 0 >, 0, 2, 0, [], true )
    array< entity > AB09_7 = CreateMultipleModel( INDUSTRIAL_SUPPORT_BEAM_256_01, origin + < 383.981445, -116, 2048.3999 >, < 0, 90, 0 >, 0, 2, 0, [], true )

    entity container = CreateModel( IMC_BASE_CARGO_CONTAINER_WHITE_01, origin + < 255.981445, -128, 2051.3999 >, < 0, 90, 0 > )

    // Arrays
    globals.extend( AB09_0 ) ; globals.extend( AB09_1 ) ; globals.extend( AB09_2 ) ; globals.extend( AB09_3 ) ; globals.extend( AB09_4 ) ; globals.extend( AB09_5 )
    globals.extend( AB09_6 ) ; globals.extend( AB09_7 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( container )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_10 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 10" )

    array< entity > AB10_0 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 1267.4 >, < 0, 0, 0 >, 4, 0, 0, [], true )
    array< entity > AB10_1 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 0, 128, 0 >, < 0, 0, 0 >, 4, 0, 5, [], true )

    // Arrays
    globals.extend( AB10_0 ) ; globals.extend( AB10_1 )
    
    // Solo
    globals.append( originEnt )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_11 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 11" )

    array< entity > AB11_0 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 2033.275 >, < 0, 0, 0 >, 3, 3, 0, [ 1, 2 ], true )
    array< entity > AB11_1 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 144, 384, 127.16 >, < 0, 0, 0 >, 4, 0, 8, [], true )
    array< entity > AB11_2 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -256, -128, 127.16 >, < 0, 0, 0 >, 2, 0, 8, [], true )
    array< entity > AB11_3 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -128, 144, 127.16 >, < 0, 90, 0 >, 4, 0, 8, [], true )
    array< entity > AB11_4 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -384, -256, 1407.16 >, < 0, 90, 0 >, 2, 0, 3, [], true )
    array< entity > AB11_5 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < -178.924805, -64.956543, 1649.2759 >, < 0, -45, 0 >, 0, 0, 2, [], true, < 0, 0, 256 > )

    entity geofix = CreateModel( THUNDERDOME_CAGE_FRAME_16x352_01, origin + < -132, -124, 1649.2759 >, < 0, 0, 0 > )
    entity lilPlatform = CreateModel( THUNDERDOME_STANDS_AWNING_01, origin + < -46.7404175, 384, 1663.15869 >, < 0, 0, 0 > )

    // Arrays
    globals.extend( AB11_0 ) ; globals.extend( AB11_1 ) ; globals.extend( AB11_2 ) ; globals.extend( AB11_3 ) ; globals.extend( AB11_4 ) ; globals.extend( AB11_5 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( geofix ) ; globals.append( lilPlatform )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_12 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 12" )

    array< entity > AB12_0 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 2307.825 >, < 0, 0, 0 >, 0, 3, 0, [], true )
    array< entity > AB12_1 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, -64, 2258.3903 >, < 0, 0, 0 >, 0, 2, 0, [], true, < 0, 512, 0 > )
    foreach ( ents in AB12_1 ) ents.SetModelScale( 2 )
    array< entity > AB12_2 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -255.8495, -64, 0 >, < 0, 90, 0 >, 4, 0, 9, [ 0, 1, 2, 3, 4, 9, 10, 11, 12, 13 ], true )
    array< entity > AB12_3 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -128, -576, 0 >, < 0, 0, 0 >, 3, 0, 9, [ 5, 6, 7, 8 ], true )
    array< entity > AB12_4 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -383.999512, -64, 0 >, < 0, 0, 0 >, 0, 0, 5, [], true )
    array< entity > AB12_5 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -511.8495, -320, -0.2 >, < 0, 90, 0 >, 2, 0, 5, [], true )
    array< entity > AB12_6 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < -383.999512, -320, 1267.4 >, < 0, 0, 0 >, 0, 2, 0, [], true )
    array< entity > AB12_7 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -255.875, 511.604414, 127.16 >, < 0, 90, 0 >, 0, 0, 9, [], true )
    array< entity > AB12_8 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 16, 575.943, 1919.16 >, < 0, 0, 0 >, 4, 0, 2, [], true )
    array< entity > AB12_9 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 0, 512, 2258.3903 >, < 0, 90, 0 >, 0, 2, 0, [], true )
    array< entity > AB12_10 = CreateMultipleModel( IMC_BASE_GENERATOR_01, origin + < -198.280884, 0.157714844, 2307.85645 >, < 0, 0, 0 >, 0, 4, 0, [], false, < 0, 128, 0 > )

    entity sign = CreateModel( SIGNS_RELIC_WARNING , origin + < -264.679688, 181.595703, 2050.97607 >, < 0, 90, 0 > )
    sign.SetModelScale( 8 )

    // Arrays
    globals.extend( AB12_0 ) ; globals.extend( AB12_1 ) ; globals.extend( AB12_2 ) ; globals.extend( AB12_3 ) ; globals.extend( AB12_4 ) ; globals.extend( AB12_5 )
    globals.extend( AB12_6 ) ; globals.extend( AB12_7 ) ; globals.extend( AB12_8 ) ; globals.extend( AB12_9 ) ; globals.extend( AB12_10 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( sign )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_13 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 13" )

    array< entity > AB13_0 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 1792 >, < 0, 0, 0 >, 0, 5, 0, [], true )
    array< entity > AB13_1 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 1742.5653 >, < 0, 0, 0 >, 0, 4, 0, [], true, < 0, 512, 0 > )
    foreach ( ents in AB13_1 ) ents.SetModelScale( 2 )
    array< entity > AB13_2 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -255.8495, 47.98625, 127.16 >, < 0, 90, 0 >, 16, 0, 7, [ 49, 50, 51, 52, 56, 57, 58, 59, 63, 64, 65, 66, 70, 71, 72, 73, 77, 78, 79, 80, 84, 85, 86, 87, 91, 92, 93, 94, 98, 99, 100, 101, 105, 106, 107, 108 ], true )

    // Arrays
    globals.extend( AB13_0 ) ; globals.extend( AB13_1 ) ; globals.extend( AB13_2 )
    
    // Solo
    globals.append( originEnt )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_14 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 14" )

    array< entity > AB14_0 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 1024 >, < 0, 0, 0 >, 2, 3, 0, [], true )
    array< entity > AB14_1 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 189.560597, 974.5653 >, < 0, 0, 0 >, 2, 3, 0, [], true, < 512, 512, 0 > )
    foreach ( ents in AB14_1 ) ents.SetModelScale( 2 )
    array< entity > AB14_2 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -511.699, 65.345215, 0 >, < 0, 90, 0 >, 5, 0, 4, [], true ) 
    array< entity > AB14_3 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 119.505555, -568.665309, -0.2 >, < 0, 0, 0 >, 5, 0, 4, [], true ) 
    array< entity > AB14_4 = CreateCamera( origin + < 359.819824, -573.774414, 881.024658 >, < 0, -90, 0 >, 0, 35, -7, 33, -85 )

    // Arrays
    globals.extend( AB14_0 ) ; globals.extend( AB14_1 ) ; globals.extend( AB14_2 ) ; globals.extend( AB14_3 ) ; globals.extend( AB14_4 )
    
    // Solo
    globals.append( originEnt )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_15 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 15" )

    array< entity > AB15_0 = CreateMultipleModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, origin + < 0, 0, 1025.69849 >, < 0, 0, 0 >, 11, 4, 0, [ 1, 2, 5, 6, 37, 38, 41, 42 ], true )
    array< entity > AB15_1 = CreateMultipleModel( DESERTLANDS_PIPE_GRATE_MEDIUM_128, origin + < 0, 0, 1025.69849 >, < 0, 0, 180 >, 11, 4, 0, [ 1, 2, 5, 6, 37, 38, 41, 42 ], true )

    // Arrays
    globals.extend( AB15_0 ) ; globals.extend( AB15_1 )
    
    // Solo
    globals.append( originEnt )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_16 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 16" )

    array< entity > AB16_0 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 384.033813, 0, 0 >, < 0, 90, 0 >, 3, 0, 5, [], true )
    array< entity > AB16_1 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < -384.033813, 0, 0 >, < 0, 90, 0 >, 3, 0, 5, [], true )
    array< entity > AB16_2 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 0, -384.03125, -0.2 >, < 0, 0, 0 >, 3, 0, 5, [], true )
    array< entity > AB16_3 = CreateMultipleModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 0, 384.03125, -0.2 >, < 0, 0, 0 >, 3, 0, 5, [], true )
    array< entity > AB16_4 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 1267.4 >, < 0, 0, 0 >, 3, 3, 0, [], true )

    entity NumLit1 = CreateModel( SIGNS_NUM_LIT_1, origin + < -392.867188, 118.648438, 1025.48755 >, < 0, 180, 0 > )
    NumLit1.SetModelScale( 40 )

    // Arrays
    globals.extend( AB16_0 ) ; globals.extend( AB16_1 ) ; globals.extend( AB16_2 ) ; globals.extend( AB16_3 ) ; globals.extend( AB16_4 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( NumLit1 )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_17 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 17" )

    array< entity > AB17_0 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 337.274 >, < 0, 0, 0 >, 3, 3, 0, [], true )

    entity b17_wb = CreateModel( THUNDERDOME_CAGE_WALL_512x352_01, origin + < -384, 128, 0 >, < 0, 90, 0 > )
    entity b17_wl = CreateModel( THUNDERDOME_CAGE_WALL_256x352_01, origin + < -384, -256, 0 >, < 0, 90, 0 > )
    entity b17_eb = CreateModel( THUNDERDOME_CAGE_WALL_512x352_01, origin + < 384, -128, 0 >, < 0, 90, 0 > )
    entity b17_el = CreateModel( THUNDERDOME_CAGE_WALL_256x352_01, origin + < 384, 256, 0 >, < 0, 90, 0 > )
    entity b17_nb = CreateModel( THUNDERDOME_CAGE_WALL_512x352_01, origin + < 128, -384, 0 >, < 0, 0, 0 > )
    entity b17_nl = CreateModel( THUNDERDOME_CAGE_WALL_256x352_01, origin + < -256, -384, 0 >, < 0, 0, 0 > )
    entity b17_sb = CreateModel( THUNDERDOME_CAGE_WALL_512x352_01, origin + < -128, 384, 0 >, < 0, 0, 0 > )
    entity b17_sl = CreateModel( THUNDERDOME_CAGE_WALL_256x352_01, origin + < 256, 384, 0 >, < 0, 0, 0 > )

    // Arrays
    globals.extend( AB17_0 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( b17_wb ) ; globals.append( b17_wl ) ; globals.append( b17_eb ) ; globals.append( b17_el ) ; globals.append( b17_nb )
    globals.append( b17_nl )    ; globals.append( b17_sb ) ; globals.append( b17_sl )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_18 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 18" )

    array< entity > AB18_0 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 1280 >, < 0, 90, 0 >, 0, 2, 0, [], true, < 0, 640, 0 > )
    array< entity > AB18_1 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 1230.5653 >, < 0, 0, 0 >, 2, 0, 0, [], true, < 512, 0, 0 > )
    foreach ( ents in AB18_1 ) ents.SetModelScale( 2 )
    array< entity > AB18_2 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -512.0625, 0, 127.16 >, < 0, 90, 0 >, 4, 0, 5, [], true )
    array< entity > AB18_3 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 512.0625, 0, 127.16 >, < 0, -90, 0 >, 4, 0, 5, [], true )
    array< entity > AB18_4 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, -255.879883, 127.16 >, < 0, 180, 0 >, 8, 0, 5, [], true )
    array< entity > AB18_5 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, 255.879883, 127.16 >, < 0, 0, 0 >, 8, 0, 5, [], true )

    entity floor_geofix = CreateModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 1280.2 >, < 0, 90, 0 > )
    entity NumLit2 = CreateModel( SIGNS_NUM_LIT_2, origin + < -307.284546, 270.95459, 1022.94116 >, < 0, 90, 0 > )
    NumLit2.SetModelScale( 40 )

    array< entity > balcony_0 = LilBalcony( origin + < -522.922119, 8.94482422, 898.947998 >, < 0, 180, 0 > )
    array< entity > balcony_1 = LilBalcony( origin + < -117.071594, 267.276367, 509.720215 >, < 0, 90, 0 > )
    array< entity > balcony_2 = LilBalcony( origin + < 238.765747, -269.046387, 767.657959 >, < 0, -90, 0 > )

    // Arrays
    globals.extend( AB18_0 ) ; globals.extend( AB18_1 ) ; globals.extend( AB18_2 ) ; globals.extend( AB18_3 ) ; globals.extend( AB18_4 ) ; globals.extend( AB18_5 )
    globals.extend( balcony_0 ) ; globals.extend( balcony_1 ) ; globals.extend( balcony_2 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( floor_geofix ) ; globals.append( NumLit2 )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_19 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 19" )

    array< entity > AB19_0 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 1280 >, < 0, 0, 0 >, 3, 0, 0, [], true )
    array< entity > AB19_1 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 959.5295, 191.981, 1280 >, < 0, 90, 0 >, 2, 0, 0, [], true )
    array< entity > AB19_2 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 1230.5653 >, < 0, 0, 0 >, 4, 0, 0, [], true, < 383.962112, 0, 0 > )
    foreach ( ents in AB19_2 ) ents.SetModelScale( 1.499852 )
    array< entity > AB19_3 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 959.5295, 191.981, 1230.5653 >, < 0, 0, 0 >, 0, 2, 0, [], true, < 0, 640, 0 > )
    foreach ( ents in  AB19_3 ) ents.SetModelScale( 1.499852 )
    array< entity > AB19_4 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 959.5295, 191.981, 1230.3653 >, < 0, 0, 0 >, 3, 0, 0, [], true, < 0, 260.461056, 0 > )
    foreach ( ents in AB19_4 ) ents.SetModelScale( 1.014426 )
    array< entity > AB19_5 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, 191.981, 127.16 >, < 0, 0, 0 >, 12, 0, 5, [], true )
    array< entity > AB19_6 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, -191.981, 127.16 >, < 0, 180, 0 >, 12, 0, 5, [], true )
    array< entity > AB19_7 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 959.5295, 703.68, 127.16 >, < 0, 0, 0 >, 3, 0, 5, [], true )
    array< entity > AB19_8 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 959.5295, -319.718, 127.16 >, < 0, 180, 0 >, 3, 0, 5, [], true )
    array< entity > AB19_9 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -767.5485, 0, 127.16 >, < 0, 90, 0 >, 3, 0, 5, [], true )
    array< entity > AB19_10 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 1151.5105, 191.981, 127.16 >, < 0, -90, 0 >, 8, 0, 5, [], true )
    array< entity > AB19_11 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 767.5485, 447.8305, 127.16 >, < 0, 90, 0 >, 4, 0, 5, [], true )
    array< entity > AB19_12 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 767.5485, -254.733398, 127.16 >, < 0, 90, 0 >, 0, 0, 5, [], true )

    entity NumLit3 = CreateModel( SIGNS_NUM_LIT_3, origin + < -565.993652, 212.129395, 1023.2627 >, < 0, 90, 0 > )
    NumLit3.SetModelScale( 40 )

    // Arrays
    globals.extend( AB19_0 ) ; globals.extend( AB19_1 ) ; globals.extend( AB19_2 ) ; globals.extend( AB19_3 ) ; globals.extend( AB19_4 ) ; globals.extend( AB19_5 )
    globals.extend( AB19_6 ) ; globals.extend( AB19_7 ) ; globals.extend( AB19_8 ) ; globals.extend( AB19_9 ) ; globals.extend( AB19_10 ); globals.extend( AB19_11 )
    globals.extend( AB19_12 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( NumLit3 )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function Building_20 ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "Building 20" )

    array< entity > AB20_0 = CreateMultipleModel( LEVELS_TERRAIN_ZONE12_MID_PLATFORM_01, origin + < 0, 0, 256 >, < 0, 90, 0 >, 2, 2, 0, [], true )
    array< entity > AB20_1 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x256_06, origin + < 0, 0, 206.5653 >, < 0, 0, 0 >, 2, 2, 0, [], true, < 384, 640, 0 > )
    foreach ( ents in AB20_1 ) ents.SetModelScale( 1.5 )
    array< entity > AB20_2 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 0, 0, 206.5653 >, < 0, 0, 0 >, 6, 0, 0, [], true, < 0, 260.461056, 0 > )
    foreach ( ents in AB20_2 ) ents.SetModelScale( 1.014426 )
    array< entity > AB20_3 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 383.962, 0, 127.16 >, < 0, -90, 0 >, 8, 0, 0, [], true )
    array< entity > AB20_4 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < -383.962, 0, 127.16 >, < 0, 90, 0 >, 8, 0, 0, [], true )
    array< entity > AB20_5 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, 511.699, 127.16 >, < 0, 0, 0 >, 6, 0, 0, [], true )
    array< entity > AB20_6 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_SHELL_BOX_C, origin + < 0, -511.699    , 127.16 >, < 0, 180, 0 >, 6, 0, 0, [], true )

    entity generator = CreateModel( IMC_BASE_GENERATOR_02, origin + < 0, 0, 256.03125 >, < 0, 0, 0 > )

    // Arrays
    globals.extend( AB20_0 ) ; globals.extend( AB20_1 ) ; globals.extend( AB20_2 ) ; globals.extend( AB20_3 ) ; globals.extend( AB20_4 ) ; globals.extend( AB20_5 )
    globals.extend( AB20_6 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( generator )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function North_Wall ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "South Wall" )

    array< entity > ANW_0 = CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < -2725.83105, 96, 0 >, < 0, 180, 0 >, 2, 0, 10, [], true )
    array< entity > ANW_1 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < -386.42626, 66.08398, 0 >, < 0, 180, 0 >, 12, 0, 10, [], true, < 260.7, 0, 0 > )
    array< entity > ANW_2 //= CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_WALL_PILLAR_64_01, origin + < -2376.10571, -32, 2309.13135 >, < 0, -90, 0 >, 0, 10, 3, [], true, < 0, 128, 286 > )
    array< entity > AWW_5 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < -2470.43848, 52, 1992.03296 >, < 0, 90, 0 >, 0, 4, 0, [], true )

    //entity sign = CreateModel( SIGNS_SERVICE_SHAFT_01, origin + < 1273.06689, 0, 2363.88477 >, < 0, 90, 0 > )
    //sign.SetModelScale( 8 )
    //entity shadow_fix = CreateModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 2378.04004, -70.606, 1531.46396 >, < 0, 0, 0 > )
    //shadow_fix.SetModelScale( 4 )

    string script_name = ""
    // OLD
    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < 0, 96, 1200+3000 >, < 0, 180, 0 >, 200, 4, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < 529, 96, 0+3000 >, < 0, 180, 0 >, 200, 10, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 144, 58, 2000+3000 >, < 0, 90, 0 >, 256, 4, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < 1160, 64, 0+3000 >, < 0, 180, 0 >, 260.7, 4, 224, 10, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < 2202.8, 0, 1792+3000 >, < 0, 180, 0 >, 260.7, 4, 224, 2, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < 3245.6, 0, 0+3000 >, < 0, 180, 0 >, 260.7, 3, 224, 10, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < 2062, 140, 1792+3000 >, < 0, 90, 0 >, 224, 2, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < 3900, 0, 0+3000 >, < 0, 180, 0 >, 200, 12, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 4028, -50, 2400+3000 >, < 0, 90, 0 >, 256, 2, script_name )
    CreateLoopFloppytownModel_XZ( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < 4500, -64, 896+3000 >, < 0, 180, 0 >, 260.7, 4, 224, 6, script_name )
    CreateLoopFloppytownModel_Z( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < 5044, -64, 1000+3000 >, < 0, 180, 0 >, 200, 7, script_name )
    CreateLoopFloppytownModel_X( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 5172, -114, 2400+3000 >, < 0, 90, 0 >, 256, 2, script_name )
    //

    // Arrays
    //globals.extend( ASW_0 ) ; globals.extend( ASW_1 ) ; globals.extend( ASW_2 )
    
    // Solo
    globals.append( originEnt ) //; globals.append( sign )

    // Wall Triggers
    //CreateMultipleWallTrigger( origin + < 2210.50781, -44, 2636.3457 >, 13, 0, true )
    //CreateMultipleWallTrigger( origin + < 584.313965, -44, 2611.40332 >, 41, 0, true )
    //CreateMultipleWallTrigger( origin + < -1240.39063, -44, 2835.4043 >, 16, 0, true )
    //CreateMultipleWallTrigger( origin + < -2381.83472, -22.99995, 3169.1626 >, 19, 0, true )

    SetAnglesForBuilding( globals, script_mover, ang )
}


void function South_Wall ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "South Wall" )

    array< entity > ASW_0 = CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < 2633.68652, -70.606, 2044.31396 >, < 0, 0, 0 >, 2, 0, 3, [], true )
    array< entity > ASW_1 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < 63.3476563, 0, 1267.36865 >, < 0, 0, 0 >, 14, 0, 7, [ 34, 41, 48, 55, 62, 69, 76, 83, 90, 97 ], true, < 260.7, 0, 0 > )
    array< entity > ASW_2 = CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_WALL_PILLAR_64_01, origin + < -2376.10571, -32, 2309.13135 >, < 0, -90, 0 >, 0, 10, 3, [], true, < 0, 128, 286 > )
    array< entity > ASW_3 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < 2377.66504, -26, 2636.3457 >, < 0, 90, 0 >, 0, 4, 0, [], true )

    entity sign = CreateModel( SIGNS_SERVICE_SHAFT_01, origin + < 1273.06689, 0, 2363.88477 >, < 0, 90, 0 > )
    sign.SetModelScale( 8 )
    //entity shadow_fix = CreateModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 2378.04004, -70.606, 1531.46396 >, < 0, 0, 0 > )
    //shadow_fix.SetModelScale( 4 )

    // Arrays
    globals.extend( ASW_0 ) ; globals.extend( ASW_1 ) ; globals.extend( ASW_2 ) ; globals.extend( ASW_3 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( sign )

    // Wall Triggers
    CreateMultipleWallTrigger( origin + < 2274.50781, 0, 2636.3457 >, 13, 0, true )
    CreateMultipleWallTrigger( origin + < 584.313965, -44, 2611.40332 >, 41, 0, true )
    CreateMultipleWallTrigger( origin + < -1240.39063, -44, 2835.4043 >, 16, 0, true )
    CreateMultipleWallTrigger( origin + < -2381.83472, -22.99995, 3169.1626 >, 19, 0, true )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function West_Wall ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "West Wall" )

    array< entity > AWW_0 = CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < -70.606, 1888.0376, 1282.15625 >, < 0, -90, 0 >, 0, 0, 5, [], true )
    array< entity > AWW_1 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < 0, 455.102051, 511.128174 >, < 0, -90, 0 >, 11, 0, 8, [ 0, 8, 16, 24, 25, 26, 32, 33, 34, 72, 73, 74, 80, 81, 82 ], true, < 260.7, 0, 0 > )
    array< entity > AWW_2 = CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_WALL_PILLAR_64_01, origin + < -22.99995, -1708.78955, 1780.21875 >, < 0, 180, 0 >, 0, 12, 4, [], true, < 0, 128, 286 > ) 
    array< entity > AWW_3 = CreateMultipleModel( COLONY_WALLRUN_PLATE, origin + < 0, 101.738281, 1330.74609 >, < 0, 180, 0 >, 0, 6, 2, [], true )
    array< entity > AWW_4 = CreateMultipleModel( COLONY_WALLRUN_PLATE, origin + < 0, 1565.16992, 1330.74609 >, < 0, 180, 0 >, 0, 5, 2, [], true )
    array< entity > AWW_5 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < -16, 2137.91846, 2274.18799 >, < 0, 0, 0 >, 0, 2, 0, [], true )

    entity sign = CreateModel( DESERTLANDS_TS_SIGN_02, origin + < 0, 480.367676, 1963.9563 >, < 0, 0, 0 > )
    sign.SetModelScale( 6 )

    // Arrays
    globals.extend( AWW_0 ) ; globals.extend( AWW_1 ) ; globals.extend( AWW_2 ) ; globals.extend( AWW_3 ) ; globals.extend( AWW_4 ) ; globals.extend( AWW_5 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( sign )

    // Wall Triggers
    CreateMultipleWallTrigger( origin + < -16, 2137.91846, 2274.18799 >, 0, 8, true )
    CreateMultipleWallTrigger( origin + < -42, 455.102051, 2303.16406 >, 0, 44, true )
    CreateMultipleWallTrigger( origin + < -22.99995, -1708.78955, 2926.25 >, 0, 24, true )

    SetAnglesForBuilding( globals, script_mover, ang )
}

void function East_Wall ( vector pos, vector ang )
{
    array< entity > globals = [] ; vector origin = SetOriginForBuilding( pos )

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )
    entity originEnt = CreateModel( EDITOR_REF, origin, < 0, 0, 0 > )
    SetTargetName( originEnt, "East Wall" )

    array< entity > AEW_0 = CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < 0, 2176.5244, 1790.03125 >, < 0, 90, 0 >, 2, 0, 4, [], true )
    array< entity > AEW_1 = CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < 0, 1118.3644, 1790.03125 >, < 0, 90, 0 >, 2, 0, 5, [], true )
    array< entity > AEW_2 = CreateMultipleModel( DESERTLANDS_CITY_SLANTED_BLDG_SLICE_01, origin + < 0, -910.73047, 0 >, < 0, 90, 0 >, 2, 0, 14, [], true )
    array< entity > AEW_3 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < 0, -180.687017, 2307.85645 >, < 0, 90, 0 >, 4, 0, 2, [], true, < 260.7, 0, 0 > )
    array< entity > AEW_4 = CreateMultipleModel( DESERTLANDS_HIGHRISE_S_BLOCK_03, origin + < -2, -2078.59253, 2044.34521 >, < 0, 90, 0 >, 3, 0, 4, [], true, < 260.7, 0, 0 > )
    array< entity > AEW_5 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < -44, 1921.26074, 2582.06299 >, < 0, 0, 0 >, 0, 4, 0, [], true )
    array< entity > AEW_6 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < -44, 863.285645, 2782.06348 >, < 0, 0, 0 >, 0, 4, 0, [], true )
    array< entity > AEW_7 = CreateMultipleModel( THUNDERDOME_CAGE_CEILING_256x128_06, origin + < -44, -1165.502439, 2792.03369 >, < 0, 0, 0 >, 0, 4, 0, [], true )

    entity pipe = CreateModel( FIRSTGEN_PIPE_256_CLOTH_01, origin + < -26.10601, -2010.43017, 2305.30615 >, < 0, -90, 0 > )
    entity pipe_curve_0 = CreateModel( FIRSTGEN_PIPE_CURVE_CLOTH_01, origin + < -26.10601, -2010.43017, 2305.30615 >, < 0, 90, 0 > )
    entity pipe_curve_1 = CreateModel( FIRSTGEN_PIPE_CURVE_CLOTH_01, origin + < -26.10601, -2266.43017, 2305.30615 >, < -180, 90, 0 > )
    //entity shadow_fix_0 = CreateModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 190.46434, -940.798831, 0 >, < 0, 90, 0 > )
    //shadow_fix_0.SetModelScale( 9.886719 )
    //entity shadow_fix_1 = CreateModel( THUNDERDOME_CAGE_WALL_256x256_01, origin + < 190.46434, 1406.81543, 0 >, < 0, 90, 0 > )
    //shadow_fix_1.SetModelScale( 10.1 )

    // Arrays
    globals.extend( AEW_0 ) ; globals.extend( AEW_1 ) ; globals.extend( AEW_2 ) ; globals.extend( AEW_3 ) ; globals.extend( AEW_4 ) ; globals.extend( AEW_5 )
    globals.extend( AEW_6 ) ; globals.extend( AEW_7 )
    
    // Solo
    globals.append( originEnt ) ; globals.append( pipe ) ; globals.append( pipe_curve_0 ) ; globals.append( pipe_curve_1 )

    // Wall Triggers
    CreateMultipleWallTrigger( origin + < -44, 1921.26074, 2582.06299 >, 0, 16, true )
    CreateMultipleWallTrigger( origin + < -44, 863.285645, 2782.06348 >, 0, 16, true )
    CreateMultipleWallTrigger( origin + < -44, -1165.502439, 2792.03369 >, 0, 16, true )
    CreateMultipleWallTrigger( origin + < 42, -180.687017, 2755.88818 >, 0, 16, true )
    CreateMultipleWallTrigger( origin + < 40, -2078.59253, 2940.37842 >, 0, 12, true )

    SetAnglesForBuilding( globals, script_mover, ang )
}

// usefull: 14.725

array< entity > function LilBalcony( vector origin, vector ang )
{
    array< entity > globals = [] ; array< entity > balcony = []

    entity script_mover = CreateScriptMover( origin, < 0, 0, 0 > )

    entity floor = CreateModel( PLAYBACK_BRIDGE_PANEL_128x64_01, origin + < 0, -64, 0 >, < 0, 0, 0 > )
    entity cornerRight = CreateModel( OLA_RAILING_CORNER_IN_01, origin + < 64, -64, 4 >, < 0, 0, 0 > )
    entity cornerLeft  = CreateModel( OLA_RAILING_CORNER_IN_01, origin + < 64, 64, 4 >, < 0, 90, 0 > )

    globals.append( floor ) ; globals.append( cornerRight ) ; globals.append( cornerLeft )
    balcony.append( floor ) ; balcony.append( cornerRight ) ; balcony.append( cornerLeft )

    SetAnglesForBuilding( globals, script_mover, ang )
return balcony }