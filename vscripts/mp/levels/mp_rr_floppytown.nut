global function CodeCallback_MapInit

asset Building_Platform     = $"mdl/desertlands/construction_bldg_platform_02.rmdl"
asset Thunderdome_Wall      = $"mdl/thunderdome/thunderdome_cage_wall_256x256_01.rmdl"
asset Thunderdome_Ceiling   = $"mdl/thunderdome/thunderdome_cage_ceiling_256x256_06.rmdl"
asset Square_Block          = $"mdl/desertlands/highrise_Square_Block_03.rmdl"
asset Grass                 = $"mdl/foliage/icelandic_moss_grass_02.rmdl"
asset Wall_Pillar           = $"mdl/desertlands/desertlands_city_slanted_building_01_wall_pillar_64.rmdl"
asset Square_Shell_Box      = $"mdl/desertlands/highrise_square_shell_box_128_c.rmdl"
asset Cubemap               = $"mdl/menu/menu_cubemap.rmdl"

array<vector> FloppyTownBuildPos   = [<0,0,0>]
array<vector> FloppyTownBuildAng   = [<0,0,0>]

void function CodeCallback_MapInit()
{
    FloppyTown_MapInit_Common()

    printt("Hello " + GetMapName())

    SpawnAllProps()
	PrinttPropsCount()
}

int function PropsCount()
{
    int count = 0
	foreach( EntitiesCount in GetPropsCount() )
	{ count++ }
	return count
}
array<entity> function GetPropsCount()
{
    array<entity> EntitiesCount = GetEntArrayByScriptName( "FloppyTownEntities" )
    return EntitiesCount
}
void function PrinttPropsCount()
{ printt("Models generated: " + PropsCount() + " | " + "Maximum number of props that can be generated: " + (8192 - PropsCount())) }

void function SpawnAllProps()
{
    for (int i=0; i<FloppyTownBuildPos.len() && FloppyTownBuildAng.len(); i++)
    { SpawnMap(FloppyTownBuildPos[i],FloppyTownBuildAng[i]) }
}

entity function CreateFloppytownModel(asset a, vector pos, vector ang, bool mantle = false, float fade = 20000, int realm = -1)
{
    entity prop = CreatePropDynamic(a,pos,ang,SOLID_VPHYSICS,fade)
    prop.kv.fadedist = fade
    if(mantle) prop.AllowMantle()
    if (realm > -1)
    { prop.RemoveFromAllRealms(); prop.AddToRealm(realm) }
    prop.e.gameModeId = realm

    prop.SetScriptName( "FloppyTownEntities" )
    return prop
}

void function SpawnMap(vector pos, vector ang)
{
    int Floor_Heigth            = 10;   int Floor_Width             = 15

    int North_Wall_Length_001   = 23;   int North_Wall_Heigth_001   = 10

    int South_Wall_Length_001   = 23;   int South_Wall_Heigth_001   = 7

    int West_Wall_Length_001    = 21;   int West_Wall_Heigth_001    = 7

    int East_Wall_Length_001    = 21;   int East_Wall_Heigth_001    = 7

    int Grass_Heigth_001        = 40;   int Grass_Width_001         = 40

    int Building_001_01         = 2;    int Building_001_02         = 3
    int Building_001_03         = 9;    int Building_001_04         = 7

    int Building_002_01         = 2;    int Building_002_02         = 5
    int Building_002_03         = 3;    int Building_002_04         = 5
    int Building_002_05         = 3;    int Building_002_06         = 2
    int Building_002_07         = 1;    int Building_002_08         = 3
    int Building_002_09         = 2;    int Building_002_10         = 2
    
    int Geofix_001              = 1;    int Geofix_002              = 7

    for (int i=0; i< Floor_Heigth ;i++)
    {   for (int j=0; j< Floor_Width ;j++)
        {
            CreateFloppytownModel(Building_Platform,pos + <592*i,352*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< North_Wall_Length_001 ;i++)
    {   for ( int j=0; j< North_Wall_Heigth_001 ;j++)
        {
            CreateFloppytownModel(Square_Block,pos + <-466,4928.8,0> + <260.7*i,0,224*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< South_Wall_Length_001 ;i++)
    {   for (int j=0; j< South_Wall_Heigth_001 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <-462,-360,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< West_Wall_Length_001 ;i++)
    {   for (int j=0; j< West_Wall_Heigth_001 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <-598,-300,0> + <0,256*i,256*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< East_Wall_Length_001 ;i++)
    {   for (int j=0; j< East_Wall_Heigth_001 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <5307,-300,0> + <0,256*i,256*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Grass_Heigth_001 ;i++)
    {   for (int j=0; j< Grass_Width_001 ;j++)
        {
            CreateFloppytownModel(Grass,pos + <-530,-206,0> + <147*i,128*j,0>,ang + <0,0,0>,true,20000,-1).SetModelScale(2)
        }
    }
    ///// BUILDING_001 /////
    for (int i=0; i< Building_001_01 ;i++)
    {   for ( int j=0; j< Building_001_02 ;j++)
        {
            CreateFloppytownModel(Building_Platform,pos + <1750,3880,1786> + <592*i,352*j,0>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_001_03 ;i++)
    {   for ( int j=0; j< Building_001_04 ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box,pos + <1750,3956,110> + <0,128*i,256*j>,ang + <0,90,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box,pos + <1804,3880,110> + <128*i,0,256*j>,ang + <0,180,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box,pos + <2932,3930,110> + <0,128*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Geofix_001 ;i++)
    {   for ( int j=0; j< Geofix_002 ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box,pos + <2908,3948,110> + <0,128*i,256*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    ///// BUILDING_001 /////
    ///// BUILDING_002 /////
    for (int i=0; i< Building_002_01 ;i++)
    {   for ( int j=0; j< Building_002_02 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <170,4546,0> + <0,256*i,256*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_03 ;i++)
    {   for ( int j=0; j< Building_002_04 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <-464,4426,0> + <256*i,0,256*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_05 ;i++)
    {   for ( int j=0; j< Building_002_06 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling,pos + <-464,4546,1272> + <256*i,256*j,0>,ang + <0,180,0>,true,20000,-1)
            CreateFloppytownModel(Thunderdome_Wall,pos + <-462,3928.8,0> + <256*j,0,256*i>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_07 ;i++)
    {   for ( int j=0; j< Building_002_08 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <46,4170,0> + <256*i,0,256*j>,ang + <0,180,0>,true,20000,-1)
            CreateFloppytownModel(Thunderdome_Wall,pos + <170,4290,0> + <256*i,0,256*j>,ang + <0,90,0>,true,20000,-1)
            CreateFloppytownModel(Thunderdome_Wall,pos + <-73,4048,0> + <256*i,0,256*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_09 ;i++)
    {   for ( int j=0; j< Building_002_10 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling,pos + <-450,4048,768.2> + <256*i,256*j,0>,ang + <0,180,0>,true,20000,-1)
        }
    }
    //CreateFloppytownModel(Thunderdome_Ceiling,pos + <-450,4048,768.4> + <256*2,256,0>,ang + <0,180,0>,true,20000,-1) // same props
    //CreateFloppytownModel(Thunderdome_Ceiling,pos + <170,4290,768.2> + <0,0,0>,ang + <0,180,0>,true,20000,-1)

    //CreateFloppytownModel(Thunderdome_Ceiling,   pos + <0,0,2000>,ang + <0,0,0>,true,20000,-1)
    //CreateFloppytownModel(Thunderdome_Ceiling,   pos + <0,0,2256>,ang + <0,0,0>,true,20000,-1)
    //CreateFloppytownModel(Thunderdome_Wall,      pos + <0,128,2000>,ang + <0,0,0>,true,20000,-1)
    //CreateFloppytownModel(Thunderdome_Wall,      pos + <0,0,2000>,ang + <0,0,0>,true,20000,-1)
    //CreateFloppytownModel(Thunderdome_Wall,      pos + <0,-128,2000>,ang + <0,0,0>,true,20000,-1)
    //CreateFloppytownModel(Thunderdome_Wall,      pos + <0,-128,2256>,ang + <0,0,0>,true,20000,-1)
    ///// BUILDING_002 /////

    CreateFloppytownModel(Cubemap, <10600, 29200, -26000>,ang + <0,0,0>,true,20000,-1).SetModelScale(15) // Hides the tear under the skybox
}