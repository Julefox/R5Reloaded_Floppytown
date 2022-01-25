global function CodeCallback_MapInit

// Map Assets
asset Building_Platform         = $"mdl/desertlands/construction_bldg_platform_02.rmdl"
asset Building_Platform_Large   = $"mdl/desertlands/construction_bldg_platform_01.rmdl"
asset Thunderdome_Wall          = $"mdl/thunderdome/thunderdome_cage_wall_256x256_01.rmdl"
asset Thunderdome_Ceiling       = $"mdl/thunderdome/thunderdome_cage_ceiling_256x256_06.rmdl"
asset Thunderdome_Mini_Ceiling  = $"mdl/thunderdome/thunderdome_cage_ceiling_256x128_06.rmdl"
asset Thunderdome_Frame         = $"mdl/thunderdome/thunderdome_cage_frame_256_01.rmdl"
asset Thunderdome_Wall_256x352  = $"mdl/thunderdome/thunderdome_cage_wall_256x352_01.rmdl"
asset Thunderdome_Wall_512x352   = $"mdl/thunderdome/thunderdome_cage_wall_512x352_01.rmdl"
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
// Zipline Stuff
asset Security_Fence            = $"mdl/industrial/security_fence_post.rmdl"
asset Zip_Arm                   = $"mdl/industrial/zipline_arm.rmdl"
// Dev Assets
asset Editor_Ref                = $"mdl/dev/editor_ref.rmdl"
asset Cubemap                   = $"mdl/menu/menu_cubemap.rmdl"

vector FloppyTownPos   = < 0, 0, 0 > // map origin // Zips appear with "mp_rr_floppytown_scripts.ent", map position change is not available anymore !
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
array< entity > function GetPropsCount()
{
    array< entity > EntitiesCount = GetEntArrayByScriptName( "FloppyTownEntities" )
    return EntitiesCount
}
void function PrinttPropsCount()
{ printt( "Models generated: " + PropsCount() + " | Maximum number of props that can be generated: " + ( 5179 - PropsCount() ) ) }

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
    Build_21_30( FloppyTownPos, FloppyTownAng, areaCPos, areaCAng )

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
    if ( realm> -1 )
    { prop.RemoveFromAllRealms(); prop.AddToRealm( realm ) }
    prop.e.gameModeId = realm
    prop.SetScriptName( "FloppyTownEntities" )
    return prop
}
array< entity > function CreateFloppytownZiplineModel( vector pos, vector ang )
{
    entity column   = CreateFloppytownModel( Security_Fence, pos, ang, true, 20000, -1 )
    entity support  = CreateFloppytownModel( Zip_Arm, pos + < 0, 0, 185 >, ang, true, 20000, -1 )

    return [ column, support ]
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
    vector floorPos = mapPos
    array< int > floorInt = [ 5, 14, 1, 3 ] // to make it easier to reference buildings put "6" in "floorInt[ 0 ]"

    for ( int i = 0 ; i < floorInt[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < floorInt[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Building_Platform_Large, floorPos + < 1024 * i, 352 * j, 0 >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < floorInt[ 2 ] ; i++ )
    {   for ( int j = 0; j < floorInt[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Building_Platform_Large, floorPos + <5120, 704, 0> + <1024 * i, 352 * j, 0>, mapAng + <0, 180, 0>, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // NORTH WALL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector northWallPos = mapPos + <0, 4864, 0>
    array< int > northWallInt = [ 1, 4, 1, 10, 4, 10, 4, 2, 3, 10, 2, 1, 12, 4, 6, 1, 7 ]

    for ( int i = 0 ; i < northWallInt[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < northWallInt[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, northWallPos + < 0, 96, 1200 > + < 529 * i, 0, 200 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < northWallInt[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < northWallInt[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, northWallPos + < 529, 96, 0 > + < 529 * i, 0, 200 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < northWallInt[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < northWallInt[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, northWallPos + < 1160, 64, 0 > + < 260.7 * i, 0, 224 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < northWallInt[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < northWallInt[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, northWallPos + < 2202.8, 0, 1792 > + < 260.7 * i, 0, 224 * j >,mapAng+ < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < northWallInt[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < northWallInt[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, northWallPos + < 3245.6, 0, 0 > + < 260.7 * i, 0, 224 * j >,mapAng+ < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int j = 0 ; j < northWallInt[ 10 ] ; j++ )
    {
        CreateFloppytownModel( Square_Block, northWallPos + < 2062, 140, 1792 > + < 0, 0, 224 * j >,mapAng+ < 0, 90, 0 >, true, 20000, -1 )
    }
    for ( int i = 0 ; i < northWallInt[ 11 ] ; i++ )
    {   for ( int j = 0 ; j < northWallInt[ 12 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, northWallPos + < 3900, 0, 0 > + < 529 * i, 0, 200 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < northWallInt[ 13 ] ; i++ )
    {   for ( int j = 0 ; j < northWallInt[ 14 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, northWallPos + < 4500, -64, 896 > + < 260.7 * i, 0, 224 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < northWallInt[ 15 ] ; i++ )
    {   for ( int j = 0 ; j < northWallInt[ 16 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, northWallPos + < 5044, -64, 1000 > + < 529 * i, 0, 200 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // SOUTH WALL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector southWallPos = mapPos + < 5888, 0, 0 >
    array< int > southWallInt = [ 2, 3, 5, 7, 1, 3, 19, 4, 3, 6 ]

    for ( int i = 0 ; i < southWallInt[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < southWallInt[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, southWallPos + < -500, -80, 2000 > + < 529 * i, 0, 200 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < southWallInt[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < southWallInt[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, southWallPos + < -2097.3, 0, 1120 > + < 260.7 * i, 0, 224 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < southWallInt[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < southWallInt[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, southWallPos + < -2358, 0, 2016 > + < 260.7 * i, 0, 224 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < southWallInt[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < southWallInt[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Wall_Pillar, southWallPos + < -5840, -32, 2002 > + < 128 * i, 0, 286 * j >, mapAng + < 0, 270, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < southWallInt[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < southWallInt[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, southWallPos + < -3400, -64, 1600 > + < 529 * i, 0, 200 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // WEST WALL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector westWallPos = mapPos + < 0, 0, 0 >
    array< int > westWallInt = [ 13, 4, 2, 5, 6, 8, 2, 5, 3, 7, 1, 2, 1, 5 ]

    for ( int i = 0 ; i < westWallInt[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < westWallInt[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Wall_Pillar, westWallPos + < -32, 0, 1716 > + < 0, 128 * i, 286 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < westWallInt[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < westWallInt[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, westWallPos + < 0, 1664, 1120 > + < 0, 260.7 * i, 224 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < westWallInt[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < westWallInt[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, westWallPos + < 0, 1664, 448 > + < 0, 260.7 * i, 224 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < westWallInt[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < westWallInt[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, westWallPos + < 0, 3228.2, 1120 > + < 0, 260.7 * i, 224 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < westWallInt[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < westWallInt[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, westWallPos + < 0, 3749.6, 672 > + < 0, 260.7 * i, 224 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < westWallInt[ 10 ] ; i++ )
    {   for ( int j = 0 ; j < westWallInt[ 11 ] ; j++ )
        {
            CreateFloppytownModel( Wall_Pillar, westWallPos + < -32, 1536, 1144 > + < 0, 128 * i, 286 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < westWallInt[ 12 ] ; i++ )
    {   for ( int j = 0 ; j < westWallInt[ 13 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, westWallPos + < -89, 4360, 1200 > + < 0, 529 * i, 200 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EAST WALL //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector eastWallPos = mapPos + < 5632, 4335, -0.1 >
    array< int > eastWallInt = [ 2, 4, 2, 5, 5, 2, 2, 14, 2, 13, 3, 4 ]

    for ( int i = 0 ; i < eastWallInt[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < eastWallInt[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, eastWallPos + < 0, 0, 1600 > + < 0, 529 * i, 200 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < eastWallInt[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < eastWallInt[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, eastWallPos + < 0, -1058, 1600 > + < 0, 529 * i, 200 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < eastWallInt[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < eastWallInt[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, eastWallPos + < 0, -2600, 2240 > + < 0, 260.7 * i, 224 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < eastWallInt[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < eastWallInt[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Slanted_Slice, eastWallPos + < 0, -2730, 0 > + < 0, 529 * i, 200 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < eastWallInt[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < eastWallInt[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, eastWallPos + < -64, -3500, 0 > + < 0, 260.7 * i, 224 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < eastWallInt[ 10 ] ; i++ )
    {   for ( int j = 0 ; j < eastWallInt[ 11 ] ; j++ )
        {
            CreateFloppytownModel( Square_Block, eastWallPos + < -64, -3500-782.1, 2016 > + < 0, 260.7 * i, 224 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // GRASS // NEED TO BE FIXED
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector grassPos = mapPos + < 128, 128, 10 > //areaCPos // .z 0 - 20 ?
    array< int > grassInt = [ 39, 38 ]

    /* for ( int i = 0 ; i < grassInt[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < grassInt[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Grass, grassPos + < 147 * i, 128 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 ).SetModelScale( 2 )
        }
    }*/

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        CreateEditorRef( mapPos, mapAng, "Spawn point Floppytown" )
        CreateEditorRef( mapPos + < ( 1024 * floorInt[ 0 ] ) / 2, ( 352 * floorInt[ 1 ] ) / 2, 0 > , mapAng, "Center point Floppytown" )
        CreateEditorRef( grassPos, mapAng, "Grass 001" )
        CreateEditorRef( northWallPos, mapAng, "North Wall" )
        CreateEditorRef( southWallPos, mapAng, "South Wall" )
        CreateEditorRef( westWallPos, mapAng, "West Wall" )
        CreateEditorRef( eastWallPos, mapAng, "East Wall" )
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
    vector build001Pos = mapPos + < 2664, 4352, 0 > //areaCPos//
    array< int > build001Int = [ 2, 3, 9, 7, 1, 7, 3, 1, 8, 1, 2, 1, 4, 2 ]

    for ( int i = 0 ; i < build001Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build001Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Building_Platform, build001Pos + < -592, -528, 1792.1 > + < 592 * i, 352 * j, 0 >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build001Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build001Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build001Pos + < -592, -464, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, build001Pos + < 592, -480, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 270, 0 >, true, 20000, -1 )  
            CreateFloppytownModel( Square_Shell_Box, build001Pos + < -528, -528, SSB_UpTo0 > + < 128 * i, 0, 256 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build001Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build001Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build001Pos + < 568, -464, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build001Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build001Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build001Pos + < 592, -864, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, build001Pos + < -464, -850, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build001Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build001Int[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build001Pos + < -400, -912, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Square_Shell_Box, build001Pos + < 568, -848, SSB_UpTo0_Patch >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
    for ( int i = 0 ; i < build001Int[ 10 ] ; i++ )
    {   for ( int j = 0 ; j < build001Int[ 11 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build001Pos + < -256+64, -720, 256 > + < 512 * i, 0 * j, 0 >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build001Int[ 12 ] ; i++ )
    {   for ( int j = 0 ; j < build001Int[ 13 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build001Pos + < -384+64, -784, 192 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    // Ziplines
    CreateFloppytownZiplineModel( build001Pos + < 600, 0, 1792.1 >, < 0, -90, 0 > )
    CreateFloppytownZiplineModel( build001Pos + < -600, 256, 1792.1 >, < 0, 90, 0 > )

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_002 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build002Pos = mapPos + < 128, 4352, 0 > //areaCPos//
    array< int > build002Int = [ 3, 5, 3, 3, 2, 2, 4, 3, 2, 3, 1, 3, 1, 3, 2, 2, 2, 2, 3, 2, 3, 2, 1, 2]

    //for ( int i = 0 ; i < build002Int[ 0 ] ; i++ )  // Side of the building not visible //
    //{   for ( int j = 0 ; j < build002Int[ 1 ] ; j++ )
    //    {
    //        CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 0, 512, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
    //    }
    //}
    for ( int i = 0 ; i < build002Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 640, -128, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build002Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 640, 128, 768 > + < 0, 256 * i, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    //for ( int i = 0 ; i < build002Int[ 6 ] ; i++ )  // Side of the building not visible //
    //{   for ( int j = 0 ; j < build002Int[ 7 ] ; j++ )
    //    {
    //        CreateFloppytownModel( Thunderdome_Wall, build002Pos + < -128, -384, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
    //    }
    //}
    for ( int i = 0 ; i < build002Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 0, -512, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build002Int[ 10 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 11 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 512, -256, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build002Int[ 12 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 13 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 384, -384, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build002Int[ 14 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 15 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build002Pos + < 0, -384, 768 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Ceiling, build002Pos + < 256, -384, 768 > + < 256, 256, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
    //for ( int i = 0 ; i < build002Int[ 16 ] ; i++ ) // Side of the building not visible //
    //{   for ( int j = 0 ; j < build002Int[ 17 ] ; j++ )
    //    {
    //        CreateFloppytownModel( Thunderdome_Wall, build002Pos + < -128, 128, 768 > + < 0, 256 * i, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
    //    }
    //}
    for ( int i = 0 ; i < build002Int[ 18 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 19 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 0, 0, 768 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build002Int[ 20 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 21 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build002Pos + < 0, 128, 1280 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build002Int[ 22 ] ; i++ )
    {   for ( int j = 0 ; j < build002Int[ 23 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 896, 128, -96 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Thunderdome_Ceiling, build002Pos + < 767.6, 128, 200 > + < 256 * i, 256 * j, 0 >, mapAng + < 25, 0, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Wall, build002Pos + < 768, 0, -96 > , mapAng + < 0, 0, 0 >, true, 20000, -1 )
    CreateFloppytownModel( Thunderdome_Mini_Ceiling, build002Pos + < 760, 12, 148 > , mapAng + < -65, 0, 90 >, true, 20000, -1 )

    // Ziplines
    CreateFloppytownZiplineModel( build002Pos + < 640, 256, 1280 >, < 0, -90, 0 > )

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_003 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build003Pos = mapPos + < 64, 3328, 0 > //areaCPos//
    array< int > build003Int = [ 1, 3, 6, 5, 1, 3, 2, 3, 1, 2 ]

    for ( int i = 0 ; i < build003Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build003Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Mini_Ceiling, build003Pos+ < 0, -256, 0 > + < 0 * i, 256 * j, 1280 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build003Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build003Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build003Pos + < 64, -320, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 270, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build003Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build003Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build003Pos + < 64, 448, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 270, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Mini_Ceiling, build003Pos + < 0, 384, 768 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
    for ( int i = 0 ; i < build003Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build003Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build003Pos + < -128, -384, 640 > + < 128 * i, 0, 256 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build003Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build003Int[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build003Pos + < 0, 384, 896 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 ) //330
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_004 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build004Pos = mapPos + < 128, 2560, 0 > //areaCPos//
    array< int > build004Int = [ 3, 2, 1, 3, 1, 2 ]

    for ( int i = 0 ; i < build004Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build004Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build004Pos + < 128, -256, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 270, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build004Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build004Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build004Pos + < 0, -256, 512 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build004Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build004Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build004Pos + < 0, 384, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_005 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build005Pos = mapPos + < 128, 1856, 0 > //areaCPos//
    array< int > build005Int = [ 5, 5, 1, 3, 1, 2 ]

    for ( int i = 0 ; i < build005Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build005Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build005Pos + < 128, -256, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 270, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Space_Elevator, build005Pos + < 0, 0, 1220 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
    for ( int i = 0 ; i < build005Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build005Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build005Pos + < 0, 324, 512 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Frame, build005Pos + < 0, -304, 1248 >, mapAng + < 0, 180, 0 >, true, 20000, -1 )

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_006 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build006Pos = mapPos + < 128, 1152, 0 > //areaCPos//
    array< int > build006Int = [ 3, 7, 1, 3, 1, 3, 1, 7, 2, 4 ]

    for ( int i = 0 ; i < build006Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build006Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build006Pos + < 256, -256, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 270, 0 >, true, 20000, -1 )
        }
    }
    //CreateFloppytownModel( Space_Elevator, build006Pos + < 0, 0, 1220 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
    for ( int i = 0 ; i < build006Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build006Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build006Pos + < 0, -256, 1792 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build006Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build006Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Mini_Ceiling, build006Pos + < 192, -256, 1792 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build006Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build006Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build006Pos + < 192, 384, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build006Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build006Int[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Cargo_Small, build006Pos + < -128, 384, 1279.9 > + < 128 * i, 0, 128 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_007 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build007Pos = mapPos + < 128, 128, 0 > //areaCPos//
    array< int > build007Int = [ 5, 2, 2, 1, 1, 2, 2, 2, 1, 7, 1, 9, 1, 9, 3, 8, 1, 9, 1, 16, 4, 3, 2, 1, 2, 9, 1, 4, 1, 8, 1, 2, 1, 2, 3, 2 ]

    for ( int i = 0 ; i < build007Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build007Pos + < 0, 0, 2304 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build007Pos + < 0, 512, 2304 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 1152, 0, 2048 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 0, 640, 1792 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 256, 640, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 10 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 11 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 512, 384, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 12 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 13 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 1024, 384, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 14 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 15 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 1280, 384, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 16 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 17 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 384, 512, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 18 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 19 ] ; j++ )
        {
            CreateFloppytownModel( Concrete_Panel, build007Pos + < 1920, 320, 0 > + < 0, 128 * i, 128 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 20 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 21 ] ; j++ )
        {
            CreateFloppytownModel( Concrete_Panel, build007Pos + < 1920, -64, 1664 > + < 0, 128 * i, 128 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 22 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 23 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build007Pos + < 1344, 128, 2048 > + < 384 * i, 384 * j, 0 >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 24 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 25 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build007Pos + < 896, 192, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, build007Pos + < 640, 192, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 270, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, build007Pos + < 704, 128, SSB_UpTo0 > + < 128 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 26 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 27 ] ; j++ )
        {
            CreateFloppytownModel( Box_Bottom_A, build007Pos + < 512, 384, 768 > + < 0, 0 * i, 512 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Box_Bottom_B, build007Pos + < 1024, 384, 768 > + < 0, 0 * i, 512 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Mini_Ceiling, build007Pos + < 768, 448, 2560 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
    for ( int i = 0 ; i < build007Int[ 28 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 29 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build007Pos + < 768, 256, 256 > + < 0 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 30 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 31 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 768, 384, 512 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Thunderdome_Wall, build007Pos + < 768, 384, 1536 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 32 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 33 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Frame, build007Pos + < 768, 384, 768 > + < 0, 256 * i, 1024 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build007Int[ 34 ] ; i++ )
    {   for ( int j = 0 ; j < build007Int[ 35 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build007Pos + < 1280, 0, 2016 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    // Ziplines
    CreateFloppytownModel( Zip_Arm, build007Pos + < 1152, 384, 2176 >, mapAng + < 0, -90, 0 >, true, 20000, -1 )

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_008 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build008Pos = mapPos + < 2048+512, 128, 0 > //areaCPos//
    array< int > build008Int = [ 2, 1, 8, 13, 4, 2 ]

    for ( int i = 0 ; i < build008Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build008Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build008Pos + < -256, 64, 1664 > + < 512 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build008Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build008Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Concrete_Panel, build008Pos + < -448, 256, 0 > + < 128 * i, 0, 128 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build008Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build008Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build008Pos + < -384, -128, 1632-32 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_009 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build009Pos = mapPos + < 3456, 128, 0 > //areaCPos//
    array< int > build009Int = [ 2, 1, 3, 8, 3, 2, 2, 2, 2, 3, 1, 6 ]

    for ( int i = 0 ; i < build009Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build009Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build009Pos + < -192, 128, 2048 > + < 384 * i, 384 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build009Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build009Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build009Pos + < -256, 384, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build009Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build009Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build009Pos + < -256, 0, 1984 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build009Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build009Int[ 7 ] ; j++ )
        { 
            CreateFloppytownModel( Thunderdome_Wall, build009Pos + < -384, 0, 1536 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build009Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build009Int[ 9 ] ; j++ )
        { 
            CreateFloppytownModel( Thunderdome_Wall, build009Pos + < 384, 0, 1280 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build009Int[ 10 ] ; i++ )
    {   for ( int j = 0 ; j < build009Int[ 11 ] ; j++ )
        { 
            CreateFloppytownModel( Thunderdome_Wall, build009Pos + < 384, 256, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Thunderdome_Wall, build009Pos + < -384, 256, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_010 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build010Pos = mapPos + < 4352, 128, 0 > //areaCPos//
    array< int > build010Int = [ 4, 1, 4, 5 ]

    for ( int i = 0 ; i < build010Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build010Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build010Pos + < -384, 0, 1280 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build010Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build010Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build010Pos + < -384, 128, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    // Ziplines
    CreateFloppytownZiplineModel( build010Pos + < -384, 128, 1280 >, < 0, 0, 0 > )

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        CreateEditorRef( build001Pos, mapAng, "Build 001" )
        CreateEditorRef( build002Pos, mapAng, "Build 002" )
        CreateEditorRef( build003Pos, mapAng, "Build 003" )
        CreateEditorRef( build004Pos, mapAng, "Build 004" )
        CreateEditorRef( build005Pos, mapAng, "Build 005" )
        CreateEditorRef( build006Pos, mapAng, "Build 006" )
        CreateEditorRef( build007Pos, mapAng, "Build 007" )
        CreateEditorRef( build008Pos, mapAng, "Build 008" )
        CreateEditorRef( build009Pos, mapAng, "Build 009" )
        CreateEditorRef( build010Pos, mapAng, "Build 010" )
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
    vector build011Pos = mapPos + < 5376, 128, 0 > //areaCPos//
    array< int > build011Int = [ 2, 3, 2, 8, 2, 8, 4, 8, 4, 8 ]

    for ( int i = 0 ; i < build011Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build011Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build011Pos + < -128, 0, 2048 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Ceiling, build011Pos + < -384, 0, 2048 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
    for ( int i = 0 ; i < build011Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build011Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build011Pos + < -512, -64, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build011Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build011Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build011Pos + < -448, 128, SSB_UpTo0 > + < 128 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build011Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build011Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build011Pos + < -192, 640, SSB_UpTo0 > + < 128 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build011Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build011Int[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build011Pos + < -256, 192, SSB_UpTo0 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_012 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build012Pos = mapPos + < 5504, 1920, 0 > //areaCPos//
    array< int > build012Int = [ 2, 5, 2, 4, 2, 9, 2, 9, 1, 5, 1, 5, 4, 3, 1, 9, 1, 2, 1, 3, 2, 4, 2, 1 ]

    for ( int i = 0 ; i < build012Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build012Pos + < -640, 0, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build012Pos + < -384, 0, 1280 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build012Pos + < -384, 512, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build012Pos + < -256, -128, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build012Pos + < -512, -128, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 10 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 11 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build012Pos + < -512, 384, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 12 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 13 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build012Pos + < -320, 1024, SSB_UpTo0_Patch + 1536 > + < 128 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 14 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 15 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build012Pos + < -384, 960, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }

    for ( int i = 0 ; i < build012Int[ 16 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 17 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build012Pos + < -512, 0, 1280 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 18 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 19 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build012Pos + < -128, 64, 2304 > + < 0 * i, 384 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 20 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 21 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build012Pos + < -256, 0, 2272-32 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build012Int[ 22 ] ; i++ )
    {   for ( int j = 0 ; j < build012Int[ 23 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Mini_Ceiling, build012Pos + < -256, 960, 2272 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }

    // Ziplines
    CreateFloppytownZiplineModel( build012Pos + < -128, 1032, 2304 >, < 0, 0, 0 > )

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_013 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build013Pos = mapPos + < 5504, 3072, 0 > //areaCPos//
    array< int > build013Int = [ 1, 5, 7, 7, 8, 3, 2, 8 ]

    for ( int i = 0 ; i < build013Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build013Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build013Pos + < -128, 64, 1792 > + < 0 * i, 384 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build013Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build013Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build013Pos + < -384, -64, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build013Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build013Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build013Pos + < -384, 832, SSB_UpTo0_Patch + 1024 > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0; i < build013Int[ 6 ] ; i++ )
    {   for ( int j = 0; j < build013Int[ 7 ] ; j++ )
        {
           CreateFloppytownModel( Thunderdome_Ceiling, build013Pos + < -256, 0, 1760-32 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_014 // BUILD TEMPLATE //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build014Pos = mapPos + < 4608, 4352, 0 > //areaCPos//
    array< int > build014Int = [ 4, 4, 4, 4, 2, 3, 4, 4 ]

    for ( int i = 0 ; i < build014Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build014Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build014Pos + < -512, -384, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build014Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build014Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build014Pos + < -384, -512, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build014Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build014Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build014Pos + < -256, -320, 1024 > + < 512 * i, 384 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build014Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build014Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build014Pos + < -384, -384, 992-32 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_015 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build015Pos = mapPos + < 1408, 4480+128, 0 > //areaCPos//
    array< int > Build_015_int = [ 7, 1, 11, 1, 0, 0 ]

    for ( int i = 0 ; i < Build_015_int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < Build_015_int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Pipe_Grate, build015Pos + < -384, 32, 1024 > + < 128 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Pipe_Grate, build015Pos + < -384, -32, 1024 > + < 128 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )

            CreateFloppytownModel( Pipe_Grate, build015Pos + < -384.1, 31.9, 1024 > + < 128 * i, 0 * j, 0 >, mapAng + < 0, 0, 180 >, true, 20000, -1 )
            CreateFloppytownModel( Pipe_Grate, build015Pos + < -384.1, -31.9, 1024 > + < 128 * i, 0 * j, 0 >, mapAng + < 0, 0, 180 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < Build_015_int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < Build_015_int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Pipe_Grate, build015Pos + < -640, 96, 1024 > + < 128 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Pipe_Grate, build015Pos + < -640, -96, 1024 > + < 128 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )

            CreateFloppytownModel( Pipe_Grate, build015Pos + < -640.1, 95.9, 1024 > + < 128 * i, 0 * j, 0 >, mapAng + < 0, 0, 180 >, true, 20000, -1 )
            CreateFloppytownModel( Pipe_Grate, build015Pos + < -640.1, -95.9, 1024 > + < 128 * i, 0 * j, 0 >, mapAng + < 0, 0, 180 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_016 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build016Pos = mapPos + < 4096, 3072, 0 > //areaCPos//
    array< int > build016Int = [ 3, 5, 3, 3 ]

    for ( int i = 0 ; i < build016Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build016Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Wall, build016Pos + < -256, 384, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Thunderdome_Wall, build016Pos + < -256, -384, 0 > + < 256 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Thunderdome_Wall, build016Pos + < 384, -256, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Thunderdome_Wall, build016Pos + < -384, -256, 0 > + < 0, 256 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build016Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build016Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build016Pos + < -256, -256, 1280 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_017 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build017Pos = mapPos + < 1152, 2944, 0 > //areaCPos//
    array< int > build017Int = [ 3, 3 ]

    for ( int i = 0 ; i < build017Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build017Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build017Pos + < -256, -256, 352 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Thunderdome_Wall_512x352, build017Pos + < -128, -384, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
    CreateFloppytownModel( Thunderdome_Wall_256x352, build017Pos + < 256, -384, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
    CreateFloppytownModel( Thunderdome_Wall_512x352, build017Pos + < 128, 384, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
    CreateFloppytownModel( Thunderdome_Wall_256x352, build017Pos + < -256, 384, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
    CreateFloppytownModel( Thunderdome_Wall_512x352, build017Pos + < -384, 128, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
    CreateFloppytownModel( Thunderdome_Wall_256x352, build017Pos + < -384, -256, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
    CreateFloppytownModel( Thunderdome_Wall_512x352, build017Pos + < 384, -128, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
    CreateFloppytownModel( Thunderdome_Wall_256x352, build017Pos + < 384, 256, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_018 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build018Pos = mapPos + < 2944, 2176, 0 > //areaCPos//
    array< int > build018Int = [ 4, 5, 8, 5, 2, 1, 4, 2 ]

    for ( int i = 0 ; i < build018Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build018Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build018Pos + < -512, -192, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, build018Pos + < 512, -192, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build018Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build018Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build018Pos + < -448, 256, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, build018Pos + < -448, -256, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build018Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build018Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build018Pos + < -320, 0, 1280 > + < 640 * i, 384 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    CreateFloppytownModel( Mid_Platform, build018Pos + < 0, 0, 1280.1 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
    for ( int i = 0 ; i < build018Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build018Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build018Pos + < -384, -128, 1248-32 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_019 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build019Pos = mapPos + < 3968, 1344, 0 > //areaCPos//
    array< int > build019Int = [ 1, 2, 8, 5, 3, 5, 3, 5, 12, 5, 12, 5, 4, 5, 1, 5, 3, 5, 3, 1, 1, 4, 1, 4, 6, 1, 6, 1 ]

    for ( int i = 0 ; i < build019Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build019Pos + < 0, -256, 1280 > + < 0 * i, 512 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build019Pos + < 192, -448, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build019Pos + < -128, -512, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 ) // droit
        }
    }
    for ( int i = 0 ; i < build019Int[ 6 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 7 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build019Pos + < -128, 512, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 8 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 9 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build019Pos + < -1664, 0, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 10 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 11 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build019Pos + < -1664, -384, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 12 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 13 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build019Pos + < -192, 64, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 14 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 15 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build019Pos + < -192, -448, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 16 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 17 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build019Pos + < -1728, -320, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 18 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 19 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build019Pos + < -1472, -192, 1280 > + < 512 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 20 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 21 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Mini_Ceiling, build019Pos + < 128, -384, 1248-32 > + < 0 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 22 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 23 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build019Pos + < -64, -384, 1248-32 > + < 0 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 24 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 25 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build019Pos + < -1600, -256, 1248-32 > + < 256 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build019Int[ 26 ] ; i++ )
    {   for ( int j = 0 ; j < build019Int[ 27 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Mini_Ceiling, build019Pos + < -1600, -64, 1248-32 > + < 256 * i, 0 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_020 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build020Pos = mapPos + < 1280, 1600, 0 > //areaCPos//
    array< int > build020Int = [ 2, 2, 8, 1, 6, 1 ]

    for ( int i = 0 ; i < build020Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build020Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build020Pos + < -192, -256, 256 > + < 384 * i, 512 * j, 0 >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build020Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build020Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build020Pos + < 384, -448, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, -90, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, build020Pos + < -384, -448, SSB_UpTo0_Patch > + < 0, 128 * i, 256 * j >, mapAng + < 0, 90, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build020Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build020Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Square_Shell_Box, build020Pos + < -320, 512, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
            CreateFloppytownModel( Square_Shell_Box, build020Pos + < -320, -512, SSB_UpTo0_Patch > + < 128 * i, 0, 256 * j >, mapAng + < 0, 180, 0 >, true, 20000, -1 )
        }
    }
    //CreateZipline( <1544.03125, 2572.64331, 137.872391>, <3705.34375, 3061.00635, 138.614517> )
    //CreateZipline( <5360.91406, 2993.85083, 2474.17163>, <5360.91406, 2993.85083, 1792> )
    

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        CreateEditorRef( build011Pos, mapAng, "Build 011" )
        CreateEditorRef( build012Pos, mapAng, "Build 012" )
        CreateEditorRef( build013Pos, mapAng, "Build 013" )
        CreateEditorRef( build014Pos, mapAng, "Build 014" )
        CreateEditorRef( build015Pos, mapAng, "Build 015" )
        CreateEditorRef( build016Pos, mapAng, "Build 016" )
        CreateEditorRef( build017Pos, mapAng, "Build 017" )
        CreateEditorRef( build018Pos, mapAng, "Build 018" )
        CreateEditorRef( build019Pos, mapAng, "Build 019" )
        CreateEditorRef( build020Pos, mapAng, "Build 020" )
    }
}

void function Build_21_30( vector mapPos, vector mapAng, vector areaCPos, vector areaCAng )
{
    // var that need to be declared in each function //
    int SSB_UpTo0 = 128 // set to 0 Square_Shell_Box axis Z
    float SSB_UpTo0_Patch = SSB_UpTo0 - 0.1
    ///////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_021 //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build021Pos = areaCPos //mapPos + < 0, 0, 0 > //areaCPos//
    array< int > build021Int = [ 0, 0, 0, 0, 0, 0 ]

    for ( int i = 0 ; i < build021Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build021Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build021Pos + < 0, 0, 0 > + < 512 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build021Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build021Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Concrete_Panel, build021Pos + < 0, 0, 0 > + < 128 * i, 0, 128 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build021Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build021Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build021Pos + < 0, 0, 0 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }

    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        CreateEditorRef( build021Pos, mapAng, "Build 021" )
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // OTHER //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    CreateFloppytownModel( Cubemap, < 10600, 29200, -26000 >, mapAng + < 0, 0, 0 >, true, 20000, -1 ).SetModelScale( 15 ) // Hides the tear under the skybox

    /*
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // BUILD_020 // BUILD TEMPLATE //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    vector build020Pos = areaCPos //mapPos + < 0, 0, 0 > //areaCPos//
    array< int > build020Int = [ 0, 0, 0, 0, 0, 0 ]

    for ( int i = 0 ; i < build020Int[ 0 ] ; i++ )
    {   for ( int j = 0 ; j < build020Int[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Mid_Platform, build020Pos + < 0, 0, 0 > + < 512 * i, 0 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build020Int[ 2 ] ; i++ )
    {   for ( int j = 0 ; j < build020Int[ 3 ] ; j++ )
        {
            CreateFloppytownModel( Concrete_Panel, build020Pos + < 0, 0, 0 > + < 128 * i, 0, 128 * j >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    for ( int i = 0 ; i < build020Int[ 4 ] ; i++ )
    {   for ( int j = 0 ; j < build020Int[ 5 ] ; j++ )
        {
            CreateFloppytownModel( Thunderdome_Ceiling, build020Pos + < 0, 0, 0 > + < 256 * i, 256 * j, 0 >, mapAng + < 0, 0, 0 >, true, 20000, -1 )
        }
    }
    */
}

void function AreaBuild( vector areaPos, vector areaAng, vector areaCPos, vector areaCAng )
{
    array< int > areaInt = [ 3, 7 ]

    for ( int i = 0 ; i <  areaInt[ 0 ] ; i++ )
    {   for ( int j = 0 ; j <  areaInt[ 1 ] ; j++ )
        {
            CreateFloppytownModel( Building_Platform_Large, areaPos + < 1024 * i, 352 * j, 0 >, areaAng , true, 20000, -1 )
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if ( GetCurrentPlaylistVarBool( "FT_Editing_Enable", false ) ) // map editing, do not activate in normal use
    {
        //CreateEditorRef( areaPos, areaAng, "Spawn point Area Build" )
        //CreateEditorRef( areaCPos, areaAng, "Center point Area Build" ) 
    }
}
