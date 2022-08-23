untyped

globalize_all_functions

global array< entity > VERTICAL_ZIPLINE         = [ ]
global array< entity > HORIZONTAL_ZIPLINE_START = [ ]
global array< entity > HORIZONTAL_ZIPLINE_END   = [ ]

void function Map_Dev_Init()
{

}


#if SERVER
    void function ShowCenterOfEntity( entity ent )
    {
        for ( int i = 0 ; i < 3 ; i++ )
        {
            if ( IsValid( ent ) )
            {
                entity fx = PlayFXOnEntity( $"P_test_angles", ent )
                    wait 1.5

                if ( IsValid( fx ) ) fx.Destroy()
            }
        }
    printt( "ShowCenterOfEntity(): FXOnEntity as been destroy." ) }


    void function FindBestZiplineLocation( entity ent )
    {
        if ( IsValid( ent ) )
        {
            switch ( ent.GetScriptName() )
            {
                case "IsVertical":

                    entity fx = PlayFXOnEntity( $"P_test_angles", ent, "", < -4, -55.5, -12 > )

                    vector fxPos = fx.GetOrigin()

                    thread EntFilesGeneratorForVerticalZip( fxPos )
                        wait 1.5

                    if ( IsValid( fx ) )
                    {   fx.Destroy() }

                break

                case "IsHorizontal_start":
                case "IsHorizontal_end":

                    int index

                    if ( HORIZONTAL_ZIPLINE_START.contains( ent ) )
                    {   index = HORIZONTAL_ZIPLINE_START.find( ent ) }
                    else if ( HORIZONTAL_ZIPLINE_END.contains( ent ) )
                    {   index = HORIZONTAL_ZIPLINE_END.find( ent ) }

                    entity ent_start = HORIZONTAL_ZIPLINE_START[ index ]
                    entity ent_end = HORIZONTAL_ZIPLINE_END[ index ]

                    vector entPos_start = ent_start.GetOrigin()
                    vector entPos_end = ent_end.GetOrigin()

                    vector entAng_start = ent_start.GetAngles()
                    vector entAng_end = ent_end.GetAngles()

                    entity fx_start = PlayFXOnEntity( $"P_test_angles", ent_start, "", < -4, -55.5, -12 > )
                    entity fx_end   = PlayFXOnEntity( $"P_test_angles", ent_end, "", < -4, -55.5, -12 > )

                    vector fxPos_start = fx_start.GetOrigin()
                    vector fxPos_end   = fx_end.GetOrigin()

                    thread EntFilesGeneratorForHorizontalZip( fxPos_start, fxPos_end )
                        wait 1.0

                    printt( "" )
                    printt( "armPos_start: " + entPos_start + ", " + entAng_start )
                    printt( "armPos_end: " + entPos_end + ", " + entAng_end )
                    printt( "" )

                    if ( IsValid( fx_start ) )
                    {   fx_start.Destroy() }
                    if ( IsValid( fx_end ) )
                    {   fx_end.Destroy() }

                break
                
                default:
                break
            }
        }
    }


    void function EntFilesGeneratorForVerticalZip( vector fxPos )
    {
        int j = 0

        vector fxPosOffset = fxPos - < 0, 0, 80 >

        TraceResults result = TraceLine( fxPosOffset, fxPosOffset + -6000 * <0,0,1>, [], TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_PLAYER )

        vector end = result.endPos + < 0, 0, 35 >

        DebugDrawLine( fxPos, end, 55, 120, 194, true, 4.0 )

        printt( "" )
        printt( "===== .ent file generation =====" )
        
        printt( "\"origin\"" + "\"" + fxPos.x + " " + fxPos.y + " " + fxPos.z + "\"" )

        for ( float i = fxPos.z ; i > end.z ; i = i-304 )
        {
            j++
        }

        for ( float i = fxPos.z ; i > end.z ; i = i-304 )
        {
            printt( "\"_zipline_rest_point_" + j + "\" \"" + fxPos.x + " " + fxPos.y + " " + i + "\"" )
            j--
        }

        printt( "\"_zipline_rest_point_" + j + "\" \"" + fxPos.x + " " + fxPos.y + " " + end.z + "\"" )
        
        printt( "\"origin\"" + "\"" + fxPos.x + " " + fxPos.y + " " + end.z + "\"" )

        printt( "===== end .ent file generation =====\n" )
    }


    void function EntFilesGeneratorForHorizontalZip( vector fxPos_start, vector fxPos_end )
    {
        /* int j = 0

        vector fxPosOffset = fxPos - < 0, 0, 80 >

        TraceResults result = TraceLine( fxPosOffset, fxPosOffset + -6000 * <0,0,1>, [], TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_PLAYER )

        vector end = result.endPos + < 0, 0, 35 > */

        DebugDrawLine( fxPos_start, fxPos_end, 55, 120, 194, true, 4.0 )

        /* printt( "" )
        printt( "===== .ent file generation =====" )
        
        printt( "\"origin\"" + "\"" + fxPos.x + " " + fxPos.y + " " + fxPos.z + "\"" )

        for ( float i = fxPos.z ; i > end.z ; i = i-304 )
        {
            j++
        }

        for ( float i = fxPos.z ; i > end.z ; i = i-304 )
        {
            printt( "\"_zipline_rest_point_" + j + "\" \"" + fxPos.x + " " + fxPos.y + " " + i + "\"" )
            j--
        }

        printt( "\"_zipline_rest_point_" + j + "\" \"" + fxPos.x + " " + fxPos.y + " " + end.z + "\"" )
        
        printt( "\"origin\"" + "\"" + fxPos.x + " " + fxPos.y + " " + end.z + "\"" )

        printt( "===== end .ent file generation =====\n" ) */
    }


    void function EntFilesGeneratorForProps( entity ent )
    {
        vector ent_pos = ent.GetOrigin()
        vector ent_ang = ent.GetAngles()

        printt( "" )
        printt( "===== .ent file generation =====" )
        
        printt( "{" )
        printt( "\"SuppressAnimSounds\"" 		+ " " + "\"0\"" )
        printt( "\"StartDisabled\"" 			+ " " + "\"0\"" )
        printt( "\"spawnflags\"" 				+ " " + "\"0\"" )
        printt( "\"skin\"" 						+ " " + "\"0\"" )
        printt( "\"SetBodyGroup\"" 				+ " " + "\"0\"" )
        printt( "\"rendermode\"" 				+ " " + "\"0\"" )
        printt( "\"renderfx\"" 					+ " " + "\"0\"" )
        printt( "\"rendercolor\"" 				+ " " + "\"255 255 255\"" )
        printt( "\"renderamt\"" 				+ " " + "\"255\"" )
        printt( "\"RandomAnimation\"" 			+ " " + "\"0\"" )
        printt( "\"pressuredelay\"" 			+ " " + "\"0\"" )
        printt( "\"PerformanceMode\"" 			+ " " + "\"0\"" )
        printt( "\"mingpulevel\"" 				+ " " + "\"0\"" )
        printt( "\"mincpulevel\"" 				+ " " + "\"0\"" )
        printt( "\"MinAnimTime\"" 				+ " " + "\"5\"" )
        printt( "\"maxgpulevel\"" 				+ " " + "\"0\"" )
        printt( "\"maxcpulevel\"" 				+ " " + "\"0\"" )
        printt( "\"MaxAnimTime\"" 				+ " " + "\"10\"" )
        printt( "\"HoldAnimation\"" 			+ " " + "\"0\"" )
        printt( "\"gamemode_tdm\"" 				+ " " + "\"1\"" )
        printt( "\"gamemode_sur\"" 				+ " " + "\"1\"" )
        printt( "\"gamemode_lts\"" 				+ " " + "\"1\"" )
        printt( "\"gamemode_lh\"" 				+ " " + "\"1\"" )
        printt( "\"gamemode_fd\"" 				+ " " + "\"1\"" )
        printt( "\"gamemode_ctf\"" 				+ " " + "\"1\"" )
        printt( "\"gamemode_cp\"" 				+ " " + "\"1\"" )
        printt( "\"fadedist\"" 					+ " " + "\"-1\"" )
        printt( "\"ExplodeRadius\"" 			+ " " + "\"0\"" )
        printt( "\"ExplodeDamage\"" 			+ " " + "\"0\"" )
        printt( "\"disableX360\"" 				+ " " + "\"0\"" )
        printt( "\"disableshadows\"" 			+ " " + "\"0\"" )
        printt( "\"disablereceiveshadows\"" 	+ " " + "\"0\"" )
        printt( "\"DisableBoneFollowers\"" 		+ " " + "\"0\"" )
        printt( "\"DefaultCycle\"" 				+ " " + "\"0\"" )
        printt( "\"collide_titan\"" 			+ " " + "\"1\"" )
        printt( "\"collide_ai\"" 				+ " " + "\"1\"" )
        printt( "\"AnimateInStaticShadow\"" 	+ " " + "\"0\"" )
        printt( "\"scale\"" 					+ " " + "\"1\"" )
        printt( "\"angles\"" 					+ " " + "\"" + ent_ang.x + " " + ent_ang.y + " " + ent_ang.z + "\"" )
        printt( "\"origin\"" 					+ " " + "\"" + ent_pos.x + " " + ent_pos.y + " " + ent_pos.z + "\"" )
        printt( "\"targetname\"" 				+ " " + "\"\"" )
        printt( "\"solid\"" 					+ " " + "\"6\"" )
        printt( "\"model\"" 					+ " " + "\"" + ent.GetModelName() + "\"" )
        printt( "\"luxelsize\"" 				+ " " + "\"16\"" )
        printt( "\"lightingMethod\"" 			+ " " + "\"0\"" )
        printt( "\"DefaultAnim\"" 				+ " " + "\"\"" )
        printt( "\"ClientSide\"" 				+ " " + "\"1\"" )
        printt( "\"classname\"" 				+ " " + "\"prop_dynamic\"" )
        printt( "}" )

        printt( "===== end .ent file generation =====\n" )
    }
#endif
