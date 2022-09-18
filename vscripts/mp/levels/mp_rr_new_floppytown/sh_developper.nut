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
        AddClientCommandCallback( "asset",  ClientCommand_AssetViewerActive )
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
                printt( "Origin ~ Dev Platform: " + ( result.hitEnt.GetOrigin() - DEV_PLATFORM_POS ) )
                printt( "Angles:                " + result.hitEnt.GetAngles() )
                printt(	"Real Origin:           " + result.hitEnt.GetOrigin() )
                printt(	"Ping Origin:           " + result.endPos )
                printt(	"Ping Origin ~ FT S:    " + ( result.endPos - FLOPPYTOWN_POS ) )
                printt(	"Ping Origin ~ Dev P:   " + ( result.endPos - DEV_PLATFORM_POS ) )

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

                printt( "W: " + GetEntWidth ( result.hitEnt ) + " D: " + GetEntDepth ( result.hitEnt ) + " H: " + GetEntHeight( result.hitEnt ) )
                printt( "===========================" )
                printt( "" )

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

#if SERVER
bool function ClientCommand_AssetViewerActive( entity player, array<string> args )
{
    int j = 1
    int k = 1
    int l = 0
    int props_count = 0
    int max_props_count = ASSET_VIEWER_ARRAY.len() + 4


    CreateFloppytownModel( DOMESTIC_YUKI_MEMORIAL_02, < -2000, 3000, 5480 >, < 0, 0, 0 >, "assetViewer" ).SetModelScale( 500 )
    CreateFloppytownModel( DOMESTIC_YUKI_MEMORIAL_03, < 4600, 9000, 5480 >, < 0, 90, 0 >, "assetViewer" ).SetModelScale( 500 )
    CreateFloppytownModel( DOMESTIC_YUKI_MEMORIAL_04, < 16600, 9758, 5480 >, < 0, -90, 0 >, "assetViewer" ).SetModelScale( 500 )

    for ( int i = 0 ; i < ASSET_VIEWER_ARRAY.len() ; i++ )
    {

        entity assets = CreateFloppytownModel( ASSET_VIEWER_ARRAY[i], < 0, 0, 1000 > + < 800 * l, 800 * j, 800 * k >, < 0, 0, 0 >, "assetViewer" )

        k++

        if ( k == 11 )
        {
            j = j+1
            k = k-10

            if ( j >= 10 )
            {
                l = l+1
                j = 10
            }
        } 
    }

    foreach ( props in GetEntArrayByScriptName( "assetViewer" ) )
    { props_count++ }

    
    if ( props_count >= max_props_count )
    {
        foreach ( props in GetEntArrayByScriptName( "assetViewer" ) )
        {
            props.Destroy()
        }
        printt( "" )
        printt("Asset Viewer Closed")
        printt( "" )
    }
    else
    {
        printt( "" )
        printt("Asset Viewer Opened")
        printt( "" )
    }

return true }
#endif
