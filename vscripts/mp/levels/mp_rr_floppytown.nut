global function CodeCallback_MapInit

asset Editor_Ref            = $"mdl/dev/editor_ref.rmdl"
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
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // FLOOR
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    int Floor_Heigth            = 10;   int Floor_Width             = 15

    for (int i=0; i< Floor_Heigth ;i++)
    {   for (int j=0; j< Floor_Width ;j++)
        {
            CreateFloppytownModel(Building_Platform,pos + <592*i,352*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // NORTH WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    int North_Wall_Length_001   = 23;   int North_Wall_Heigth_001   = 10

    for (int i=0; i< North_Wall_Length_001 ;i++)
    {   for ( int j=0; j< North_Wall_Heigth_001 ;j++)
        {
            CreateFloppytownModel(Square_Block,pos + <-466,4928.8,0> + <260.7*i,0,224*j>,ang + <0,180,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // SOUTH WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    int South_Wall_Length_001   = 23;   int South_Wall_Heigth_001   = 7

    for (int i=0; i< South_Wall_Length_001 ;i++)
    {   for (int j=0; j< South_Wall_Heigth_001 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <-462,-360,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // WEST WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    int West_Wall_Length_001    = 21;   int West_Wall_Heigth_001    = 7

    //for (int i=0; i< West_Wall_Length_001 ;i++)
    //{   for (int j=0; j< West_Wall_Heigth_001 ;j++)
    //    {
    //        CreateFloppytownModel(Thunderdome_Wall,pos + <-598,-300,0> + <0,256*i,256*j>,ang + <0,90,0>,true,20000,-1)
    //    }
    //}

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EAST WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    int East_Wall_Length_001    = 21;   int East_Wall_Heigth_001    = 7

    for (int i=0; i< East_Wall_Length_001 ;i++)
    {   for (int j=0; j< East_Wall_Heigth_001 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <5307,-300,0> + <0,256*i,256*j>,ang + <0,90,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILDING_002
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    int Grass_Heigth_001        = 40;   int Grass_Width_001         = 40

    for (int i=0; i< Grass_Heigth_001 ;i++)
    {   for (int j=0; j< Grass_Width_001 ;j++)
        {
            CreateFloppytownModel(Grass,pos + <-530,-206,0> + <147*i,128*j,0>,ang + <0,0,0>,true,20000,-1).SetModelScale(2)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILDING_001
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Building_001 = pos + <2552, 4390,0>
    int Building_001_01         = 2;    int Building_001_02         = 3
    int Building_001_03         = 9;    int Building_001_04         = 7
    int Building_001_05         = 1;    int Building_001_06         = 7

    //CreateFloppytownModel(Editor_Ref, Building_001,ang + <0,270,0>,true,20000,-1)
    for (int i=0; i< Building_001_01 ;i++)
    {   for ( int j=0; j< Building_001_02 ;j++)
        {
            CreateFloppytownModel(Building_Platform,Building_001 + <-592,-528,1786> + <592*i,352*j,0>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_001_03 ;i++) // 1152
    {   for ( int j=0; j< Building_001_04 ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box,Building_001 + <-592,-512,110> + <0,128*i,256*j>,ang + <0,90,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box,Building_001 + <-512,540,110> + <128*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box,Building_001 + <592,-512,110> + <0,128*i,256*j>,ang + <0,270,0>,true,20000,-1)  
            CreateFloppytownModel(Square_Shell_Box,Building_001 + <-512,-540,110> + <128*i,0,256*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_001_05 ;i++)
    {   for ( int j=0; j< Building_001_06 ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box,Building_001 + <568,512,109.9> + <0,128*i,256*j>,ang + <180,90,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box,Building_001 + <-568,-512,109.9> + <0,128*i,256*j>,ang + <180,270,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILDING_002
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Building_002 = pos + <-466,4928.8,0>
    int Building_002_01         = 3;    int Building_002_02         = 5
    int Building_002_03         = 3;    int Building_002_04         = 3
    int Building_002_05         = 2;    int Building_002_06         = 2
    int Building_002_07         = 4;    int Building_002_08         = 3
    int Building_002_09         = 2;    int Building_002_10         = 3
    int Building_002_11         = 1;    int Building_002_12         = 3
    int Building_002_13         = 1;    int Building_002_14         = 3
    int Building_002_15         = 2;    int Building_002_16         = 2
    int Building_002_17         = 2;    int Building_002_18         = 2
    int Building_002_19         = 3;    int Building_002_20         = 2
    int Building_002_21         = 3;    int Building_002_22         = 2

    //CreateFloppytownModel(Editor_Ref, Building_002,ang + <0,0,0>,true,20000,-1)
    for (int i=0; i< Building_002_01 ;i++)
    {   for ( int j=0; j< Building_002_02 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_03 ;i++)
    {   for ( int j=0; j< Building_002_04 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <640,-640,0> + <0,256*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_05 ;i++)
    {   for ( int j=0; j< Building_002_06 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <640,-384,768> + <0,256*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_07 ;i++)
    {   for ( int j=0; j< Building_002_08 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <-128,-896,0> + <0,256*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_09 ;i++)
    {   for ( int j=0; j< Building_002_10 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <0,-1024,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_11 ;i++)
    {   for ( int j=0; j< Building_002_12 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <512,-768,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_13 ;i++)
    {   for ( int j=0; j< Building_002_14 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <384,-896,0> + <256*i,0,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Building_002_15 ;i++)
    {   for ( int j=0; j< Building_002_16 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Building_002 + <0,-896,768> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }
    CreateFloppytownModel(Thunderdome_Ceiling, Building_002 + <256,-896,768> + <256,256,0>,ang + <0,0,0>,true,20000,-1)
    for (int i=0; i< 2 ;i++)
    {   for ( int j=0; j< 2 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <-128,-384,768> + <0,256*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< 3 ;i++)
    {   for ( int j=0; j< 2 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Building_002 + <0,-512,768> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< 3 ;i++)
    {   for ( int j=0; j< 2 ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Building_002 + <0,-384,1280> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILDING_003
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Building_003 = pos + <1000,1500,0>
    int Building_003_01         = 6;    int Building_003_02         = 3
    int Building_003_03         = 0;    int Building_003_04         = 0

    CreateFloppytownModel(Editor_Ref, Building_003, ang + <0,270,0>,true,20000,-1)
    for (int i=0; i< 3 ;i++)
    {   for ( int j=0; j< 2 ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box, Building_003 + <0,0,0>, ang + <0,0,0>,true,20000,-1)
        }
    }
    


    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // GEOFIX
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    int Geofix_001              = 0;    int Geofix_002              = 0

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // OTHER
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    CreateFloppytownModel(Cubemap, <10600, 29200, -26000>,ang + <0,0,0>,true,20000,-1).SetModelScale(15) // Hides the tear under the skybox


}