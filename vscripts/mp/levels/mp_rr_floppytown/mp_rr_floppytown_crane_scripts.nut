untyped

globalize_all_functions


void function PrinttCraneFiles()
{

    printt( "|mp_rr_floppytown_crane_scripts.nut:             file called.|" )

}


void function Floppytown_MapInit_Crane_Scripts()
{
    thread FallingObjectInit()
}



void function FallingObjectInit()
{
    FloppytownPanelInit()

        wait 0.1 // hack for the first activation to work

    thread GenerateCraneForFloppytown( FT_CRANE_01_POS, FT_CRANE_01_ANG_A, FT_CRANE_01_ANG_B, FT_CRANE_01_ANG_C, "01" )

    RespawnFallingObject()
}


void function FloppytownPanelInit()
{
    
    entity panel = CreateFloppytownUsableModel( PROPS_ACCES_PANEL_BUTTON_CONSOLE_STAND, FT_FALLING_OBJECT_PANEL_POS, FT_FALLING_OBJECT_PANEL_ANG, "%&use%", "PANEL_01" )
    panel.SetSkin( 0 )


    if ( IsValid( panel ) )
    {
        AddCallback_OnUseEntity( panel, void function(entity panel, entity user, int input) 
        {
            if ( GetCurrentPlaylistVarBool( "ft_debug_printt", false ) )
            {
                printt( "|==========================================================|" )
                printt( "| FallingObjectThread(): Thread activate by panel" )
                printt( "|" )
                printt( "| Player: " + user )
            }

            entity player_trigger = GetEnt( "player_trigger_01" )

            if ( IsValid( player_trigger ) )
            {
                player_trigger.Destroy()
            }

            FlagSet( "FallingObjectThread()_IsActive" )

            thread ChangePanelState()
            thread FallingObjectThread()
        })
    }
}


void function PlayerTriggerInit()
{
    entity script_mover = GetEnt( "floppytown_script_mover_crane_01_sling" )

    vector model_offset_pos = script_mover.GetOrigin() + < 0, 0, -240 >

    TraceResults result = TraceLine( model_offset_pos, model_offset_pos + -10000 * <0,0,1>, [ script_mover ], TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_PLAYER )

    vector find_player_trigger_pos = result.endPos

    CreateFloppytownPlayerTrigger( find_player_trigger_pos, "01", 300 )
}



void function ChangePanelState()
{
    entity panel = GetEnt( "PANEL_01" )

    if ( IsValid( panel ) && panel.GetSkin() == 0 )
    {
        panel.UnsetUsable()
        panel.SetSkin( 1 )

            FlagWaitClear( "FallingObjectThread()_IsActive" )

        panel.SetUsable()
        panel.SetSkin( 0 )
    }
}



void function RespawnFallingObject()
{
    entity find_sling_crane_01 = GetEnt( "floppytown_script_mover_crane_01_sling" )

    if ( IsValid( find_sling_crane_01 ) )
    {
        vector model_offset_pos = find_sling_crane_01.GetOrigin() + < 0, 0, -240 >
        vector model_offset_ang = find_sling_crane_01.GetAngles()

        entity script_mover = CreateFloppytownScriptMover( model_offset_pos, model_offset_ang, "01" )
        entity falling_object_model = CreateFloppytownModel( IMC_BASE_GENERATOR_02,model_offset_pos, model_offset_ang, "falling_object_model_01" )

        falling_object_model.SetPusher( true )
        falling_object_model.Solid()
        falling_object_model.AllowMantle()

        if ( IsValid( script_mover ) && IsValid( falling_object_model ) )
        {
            script_mover.SetParent( find_sling_crane_01 )
            falling_object_model.SetParent( script_mover )

            printt( "" )
            printt( "|==========================================================|" )
            printt( "|>>>>>>>>>  RespawnFallingObject():  Initialized  <<<<<<<<<|" )
            printt( "|==========================================================|" )
            printt( "" )
        }
    }
}



void function FallingObjectThread()
{

    float waiting_fall = RandomFloatRange( WAIT_BEFORE_FALL_MIN, WAIT_BEFORE_FALL_MAX )

    if ( GetCurrentPlaylistVarBool( "ft_debug_printt", false ) )
    {
        printt( "|" )
        printt( "| FallingObjectThread(): Thread startup" )
        printt( "|" )
        printt( "| Time before falling: " + waiting_fall )
        printt( "|==========================================================|" )
    }

    FlagSet( "FallingObjectThread()_IsActive" )
    FlagSet( "FallingObjectThread()_thread_ending" )

    entity script_mover = GetEnt( "floppytown_script_mover_01" )
    entity falling_object_model = GetEntArrayByScriptName( "falling_object_model_01" )[0]
    entity sling = GetEnt( "floppytown_script_mover_crane_01_sling" )

    foreach( player in GetPlayerArray() )
    {
        Remote_CallFunction_NonReplay( player, "ServerCallback_Crane_DoAnnouncement" )
    }
        
        wait waiting_fall

    if ( IsValid( script_mover ) && IsValid( falling_object_model ) ) // 0.3048 = 1 meter
    {
        script_mover.ClearParent()

        TraceResults result = TraceLine( script_mover.GetOrigin(), script_mover.GetOrigin() + -10000 * <0,0,1>, [ script_mover ], TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_PLAYER )

        vector end = result.endPos

        EmitSoundOnEntity( sling, PLAYER_ZIPLINE_DETACH )

        script_mover.NonPhysicsMoveTo( end, 3, 0, 0 )

        thread CraneIsMoving()

            wait 3

        entity fx_0 = PlayFXOnEntity( EXP_IMPACT_ARCBALL_DEFAULT, script_mover )
        EmitSoundOnEntity( script_mover, DROPSHIP_EXPLODE_OLD )
        Explosion_DamageDefSimple( damagedef_falling_object_floppytown, script_mover.GetOrigin(), script_mover, script_mover, script_mover.GetOrigin() )

            wait 2.8

        entity fx_1 = PlayFXOnEntity( EXP_IMPACT_TRIPLE_THREAT_FULL, script_mover )

        falling_object_model.Destroy()

            wait 0.1

        entity fx_2 = PlayFXOnEntity( EXP_NUKE_3P, script_mover )
        Explosion_DamageDefSimple( damagedef_falling_object_floppytown, script_mover.GetOrigin(), script_mover, script_mover, script_mover.GetOrigin() )

            wait 0.2

        entity fx_3 = PlayFXOnEntity( FIRE_VENT_DOOM, script_mover )
        EmitSoundOnEntity( script_mover, FIRE_MEDIUM )

            wait 6

        StopSoundOnEntity( script_mover, FIRE_MEDIUM )

        if ( IsValid( script_mover ) )
        { script_mover.Destroy() }

        if ( IsValid( fx_0 ) )
        { fx_0.Destroy() }

        if ( IsValid( fx_1 ) )
        { fx_1.Destroy() }

        if ( IsValid( fx_2 ) )
        { fx_2.Destroy() }

        if ( IsValid( fx_3 ) )
        { fx_3.Destroy() }

        FlagClear( "FallingObjectThread()_thread_ending" )
    }

    printt( "|==========================================================|" )
    printt( "| FallingObjectThread(): End of the thread" )
    printt( "|==========================================================|" )
        
}


void function CraneIsMoving()
{
    int delay = RandomIntRange( FALLING_OBJ_RESTART_DELAY_MIN, FALLING_OBJ_RESTART_DELAY_MAX )

    printt( "|==========================================================|" )
    printt( "| CraneIsMoving(): Thread startup" )
    printt( "|" )
    printt( "| wait() delay: " + delay )
    printt( "|==========================================================|" )

        wait 2

    entity crane_01_b = GetEnt( "floppytown_script_mover_crane_01_b" )
    entity crane_01_c = GetEnt( "floppytown_script_mover_crane_01_c" )

    crane_01_b.NonPhysicsRotateTo( FT_CRANE_THREAD_PART_B_OUT, 4, 2.0, 2.0 )
    crane_01_c.NonPhysicsRotateTo( FT_CRANE_THREAD_PART_C_OUT, 4, 2.0, 2.0 )

    FlagWaitClear( "FallingObjectThread()_thread_ending" )

    if ( GetCurrentPlaylistVarBool( "ft_dev_enable", false ) ) // map editing, do not activate in normal use
    {}
    else
    { wait( delay ) }


    RespawnFallingObject()

        wait 2

    entity script_mover = GetEnt( "floppytown_script_mover_01" )

    crane_01_b.NonPhysicsRotateTo( FT_CRANE_THREAD_PART_B_IN, 4, 2.0, 2.0 )
    crane_01_c.NonPhysicsRotateTo( FT_CRANE_THREAD_PART_C_IN, 4, 2.0, 2.0 )

    script_mover.NonPhysicsRotateTo( < 0, 180, 10 >, 3.5, 2.0, 1.5 )

        wait 3.5

    script_mover.NonPhysicsRotateTo( < 0, 180, 0 >, 0.5, 0.20, 0.30 )

        wait 2.2

    PlayerTriggerInit()

    FlagClear( "FallingObjectThread()_IsActive" )

    printt( "|==========================================================|" )
    printt( "| CraneIsMoving(): End of the thread" )
    printt( "|==========================================================|" )
}


void function GenerateCraneForFloppytown( vector origin, vector ang_a, vector ang_b, vector ang_c, string name )
{
    FlagSet( "FallingObjectThread()_IsActive" )

    thread ChangePanelState()

    string target_name = "crane_" + name

    entity script_mover_part_b = CreateFloppytownScriptMover( origin + FT_CRANE_PART_B_OFFSET, ZERO_VECTOR, target_name + "_b" )
    entity script_mover_part_c = CreateFloppytownScriptMover( origin + FT_CRANE_PART_C_OFFSET, ZERO_VECTOR, target_name + "_c" )
    entity script_mover_part_sling = CreateFloppytownScriptMover( origin + FT_CRANE_PART_SLING_OFFSET, ZERO_VECTOR, target_name + "_sling" )

    entity script_mover = GetEnt( "floppytown_script_mover_crane_01_sling" )

    entity moving_part_model_a = CreateFloppytownModel( DESERTLANDS_INDUSTRIAL_CRANE_A_01, origin                          , ang_a )
    entity moving_part_model_b = CreateFloppytownModel( DESERTLANDS_INDUSTRIAL_CRANE_B_01, origin + FT_CRANE_PART_B_OFFSET , ZERO_VECTOR )
    entity moving_part_model_c = CreateFloppytownModel( DESERTLANDS_INDUSTRIAL_CRANE_C_01, origin + FT_CRANE_PART_C_OFFSET , ZERO_VECTOR )

    moving_part_model_a.SetPusher( true )
    moving_part_model_b.SetPusher( true )
    moving_part_model_c.SetPusher( true )
    moving_part_model_a.Solid()
    moving_part_model_b.Solid()
    moving_part_model_c.Solid()

    moving_part_model_b.SetParent( script_mover_part_b )
    moving_part_model_c.SetParent( script_mover_part_c )

    script_mover_part_c.SetParent( moving_part_model_b )

    script_mover_part_sling.SetParent( script_mover_part_c )

        wait 0.1

    script_mover_part_b.NonPhysicsRotateTo( FT_CRANE_THREAD_PART_B_IN, 4, 2.0, 2.0 )
    script_mover_part_c.NonPhysicsRotateTo( FT_CRANE_THREAD_PART_C_IN, 4, 2.0, 2.0 )
    script_mover.NonPhysicsRotateTo( < 0, 180, 0 >, 4, 2.0, 2.0 )

        wait 4

    FlagClear( "FallingObjectThread()_IsActive" )
    PlayerTriggerInit()

    //amb_colony_fireloop_big_lr_v2_lp_flame
    //amb_emit_boneyard_generator_hum_1ch_01
    //amb_overlook_ext_generatorloop_lr_v3_lp
}
