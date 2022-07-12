global function ClientCodeCallback_MapInit

void function ClientCodeCallback_MapInit()
{
	Floppytown_MapInit_Common()

	//FloppytownLightEnvironment()

	printt( "++++-------------------------------------------------------------------------++++" )
	printt( ">>>>>>>>>>>>>>>>>>>>>>>>>>>>> WELCOME ON FLOPPYTOWN <<<<<<<<<<<<<<<<<<<<<<<<<<<<<" )
	printt( "++++-------------------------------------------------------------------------++++" )
	printt( "+                               SPECIAL THANKS TO                               +" )
    printt( "+                                                                               +" )
    printt( "+                           EckO.#1636 | Main builder                           +" )
    printt( "+                        @Julefox_ | Main builder & Code                        +" )
    printt( "+                           @ArchtuxTV | Script Support                         +" )
    printt( "+                         @kralrindo | Map Support                              +" )
    printt( "+                                                                               +" )
	printt( "++++-------------------------------------------------------------------------++++" )
	printt( "++++-------------------------------------------------------------------------++++" )
}

void function FloppytownLightEnvironment()
{
	float brightness_dev = 600.0
    entity dlight_dev_0_0 = CreateClientSideDynamicLight( <1152, 3008, 336>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
	dlight_dev_0_0.SetLightExponent( 0.1 )
	entity dlight_dev_0_1 = CreateClientSideDynamicLight( <896, 3264, 336>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
	dlight_dev_0_1.SetLightExponent( 0.1 )
}
