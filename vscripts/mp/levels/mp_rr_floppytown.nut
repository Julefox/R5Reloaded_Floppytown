global function CodeCallback_MapInit

asset Editor_Ref                = $"mdl/dev/editor_ref.rmdl"
asset Building_Platform         = $"mdl/desertlands/construction_bldg_platform_02.rmdl"
asset Thunderdome_Wall          = $"mdl/thunderdome/thunderdome_cage_wall_256x256_01.rmdl"
asset Thunderdome_Ceiling       = $"mdl/thunderdome/thunderdome_cage_ceiling_256x256_06.rmdl"
asset Thunderdome_Mini_Ceiling  = $"mdl/thunderdome/thunderdome_cage_ceiling_256x128_06.rmdl"
asset Thunderdome_Frame         = $"mdl/thunderdome/thunderdome_cage_frame_256_01.rmdl"
asset Square_Block              = $"mdl/desertlands/highrise_Square_Block_03.rmdl"
asset Grass                     = $"mdl/foliage/icelandic_moss_grass_02.rmdl"
asset Wall_Pillar               = $"mdl/desertlands/desertlands_city_slanted_building_01_wall_pillar_64.rmdl"
asset Slanted_Slice             = $"mdl/desertlands/desertlands_city_slanted_building_01_slice_01.rmdl"
asset Square_Shell_Box          = $"mdl/desertlands/highrise_square_shell_box_128_c.rmdl"
asset Space_Elevator            = $"mdl/levels_terrain/mp_rr_desertlands/desertlands_space_elevator_platform_01.rmdl"
asset Cargo_Small               = $"mdl/desertlands/industrial_cargo_container_small_03.rmdl"
asset Column_Stack              = $"mdl/desertlands/construction_bldg_column_stack_01.rmdl"
asset Mid_Platform              = $"mdl/levels_terrain/mp_rr_desertlands/desertlands_z12_mid_platform_01.rmdl"
asset Concrete_Panel            = $"mdl/desertlands/wall_city_panel_concrete_128_01.rmdl"
asset Box_Bottom_A              = $"mdl/desertlands/highrise_square_shell_box_bottom_a.rmdl"
asset Box_Bottom_B              = $"mdl/desertlands/highrise_square_shell_box_bottom_b.rmdl"
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
    vector North_Wall_pos = pos + <-600, 4930,0>

    array<int> North_Wall_001_int = [2,10, 11,10, 1,12, 4,9, 1,11]

    for (int i=0; i< North_Wall_001_int[0] ;i++)
    {   for ( int j=0; j< North_Wall_001_int[1] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,North_Wall_pos + <0,0,0> + <529*i,0,200*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< North_Wall_001_int[2] ;i++)
    {   for ( int j=0; j< North_Wall_001_int[3] ;j++)
        {
            CreateFloppytownModel(Square_Block,North_Wall_pos + <1160,0,0> + <260.7*i,0,224*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< North_Wall_001_int[4] ;i++)
    {   for ( int j=0; j< North_Wall_001_int[5] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,North_Wall_pos + <3900,0,0> + <529*i,0,200*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< North_Wall_001_int[6] ;i++)
    {   for ( int j=0; j< North_Wall_001_int[7] ;j++)
        {
            CreateFloppytownModel(Square_Block,North_Wall_pos + <4500,0,0> + <260.7*i,0,224*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    for (int i=0; i< North_Wall_001_int[8] ;i++)
    {   for ( int j=0; j< North_Wall_001_int[9] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,North_Wall_pos + <5300,0,0> + <529*i,0,200*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // SOUTH WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector South_Wall_001_pos = pos + <5300, -20,0>

    array<int> South_Wall_001_int = [2,9, 11,9, 20,10, 3,13]

    for (int i=0; i< South_Wall_001_int[0] ;i++)
    {   for (int j=0; j< South_Wall_001_int[1] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,South_Wall_001_pos + <-500,0,0> + <529*i,0,200*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< South_Wall_001_int[2] ;i++)
    {   for ( int j=0; j< South_Wall_001_int[3] ;j++)
        {
            CreateFloppytownModel(Square_Block,South_Wall_001_pos + <-3400,0,0> + <260.7*i,0,224*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< South_Wall_001_int[4] ;i++)
    {   for ( int j=0; j< South_Wall_001_int[5] ;j++)
        {
            CreateFloppytownModel(Wall_Pillar,South_Wall_001_pos + <-6000,-32,0> + <128*i,0,286*j>,ang + <0,270,0>,true,20000,-1)
        }
    }
    for (int i=0; i< South_Wall_001_int[6] ;i++)
    {   for (int j=0; j< South_Wall_001_int[7] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,South_Wall_001_pos + <-3400,0,0> + <529*i,0,200*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // WEST WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector West_Wall_001_pos = pos + <-592,-410,0>
    array<int> West_Wall_001_int = [12,10]

    for (int i=0; i< West_Wall_001_int[0] ;i++)
    {   for ( int j=0; j< West_Wall_001_int[1] ;j++)
        {
            CreateFloppytownModel(Wall_Pillar,West_Wall_001_pos + <0,0,0> + <0,128*i,286*j>,ang + <0,180,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EAST WALL
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector East_Wall_001_pos = pos + <5300, 4330,0>

    array<int> East_Wall_001_int = [2,13, 1,12, 2,14, 5,9, 2,12, 6,10]

    for (int i=0; i< East_Wall_001_int[0] ;i++)
    {   for (int j=0; j< East_Wall_001_int[1] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,East_Wall_001_pos + <0,0,0> + <0,529*i,200*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< East_Wall_001_int[2] ;i++)
    {   for (int j=0; j< East_Wall_001_int[3] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,East_Wall_001_pos + <0,-529,0> + <0,529*i,200*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< East_Wall_001_int[4] ;i++)
    {   for (int j=0; j< East_Wall_001_int[5] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,East_Wall_001_pos + <0,-1058,0> + <0,529*i,200*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< East_Wall_001_int[6] ;i++)
    {   for ( int j=0; j< East_Wall_001_int[7] ;j++)
        {
            CreateFloppytownModel(Square_Block,East_Wall_001_pos + <0,-2600,0> + <0,260.7*i,224*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< East_Wall_001_int[8] ;i++)
    {   for (int j=0; j< East_Wall_001_int[9] ;j++)
        {
            CreateFloppytownModel(Slanted_Slice,East_Wall_001_pos + <0,-2730,0> + <0,529*i,200*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< East_Wall_001_int[10] ;i++)
    {   for ( int j=0; j< East_Wall_001_int[11] ;j++)
        {
            CreateFloppytownModel(Square_Block,East_Wall_001_pos + <0,-4450,0> + <0,260.7*i,224*j>,ang + <0,90,0>,true,20000,-1)
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

    //CreateFloppytownModel(Editor_Ref, Build_001_pos,ang + <0,270,0>,true,20000,-1)
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
    vector Build_002_pos = pos + <-462,4820,0>

    array<int> Build_002_int = [3,5, 3,3, 2,2, 4,3, 2,3, 1,3, 1,3, 2,2, 2,2, 3,2, 3,2]

    //CreateFloppytownModel(Editor_Ref, Build_002_pos,ang + <0,0,0>,true,20000,-1)
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
    // BUILD_003
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_003_pos = pos + <-528,3218,0>

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
    vector Build_004_pos = pos + <-464,2524,0>

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
    vector Build_005_pos = pos + <-464,1830,0>

    array<int> Build_005_int = [5,5, 1,3, 1,2]

    //CreateFloppytownModel(Editor_Ref, Build_005_pos, ang + <0,180,0>,true,20000,-1)
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
    // BUILD_006
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_006_pos = pos + <-464,1140,0>

    array<int> Build_006_int = [3,7, 1,3, 1,3, 1,7, 2,4]

    //CreateFloppytownModel(Editor_Ref, Build_006_pos, ang + <0,180,0>,true,20000,-1)
    for (int i=0; i< Build_006_int[0] ;i++)
    {   for (int j=0; j< Build_006_int[1] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_006_pos + <256,-256,0> + <0,256*i,256*j>, ang + <0,270,0>,true,20000,-1)
        }
    }
    //CreateFloppytownModel(Space_Elevator, Build_006_pos + <0,0,1220>, ang + <0,90,0>,true,20000,-1)
    for (int i=0; i< Build_006_int[2] ;i++)
    {   for ( int j=0; j< Build_006_int[3] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Build_006_pos + <0,-256,1792> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_006_int[4] ;i++)
    {   for ( int j=0; j< Build_006_int[5] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Mini_Ceiling, Build_006_pos + <192,-256,1792> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_006_int[6] ;i++)
    {   for (int j=0; j< Build_006_int[7] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box, Build_006_pos + <192,384,128> + <0,128*i,256*j>, ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_006_int[8] ;i++)
    {   for (int j=0; j< Build_006_int[9] ;j++)
        {
            CreateFloppytownModel(Cargo_Small, Build_006_pos + <-128,384,1279.9> + <128*i,0,128*j>, ang + <0,0,0>,true,20000,-1)
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_007
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_007_pos = pos + <-420,100,0>

    array<int> Build_007_int = [5,2, 2,1, 1,2, 2,2, 1,7, 1,9, 1,9, 3,8, 1,9, 1,16, 4,3, 2,1, 2,9, 1,4, 1,8, 1,2, 1,2]

    //CreateFloppytownModel(Editor_Ref, Build_007_pos, ang + <0,180,0>,true,20000,-1)
    for (int i=0; i< Build_007_int[0] ;i++)
    {   for ( int j=0; j< Build_007_int[1] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Build_007_pos + <0,0,2304> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[2] ;i++)
    {   for ( int j=0; j< Build_007_int[3] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Build_007_pos + <0,512,2304> + <256*i,256*j,0>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[4] ;i++)
    {   for ( int j=0; j< Build_007_int[5] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <1152,0,2048> + <256*i,256*j,0>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[6] ;i++)
    {   for ( int j=0; j< Build_007_int[7] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <0,640,1792> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[8] ;i++)
    {   for ( int j=0; j< Build_007_int[9] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <256,640,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[10] ;i++)
    {   for ( int j=0; j< Build_007_int[11] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <512,384,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[12] ;i++)
    {   for ( int j=0; j< Build_007_int[13] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <1024,384,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[14] ;i++)
    {   for ( int j=0; j< Build_007_int[15] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <1280,384,0> + <256*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[16] ;i++)
    {   for ( int j=0; j< Build_007_int[17] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <384,512,0> + <0,256*i,256*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[18] ;i++)
    {   for ( int j=0; j< Build_007_int[19] ;j++)
        {
            CreateFloppytownModel(Concrete_Panel, Build_007_pos + <1920,320,0> + <0,128*i,128*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[20] ;i++)
    {   for ( int j=0; j< Build_007_int[21] ;j++)
        {
            CreateFloppytownModel(Concrete_Panel, Build_007_pos + <1920,-64,1664> + <0,128*i,128*j>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[22] ;i++)
    {   for ( int j=0; j< Build_007_int[23] ;j++)
        {
            CreateFloppytownModel(Mid_Platform, Build_007_pos + <1344,128,2048> + <384*i,384*j,0>,ang + <0,90,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[24] ;i++)
    {   for ( int j=0; j< Build_007_int[25] ;j++)
        {
            CreateFloppytownModel(Square_Shell_Box, Build_007_pos + <896,192,110> + <0,128*i,256*j>,ang + <0,90,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box, Build_007_pos + <640,192,110> + <0,128*i,256*j>,ang + <0,270,0>,true,20000,-1)
            CreateFloppytownModel(Square_Shell_Box, Build_007_pos + <704,128,110> + <128*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[26] ;i++)
    {   for ( int j=0; j< Build_007_int[27] ;j++)
        {
            CreateFloppytownModel(Box_Bottom_A, Build_007_pos + <512,384,768> + <0,0*i,512*j>,ang + <0,180,0>,true,20000,-1)
            CreateFloppytownModel(Box_Bottom_B, Build_007_pos + <1024,384,768> + <0,0*i,512*j>,ang + <0,180,0>,true,20000,-1)
        }
    }
    CreateFloppytownModel(Thunderdome_Mini_Ceiling, Build_007_pos + <768,448,2560>,ang + <0,90,0>,true,20000,-1)
    for (int i=0; i< Build_007_int[28] ;i++)
    {   for ( int j=0; j< Build_007_int[29] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Ceiling, Build_007_pos + <768,256,256> + <0*i,0,256*j>,ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[30] ;i++)
    {   for (int j=0; j< Build_007_int[31] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <768,384,512> + <0,256*i,256*j>, ang + <0,0,0>,true,20000,-1)
            CreateFloppytownModel(Thunderdome_Wall, Build_007_pos + <768,384,1536> + <0,256*i,256*j>, ang + <0,0,0>,true,20000,-1)
        }
    }
    for (int i=0; i< Build_007_int[32] ;i++)
    {   for (int j=0; j< Build_007_int[33] ;j++)
        {
            CreateFloppytownModel(Thunderdome_Frame, Build_007_pos + <768,384,768> + <0,256*i,1024*j>, ang + <0,0,0>,true,20000,-1)
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