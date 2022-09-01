untyped

globalize_all_functions

global struct PingTraceResultsTest
{
    entity player
    vector endPos
    vector surfaceNormal
    float  hitDist
    entity hitEnt
    bool   success = false

    entity pingedEnt
    vector pingedEntPos

    TraceResults & tr
}
global PingTraceResultsTest pingTraceResultsTest


void function Developer_Init()
{
    #if SERVER
        AddClientCommandCallback( "GetEnt", ClientCommand_GetEnt )
    #endif
}


void function debug_printt( ... )
{
    if ( GetCurrentPlaylistVarBool( "r5devDebugFloppytown", true) )
    {
	    if ( vargc <= 0 )
	    	return

	    local msg = vargv[0]
	    for ( int i = 1; i < vargc; i++ )
	    	msg = (msg + " " + vargv[i])

	    printl( msg )
    }
}


#if SERVER
    bool function ClientCommand_GetEnt( entity player, array<string> args )
    {
        GetEntityTouched( player )
    return true }
#endif


#if SERVER || CLIENT
    PingTraceResultsTest function GetEntityTouched( entity player )
    {
        const int colGroup = TRACE_COLLISION_GROUP_NONE
        const int colMask = ( TRACE_MASK_VISIBLE_AND_NPCS | CONTENTS_BLOCKLOS | CONTENTS_BLOCK_PING | CONTENTS_HITBOX )

        TraceResults tr = PingTraceForPlayer( player, 9000, colMask, colGroup )

        PingTraceResultsTest result
        if ( ConsiderPingTraceFailedFloppytown( tr ) )
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
                pingTraceResultsTest.pingedEnt = result.hitEnt
                pingTraceResultsTest.pingedEntPos = result.hitEnt.GetOrigin()
                printt( "" )
                printt( "		TraceResults:		" )
                printt( "===========================" )
                printt( "Ent:                   " + result.hitEnt )
                printt( "ModelName:             " + result.hitEnt.GetModelName() )
                printt( "Origin ~ FT Spawn:     " + ( result.hitEnt.GetOrigin() - FLOPPYTOWN_POS ) )
                printt( "Angles:                " + result.hitEnt.GetAngles() )
                printt(	"Real Origin:           " + result.hitEnt.GetOrigin() )
                printt(	"Ping Origin:           " + result.endPos )

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

                printt( "Height: " + GetEntHeight( result.hitEnt ) )
                printt( "Width:  " + GetEntWidth ( result.hitEnt ) )
                printt( "Depth:  " + GetEntDepth ( result.hitEnt ) )

                DebugDrawAxis( result.hitEnt.GetOrigin(), result.hitEnt.GetAngles(), 6.0, 30, <0,0,0> )

            #endif

            #if SERVER
                //if ( result.hitEnt.GetScriptName() == "FloppytownEntities" || result.hitEnt.GetScriptName() == "editor_ref")
                //{ result.hitEnt.Destroy() }
            #endif
        }

        return result
    }
#endif

bool function ConsiderPingTraceFailedFloppytown( TraceResults tr )
{
    if ( tr.hitSky )
        return true
    if ( tr.fraction >= 0.99 )
        return true
        
    return false
}
