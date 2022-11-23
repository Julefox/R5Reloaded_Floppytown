untyped

global function CodeCallback_MapInit


global struct Floppytown
{
    entity worldspawn
    vector worldspawnPos = < 0, 0, 0 >
    vector devPlatformPos = < 0, 0, 0 >
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
    floppytown.devPlatformPos = DEV_PLATFORM_POS

    Floppytown_MapInit_Common()
    Floppytown_MapInit_Dev()

    //Floppytown_MapInit_Generation()
    _Floppytown()
}

void function _Floppytown()
{
    //Starting Origin, Change this to a origin in a map 
    vector originOffset = < 2000, 2000, 6000 >

    var dataTable = GetDataTable( $"datatable/mp_rr_floppytown.rpak" )
    int numRows = GetDatatableRowCount( dataTable )

    int originColumn = GetDataTableColumnByName( dataTable, "origin" )
    int anglesColumn = GetDataTableColumnByName( dataTable, "angles" )
    int scaleColumn = GetDataTableColumnByName( dataTable, "scale" )
    int fadeColumn = GetDataTableColumnByName( dataTable, "fade" )
    int mantleColumn = GetDataTableColumnByName( dataTable, "mantle" )
    int mdlColumn = GetDataTableColumnByName( dataTable, "mdl" )


    for ( int i = 0 ; i < numRows; i++ )
    {
        vector origin = GetDataTableVector( dataTable, i, originColumn )
        vector angles = GetDataTableVector( dataTable, i, anglesColumn )
        float scale = GetDataTableFloat( dataTable, i, scaleColumn )
        float fade = GetDataTableFloat( dataTable, i, fadeColumn )
        bool mantle = GetDataTableBool( dataTable, i, mantleColumn )
        asset mdl = GetDataTableAsset( dataTable, i, mdlColumn )

        MapEditor_CreateProp( mdl, origin + originOffset, angles, mantle, fade, -1, scale )
    }

}

entity function MapEditor_CreateProp( asset a, vector pos, vector ang, bool mantle = false, float fade = 5000, int realm = -1, float scale = 1 )
{
	entity e = CreatePropDynamic( a, pos, ang, SOLID_VPHYSICS, fade )
	e.kv.fadedist = fade
	e.kv.rendermode = 0
	e.kv.renderamt = 1
	e.kv.solid = 6
	e.kv.CollisionGroup = TRACE_COLLISION_GROUP_PLAYER

	if(mantle) e.AllowMantle()
    
	if (realm > -1) {
		e.RemoveFromAllRealms()
		e.AddToRealm(realm)
	}
    
	e.SetScriptName("editor_placed_prop")
	e.e.gameModeId = realm
    e.SetModelScale( scale )
    
	return e
}