untyped

#if SERVER || CLIENT
    global function Floppytown_MapInit_Common
    global function DebugPrintt


    void function PrinttCommonFiles()
    {
        #if SERVER
            printt( "|mp_rr_floppytown_common.nut:                    file called.|" )
        #endif
    }


    void function Floppytown_MapInit_Common()
    {
        #if SERVER
            PrecacheAssets()
        #endif

        Floppytown_MapInit_Crane_Scripts()
    }


    void function DebugPrintt()
    {
        if ( GetCurrentPlaylistVarBool( "ft_debug_printt", false ) )
        {
            #if SERVER // server side
                printt( "" )
                printt( "|============================================================|" )

                PrinttGlobalFunctionFiles()
                PrinttGlobalAssetsFiles()
                PrinttGlobalVectorsFiles()
                PrinttServerFiles()
                PrinttAssemblyFiles()
                PrinttGenerationFiles()

                if ( GetCurrentPlaylistVarBool( "ft_dev_enable", false ) ) // map editing, do not activate in normal use
                    PrinttDevFiles()
            #endif

            #if SERVER || CLIENT // server || client side
                PrinttCommonFiles()
                PrinttCraneFiles()
            #endif

            #if CLIENT // client side
                PrinttClientFiles()
            #endif

            #if SERVER // server side
                if ( GetCurrentPlaylistVarBool( "ft_dev_enable", false ) ) // map editing, do not activate in normal use
                {
                    printt( "|============================================================|" )
                    printt( "|>>>>>>>>>>>> WARNING:  DEVELOPER MODE IS ENABLE <<<<<<<<<<<<|" )
                    printt( "|============================================================|" )
                    printt( "" )
                }
                else
                {
                    printt( "|============================================================|" )
                    printt( "" )
                }
            #endif
        }
    }
#endif