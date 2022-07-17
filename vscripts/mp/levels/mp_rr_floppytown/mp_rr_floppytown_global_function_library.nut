untyped

globalize_all_functions


void function Floppytown_MapInit_Global_Function_Library()
{
    printt( "| Floppytown_MapInit_Global_Function_Library:   The file has been called. |" )
}


entity function CreateFloppytownModel( asset a, vector pos, vector ang, string script_name = "FloppytownEntities" )
{
    entity prop = CreatePropDynamic( a, pos, ang, SOLID_VPHYSICS, 20000 )
    prop.kv.fadedist = 20000
    prop.AllowMantle()
    int realm = -1
    if ( realm> -1 )
    { prop.RemoveFromAllRealms(); prop.AddToRealm( realm ) }
    prop.e.gameModeId = realm

    FLOPPYTOWN_ENTITIES.append( prop )
    prop.SetScriptName( script_name )

return prop }


array< entity > function CreateFloppytownZiplineModel( vector pos, vector ang )
{
    entity column   = CreateFloppytownModel( SECURITY_FENCE, pos, ang )
    entity support  = CreateFloppytownModel( ZIP_ARM, pos + < 0, 0, 185 >, ang )

return [ column, support ] }


entity function CreateEditorRef( vector pos, vector ang, string name )
{
    entity editor_ref = CreateFloppytownModel( EDITOR_REF, pos, ang )
    SetTargetName( editor_ref, name )
    editor_ref.SetScriptName( "editor_ref" )
return editor_ref }


entity function CreateFloppytownUsableModel( asset model, vector pos, vector ang, string prompt, string name = "" )
{
 	entity TeleporterButton = CreateEntity("prop_dynamic")
	TeleporterButton.kv.solid = 6
	TeleporterButton.SetValueForModelKey( model )
	TeleporterButton.AllowMantle()
	TeleporterButton.SetScriptName( name )
	TeleporterButton.SetOrigin(pos)
	TeleporterButton.SetAngles(ang)
	DispatchSpawn(TeleporterButton)

	TeleporterButton.SetUsable()
	TeleporterButton.SetUsableByGroup("pilot")
	TeleporterButton.SetUsePrompts(prompt, prompt)
	return TeleporterButton 
}


entity function CreateFloppytownScriptMover( vector origin = <0.0, 0.0, 0.0>, vector angles = <0.0, 0.0, 0.0>, string name = "" )
{
	entity script_mover = CreateEntity( "script_mover_lightweight" )
	script_mover.kv.solid = 0
	script_mover.SetValueForModelKey( $"mdl/dev/empty_model.rmdl" )
	script_mover.kv.SpawnAsPhysicsMover = 0
	script_mover.SetScriptName( name )
	script_mover.SetOrigin( origin )
	script_mover.SetAngles( angles )
	DispatchSpawn( script_mover )
	return script_mover
}


entity function CreateFloppyWallTrigger(vector pos, float box_radius = 1000 )
{
    entity map_trigger = CreateEntity( "trigger_cylinder" )
    map_trigger.SetRadius( box_radius );map_trigger.SetAboveHeight( 5000 );map_trigger.SetBelowHeight( 10 );
    map_trigger.SetOrigin( pos )
    DispatchSpawn( map_trigger )
    FLOPPYTOWN_ENTITIES.append( map_trigger )
    thread FloppyWallTrigger( map_trigger )
    return map_trigger
}


void function FloppyWallTrigger(entity proxy, float speed = 0.6)
{   bool active = true
    while (active)
    {   if(IsValid(proxy))
        {   foreach(player in GetPlayerArray())
            {   if (player.GetPhysics() != MOVETYPE_NOCLIP)//won't affect noclip player
                {   if(proxy.IsTouching(player))
				{
                    player.Zipline_Stop()
					switch(GetMapName())
					{
					    default:
					    	vector target_origin = player.GetOrigin()
                            target_origin.z = 0.0
					    	vector proxy_origin = proxy.GetOrigin()
					    	vector target_angles = player.GetAngles()
					    	vector proxy_angles = proxy.GetAngles()

					    	vector velocity = target_origin - proxy_origin
					    	velocity = velocity * speed

					    	vector angles = target_angles - proxy_angles

					    	velocity = velocity + angles
					    	player.SetVelocity(velocity)
			}   }   }   }
        } else {active = false ; break}
        wait 0.01
}   }
