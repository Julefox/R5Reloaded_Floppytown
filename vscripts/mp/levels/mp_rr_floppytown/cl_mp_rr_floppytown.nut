global function ClientCodeCallback_MapInit

void function ClientCodeCallback_MapInit()
{
	FloppyTown_MapInit_Common()

	FloppytownLightEnvironment()

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
	float brightness_dev = 8000
    entity dlight_dev_0_0 = CreateClientSideDynamicLight( <-465, -286, 3000>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
	dlight_dev_0_0.SetLightExponent( 1.4 )
	entity dlight_dev_0_1 = CreateClientSideDynamicLight( <-633, 5000, 3000>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
	dlight_dev_0_1.SetLightExponent( 1.4 )
	entity dlight_dev_0_2 = CreateClientSideDynamicLight( <5500, 5000, 3000>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
	dlight_dev_0_2.SetLightExponent( 1.4 )
	entity dlight_dev_0_3 = CreateClientSideDynamicLight( <5400, -530, 3000>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
	dlight_dev_0_3.SetLightExponent( 1.4 )
	entity dlight_dev_0_4 = CreateClientSideDynamicLight( <2100, 2100, 3000>, <0,0,0>, DLIGHT_WHITE, brightness_dev )
	dlight_dev_0_4.SetLightExponent( 1.4 )

	entity dlight_test = CreateClientSideDynamicLight( <-8000, 0, 6000>, <0,0,0>, DLIGHT_WHITE, 20000 )
	dlight_test.SetLightExponent( 1.4 )
}