untyped

globalize_all_functions

void function ClientCodeCallback_MapInit()
{
    Floppytown_MapInit_Common()

    ServerCallback_ToneMapping( 16.0, 2.0, 0.1, 0.75 )

    //thread Thanks()
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

void function ServerCallback_Cl_Test()
{
    
}
