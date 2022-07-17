untyped

globalize_all_functions

void function Floppytown_MapInit_Dev()
{
    printt( "| Floppytown_MapInit_Dev:                       The file has been called. |" )
    FloppytownDevEnable()
}

void function FloppytownDevEnable()
{
    EditorRefAreVisible()
    AreaBuildAreVisible()
    AddClientCommandCallback( "props",  ClientCommand_Props )
    AddClientCommandCallback( "god",    ClientCommand_Invulnerable )
    AddClientCommandCallback( "test",   ClientCommand_Test )
    AddClientCommandCallback( "asset",  ClientCommand_AssetViewerActive )

	for ( int i = 0 ; i < ASSET_VIEWER_ARRAY.len() ; i++)
    {
        PrecacheModel( ASSET_VIEWER_ARRAY[i] )
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
/////   become useless since in dev mode we can see the number of entities on the map in real time   /////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    bool function ClientCommand_Props( entity player, array<string> args )
    {   PrinttPropsCount(); return true }

    int function PropsCount()
    {
        int count = 0
    	foreach( EntitiesCount in GetPropsCount() )
    	{ count++ }
    	return count
    }

    array< entity > function GetPropsCount()
    {
        array< entity > EntitiesCount = GetEntArrayByScriptName( "FloppytownEntities" )
        return EntitiesCount
    }

    void function PrinttPropsCount()
    {
        printt( "" )
        printt( "Models generated by Floppytown scripts: " + PropsCount() )
        printt( "" )
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////

bool function ClientCommand_Invulnerable( entity player, array<string> args )
{
	if ( player.GetPlayerName() == "Julefox" )
	{
		if ( player.IsInvulnerable() )
        {
            player.ClearInvulnerable()
            printt( player.GetPlayerName() + " is now vulnerable." )
        }
        else
        {
            player.SetInvulnerable()
            player.SetHealth( 100 )

            printt( player.GetPlayerName() + " is invulnerable !")
        }
	}
    else
    {
        printt( "cheh." )
        return false
    }

return true }

bool function ClientCommand_Test( entity player, array<string> args )
{
return true }

bool function ClientCommand_AssetViewerActive( entity player, array<string> args )
{
    int j = 1
    int k = 1
    int l = 0
    int props_count = 0
    int max_props_count = ASSET_VIEWER_ARRAY.len() + 4


    entity wallpaper_0 = CreateFloppytownModel( YUKI_MEMORIAL_02, FT_BUILD_AREA_POS + < -2000, 3000, 5480 >, < 0, 0, 0 > )
    entity wallpaper_1 = CreateFloppytownModel( YUKI_MEMORIAL_03, FT_BUILD_AREA_POS + < 4600, 9000, 5480 >, < 0, 90, 0 > )
    entity wallpaper_2 = CreateFloppytownModel( YUKI_MEMORIAL_04, FT_BUILD_AREA_POS + < 16600, 9758, 5480 >, < 0, -90, 0 > )

    wallpaper_0.SetScriptName( "assetViewer" )
    wallpaper_0.SetModelScale( 500 )

    wallpaper_1.SetScriptName( "assetViewer" )
    wallpaper_1.SetModelScale( 500 )

    wallpaper_2.SetScriptName( "assetViewer" )
    wallpaper_2.SetModelScale( 500 )

    for ( int i = 0 ; i < ASSET_VIEWER_ARRAY.len() ; i++ )
    {

        entity assets = CreateFloppytownModel( ASSET_VIEWER_ARRAY[i], FT_BUILD_AREA_POS + < 0, 0, 1000 > + < 800 * l, 800 * j, 800 * k >, < 0, 0, 0 > )

        assets.SetScriptName( "assetViewer" )

        k++

        if ( k == 9 )
        {
            j = j+1
            k = k-8

            if ( j >= 10 )
            {
                l = l+1
                j = 10
            }
        } 
    }

    foreach ( props in GetEntArrayByScriptName( "assetViewer" ) )
    { props_count++ }

    
    if ( props_count >= max_props_count )
    {
        foreach ( props in GetEntArrayByScriptName( "assetViewer" ) )
        {
            props.Destroy()
        }
        printt( "" )
        printt("Asset Viewer Closed")
        printt( "" )
    }
    else
    {
        printt( "" )
        printt("Asset Viewer Opened")
        printt( "" )
    }

return true }
        