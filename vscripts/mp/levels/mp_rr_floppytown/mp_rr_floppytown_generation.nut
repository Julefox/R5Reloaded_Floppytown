global function Floppytown_MapInit_Generation

void function Floppytown_MapInit_Generation()
{   printt( "Floppytown_MapInit_Generation OK" )
    Map_Generation()
    Zips_Generation()

    if ( GetCurrentPlaylistVarBool( "Builder_Editing_Enable", false ) )
    {   // map editing, do not activate in normal use
        EditorRefAreVisible()
        AreaBuildAreVisible()
        PrinttPropsCount()
    }
}

int function PropsCount()
{
    int count = 0
	foreach( EntitiesCount in GetPropsCount() )
	{ count++ }
	return count
}
array< entity > function GetPropsCount()
{
    array< entity > EntitiesCount = GetEntArrayByScriptName( "FloppyTownEntities" )
    return EntitiesCount
}
void function PrinttPropsCount()
{ printt( "Models generated: " + PropsCount() + " / 5000 " + "| Maximum number of props that can be generated: " + ( 5000 - PropsCount() ) ) }

void function Map_Generation()
{
    Ft_Floor( FT_FLOOR_POS, FT_FLOOR_ANG, 5, 14, 1 )    // to make it easier to reference buildings put "6" in "floorInt[ 0 ]"
    Ft_Floor( FT_FLOOR_POS_GEOFIX, FT_FLOOR_ANG, 1, 4, 1 )

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
    //Building_21( FT_BUILDING_POS_21, FT_BUILDING_ANG_21 )

    // Other
    CreateFloppytownModel( CUBEMAP, < 10600, 29200, -26000 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ).SetModelScale( 15 ) // Hides the tear under the skybox
}

void function Zips_Generation()
{
    CreateFloppytownZiplineModel( FT_BUILDING_POS_01 + < 600, 0, 1792.1 >,      < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_01 + < -600, 256, 1792.1 >,   < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_02 + < 640, 256, 1280 >,      < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_10 + < -384, 128, 1280 >,     < 0, 0, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_12 + < -128, 1024, 2304 >,    < 0, 0, 0 > )

    CreateFloppytownModel( ZIP_ARM, FT_BUILDING_POS_07 + < 1152, 384, 2176 >,   < 0, -90, 0 > )
}