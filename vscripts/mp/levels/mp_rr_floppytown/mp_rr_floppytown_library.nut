untyped

globalize_all_functions

// Map Assets
global asset BUILDING_PLATFORM              = $"mdl/desertlands/construction_bldg_platform_02.rmdl"
global asset BUILDING_PLATFORM_LARGE        = $"mdl/desertlands/construction_bldg_platform_01.rmdl"
global asset THUNDERDOME_WALL               = $"mdl/thunderdome/thunderdome_cage_wall_256x256_01.rmdl"
global asset THUNDERDOME_CEILING            = $"mdl/thunderdome/thunderdome_cage_ceiling_256x256_06.rmdl"
global asset THUNDERDOME_MINI_CEILING       = $"mdl/thunderdome/thunderdome_cage_ceiling_256x128_06.rmdl"
global asset THUNDERDOME_FRAME              = $"mdl/thunderdome/thunderdome_cage_frame_256_01.rmdl"
global asset THUNDERDOME_WALL_256x352       = $"mdl/thunderdome/thunderdome_cage_wall_256x352_01.rmdl"
global asset THUNDERDOME_WALL_512x352       = $"mdl/thunderdome/thunderdome_cage_wall_512x352_01.rmdl"
global asset SQUARE_BLOCK                   = $"mdl/desertlands/highrise_Square_Block_03.rmdl"
global asset GRASS                          = $"mdl/foliage/icelandic_moss_grass_02.rmdl"
global asset WALL_PILLAR                    = $"mdl/desertlands/desertlands_city_slanted_building_01_wall_pillar_64.rmdl"
global asset SLANTED_SLICE                  = $"mdl/desertlands/desertlands_city_slanted_building_01_slice_01.rmdl"
global asset SQUARE_SHELL_BOX               = $"mdl/desertlands/highrise_square_shell_box_128_c.rmdl"
global asset PIPE_GRATE                     = $"mdl/desertlands/city_pipe_grate_medium_128.rmdl"
global asset SPACE_ELEVATOR                 = $"mdl/levels_terrain/mp_rr_desertlands/desertlands_space_elevator_platform_01.rmdl"
global asset CARGO_SMALL                    = $"mdl/desertlands/industrial_cargo_container_small_03.rmdl"
global asset COLUMN_STACK                   = $"mdl/desertlands/construction_bldg_column_stack_01.rmdl"
global asset MID_PLATFORM                   = $"mdl/levels_terrain/mp_rr_desertlands/desertlands_z12_mid_platform_01.rmdl"
global asset CONCRETE_PANEL                 = $"mdl/desertlands/wall_city_panel_concrete_128_01.rmdl"
global asset BOX_BOTTOM_A                   = $"mdl/desertlands/highrise_square_shell_box_bottom_a.rmdl"
global asset BOX_BOTTOM_B                   = $"mdl/desertlands/highrise_square_shell_box_bottom_b.rmdl"

// Zipline Assets
global asset SECURITY_FENCE                 = $"mdl/industrial/security_fence_post.rmdl"
global asset ZIP_ARM                        = $"mdl/industrial/zipline_arm.rmdl"

// Ornament Assets
global asset BEAM_SUPPORT                   = $"mdl/industrial/underbelly_support_beam_256_01.rmdl"
global asset IMC_CARGO_CONTAINER            = $"mdl/IMC_base/cargo_container_imc_01_white.rmdl"
global asset VEHICLE_R5_MSC_SUV             = $"mdl/vehicles_r5/land/msc_suv_partum/veh_land_msc_suv_partum_static.rmdl"
global asset RAILING_CORNER_IN              = $"mdl/ola/sewer_railing_01_corner_in.rmdl"
global asset RAILING_CORNER_OUT             = $"mdl/ola/sewer_railing_01_corner_out.rmdl"
global asset RAILING_128                    = $"mdl/ola/sewer_railing_01_128.rmdl"
global asset RAILING_64                     = $"mdl/ola/sewer_railing_01_64.rmdl"
global asset RAILING_32                     = $"mdl/ola/sewer_railing_01_32.rmdl"
global asset RAILING_16                     = $"mdl/ola/sewer_railing_01_16.rmdl"

// Dev Assets
global asset EDITOR_REF                     = $"mdl/dev/editor_ref.rmdl"
global asset CUBEMAP                        = $"mdl/menu/menu_cubemap.rmdl"
global asset EMPTY                          = $"mdl/dev/empty_model.rmdl"

// Map Origin | Angles
global const vector FLOPPYTOWN_POS_OFFSET   = < 0, 0, 0 > // map origin // Zips appear with "mp_rr_floppytown_scripts.ent", map position change is not available anymore !
global const vector FLOPPYTOWN_ANG_OFFSET   = < 0, 0, 0 > // map angles // not usable !

// Map Origin | Angles
global const vector FT_BUILD_AREA_POS       = FLOPPYTOWN_POS_OFFSET + < -5000, 0, 1280 >
global const vector FT_BUILD_AREA_ANG       = FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 >

// Buildings Origin | Angles
global const vector FT_BUILDING_POS_01      = FLOPPYTOWN_POS_OFFSET + < 2664, 4352, 0 >
global const vector FT_BUILDING_ANG_01      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_02      = FLOPPYTOWN_POS_OFFSET + < 128, 4352, 0 >
global const vector FT_BUILDING_ANG_02      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_03      = FLOPPYTOWN_POS_OFFSET + < 64, 3328, 0 >
global const vector FT_BUILDING_ANG_03      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_04      = FLOPPYTOWN_POS_OFFSET + < 128, 2560, 0 >
global const vector FT_BUILDING_ANG_04      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_05      = FLOPPYTOWN_POS_OFFSET + < 128, 1856, 0 >
global const vector FT_BUILDING_ANG_05      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_06      = FLOPPYTOWN_POS_OFFSET + < 128, 1152, 0 >
global const vector FT_BUILDING_ANG_06      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_07      = FLOPPYTOWN_POS_OFFSET + < 128, 128, 0 >
global const vector FT_BUILDING_ANG_07      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_08      = FLOPPYTOWN_POS_OFFSET + < 2560, 128, 0 >
global const vector FT_BUILDING_ANG_08      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_09      = FLOPPYTOWN_POS_OFFSET + < 3456, 128, 0 >
global const vector FT_BUILDING_ANG_09      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_10      = FLOPPYTOWN_POS_OFFSET + < 4352, 128, 0 >
global const vector FT_BUILDING_ANG_10      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_11      = FLOPPYTOWN_POS_OFFSET + < 5376, 128, 0 >
global const vector FT_BUILDING_ANG_11      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_12      = FLOPPYTOWN_POS_OFFSET + < 5504, 1920, 0 >
global const vector FT_BUILDING_ANG_12      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_13      = FLOPPYTOWN_POS_OFFSET + < 5504, 3072, 0 >
global const vector FT_BUILDING_ANG_13      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_14      = FLOPPYTOWN_POS_OFFSET + < 4608, 4352, 0 >
global const vector FT_BUILDING_ANG_14      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_15      = FLOPPYTOWN_POS_OFFSET + < 1408, 4608, 0 >
global const vector FT_BUILDING_ANG_15      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_16      = FLOPPYTOWN_POS_OFFSET + < 4224, 3072, 0 >
global const vector FT_BUILDING_ANG_16      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_17      = FLOPPYTOWN_POS_OFFSET + < 1152, 3008, 0 >
global const vector FT_BUILDING_ANG_17      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_18      = FLOPPYTOWN_POS_OFFSET + < 2688, 2176, 0 >
global const vector FT_BUILDING_ANG_18      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_19      = FLOPPYTOWN_POS_OFFSET + < 4096, 1344, 0 >
global const vector FT_BUILDING_ANG_19      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_20      = FLOPPYTOWN_POS_OFFSET + < 1344, 1600, 0 >
global const vector FT_BUILDING_ANG_20      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BUILDING_POS_21      = FLOPPYTOWN_POS_OFFSET + < 0, 0, 0 >
global const vector FT_BUILDING_ANG_21      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

//global const vector FT_BUILDING_POS_22      = FLOPPYTOWN_POS_OFFSET + < 0, 0, 0 >
//global const vector FT_BUILDING_ANG_22      = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_FLOOR_POS            = FLOPPYTOWN_POS_OFFSET + < 0, 0, 0 >
global const vector FT_FLOOR_ANG            = FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 >

global const vector FT_GRASS_POS            = FLOPPYTOWN_POS_OFFSET + < -32, -32, 0 >
global const vector FT_GRASS_ANG            = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_NORTH_WALL_POS       = FLOPPYTOWN_POS_OFFSET + <0, 4864, 0>
global const vector FT_NORTH_WALL_ANG       = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_SOUTH_WALL_POS       = FLOPPYTOWN_POS_OFFSET + < 5888, 0, 0 >
global const vector FT_SOUTH_WALL_ANG       = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_WEST_WALL_POS        = FLOPPYTOWN_POS_OFFSET + < 0, 0, 0 >
global const vector FT_WEST_WALL_ANG        = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_EAST_WALL_POS        = FLOPPYTOWN_POS_OFFSET + < 5632, 4335, -0.1 >
global const vector FT_EAST_WALL_ANG        = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_LITTLE_BRIDGE_POS    = FLOPPYTOWN_POS_OFFSET + < 3840, 128, 2048 >
global const vector FT_LITTLE_BRIDGE_ANG    = FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 >

global const vector FT_BALCONY_LEFT_POS     = FT_BUILDING_POS_01 + < -272, -584, 576 >
global const vector FT_BALCONY_LEFT_ANG     = FT_BUILDING_ANG_01 + < 0, 0, 0 >

global const vector FT_BALCONY_RIGHT_POS    = FT_BUILDING_POS_01 + < 368, -584, 576 >
global const vector FT_BALCONY_RIGHT_ANG    = FT_BUILDING_ANG_01 + < 0, 0, 0 >

//
global const int    SSB_UP_TO_0             = 128 // set to 0 SQUARE_SHELL_BOX axis Z
global const float  SSB_UP_TO_0_PATCH       = SSB_UP_TO_0 - 0.1

global array< asset > assetViewerArray =
[
    $"mdl/desertlands/railing_metal_dirty_64_01.rmdl",
    $"mdl/desertlands/railing_metal_dirty_64_02.rmdl",
    $"mdl/desertlands/railing_metal_dirty_64_panel_01.rmdl",
    $"mdl/desertlands/railing_metal_dirty_64x24_01.rmdl",
    $"mdl/desertlands/railing_metal_dirty_64x24_panel_01.rmdl",
    $"mdl/desertlands/railing_post_metal_dirty_01.rmdl",
    $"mdl/desertlands/railing_stairs_metal_dirty_24_01.rmdl",
    $"mdl/desertlands/railing_stairs_metal_dirty_48_01.rmdl",
    $"mdl/ola/sewer_railing_01_128.rmdl",
    $"mdl/ola/sewer_railing_01_16.rmdl",
    $"mdl/ola/sewer_railing_01_32.rmdl",
    $"mdl/ola/sewer_railing_01_64.rmdl",
    $"mdl/ola/sewer_railing_01_corner_in.rmdl",
    $"mdl/ola/sewer_railing_01_corner_out.rmdl",
    $"mdl/ola/sewer_railing_01_stairend.rmdl",
    $"mdl/ola/sewer_railing_02_128.rmdl",
]

entity function CreateFloppytownModel( asset a, vector pos, vector ang )
{
    entity prop = CreatePropDynamic( a, pos, ang, SOLID_VPHYSICS, 20000 )
    prop.kv.fadedist = 20000
    prop.AllowMantle()
    int realm = -1
    if ( realm> -1 )
    { prop.RemoveFromAllRealms(); prop.AddToRealm( realm ) }
    prop.e.gameModeId = realm

        /* if ( a == THUNDERDOME_CEILING )
        {
            
        } */

    prop.SetScriptName( "FloppytownEntities" )
return prop }

entity function CreateFloppyWallTrigger(vector pos, float box_radius = 1000 )
{
    entity map_trigger = CreateEntity( "trigger_cylinder" )
    map_trigger.SetRadius( box_radius );map_trigger.SetAboveHeight( 5000 );map_trigger.SetBelowHeight( 10 );
    map_trigger.SetOrigin( pos )
    DispatchSpawn( map_trigger )
    thread FloppyWallTrigger( map_trigger )
    return map_trigger
}

void function FloppyWallTrigger(entity proxy, float speed = 0.6)
{   bool active = true
    while (active)
    {   if(IsValid(proxy))
        {   foreach(player in GetPlayerArray())
            {   if (player.GetPhysics() != MOVETYPE_NOCLIP)//won't affect noclip player
                {   if(proxy.IsTouching(player))
				{
                    player.Zipline_Stop()
					switch(GetMapName())
					{
					    default:
					    	vector target_origin = player.GetOrigin()
                            target_origin.z = 0.0
					    	vector proxy_origin = proxy.GetOrigin()
					    	vector target_angles = player.GetAngles()
					    	vector proxy_angles = proxy.GetAngles()

					    	vector velocity = target_origin - proxy_origin
					    	velocity = velocity * speed

					    	vector angles = target_angles - proxy_angles

					    	velocity = velocity + angles
					    	player.SetVelocity(velocity)
			}   }   }   }
        } else {active = false ; break}
        wait 0.01
}   }

array< entity > function CreateFloppytownZiplineModel( vector pos, vector ang )
{
    entity column   = CreateFloppytownModel( SECURITY_FENCE, pos, ang )
    entity support  = CreateFloppytownModel( ZIP_ARM, pos + < 0, 0, 185 >, ang )

return [ column, support ] }

entity function CreateEditorRef( vector pos, vector ang, string name )
{
    entity editor_ref = CreateFloppytownModel( EDITOR_REF, pos, ang )
    SetTargetName( editor_ref, name )
    editor_ref.SetScriptName( "editor_ref" )
return editor_ref }

void function Floppytown_MapInit_Library()
{   printt( "Floppytown_MapInit_Library OK" ) }
