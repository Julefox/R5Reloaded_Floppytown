global function CodeCallback_MapInit

asset Editor_Ref                = $"mdl/dev/editor_ref.rmdl"
asset Building_Platform         = $"mdl/desertlands/construction_bldg_platform_02.rmdl"
asset Thunderdome_Wall          = $"mdl/thunderdome/thunderdome_cage_wall_256x256_01.rmdl"
asset Thunderdome_Ceiling       = $"mdl/thunderdome/thunderdome_cage_ceiling_256x256_06.rmdl"
asset Thunderdome_Mini_Ceiling  = $"mdl/thunderdome/thunderdome_cage_ceiling_256x128_06.rmdl"
asset Square_Block              = $"mdl/desertlands/highrise_Square_Block_03.rmdl"
asset Grass                     = $"mdl/foliage/icelandic_moss_grass_02.rmdl"
asset Wall_Pillar               = $"mdl/desertlands/desertlands_city_slanted_building_01_wall_pillar_64.rmdl"
asset Square_Shell_Box          = $"mdl/desertlands/highrise_square_shell_box_128_c.rmdl"
asset Space_Elevator            = $"mdl/levels_terrain/mp_rr_desertlands/desertlands_space_elevator_platform_01.rmdl"
asset Cubemap                   = $"mdl/menu/menu_cubemap.rmdl"


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
    array<int> Floor = [10,15]

    for (int i=0; i< Floor[0] ;i++)
    {   for (int j=0; j< Floor[1] ;j++)
        {
            CreateFloppytownModel(Building_Platform,pos + <592*i,352*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // NORTH WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    array<int> North_Wall_001_int = [23,10]

    for (int i=0; i< North_Wall_001_int[0] ;i++)
    {   for ( int j=0; j< North_Wall_001_int[1] ;j++)
        {
            CreateFloppytownModel(Square_Block,pos + <-466,4928.8,0> + <260.7*i,0,224*j>,ang + <0,180,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // SOUTH WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    array<int> South_Wall_001_int = [23,7]

    for (int i=0; i< South_Wall_001_int[0] ;i++)
    {   for (int j=0; j< South_Wall_001_int[1] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <-462,-360,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // WEST WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    array<int> West_Wall_001_int = [21,7]

    //for (int i=0; i< West_Wall_001_int[0] ;i++)
    //{   for (int j=0; j< West_Wall_001_int[1] ;j++)
    //    {
    //        CreateFloppytownModel(Thunderdome_Wall,pos + <-598,-300,0> + <0,256*i,256*j>,ang + <0,90,0>,true,20000,-1)
    //    }
    //}

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EAST WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    array<int> East_Wall_001_int = [21,7]

    for (int i=0; i< East_Wall_001_int[0] ;i++)
    {   for (int j=0; j< East_Wall_001_int[1] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall,pos + <5307,-300,0> + <0,256*i,256*j>,ang + <0,90,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // GRASS
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    array<int> Grass_001_int = [40,40]

    for (int i=0; i< Grass_001_int[0] ;i++)
    {   for (int j=0; j< Grass_001_int[1] ;j++)
        {
            CreateFloppytownModel(Grass,pos + <-530,-206,0> + <147*i,128*j,0>,ang + <0,0,0>,true,20000,-1).SetModelScale(2)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_001
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_001_pos = pos + <2552, 4390,0>

    array<int> Build_001_int = [2,3, 9,7, 1,7]

    //CreateFloppytownModel(Editor_Ref, Building_001,ang + <0,270,0>,true,20000,-1)
    for (int i=0; i< Build_001_int[0] ;i++)
    {   for ( int j=0; j< Build_001_int[1] ;j++)
        {
            CreateFloppytownModel(Building_Platform,Build_001_pos + <-592,-528,1792.1> + <592*i,352*j,0>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_001_int[2] ;i++) // 1152
    {   for ( int j=0; j< Build_001_int[3] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box,Build_001_pos + <-592,-512,128> + <0,128*i,256*j>,ang + <0,90,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box,Build_001_pos + <-512,540,128> + <128*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box,Build_001_pos + <592,-512,128> + <0,128*i,256*j>,ang + <0,270,0>,true,20000,-1)  
            CreateFloppytownModel(Square_Shell_Box,Build_001_pos + <-512,-540,128> + <128*i,0,256*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_001_int[4] ;i++)
    {   for ( int j=0; j< Build_001_int[5] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box,Build_001_pos + <568,512,127.9> + <0,128*i,256*j>,ang + <180,90,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box,Build_001_pos + <-568,-512,127.9> + <0,128*i,256*j>,ang + <180,270,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_002
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_002_pos = pos + <-466,4928.8,0>

    array<int> Build_002_int = [3,5, 3,3, 2,2, 4,3, 2,3, 1,3, 1,3, 2,2, 2,2, 3,2, 3,2]

    //CreateFloppytownModel(Editor_Ref, Building_002,ang + <0,0,0>,true,20000,-1)
    for (int i=0; i< Build_002_int[0] ;i++)
    {   for ( int j=0; j< Build_002_int[1] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[2] ;i++)
    {   for ( int j=0; j< Build_002_int[3] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <640,-640,0> + <0,256*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[4] ;i++)
    {   for ( int j=0; j< Build_002_int[5] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <640,-384,768> + <0,256*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[6] ;i++)
    {   for ( int j=0; j< Build_002_int[7] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <-128,-896,0> + <0,256*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[8] ;i++)
    {   for ( int j=0; j< Build_002_int[9] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <0,-1024,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[10] ;i++)
    {   for ( int j=0; j< Build_002_int[11] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <512,-768,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[12] ;i++)
    {   for ( int j=0; j< Build_002_int[13] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <384,-896,0> + <256*i,0,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[14] ;i++)
    {   for ( int j=0; j< Build_002_int[15] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Build_002_pos + <0,-896,768> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }
    CreateFloppytownModel(Thunderdome_Ceiling, Build_002_pos + <256,-896,768> + <256,256,0>,ang + <0,0,0>,true,20000,-1)
    for (int i=0; i< Build_002_int[16] ;i++)
    {   for ( int j=0; j< Build_002_int[17] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <-128,-384,768> + <0,256*i,256*j>,ang + <0,-90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[18] ;i++)
    {   for ( int j=0; j< Build_002_int[19] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_002_pos + <0,-512,768> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_002_int[20] ;i++)
    {   for ( int j=0; j< Build_002_int[21] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Build_002_pos + <0,-384,1280> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILDING_003
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_003_pos = pos + <-528,3328,0>

    array<int> Build_003_int = [1,2, 5,5, 2,3, 1,3, 1,2]

    //CreateFloppytownModel(Editor_Ref, Build_003_pos, ang + <0,180,0>,true,20000,-1)
    for (int i=0; i< Build_003_int[0] ;i++)
    {   for (int j=0; j< Build_003_int[1] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Mini_Ceiling, Build_003_pos+ <0,-192,0> + <0*i,256*j,1280>, ang + <0,0,0>,true,20000,-1)
        }
    }
    CreateFloppytownModel(Thunderdome_Mini_Ceiling, Build_003_pos + <-0.1,208,1279.1>, ang + <0,0,0>,true,20000,-1)
    for (int i=0; i< Build_003_int[2] ;i++)
    {   for ( int j=0; j< Build_003_int[3] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box, Build_003_pos + <64,-256,128> + <0,128*i,256*j>, ang + <0,270,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_003_int[4] ;i++)
    {   for ( int j=0; j< Build_003_int[5] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box, Build_003_pos + <64,384,128> + <0,128*i,256*j>, ang + <0,270,0>,true,20000,-1)
        }
    }
    CreateFloppytownModel(Thunderdome_Mini_Ceiling, Build_003_pos + <0,448,768>, ang + <0,0,0>,true,20000,-1)
    for (int i=0; i< Build_003_int[6] ;i++)
    {   for ( int j=0; j< Build_003_int[7] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box, Build_003_pos + <0,-320,640> + <0,128*i,256*j>, ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_003_int[8] ;i++)
    {   for ( int j=0; j< Build_003_int[9] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box, Build_003_pos + <0,320,896> + <0,128*i,256*j>, ang + <0,0,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_004
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_004_pos = pos + <-464,2624,0>

    array<int> Build_004_int = [3,2, 1,3, 1,2]

    //CreateFloppytownModel(Editor_Ref, Build_004_pos, ang + <0,180,0>,true,20000,-1)
    for (int i=0; i< Build_004_int[0] ;i++)
    {   for (int j=0; j< Build_004_int[1] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_004_pos + <128,-256,0> + <0,256*i,256*j>, ang + <0,270,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_004_int[2] ;i++)
    {   for ( int j=0; j< Build_004_int[3] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Build_004_pos + <0,-256,512> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_004_int[4] ;i++)
    {   for ( int j=0; j< Build_004_int[5] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_004_pos + <0,384,0> + <0,256*i,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_005
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_005_pos = pos + <-464,1914,0>

    array<int> Build_005_int = [5,5, 1,3, 1,2]

    CreateFloppytownModel(Editor_Ref, Build_005_pos, ang + <0,180,0>,true,20000,-1)
    for (int i=0; i< Build_005_int[0] ;i++)
    {   for (int j=0; j< Build_005_int[1] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box, Build_005_pos + <128,-256,128> + <0,128*i,256*j>, ang + <0,270,0>,true,20000,-1)
        }
    }
    CreateFloppytownModel(Space_Elevator, Build_005_pos + <0,0,1220>, ang + <0,90,0>,true,20000,-1)
    for (int i=0; i< Build_005_int[2] ;i++)
    {   for ( int j=0; j< Build_005_int[3] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_005_pos + <0,324,512> + <0,256*i,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // GEOFIX
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Geofix_000_pos = <0,0,0>

    array<int> Geofix_000_int = [0,0]

    //

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // OTHER
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    CreateFloppytownModel(Cubemap, <10600, 29200, -26000>,ang + <0,0,0>,true,20000,-1).SetModelScale(15) // Hides the tear under the skybox


}