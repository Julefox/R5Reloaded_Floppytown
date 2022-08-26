untyped

globalize_all_functions

global array< vector > RANDOM_COLOR =
[
    < 55, 120, 194 >,   // #3778c2 Sky Blue
    < 153, 0, 0 >,      // #990000 Red
    < 43, 163, 38 >,    // #2ba326
    < 127, 250, 40 >,   // #7ffa28
    < 222, 80, 249 >,   // #DE50F9
    < 28, 148, 26 >,    // #1C941A
    < 184, 43, 127 >,   // #B82B7F
    < 22, 13, 52 >,     // #160D34
    < 18, 31, 180 >,    // #121FB4
    < 146, 97, 101 >,   // #926165
    < 0, 223, 255 >,    // #00DFFF
    < 159, 33, 253 >,   // #9F21FD
    < 75, 172, 53 >     // #4BAC35
]

struct PingTraceResults
{
    entity player
    vector endPos
    vector surfaceNormal
    float  hitDist
    entity hitEnt
    bool   success = false

    TraceResults & tr
}

void function Map_Dev_Init()
{
    #if SERVER
        AddClientCommandCallback( "Zipline_Debug", ClientCommand_DebugDrawZipline )
        AddClientCommandCallback( "GetEnt", ClientCommand_GetEnt )
    #endif
}


#if SERVER
    void function FindBestZiplineLocation( entity ent )
    {
        if ( IsValid( ent ) )
        {
            if ( ent.GetModelName() == $"mdl/industrial/security_fence_post.rmdl" )
            {   int index = ZIPLINE_ENTS.find( ent ) + 1 ; ent = ZIPLINE_ENTS[ index ] }

            if ( IS_VERTICAL_ZIPLINE.contains( ent ) )
            {
                entity fx = PlayFXOnEntity( $"P_test_angles", ent, "", < -4, -55.5, -12 > ) // hack for find origin

                vector fxPos = fx.GetOrigin() ; vector fxAng = fx.GetAngles()

                thread EntFilesGeneratorForVerticalZip( fxPos, fxAng )

                    wait 1.5

                if ( IsValid( fx ) )
                {   fx.Destroy() }
            }
            else if ( NON_HORIZONTAL_ZIPLINE_START.contains( ent ) || NON_HORIZONTAL_ZIPLINE_END.contains( ent ) )
            {
                int index

                if ( NON_HORIZONTAL_ZIPLINE_START.contains( ent ) ) index = NON_HORIZONTAL_ZIPLINE_START.find( ent )
                else if ( NON_HORIZONTAL_ZIPLINE_END.contains( ent ) ) index = NON_HORIZONTAL_ZIPLINE_END.find( ent )

                entity ent_start = NON_HORIZONTAL_ZIPLINE_START[ index ]
                entity ent_end = NON_HORIZONTAL_ZIPLINE_END[ index ]

                vector entPos_start = ent_start.GetOrigin()
                vector entPos_end = ent_end.GetOrigin()

                vector entAng_start = ent_start.GetAngles()
                vector entAng_end = ent_end.GetAngles()

                entity fx_start = PlayFXOnEntity( $"P_test_angles", ent_start, "", < -4, -55.5, -12 > ) // hack for find origin
                entity fx_end   = PlayFXOnEntity( $"P_test_angles", ent_end, "", < -4, -55.5, -12 > ) // hack for find origin

                vector fxPos_start = fx_start.GetOrigin()
                vector fxPos_end   = fx_end.GetOrigin()

                thread EntFilesGeneratorForNonVerticalZip( fxPos_start, fxPos_end )

                printt( "" )
                printt( "armPos_start: " + entPos_start + ", " + entAng_start )
                printt( "armPos_end: " + entPos_end + ", " + entAng_end )
                printt( "" )

                    wait 1.0

                if ( IsValid( fx_start ) ) fx_start.Destroy()
                if ( IsValid( fx_end ) ) fx_end.Destroy()
            }
        } else printt( "FindBestZiplineLocation(): entitie is not valid." )
    }


    void function EntFilesGeneratorForVerticalZip( vector zipPos_start, vector zipAng_start )
    {
        // Part of the calculation
        int indexStartPos = 0 ; int indexEndPos = 1

        array< vector > lastestPos = [ ]

        vector zipPos_Offset = zipPos_start - < 0, 0, 80 >

        TraceResults result = TraceLine( zipPos_Offset, zipPos_Offset + -6000 * <0,0,1>, [], TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_PLAYER )

        vector zipPos_end = result.endPos + < 0, 0, 35 >

        int rst_pt_calc = int ( floor ( Distance( zipPos_end, zipPos_start ) / 304.0 ) + 1 )

        float ziplineLengthDist = Length( zipPos_end - zipPos_start )
        float ziplineLengthMidDist = ziplineLengthDist / 2

        vector direction = Normalize( zipPos_end - zipPos_start )

        vector debugDirection = AnglesCompose( VectorToAngles( Normalize( zipPos_end - zipPos_start ) ), < 90, 0, 0 > )

        float bestSpacing = floor( ziplineLengthDist / rst_pt_calc ) ; bestSpacing = bestSpacing % 304.0

        lastestPos.append( zipPos_start )

        for ( int i = 1 ; i < rst_pt_calc ; i++ ) // Calculate and add vectors in array
        {   vector calculatedDir = zipPos_start + ( direction * bestSpacing * i ) ; lastestPos.append( calculatedDir ) }

        lastestPos.append( zipPos_end )

        int lastestPosInt = lastestPos.len()
        int lastestPosIntCorrection = lastestPosInt - 1

        // Draw all sections of the zipline
        DebugDrawSphere( zipPos_start, 8, 255, 0, 0, true, 6.0 )

        for ( int i = 1 ; i < lastestPosInt ; i++ )
        { DebugDrawCircle( lastestPos[ i ], debugDirection, 16, 255, 0, 0, true, 6.0 ) } 

        for ( int i = 0 ; i < lastestPosIntCorrection ; i++ )
        {   DebugDrawLine( lastestPos[ indexStartPos++ ], lastestPos[ indexEndPos++ ], RandomIntRange( 0, 255 ), RandomIntRange( 0, 255 ), RandomIntRange( 0, 255 ), true, 6.0 ) }

        indexStartPos = 0

        CreateHovertankZipline2( zipPos_start, zipPos_end, true )

        // Printt on the console
        printt( "" )
        printt( "===== .ent file generation =====" )

        for ( int i = 0 ; i <= rst_pt_calc ; i++ )
        {   printt( "\"_zipline_rest_point_" + lastestPosIntCorrection-- + "\" \"" + lastestPos[ indexStartPos ].x + " " + lastestPos[ indexStartPos ].y + " " + lastestPos[ indexStartPos ].z + "\"" ) ; indexStartPos++ }

        printt( "\"angles\" " + "\"" + zipAng_start.x    + " "  + zipAng_start.y + " " + zipAng_start.z  + "\"" )
        printt( "\"origin\" " + "\"" + zipPos_end.x      + " "  + zipPos_end.y   + " " + zipPos_end.z    + "\"" )
        printt( "\"origin\" " + "\"" + zipPos_start.x    + " "  + zipPos_start.y + " " + zipPos_start.z  + "\"" )
        printt( "===== end .ent file generation =====" )
    }


    void function EntFilesGeneratorForNonVerticalZip( vector zipPos_start, vector zipPos_end )
    {
        // Part of the calculation
        int indexStartPos = 0 ; int indexEndPos = 1
        int rst_pt_calc = int ( floor ( Distance( zipPos_end ,zipPos_start ) / 978.0 ) + 1 )

        float ziplineLengthDist = Length( zipPos_end - zipPos_start )
        float ziplineLengthMidDist = ziplineLengthDist / 2

        array< vector > lastestPos = [ ]

        vector anglesStartToEnd = VectorToAngles( Normalize( zipPos_end - zipPos_start ) )
        anglesStartToEnd.x = anglesStartToEnd.x % 180.0
        anglesStartToEnd.y = anglesStartToEnd.y % 180.0
        anglesStartToEnd.z = anglesStartToEnd.z % 180.0

        vector anglesEndToStart = VectorToAngles( Normalize( zipPos_start - zipPos_end ) )
        anglesEndToStart.x = anglesEndToStart.x % 180.0
        anglesEndToStart.y = anglesEndToStart.y % 180.0
        anglesEndToStart.z = anglesEndToStart.z % 180.0

        vector direction = Normalize( zipPos_end - zipPos_start )

        vector debugDirection = AnglesCompose( VectorToAngles( direction ), < 90, 0, 0 > )

        float bestSpacing = floor( ziplineLengthDist / rst_pt_calc ) ; bestSpacing = bestSpacing % 978.0

        lastestPos.append( zipPos_start )

        for ( int i = 1 ; i < rst_pt_calc ; i++ ) // Calculate and add vectors in array
        {   vector calculatedDir = zipPos_start + ( direction * bestSpacing * i ) ; lastestPos.append( calculatedDir ) }

        lastestPos.append( zipPos_end )

        int lastestPosInt = lastestPos.len()
        int lastestPosIntCorrection = lastestPosInt - 1
        int lastestPosIntDebugDraw  = lastestPosInt - 2

        // Draw all sections of the zipline
        DebugDrawSphere( zipPos_start, 8, 255, 0, 0, true, 6.0 )
        DebugDrawSphere( zipPos_end, 8, 0, 0, 255, true, 6.0 )

        for ( int i = 1 ; i <= lastestPosIntDebugDraw ; i++ )
        { DebugDrawCircle( lastestPos[ i ], debugDirection, 16, 255, 0, 0, true, 6.0 ) } 

        for ( int i = 0 ; i < lastestPosIntCorrection ; i++ )
        {   DebugDrawLine( lastestPos[ indexStartPos++ ], lastestPos[ indexEndPos++ ], RandomIntRange( 0, 255 ), RandomIntRange( 0, 255 ), RandomIntRange( 0, 255 ), true, 6.0 ) }

        indexStartPos = 0

        CreateHovertankZipline2( zipPos_start, zipPos_end )

        // Printt on the console
        printt( "" )
        printt( "===== .ent file generation =====" )

        for ( int i = 0 ; i <= rst_pt_calc ; i++ )
        {   printt( "\"_zipline_rest_point_" + lastestPosIntCorrection-- + "\" \"" + lastestPos[ indexStartPos ].x + " " + lastestPos[ indexStartPos ].y + " " + lastestPos[ indexStartPos ].z + "\"" ) ; indexStartPos++ }

        printt( "\"angles\" " + "\"" + anglesStartToEnd.x    + " " + anglesStartToEnd.y  + " " + anglesStartToEnd.z  + "\"" )
        printt( "\"origin\" " + "\"" + zipPos_end.x      + " " + zipPos_end.y    + " " + zipPos_end.z    + "\"" )
        printt( "" )
        printt( "\"angles\" " + "\"" + anglesEndToStart.x    + " " + anglesEndToStart.y  + " " + anglesEndToStart.z  + "\"" )
        printt( "\"origin\" " + "\"" + zipPos_start.x    + " " + zipPos_start.y  + " " + zipPos_start.z  + "\"" )
        printt( "===== end .ent file generation =====\n" ) 
    }


    bool function ClientCommand_DebugDrawZipline( entity player, array<string> args )
    {
        foreach ( ziplines in IS_VERTICAL_ZIPLINE )
        {
            if ( ziplines.GetModelName() == $"mdl/industrial/zipline_arm.rmdl" )
            {
                // Part of the calculation
                entity fx = PlayFXOnEntity( $"P_test_angles", ziplines, "", < -4, -55.5, -12 > ) // hack for find origin
                vector zipPos_start = fx.GetOrigin()
                if ( IsValid( fx ) ) fx.Destroy()

                int indexStartPos = 0 ; int indexEndPos = 1
                vector zipPos_Offset = zipPos_start - < 0, 0, 80 >

                array< vector > lastestPos = [ ]

                TraceResults result = TraceLine( zipPos_Offset, zipPos_Offset + -6000 * <0,0,1>, [], TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_PLAYER )

                vector zipPos_end = result.endPos + < 0, 0, 35 >

                vector debugDirection = AnglesCompose( VectorToAngles( Normalize( zipPos_end - zipPos_start ) ), < 90, 0, 0 > )

                int rst_pt_calc = int ( floor ( Distance( zipPos_end, zipPos_start ) / 304.0 ) + 1 )

                lastestPos.append( zipPos_start )

                for ( int i = 1 ; i < rst_pt_calc ; i++ ) // Calculate and add vectors in array
                {
                    vector direction = Normalize( zipPos_end - zipPos_start ) * 304.0 * i
                    vector calculatedDir = zipPos_start + direction
                    lastestPos.append( calculatedDir )
                }

                lastestPos.append( zipPos_end )

                int lastestPosInt = lastestPos.len()
                int lastestPosIntCorrection = lastestPosInt - 1

                // Draw all sections of the zipline
                DebugDrawSphere( zipPos_start, 8, 255, 0, 0, true, 20.0 )

                for ( int i = 1 ; i < lastestPosInt ; i++ )
                { DebugDrawCircle( lastestPos[ i ], debugDirection, 16, 255, 0, 0, true, 20.0 ) } 

                for ( int i = 0 ; i < lastestPosIntCorrection ; i++ )
                {   DebugDrawLine( lastestPos[ indexStartPos++ ], lastestPos[ indexEndPos++ ], RandomIntRange( 0, 255 ), RandomIntRange( 0, 255 ), RandomIntRange( 0, 255 ), true, 20.0 ) }
            }
        }

        foreach ( ziplines in NON_HORIZONTAL_ZIPLINE_START )
        {
            if ( ziplines.GetModelName() == $"mdl/industrial/zipline_arm.rmdl" )
            {
                // Part of the calculation
                int index
                index = NON_HORIZONTAL_ZIPLINE_START.find( ziplines )

                entity ent_start = NON_HORIZONTAL_ZIPLINE_START[ index ]
                entity ent_end = NON_HORIZONTAL_ZIPLINE_END[ index ]

                entity fx_start = PlayFXOnEntity( $"P_test_angles", ent_start, "", < -4, -55.5, -12 > ) // hack for find origin
                entity fx_end   = PlayFXOnEntity( $"P_test_angles", ent_end, "", < -4, -55.5, -12 > ) // hack for find origin

                vector zipPos_start = fx_start.GetOrigin()
                vector zipPos_end   = fx_end.GetOrigin()

                if ( IsValid( fx_start ) ) fx_start.Destroy()
                if ( IsValid( fx_end ) ) fx_end.Destroy()

                int indexStartPos = 0 ; int indexEndPos = 1
                int rst_pt_calc = int ( floor ( Distance( zipPos_end ,zipPos_start ) / 304.0 ) + 1 )

                array< vector > lastestPos = [ ]

                vector debugDirection = AnglesCompose( VectorToAngles( Normalize( zipPos_end - zipPos_start ) ), < 90, 0, 0 > )

                lastestPos.append( zipPos_start )

                for ( int i = 1 ; i < rst_pt_calc ; i++ ) // Calculate and add vectors in array
                {
                    vector direction = Normalize( zipPos_end - zipPos_start ) * 304.0 * i
                    vector calculatedDir = zipPos_start + direction
                    lastestPos.append( calculatedDir )
                }

                lastestPos.append( zipPos_end )

                int lastestPosInt = lastestPos.len()
                int lastestPosIntCorrection = lastestPosInt - 1
                int lastestPosIntDebugDraw  = lastestPosInt - 2

                // Draw all sections of the zipline
                DebugDrawSphere( zipPos_start, 8, 255, 0, 0, true, 20.0 )
                DebugDrawSphere( zipPos_end, 8, 255, 0, 0, true, 20.0 )

                for ( int i = 1 ; i <= lastestPosIntDebugDraw ; i++ )
                { DebugDrawCircle( lastestPos[ i ], debugDirection, 16, 255, 0, 0, true, 20.0 ) } 

                for ( int i = 0 ; i < lastestPosIntCorrection ; i++ )
                {   DebugDrawLine( lastestPos[ indexStartPos++ ], lastestPos[ indexEndPos++ ], RandomIntRange( 0, 255 ), RandomIntRange( 0, 255 ), RandomIntRange( 0, 255 ), true, 20.0 ) }
            }
        }

    return true }


    bool function ClientCommand_GetEnt( entity player, array<string> args )
    {
        GetEntityTouched( player )
    return true }


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

#if SERVER || CLIENT
    PingTraceResults function GetEntityTouched( entity player )
    {
        const int colGroup = TRACE_COLLISION_GROUP_NONE
        const int colMask = ( TRACE_MASK_VISIBLE_AND_NPCS | CONTENTS_BLOCKLOS | CONTENTS_BLOCK_PING | CONTENTS_HITBOX )

        TraceResults tr = PingTraceForPlayer( player, 9000, colMask, colGroup )

        PingTraceResults result
        if ( ConsiderPingTraceFailed2( tr ) )
        {
            result.success = false
        }
        else
        {        
            result.player = player
            result.endPos = tr.endPos
            result.surfaceNormal = tr.surfaceNormal
            result.hitDist = ( tr.fraction * 9000 )
            result.hitEnt = tr.hitEnt
            result.success = true
        }
        result.tr = tr

        if ( result.hitEnt == null )
        {
            return result
        }
        else
        {
            #if SERVER
                printt( "" )
                printt( "		TraceResults:		" )
                printt( "===========================" )
                printt( "Ent_Number:            " + result.hitEnt )
                printt( "Ent_ModelName:         " + result.hitEnt.GetModelName() )
                printt( "Ent_Origin:            " + result.hitEnt.GetOrigin() )
                printt( "Ent_Angles:            " + result.hitEnt.GetAngles() )
                printt(	"Ping_Origin:           " + result.endPos )

                if (  result.hitEnt.GetTargetName() != "" )
                {
                    if ( result.hitEnt.GetTargetName() != "editor_ref" )
                    {
                        printt(	"Target Name:           "	+ result.hitEnt.GetTargetName() )
                    }
                    else
                    {
                        printt(	"Editor Ref:            "	+ result.hitEnt.GetTargetName() )
                    }
                }

                printt( "===========================" )
                printt( "" )

                DebugDrawAxis( result.hitEnt.GetOrigin(), result.hitEnt.GetAngles(), 6.0, 30, <0,0,0> )
                if ( ZIPLINE_ENTS.contains( result.hitEnt ) ) thread FindBestZiplineLocation( result.hitEnt )
                //else thread EntFilesGeneratorForProps( result.hitEnt ) // For testing but the ent is not solid

            #endif

            #if CLIENT
                if ( result.hitEnt.GetScriptName() == "editor_ref" )
                {
                    AddPlayerHint( 3.0, 0.0, $"",
                    "\nEditor Ref Name : "	+ result.hitEnt.GetTargetName() +
                    "\nEditor Ref Origin : " + result.hitEnt.GetOrigin() + " " + result.hitEnt.GetAngles() )
                }
                else
                {
                    AddPlayerHint( 3.0, 0.0, $"", // rui/menu/buttons/tip
                    "Name : " + result.hitEnt.GetModelName() +
                    "\nOrigin : " + result.hitEnt.GetOrigin() + " " + result.hitEnt.GetAngles() )
                }
            #endif

            #if SERVER
                //if ( result.hitEnt.GetScriptName() == "FloppytownEntities" || result.hitEnt.GetScriptName() == "editor_ref")
                //{ result.hitEnt.Destroy() }
            #endif
        }

        return result
    }

    bool function ConsiderPingTraceFailed2( TraceResults tr )
    {
        if ( tr.hitSky )
            return true
        if ( tr.fraction >= 0.99 )
            return true

        return false
    }
#endif
