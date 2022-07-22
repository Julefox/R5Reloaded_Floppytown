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

    //FloppytownLightEnvironment()

    thread Thanks()

    printt( "" )
    printt( "|============================================================|" )
    printt( "| Map generated, hello " + GetMapName() + " !" )
    printt( "|============================================================|" )
    printt( "" )
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

void function FloppytownLightEnvironment()
{
    float brightness_dev = 600.0
    entity dlight_dev_0_0 = CreateClientSideDynamicLight( <1152, 3008, 336>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
    dlight_dev_0_0.SetLightExponent( 0.1 )
    entity dlight_dev_0_1 = CreateClientSideDynamicLight( <896, 3264, 336>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
    dlight_dev_0_1.SetLightExponent( 0.1 )
}
