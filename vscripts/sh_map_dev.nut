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
        //AddClientCommandCallback( "GetEnt", ClientCommand_GetEnt )
        AddClientCommandCallback( "zip", ClientCommand_ZipTest )
        AddClientCommandCallback( "zip0", ClientCommand_ZipTest0 )
    #endif
}

#if SERVER
    bool function ClientCommand_ZipTest( entity player, array<string> args )
    {
        ZiplineUtility ZiplineTest = Zipline_CreateZipline(  "zipline_test", < 3888.00366, 4100.53906, 4561.24365 >, < 0, -90, 0 > )
        Zipline_SetIsMoving( ZiplineTest )
        Zipline_SetSkin( ZiplineTest, 2 )
        Zipline_CreatePanel( ZiplineTest, < 4023.12964, 4036.49243, 4365.52832 >, < 0, 0, 0 > )
        Zipline_CreatePanel( ZiplineTest, < 4036.33276, 4045.34351, 2061.67651 >, < 0, 180, 0 > )
        //Zipline_BuildInit( ZiplineTest )

        ZiplineUtility ZiplineTest0 = Zipline_CreateZipline(  "zipline_test", < 3888.00366, 4100.53906, 4561.24365 >, < 0, -58, 0 >, < 8150.14795, 5399.45068, 4307.85645 >, < 0, 90, 0 > )
        Zipline_SetIsMoving( ZiplineTest0 )
        Zipline_SetLengthScale( ZiplineTest0, 0.98 )
        Zipline_SetPreserveVelocity( ZiplineTest0 )
        //Zipline_BuildInit( ZiplineTest0 )
        //thread Yes()

    return true }

    bool function ClientCommand_ZipTest0( entity player, array<string> args )
    {
        foreach ( ziplines in ziplineUtility.ziplineArrayInit ) {
            printt( ziplines.ziplineName )
            Zipline_BuildInit( ziplines ) }

    return true }
#endif


/* void function debug_printt( ... )
{
    if ( GetCurrentPlaylistVarBool( "r5devDebug", true) )
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

                printt( "Height: " + GetEntHeight( result.hitEnt ) )
                printt( "Width:  " + GetEntWidth ( result.hitEnt ) )
                printt( "Depth:  " + GetEntDepth ( result.hitEnt ) )

                DebugDrawAxis( result.hitEnt.GetOrigin(), result.hitEnt.GetAngles(), 6.0, 30, <0,0,0> )
                //if ( ZIPLINE_ENTS.contains( result.hitEnt ) ) thread FindBestZiplineLocation( result.hitEnt )
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
#endif */
