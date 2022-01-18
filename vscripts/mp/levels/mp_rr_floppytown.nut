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
asset Pipe_Grate                = $"mdl/desertlands/city_pipe_grate_medium_128.rmdl"
asset Space_Elevator            = $"mdl/levels_terrain/mp_rr_desertlands/desertlands_space_elevator_platform_01.rmdl"
asset Cargo_Small               = $"mdl/desertlands/industrial_cargo_container_small_03.rmdl"
asset Column_Stack              = $"mdl/desertlands/construction_bldg_column_stack_01.rmdl"
asset Mid_Platform              = $"mdl/levels_terrain/mp_rr_desertlands/desertlands_z12_mid_platform_01.rmdl"
asset Concrete_Panel            = $"mdl/desertlands/wall_city_panel_concrete_128_01.rmdl"
asset Box_Bottom_A              = $"mdl/desertlands/highrise_square_shell_box_bottom_a.rmdl"
asset Box_Bottom_B              = $"mdl/desertlands/highrise_square_shell_box_bottom_b.rmdl"
asset Cubemap                   = $"mdl/menu/menu_cubemap.rmdl"

vector FloppyTownPos   = < 0, 0, 0 > // map origin
vector FloppyTownAng   = < 0, 0, 0 > // map angles // not usable !

void function CodeCallback_MapInit()
{
    FloppyTown_MapInit_Common()

    printt( "Hello " + GetMapName() )

    InitializeProps()
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
{ printt( "Models generated: " + PropsCount() + " | Maximum number of props that can be generated: " + ( 8192 - PropsCount() ) ) }

void function InitializeProps()
{
    // Position of the construction area of the buildings
    vector areaPos = FloppyTownPos + < -5000, 0, 0 >
    vector areaAng = FloppyTownAng + < 0, 180, 0 >
    // Center of the construction area of the buildings
    vector areaCPos = areaPos + < 1480, 1232, 0 >
    vector areaCAng = areaAng + < 0, 0, 0 >

    PerimeterZone( FloppyTownPos, FloppyTownAng, areaCPos, areaCAng )
    Build_01_10( FloppyTownPos, FloppyTownAng, areaCPos, areaCAng )
    Build_11_20( FloppyTownPos, FloppyTownAng, areaCPos, areaCAng )

    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        AreaBuild( areaPos, areaAng, areaCPos, areaCAng )

        printt( "FT_Editing is Enable." )
    } else { printt( "FT_Editing is Disable." ) }
}

entity function CreateFloppytownModel( asset a, vector pos, vector ang, bool mantle = false, float fade = 20000, int realm = -1 )
{
    entity prop = CreatePropDynamic( a, pos, ang, SOLID_VPHYSICS, fade )
    prop.kv.fadedist = fade
    if( mantle ) prop.AllowMantle()
    if ( realm > -1 )
    { prop.RemoveFromAllRealms(); prop.AddToRealm( realm ) }
    prop.e.gameModeId = realm

    prop.SetScriptName( "FloppyTownEntities" )
    return prop
}
entity function CreateEditorRef( vector pos, vector ang, string name )
{
    entity editor_ref = CreatePropDynamic( Editor_Ref, pos, ang, SOLID_VPHYSICS, 20000 )
    SetTargetName( editor_ref, name )
    editor_ref.SetScriptName( "editor_ref" )
    return editor_ref
}

void function PerimeterZone( vector mapPos, vector mapAng, vector areaCPos, vector areaCAng )
{
    // var that need to be declared in each function //
    int SSB_UpTo0 = 128 // set to 0 Square_Shell_Box axis Z
    float SSB_UpTo0_Patch = SSB_UpTo0 - 0.1
    ///////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // FLOOR //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Floor_pos = mapPos
    array<int> Floor_int = [ 10, 14 ]

    for ( int i=0; i< Floor_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Floor_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Building_Platform, Floor_pos + <592*i, 352*j, 0>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // NORTH WALL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector North_Wall_pos = mapPos + <0, 4864, 0>
    array<int> North_Wall_001_int = [ 2, 10, 4, 10, 7, 10, 1, 12, 4, 10, 1, 12 ]

    for ( int i=0; i< North_Wall_001_int[ 0 ] ;i++ )
    {   for ( int j=0; j< North_Wall_001_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, North_Wall_pos + <0, 96, 0> + <529*i, 0, 200*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< North_Wall_001_int[ 2 ] ;i++ )
    {   for ( int j=0; j< North_Wall_001_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Square_Block, North_Wall_pos + <1160, 64/* 96 */, 0> + <260.7*i, 0, 224*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< North_Wall_001_int[ 4 ] ;i++ )
    {   for ( int j=0; j< North_Wall_001_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Square_Block, North_Wall_pos + <2202.8, 0, 0> + <260.7*i, 0, 224*j>,mapAng+ <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int j=0; j< North_Wall_001_int[ 5 ] ;j++ )
    {
        CreateFloppytownModel( Square_Block, North_Wall_pos + <2062, 140, 0> + <0, 0, 224*j>,mapAng+ <0, 90, 0>, true, 20000, -1 )
    }
    for ( int i=0; i< North_Wall_001_int[ 6 ] ;i++ )
    {   for ( int j=0; j< North_Wall_001_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, North_Wall_pos + <3900, 0, 0> + <529*i, 0, 200*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< North_Wall_001_int[ 8 ] ;i++ )
    {   for ( int j=0; j< North_Wall_001_int[ 9 ] ;j++ )
        {
            CreateFloppytownModel( Square_Block, North_Wall_pos + <4500, -64, 0> + <260.7*i, 0, 224*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< North_Wall_001_int[ 10 ] ;i++ )
    {   for ( int j=0; j< North_Wall_001_int[ 11 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, North_Wall_pos + <5044, -64, 0> + <529*i, 0, 200*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // SOUTH WALL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector South_Wall_pos = mapPos + <5888, 0, 0>
    array<int> South_Wall_001_int = [ 2, 13, 11, 12, 19, 11, 3, 14 ]

    for ( int i=0; i< South_Wall_001_int[ 0 ] ;i++ )
    {   for ( int j=0; j< South_Wall_001_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, South_Wall_pos + <-500, -80, 0> + <529*i, 0, 200*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< South_Wall_001_int[ 2 ] ;i++ )
    {   for ( int j=0; j< South_Wall_001_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Square_Block, South_Wall_pos + <-3400, 0, 0> + <260.7*i, 0, 224*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< South_Wall_001_int[ 4 ] ;i++ )
    {   for ( int j=0; j< South_Wall_001_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Wall_Pillar, South_Wall_pos + <-5840, -32, 0> + <128*i, 0, 286*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< South_Wall_001_int[ 6 ] ;i++ )
    {   for ( int j=0; j< South_Wall_001_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, South_Wall_pos + <-3400, -64, 0> + <529*i, 0, 200*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // WEST WALL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector West_Wall_pos = mapPos + <0, 0, 0>
    array<int> West_Wall_001_int = [ 13, 4, 11, 10, 1, 2, 1, 11 ]

    for ( int i=0; i< West_Wall_001_int[ 0 ] ;i++ )
    {   for ( int j=0; j< West_Wall_001_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Wall_Pillar, West_Wall_pos + <0, 0, 1716> + <0, 128*i, 286*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< West_Wall_001_int[ 2 ] ;i++ )
    {   for ( int j=0; j< West_Wall_001_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Square_Block, West_Wall_pos + <0, 1664, 0> + <0, 260.7*i, 224*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< West_Wall_001_int[ 4 ] ;i++ )
    {   for ( int j=0; j< West_Wall_001_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Wall_Pillar, West_Wall_pos + <0, 1536, 1144> + <0, 128*i, 286*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< West_Wall_001_int[ 6 ] ;i++ )
    {   for ( int j=0; j< West_Wall_001_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, West_Wall_pos + <-89, 4360, 0> + <0, 529*i, 200*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EAST WALL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector East_Wall_pos = mapPos + <5632, 4335, -0.1>
    array<int> East_Wall_001_int = [ 2, 13, 1, 12, 2, 14, 5, 12, 2, 14, 6, 13 ]

    for ( int i=0; i< East_Wall_001_int[ 0 ] ;i++ )
    {   for ( int j=0; j< East_Wall_001_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, East_Wall_pos + <0, 0, 0> + <0, 529*i, 200*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< East_Wall_001_int[ 2 ] ;i++ )
    {   for ( int j=0; j< East_Wall_001_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, East_Wall_pos + <0, -529, 0> + <0, 529*i, 200*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< East_Wall_001_int[ 4 ] ;i++ )
    {   for ( int j=0; j< East_Wall_001_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, East_Wall_pos + <0, -1058, 0> + <0, 529*i, 200*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< East_Wall_001_int[ 6 ] ;i++ )
    {   for ( int j=0; j< East_Wall_001_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Square_Block, East_Wall_pos + <0, -2600, 0> + <0, 260.7*i, 224*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< East_Wall_001_int[ 8 ] ;i++ )
    {   for ( int j=0; j< East_Wall_001_int[ 9 ] ;j++ )
        {
            CreateFloppytownModel( Slanted_Slice, East_Wall_pos + <0, -2730, 0> + <0, 529*i, 200*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< East_Wall_001_int[ 10 ] ;i++ )
    {   for ( int j=0; j< East_Wall_001_int[ 11 ] ;j++ )
        {
            CreateFloppytownModel( Square_Block, East_Wall_pos + <-64, -4450, 0> + <0, 260.7*i, 224*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // GRASS //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Grass_001_pos = mapPos + <128, 128, 10> //areaCPos // .z 0 - 20 ?
    array<int> Grass_001_int = [ 39, 38 ]

    for ( int i=0; i< Grass_001_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Grass_001_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Grass, Grass_001_pos + <147*i, 128*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 ).SetModelScale( 2 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        CreateEditorRef( mapPos, mapAng, "Spawn point Floppytown" )
        CreateEditorRef( mapPos + < (592*Floor_int[ 0 ]) / 2, (352*Floor_int[ 1 ]) / 2, 0 > , mapAng, "Center point Floppytown" )
        CreateEditorRef( Grass_001_pos, mapAng, "Grass 001" )
        CreateEditorRef( North_Wall_pos, mapAng, "North Wall" )
        CreateEditorRef( South_Wall_pos, mapAng, "South Wall" )
        CreateEditorRef( West_Wall_pos, mapAng, "West Wall" )
        CreateEditorRef( East_Wall_pos, mapAng, "East Wall" )
    }
}

void function Build_01_10( vector mapPos, vector mapAng, vector areaCPos, vector areaCAng )
{
    // var that need to be declared in each function //
    int SSB_UpTo0 = 128 // set to 0 Square_Shell_Box axis Z
    float SSB_UpTo0_Patch = SSB_UpTo0 - 0.1
    ///////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_001 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_001_pos = mapPos + <2664, 4352/* 4288 */, 0> //areaCPos
    array<int> Build_001_int = [ 2, 3, 9, 7, 1, 7 ]

    for ( int i=0; i< Build_001_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_001_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Building_Platform, Build_001_pos + <-592, -528, 1792.1> + <592*i, 352*j, 0>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_001_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_001_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_001_pos + <-592, -464, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, Build_001_pos + <592, -480, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 270, 0>, true, 20000, -1 )  
            CreateFloppytownModel( Square_Shell_Box, Build_001_pos + <-528, -528, SSB_UpTo0> + <128*i, 0, 256*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_001_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_001_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_001_pos + <568, -464, SSB_UpTo0_Patch> + <0, 128*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_002 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_002_pos = mapPos + <128, 4352, 0> //areaCPos
    array<int> Build_002_int = [ 3, 5, 3, 3, 2, 2, 4, 3, 2, 3, 1, 3, 1, 3, 2, 2, 2, 2, 3, 2, 3, 2 ]

    for ( int i=0; i< Build_002_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <0, 512, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <640, -128, 0> + <0, 256*i, 256*j>, mapAng + <0, -90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <640, 128, 768> + <0, 256*i, 256*j>, mapAng + <0, -90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 6 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <-128, -384, 0> + <0, 256*i, 256*j>, mapAng + <0, -90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 8 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 9 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <0, -512, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 10 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 11 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <512, -256, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 12 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 13 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <384, -384, 0> + <256*i, 0, 256*j>, mapAng + <0, -90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 14 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 15 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_002_pos + <0, -384, 768> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Ceiling, Build_002_pos + <256, -384, 768> + <256, 256, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
    for ( int i=0; i< Build_002_int[ 16 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 17 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <-128, 128, 768> + <0, 256*i, 256*j>, mapAng + <0, -90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 18 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 19 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_002_pos + <0, 0, 768> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_002_int[ 20 ] ;i++ )
    {   for ( int j=0; j< Build_002_int[ 21 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_002_pos + <0, 128, 1280> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_003 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_003_pos = mapPos + <64, 3328, 0> //areaCPos
    array<int> Build_003_int = [ 1, 3, 6, 5, 1, 3, 1, 3, 1, 2 ]

    for ( int i=0; i< Build_003_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_003_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Mini_Ceiling, Build_003_pos+ <0, -256, 0> + <0*i, 256*j, 1280>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_003_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_003_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_003_pos + <64, -320, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_003_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_003_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_003_pos + <64, 448, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Mini_Ceiling, Build_003_pos + <0, 384, 768>, mapAng + <0, 0, 0>, true, 20000, -1 )
    for ( int i=0; i< Build_003_int[ 6 ] ;i++ )
    {   for ( int j=0; j< Build_003_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_003_pos + <0, -384, 640> + <0, 128*i, 256*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_003_int[ 8 ] ;i++ )
    {   for ( int j=0; j< Build_003_int[ 9 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_003_pos + <0, 384, 896> + <0, 128*i, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 ) //330
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_004 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_004_pos = mapPos + <128, 2560, 0> //areaCPos
    array<int> Build_004_int = [ 3, 2, 1, 3, 1, 2 ]

    for ( int i=0; i< Build_004_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_004_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_004_pos + <128, -256, 0> + <0, 256*i, 256*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_004_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_004_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_004_pos + <0, -256, 512> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_004_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_004_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_004_pos + <0, 384, 0> + <0, 256*i, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_005 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_005_pos = mapPos + <128, 1856, 0> //areaCPos
    array<int> Build_005_int = [ 5, 5, 1, 3, 1, 2 ]

    for ( int i=0; i< Build_005_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_005_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_005_pos + <128, -256, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Space_Elevator, Build_005_pos + <0, 0, 1220>, mapAng + <0, 90, 0>, true, 20000, -1 )
    for ( int i=0; i< Build_005_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_005_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_005_pos + <0, 324, 512> + <0, 256*i, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Frame, Build_005_pos + <0, -304, 1248>, mapAng + <0, 180, 0>, true, 20000, -1 )

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_006 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_006_pos = mapPos + <128, 1152, 0> //areaCPos
    array<int> Build_006_int = [ 3, 7, 1, 3, 1, 3, 1, 7, 2, 4 ]

    for ( int i=0; i< Build_006_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_006_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_006_pos + <256, -256, 0> + <0, 256*i, 256*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
        }
    }
    //CreateFloppytownModel( Space_Elevator, Build_006_pos + <0, 0, 1220>, mapAng + <0, 90, 0>, true, 20000, -1 )
    for ( int i=0; i< Build_006_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_006_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_006_pos + <0, -256, 1792> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_006_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_006_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Mini_Ceiling, Build_006_pos + <192, -256, 1792> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_006_int[ 6 ] ;i++ )
    {   for ( int j=0; j< Build_006_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_006_pos + <192, 384, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_006_int[ 8 ] ;i++ )
    {   for ( int j=0; j< Build_006_int[ 9 ] ;j++ )
        {
            CreateFloppytownModel( Cargo_Small, Build_006_pos + <-128, 384, 1279.9> + <128*i, 0, 128*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_007 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_007_pos = mapPos + <128, 128, 0> //areaCPos
    array<int> Build_007_int = [ 5, 2, 2, 1, 1, 2, 2, 2, 1, 7, 1, 9, 1, 9, 3, 8, 1, 9, 1, 16, 4, 3, 2, 1, 2, 9, 1, 4, 1, 8, 1, 2, 1, 2, 3, 2 ]

    for ( int i=0; i< Build_007_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_007_pos + <0, 0, 2304> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_007_pos + <0, 512, 2304> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <1152, 0, 2048> + <256*i, 256*j, 0>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 6 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <0, 640, 1792> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 8 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 9 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <256, 640, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 10 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 11 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <512, 384, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 12 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 13 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <1024, 384, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 14 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 15 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <1280, 384, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 16 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 17 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <384, 512, 0> + <0, 256*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 18 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 19 ] ;j++ )
        {
            CreateFloppytownModel( Concrete_Panel, Build_007_pos + <1920, 320, 0> + <0, 128*i, 128*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 20 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 21 ] ;j++ )
        {
            CreateFloppytownModel( Concrete_Panel, Build_007_pos + <1920, -64, 1664> + <0, 128*i, 128*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 22 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 23 ] ;j++ )
        {
            CreateFloppytownModel( Mid_Platform, Build_007_pos + <1344, 128, 2048> + <384*i, 384*j, 0>, mapAng + <0, -90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 24 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 25 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_007_pos + <896, 192, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, Build_007_pos + <640, 192, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 270, 0>, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, Build_007_pos + <704, 128, SSB_UpTo0> + <128*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 26 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 27 ] ;j++ )
        {
            CreateFloppytownModel( Box_Bottom_A, Build_007_pos + <512, 384, 768> + <0, 0*i, 512*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
            CreateFloppytownModel( Box_Bottom_B, Build_007_pos + <1024, 384, 768> + <0, 0*i, 512*j>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Mini_Ceiling, Build_007_pos + <768, 448, 2560>, mapAng + <0, 90, 0>, true, 20000, -1 )
    for ( int i=0; i< Build_007_int[ 28 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 29 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_007_pos + <768, 256, 256> + <0*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 30 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 31 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <768, 384, 512> + <0, 256*i, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
            CreateFloppytownModel( Thunderdome_Wall, Build_007_pos + <768, 384, 1536> + <0, 256*i, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 32 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 33 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Frame, Build_007_pos + <768, 384, 768> + <0, 256*i, 1024*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_007_int[ 34 ] ;i++ )
    {   for ( int j=0; j< Build_007_int[ 35 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_007_pos + <1280, 0, 2016> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_008 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_008_pos = mapPos + <2048+512, 128, 0> //areaCPos
    array<int> Build_008_int = [ 2, 1, 8, 13, 4, 2 ]

    for ( int i=0; i< Build_008_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_008_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Mid_Platform, Build_008_pos + <-256, 64, 1664> + <512*i, 0*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_008_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_008_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Concrete_Panel, Build_008_pos + <-448, 256, 0> + <128*i, 0, 128*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_008_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_008_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_008_pos + <-384, -128, 1632> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_009 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_009_pos = mapPos + <3456, 128, 0> //areaCPos
    array<int> Build_009_int = [ 2, 1, 3, 8, 3, 2, 2, 8 ]

    for ( int i=0; i< Build_009_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_009_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Mid_Platform, Build_009_pos + <-192, 128, 2048> + <384*i, 384*j, 0>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_009_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_009_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_009_pos + <-256, 384, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_009_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_009_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_009_pos + <-256, 0, 2016> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_009_int[ 6 ] ;i++ )
    {   for ( int j=0; j< Build_009_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_009_pos + <384, 0, 0> + <0, 256*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
            CreateFloppytownModel( Thunderdome_Wall, Build_009_pos + <-384, 0, 0> + <0, 256*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_010 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_010_pos = mapPos + <4352, 128, 0> //areaCPos
    array<int> Build_010_int = [ 4, 1, 4, 5 ]

    for ( int i=0; i< Build_010_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_010_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_010_pos + <-384, 0, 1280> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_010_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_010_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_010_pos + <-384, 128, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        CreateEditorRef( Build_001_pos, mapAng, "Build 001" )
        CreateEditorRef( Build_002_pos, mapAng, "Build 002" )
        CreateEditorRef( Build_003_pos, mapAng, "Build 003" )
        CreateEditorRef( Build_004_pos, mapAng, "Build 004" )
        CreateEditorRef( Build_005_pos, mapAng, "Build 005" )
        CreateEditorRef( Build_006_pos, mapAng, "Build 006" )
        CreateEditorRef( Build_007_pos, mapAng, "Build 007" )
        CreateEditorRef( Build_008_pos, mapAng, "Build 008" )
        CreateEditorRef( Build_009_pos, mapAng, "Build 009" )
        CreateEditorRef( Build_010_pos, mapAng, "Build 010" )
    }
}

void function Build_11_20( vector mapPos, vector mapAng, vector areaCPos, vector areaCAng )
{
    // var that need to be declared in each function //
    int SSB_UpTo0 = 128 // set to 0 Square_Shell_Box axis Z
    float SSB_UpTo0_Patch = SSB_UpTo0 - 0.1
    ///////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_011 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_011_pos = mapPos + <5376, 128, 0> //areaCPos
    array<int> Build_011_int = [ 2, 3, 2, 8, 2, 8, 4, 8, 4, 8 ]

    for ( int i=0; i< Build_011_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_011_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_011_pos + <-128, 0, 2048> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Ceiling, Build_011_pos + <-384, 0, 2048>, mapAng + <0, 0, 0>, true, 20000, -1 )
    for ( int i=0; i< Build_011_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_011_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_011_pos + <-512, -64, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_011_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_011_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_011_pos + <-448, 128, SSB_UpTo0> + <128*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_011_int[ 6 ] ;i++ )
    {   for ( int j=0; j< Build_011_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_011_pos + <-192, 640, SSB_UpTo0> + <128*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_011_int[ 8 ] ;i++ )
    {   for ( int j=0; j< Build_011_int[ 9 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_011_pos + <-256, 192, SSB_UpTo0> + <0, 128*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_012 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_012_pos = mapPos + <5504, 1920, 0> //areaCPos
    array<int> Build_012_int = [ 2, 5, 2, 4, 2, 9, 2, 9, 1, 5, 1, 5, 4, 9, 1, 9, 1, 2, 1, 3, 2, 4, 2, 1 ]

    for ( int i=0; i< Build_012_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_012_pos + <-640, 0, 0> + <0, 256*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_012_pos + <-384, 0, 1280> + <0, 256*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_012_pos + <-384, 512, 0> + <0, 256*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 6 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_012_pos + <-256, -128, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 8 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 9 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_012_pos + <-512, -128, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 10 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 11 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_012_pos + <-512, 384, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 12 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 13 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_012_pos + <-320, 1024, SSB_UpTo0_Patch> + <128*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 14 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 15 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_012_pos + <-384, 960, SSB_UpTo0_Patch> + <0, 128*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }

    for ( int i=0; i< Build_012_int[ 16 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 17 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_012_pos + <-512, 0, 1280> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 18 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 19 ] ;j++ )
        {
            CreateFloppytownModel( Mid_Platform, Build_012_pos + <-128, 64, 2304> + <0*i, 384*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 20 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 21 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_012_pos + <-256, 0, 2272> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_012_int[ 22 ] ;i++ )
    {   for ( int j=0; j< Build_012_int[ 23 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Mini_Ceiling, Build_012_pos + <-256, 960, 2272> + <256*i, 256*j, 0>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_013 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_013_pos = mapPos + <5504, 3072, 0> //areaCPos
    array<int> Build_013_int = [ 1, 5, 15, 7, 2, 8 ]

    for ( int i=0; i< Build_013_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_013_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Mid_Platform, Build_013_pos + <-128, 64, 1792> + <0*i, 384*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_013_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_013_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, Build_013_pos + <-384, -64, SSB_UpTo0_Patch> + <0, 128*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_013_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_013_int[ 5 ] ;j++ )
        {
           CreateFloppytownModel( Thunderdome_Ceiling, Build_013_pos + <-256, 0, 1760> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_014 // BUILD TEMPLATE //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_014_pos = mapPos + <4608, 4352, 0> //areaCPos
    array<int> Build_014_int = [ 4, 4, 4, 4, 2, 3, 4, 4 ]

    for ( int i=0; i< Build_014_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_014_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_014_pos + <-512, -384, 0> + <0, 256*i, 256*j>, mapAng + <0, 90, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_014_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_014_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, Build_014_pos + <-384, -512, 0> + <256*i, 0, 256*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_014_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_014_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Mid_Platform, Build_014_pos + <-256, -320, 1024> + <512*i, 384*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_014_int[ 6 ] ;i++ )
    {   for ( int j=0; j< Build_014_int[ 7 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_014_pos + <-384, -384, 992> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_015 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_015_pos = mapPos + <1408, 4480+128, 0> //areaCPos
    array<int> Build_015_int = [ 7, 1, 11, 1, 0, 0 ]

    for ( int i=0; i< Build_015_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_015_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Pipe_Grate, Build_015_pos + <-384, 32, 1024> + <128*i, 0*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
            CreateFloppytownModel( Pipe_Grate, Build_015_pos + <-384, -32, 1024> + <128*i, 0*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_015_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_015_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Pipe_Grate, Build_015_pos + <-640, 96, 1024> + <128*i, 0*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
            CreateFloppytownModel( Pipe_Grate, Build_015_pos + <-640, -96, 1024> + <128*i, 0*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        CreateEditorRef( Build_011_pos, mapAng, "Build 011" )
        CreateEditorRef( Build_012_pos, mapAng, "Build 012" )
        CreateEditorRef( Build_013_pos, mapAng, "Build 013" )
        CreateEditorRef( Build_014_pos, mapAng, "Build 014" )
        CreateEditorRef( Build_015_pos, mapAng, "Build 015" )
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // OTHER //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    CreateFloppytownModel( Cubemap, <10600, 29200, -26000>, mapAng + <0, 0, 0>, true, 20000, -1 ).SetModelScale( 15 ) // Hides the tear under the skybox

    /*
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_010 // BUILD TEMPLATE //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector Build_010_pos = areaCPos //mapPos + <0, 0, 0> //areaCPos
    array<int> Build_010_int = [ 0, 0, 0, 0, 0, 0 ]

    for ( int i=0; i< Build_010_int[ 0 ] ;i++ )
    {   for ( int j=0; j< Build_010_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Mid_Platform, Build_010_pos + <0, 0, 0> + <512*i, 0*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_010_int[ 2 ] ;i++ )
    {   for ( int j=0; j< Build_010_int[ 3 ] ;j++ )
        {
            CreateFloppytownModel( Concrete_Panel, Build_010_pos + <0, 0, 0> + <128*i, 0, 128*j>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    for ( int i=0; i< Build_010_int[ 4 ] ;i++ )
    {   for ( int j=0; j< Build_010_int[ 5 ] ;j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, Build_010_pos + <0, 0, 0> + <256*i, 256*j, 0>, mapAng + <0, 0, 0>, true, 20000, -1 )
        }
    }
    */
}

void function AreaBuild( vector areaPos, vector areaAng, vector areaCPos, vector areaCAng )
{
    array<int> AreaBuild_int = [ 5, 7 ]

    for ( int i=0; i< AreaBuild_int[ 0 ] ;i++ )
    {   for ( int j=0; j< AreaBuild_int[ 1 ] ;j++ )
        {
            CreateFloppytownModel( Building_Platform, areaPos + <592*i, 352*j, 0>, areaAng , true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        CreateEditorRef( areaPos, areaAng, "Spawn point Area Build" )
        CreateEditorRef( areaCPos, areaAng, "Center point Area Build" ) 
    }
}
