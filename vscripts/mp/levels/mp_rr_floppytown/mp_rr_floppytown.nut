global function CodeCallback_MapInit

void function CodeCallback_MapInit()
{
    printt( "" )
    printt( "Floppytown_MapInit:                           The file has been called." )
    Floppytown_MapInit_Common()
    Floppytown_MapInit_Asset_Library()
    Floppytown_MapInit_Vectors_Library()
    Floppytown_MapInit_Assembly()
    Floppytown_MapInit_Generation()

    printt( "Hello " + GetMapName() + " !" )
}
