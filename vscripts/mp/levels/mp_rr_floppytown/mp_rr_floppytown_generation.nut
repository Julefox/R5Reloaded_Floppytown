global function Floppytown_MapInit_Generation

void function Floppytown_MapInit_Generation()
{   printt( "Floppytown_MapInit_Generation OK" )
    Map_Generation()
    Zips_Generation()
    PrinttPropsCount()
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
{ printt( "Models generated: " + PropsCount() + " | Maximum number of props that can be generated: " + ( 5179 - PropsCount() ) ) }

void function Map_Generation()
{
    Ft_Floor( FT_FLOOR_POS, FT_FLOOR_ANG, 6, 14, 1 )
    Building_01( FT_BUILDING_POS_01, FT_BUILDING_ANG_01 )
    Building_02( FT_BUILDING_POS_02, FT_BUILDING_ANG_02 )
    Building_03( FT_BUILDING_POS_03, FT_BUILDING_ANG_03 )
    Building_04( FT_BUILDING_POS_04, FT_BUILDING_ANG_04 )
    Building_05( FT_BUILDING_POS_05, FT_BUILDING_ANG_05 )
}

void function Zips_Generation()
{
    CreateFloppytownZiplineModel( FT_BUILDING_POS_01 + < 600, 0, 1792.1 >, < 0, -90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_01 + < -600, 256, 1792.1 >, < 0, 90, 0 > )
    CreateFloppytownZiplineModel( FT_BUILDING_POS_02 + < 640, 256, 1280 >, < 0, -90, 0 > )
}
