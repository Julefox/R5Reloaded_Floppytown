untyped

globalize_all_functions


void function Floppytown_MapInit_Generation()
{
    MapGen()
}

void function MapGen()
{
    Floppytown_Floor( floppytown.worldspawnPos, < 0, 0, 0 > ) // Don't change the ang because the zip won't work
    Developper_Floor()
    Building_01( < -240.00758, -1936.07898, 0 >, < 0, 0, 0 > )
    Building_02( < -2495.99634, -1887.99707, 0 >, < 0, 0, 0 > )
    Building_03( < -2943.99634, -919.99707, 0 >, < 0, 0, 0 > )
    Building_04( < -2879.99634, -92, 0 >, < 0, 0, 0 > )
    Building_05( < -2879.99634, 617.44, 0 >, < 0, 0, 0 > )
    Building_06( < -2879.99634, 1321.44, 0 >, < 0, 0, 0 > )
    Building_07( < -2367.99634, 2091.46124, 0 >, < 0, 0, 0 > )
    Building_08( < -450, 2284.44141, 0 >, < 0, 0, 0 > )
    Building_09( < 454, 2219.44141, 0 >, < 0, 0, 0 > )
    Building_10( < 1353.0213, 2347.44141, 0 >, < 0, 0, 0 > )
    Building_11( < 2249.02148, 2091.44141, 0 >, < 0, 0, 0 > ) //14.17285
    Building_12( < 2379.02148, 53.82324, 0 >, < 0, 0, 0 > )
    Building_13( < 2379.02148, -1490.17676, 0 >, < 0, 0, 0 > )
    Building_14( < 1602.59374, -1873.91162, 0 >, < 0, 0, 0 > )
    Building_15( < -1536.01732, -2143.99707, 0 >, < 0, 0, 0 > )
    Building_16( < 1155.35791, -370.766113, 0 >, < 0, 0, 0 > )
    Building_17( < -1754.6582, -703.108398, -0.4 >, < 0, 0, 0 > )
    Building_18( < -551.996094, 353.216797, 0 >, < 0, 0, 0 > )
    Building_19( < -17.0478516, 1247.18945, 0 >, < 0, 0, 0 > )
    Building_20( < -1891.02295, 1051.41602, 0 >, < 0, 0, 0 > )

    North_Wall( < 0, -2398.02539, 0 >, < 0, 0, 0 > )
    South_Wall( < 0, 2462.22949, 0 >, < 0, 0, 0 > )
    West_Wall( < -3008.02759, 0, 0 >, < 0, 0, 0 > )
    East_Wall( < 2633.26367, 0, 0 >, < 0, 0, 0 > )

    AddCallback_EntitiesDidLoad( ZipsGen )
}

void function ZipsGen()
{
    vector origin = floppytown.worldspawnPos
    
    ZiplineUtility ZiplineTest4 = Zipline_CreateZipline( "zipline_test4", < 4856.17529, 5006.62109, -3302.93188 >, < 0, 180, 0 > )
        Zipline_SetSkin( ZiplineTest4, 1 )
        Zipline_SetHeightLimit( ZiplineTest4, 260 )
        Zipline_SetIsMoving( ZiplineTest4 )
        Zipline_CreatePanel( ZiplineTest4, < 4879.12207, 5007.38184, -3440.5979 >, < 0, 0, 0 > )
        Zipline_PanelUsableLimit( ZiplineTest4, 1 )
        Zipline_BuildInit( ZiplineTest4, false )
    /*
    // Building 01
    ZiplineUtility zipline_0 = Zipline_CreateZipline(  "zipline_0", origin + < -818.783691, 2174.89014, 1792.03125 >, < 0, -170, 0 > )
    Zipline_SetZiplineAngles( zipline_0, < 0, -32, 0 > )
    Zipline_BuildInit( zipline_0 )

    ZiplineUtility zipline_1 = Zipline_CreateZipline(  "zipline_1", origin + < 345.146484, 1768.70166, 1792.03125 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_1, < 0, 144, 0 > )
    Zipline_BuildInit( zipline_1 )

    ZiplineUtility zipline_2 = Zipline_CreateZipline(  "zipline_2", origin + < -161.421875, 1325.08057, 898.765625 >, < 0, -90, 0 > )
    Zipline_SetZiplineAngles( zipline_2, < 0, -175, 0 > )
    Zipline_SetSkin( zipline_2, 1 )
    Zipline_BuildInit( zipline_2 )

    ZiplineUtility zipline_35 = Zipline_CreateZipline( "zipline_35", origin + < -617.869141, 939.623047, 160 >, < 0, -90, 0 >, origin + < 274.938477, 939.623047, 160 >, < 0, -90, 0 > )
    Zipline_SetSkin( zipline_35, 1, 1 )
    Zipline_BuildInit( zipline_35 )

    // Building 02
    ZiplineUtility zipline_3 = Zipline_CreateZipline(  "zipline_3", origin + < -2625.32837, 1375.74268, 769.102539 >, < 0, -90, 0 > )
    Zipline_SetZiplineAngles( zipline_3, < 0, 150, 0 > )
    Zipline_BuildInit( zipline_3 )

    ZiplineUtility zipline_4 = Zipline_CreateZipline(  "zipline_4", origin + < -2240.83325, 2143.62793, 1277.19531 >, < 0, 0, 0 > )
    Zipline_SetZiplineAngles( zipline_4, < 0, 150, 0 > )
    Zipline_BuildInit( zipline_4 )

    ZiplineUtility zipline_31 = Zipline_CreateZipline(  "zipline_31", origin + < -1976.77051, 1901.76416, 148 >, < 0, 0, 0 >, origin + < -1976.77051, 2370.04688, 148 >, < 0, 0, 0 > )
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
    */
}
