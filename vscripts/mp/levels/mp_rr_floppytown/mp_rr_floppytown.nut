untyped

global function CodeCallback_MapInit
global function PrinttServerFiles

void function CodeCallback_MapInit()
{
    FlagInit( "FallingObjectThread()_IsActive" )
    FlagInit( "FallingObjectThread()_thread_ending" )

    PrecacheAssets()

    //SetConVarInt( "r_drawWorldMeshes", 0 )
    SetConVarInt( "gl_clear_color_buffer", 1 )

    Floppytown_MapInit_Common()

    DebugPrintt()

    Floppytown_MapInit()
}

void function PrinttServerFiles()
{
    printt( "|mp_rr_floppytown.nut:                           file called.|" )
}

void function Floppytown_MapInit()
{
    Floppytown_MapInit_Global_Functions()
    Floppytown_MapInit_Global_Assets()
    Floppytown_MapInit_Global_Vectors()
    Floppytown_MapInit_Assembly()
    Floppytown_MapInit_Generation()
    Floppytown_MapInit_Dev()
}
