global function ClientCodeCallback_MapInit

global function ServerCallback_AnnouncementTest

void function ClientCodeCallback_MapInit()
{
    printt( "" )
    printt( "|=========================================================================|" )
    Floppytown_MapInit_Common()
    Floppytown_MapInit_Client()

    ServerCallback_ToneMapping( 16.0, 2.0, 0.1, 0.75 )

    //FloppytownLightEnvironment()

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

    printt( "|=========================================================================|" )
    printt( "| Map generated, hello " + GetMapName() + " !" )
    printt( "|=========================================================================|" )
    printt( "" )
}

void function FloppytownLightEnvironment()
{
    float brightness_dev = 600.0
    entity dlight_dev_0_0 = CreateClientSideDynamicLight( <1152, 3008, 336>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
    dlight_dev_0_0.SetLightExponent( 0.1 )
    entity dlight_dev_0_1 = CreateClientSideDynamicLight( <896, 3264, 336>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
    dlight_dev_0_1.SetLightExponent( 0.1 )
}

void function ServerCallback_AnnouncementTest()
{
    entity player = GetPlayerArray()[0]
    AnnouncementData announcement = Announcement_Create( "" )
	Announcement_SetSoundAlias( announcement, "survival_circle_close_alarm_01" )
    AnnouncementFromClass( player, announcement )
}

void function Floppytown_MapInit_Client()
{
    printt( "| Floppytown_MapInit_Client:                    The file has been called. |" )
    printt( "|=========================================================================|" )
}
