untyped

global function CodeCallback_MapInit


global struct Floppytown
{
    entity worldspawn
    vector worldspawnPos = < 0, 0, 0 >
}
global Floppytown floppytown


void function CodeCallback_MapInit()
{
    PrecacheAssets()
    SetConVarInt( "gl_clear_color_buffer", 1 )
    //SetConVarInt( "r_drawWorldMeshes", 0 )

    entity worldSpawn = CreateModel( EDITOR_REF, FLOPPYTOWN_POS, < 0, 0, 0 > )
    SetTargetName( worldSpawn, "FloppytownWorldSpawn" )
    floppytown.worldspawn    = worldSpawn
    floppytown.worldspawnPos = FLOPPYTOWN_POS

    Floppytown_MapInit_Common()
    Floppytown_MapInit_Dev()

    //Floppytown_MapInit_Generation()
    AddCallback_EntitiesDidLoad( Floppytown_MapInit_Generation )
}
