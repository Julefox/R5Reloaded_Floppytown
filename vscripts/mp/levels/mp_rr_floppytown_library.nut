global function Floppytown_MapInit_Library

void function Floppytown_MapInit_Library()
{
    FloppyTown_MapInit_Common()

    Yes()

    printt( "library OK" )
}

entity function CreateFloppytownModel( asset a, vector pos, vector ang, bool mantle = false, float fade = 20000, int realm = -1 )
{
    entity prop = CreatePropDynamic( a, pos, ang, SOLID_VPHYSICS, fade )
    prop.kv.fadedist = fade
    if( mantle ) prop.AllowMantle()
    if ( realm> -1 )
    { prop.RemoveFromAllRealms(); prop.AddToRealm( realm ) }
    prop.e.gameModeId = realm
    prop.SetScriptName( "FloppyTownEntities" )
    return prop
}

void function Yes()
{
    CreateFloppytownModel( $"mdl/menu/menu_cubemap.rmdl", <0, 0, 4000>, <0, 0, 0>, true, 20000, -1 )
}
