global function CodeCallback_MapInit

void function CodeCallback_MapInit()
{
    Floppytown_MapInit_Common()
    Floppytown_MapInit_Library()
    Floppytown_MapInit_Assembly()
    Floppytown_MapInit_Generation()

    printt( "Hello " + GetMapName() + " !" )
}
