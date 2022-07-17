global function CodeCallback_MapInit

void function CodeCallback_MapInit()
{
    printt( "" )
    printt( "|=========================================================================|" )
    printt( "| Floppytown_MapInit:                           The file has been called. |" )
    Floppytown_MapInit_Common()

    if ( GetCurrentPlaylistVarBool( "ft_dev_enable", false ) ) // map editing, do not activate in normal use
    {
        Floppytown_MapInit_Dev()
    }

    Floppytown_MapInit_Asset_Library()
    Floppytown_MapInit_Vectors_Library()
    Floppytown_MapInit_Assembly()
    Floppytown_MapInit_Generation()

    printt( "" )
    printt( " Map generated, hello " + GetMapName() + " !" )
    printt( "" )

    if ( GetCurrentPlaylistVarBool( "ft_dev_enable", false ) ) // map editing, do not activate in normal use
    {
        printt( "|=============================================================|" )
        printt( "|>>>>>>>>>>>>> WARNING: DEVELOPER MODE IS ENABLE <<<<<<<<<<<<<|" )
        printt( "|=============================================================|" )
    }
    printt( "" )
}
