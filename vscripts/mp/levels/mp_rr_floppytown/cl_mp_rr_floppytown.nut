untyped

globalize_all_functions


void function PrinttClientFiles()
{
    printt( "" )
    printt( "|============================================================|" )
    printt( "|cl_mp_rr_floppytown.nut:                        file called.|" )
    printt( "|============================================================|" )
    printt( "" )
}


void function ClientCodeCallback_MapInit()
{
    DebugPrintt()

    Floppytown_MapInit_Common()

    ServerCallback_ToneMapping( 16.0, 2.0, 0.1, 0.75 )

    thread Thanks()

    printt( "" )
    printt( "|============================================================|" )
    printt( "| Map generated, hello " + GetMapName() + " !" )
    printt( "|============================================================|" )
    printt( "" )
}

void function ServerCallback_Crane_DoAnnouncement()
{
    foreach( player in GetPlayerArray() )
    {
        AnnouncementData announcement = Announcement_Create( "" )
	    Announcement_SetSoundAlias( announcement, "survival_circle_close_alarm_01" )
        AnnouncementFromClass( player, announcement )
    }
}

void function Thanks()
{
    wait 6

    printt( "" )
    printt( "++++-------------------------------------------------------------------------++++" )
    printt( ">>>>>>>>>>>>>>>>>>>>>>>>>>>>> WELCOME ON FLOPPYTOWN <<<<<<<<<<<<<<<<<<<<<<<<<<<<<" )
    printt( "++++-------------------------------------------------------------------------++++" )
    printt( "+                               SPECIAL THANKS TO                               +" )
    printt( "+                                                                               +" )
    printt( "+                           EckO.#1636 | Designer                               +" )
    printt( "+                            @Julefox_ | Main builder & Code                    +" )
    printt( "+                           @CriosChan | Main builder & Code                    +" )
    printt( "+                           @ArchtuxTV | Script Support                         +" )
    printt( "+                           @kralrindo | Map Support                            +" )
    printt( "+                                                                               +" )
    printt( "++++-------------------------------------------------------------------------++++" )
    printt( "++++-------------------------------------------------------------------------++++" )
    printt( "" )
}

void function ServerCallback_HUD_Test_DoAnnouncement()
{
    thread HUD_Test()
}

void function HUD_Test()
{
    array<var> ruis = []

    entity player = GetLocalViewPlayer()

    /* // LINE 1
	var titleRui = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 0 )
	RuiSetInt( titleRui, "maxLines", 30 )
	RuiSetInt( titleRui, "lineNum", 0 )
	RuiSetString( titleRui, "msgText", Localize( "Thanks to:", "" ) )
	RuiSetFloat( titleRui, "msgFontSize", 30.0 )
	RuiSetFloat( titleRui, "msgAlpha", 1.0 )
	RuiSetFloat3( titleRui, "msgColor", <0.07,	0.88,	0.68> )
	RuiSetFloat2( titleRui, "msgPos", < 0.82, 0.25, 0.0 > )
	ruis.append( titleRui )

    RuiSetString( titleRui, "msgText", "Thanks to:" )

    var titleRui1 = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 0 )
	RuiSetInt( titleRui1, "maxLines", 30 )
	RuiSetInt( titleRui1, "lineNum", 2 )
	RuiSetString( titleRui1, "msgText", Localize( "Julefox", "" ) )
	RuiSetFloat( titleRui1, "msgFontSize", 30.0 )
	RuiSetFloat( titleRui1, "msgAlpha", 1.0 )
	RuiSetFloat3( titleRui1, "msgColor", <0.96, 0.0, 0.0> )
	RuiSetFloat2( titleRui1, "msgPos", < 0.82, 0.25, 0.0 > )
	ruis.append( titleRui1 )

    RuiSetString( titleRui1, "msgText", "Julefox" )

    var titleRui2 = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 0 )
	RuiSetInt( titleRui2, "maxLines", 30 )
	RuiSetInt( titleRui2, "lineNum", 3 )
	RuiSetString( titleRui2, "msgText", Localize( "Crioschan", "" ) )
	RuiSetFloat( titleRui2, "msgFontSize", 30.0 )
	RuiSetFloat( titleRui2, "msgAlpha", 1.0 )
	RuiSetFloat3( titleRui2, "msgColor", <0.1, 0.23, 0.4> )
	RuiSetFloat2( titleRui2, "msgPos", < 0.82, 0.25, 0.0 > )
	ruis.append( titleRui2 )

    RuiSetString( titleRui2, "msgText", "Crioschan" )

    var titleRui3 = CreateCockpitRui( $"ui/cockpit_console_text_top_left.rpak", 0 )
	RuiSetInt( titleRui3, "maxLines", 30 )
	RuiSetInt( titleRui3, "lineNum", 4 )
	RuiSetString( titleRui3, "msgText", Localize( "Archtux", "" ) )
	RuiSetFloat( titleRui3, "msgFontSize", 30.0 )
	RuiSetFloat( titleRui3, "msgAlpha", 1.0 )
	RuiSetFloat3( titleRui3, "msgColor", <0.1, 0.23, 0.4> )
	RuiSetFloat2( titleRui3, "msgPos", < 0.82, 0.25, 0.0 > )
	ruis.append( titleRui3 )

    RuiSetString( titleRui3, "msgText", "Archtux" )

        wait 6 */

    foreach( rui in ruis )
	{
		RuiDestroyIfAlive( rui )
	}

    /* AnnouncementData announcement = Announcement_Create( "Trace Results" )
    Announcement_SetSubText(announcement, "subtext")
	Announcement_SetStyle( announcement, ANNOUNCEMENT_STYLE_SWEEP )
	Announcement_SetPurge( announcement, true )
	Announcement_SetOptionalTextArgsArray( announcement, [ "true" ] )
	Announcement_SetPriority( announcement, 200 )
	announcement.duration = 4.0
	AnnouncementFromClass( GetLocalViewPlayer(), announcement ) */

	wait 1
}
