untyped

global function ZiplineUtility_Init

global function Zipline_Create


global struct ZiplineUtility
{

}

// Used to deduce the nature of the zipline
global array< entity > ZIPLINE_ENTS                 = [ ]
global array< entity > IS_VERTICAL_ZIPLINE          = [ ]
global array< entity > IS_NON_VERTICAL_ZIPLINE      = [ ]
global array< entity > NON_HORIZONTAL_ZIPLINE_START = [ ]
global array< entity > NON_HORIZONTAL_ZIPLINE_END   = [ ]

// Assets
asset ziplineSupport = $"mdl/industrial/security_fence_post.rmdl"
asset ziplineArm = $"mdl/industrial/zipline_arm.rmdl"

void function ZiplineUtility_Init()
{
    // For tests delete them later
    Zipline_Create( < 2100.71851, 5116.19482, 2240.03125 >, < 0, 90, 0 >, 200 )
}

array< entity > function Zipline_Create( vector startPos, vector startAng, float startArmOffset = 160, bool isVertical = true, vector endPos = < 0, 0, 0 >, vector endAng = < 0, 0, 0 >, float endArmOffset = 160, int setSkinStart = 0, int setSkinEnd = 0 )
{
    // Entities Declaration
    array< entity > entityArray = [] ; entity startSupport ; entity startArm ; entity endSupport ; entity endArm

    // Offset for arm heigth | locked between 160.0 (min) / 280.0 (max)
    float minOffset = 160.0 ; float maxOffset = 280.0
    if ( startArmOffset < minOffset ) startArmOffset = minOffset else if ( startArmOffset > maxOffset ) startArmOffset = maxOffset
    if ( endArmOffset < minOffset )   endArmOffset   = minOffset else if ( endArmOffset > maxOffset )   endArmOffset   = maxOffset

    // Temporary angle for the right position | Position offsets calculation
    vector startPosArm = startPos + < -1, -2, startArmOffset > ; vector endPosArm = endPos + < -1, -2, startArmOffset > ; vector angOffset = < 0, 90, 0 >
    vector tempAng = < 0, 0, 0 > ; vector tempAngForSupport = < 0, 90, 0 > ; vector startArmAng = startAng - angOffset ; vector endArmAng = endAng - angOffset

    if ( isVertical == true ) // If vertical
    {
        switch ( setSkinStart ) // With / Without support selection
        {
            case 0: // With support
                startSupport = Zipline_CreateModel( ziplineSupport, startPos, tempAngForSupport )
                startArm = Zipline_CreateModel( ziplineArm, startPosArm, tempAng )
                entityArray.append( startSupport ) ; entityArray.append( startArm )
                startArm.SetParent( startSupport ) ; startSupport.SetAngles( startAng )
                break
            case 1: // Without support
                startArm = Zipline_CreateModel( ziplineArm, startPos, startArmAng )
                entityArray.append( startArm )
                break
            default:
            break
        }

        foreach ( ent in entityArray ) { ZIPLINE_ENTS.append( ent ) ; IS_VERTICAL_ZIPLINE.append( ent ) ; ent.SetScriptName( "IsVerticalZipline" ) }
    }
    else // If non vertical
    {
        switch ( setSkinStart ) // With / Without support selection
        {
            case 0: // With support
                startSupport = Zipline_CreateModel( ziplineSupport, startPos, tempAngForSupport )
                startArm = Zipline_CreateModel( ziplineArm, startPosArm, tempAng )
                entityArray.append( startSupport ) ; entityArray.append( startArm ) ; NON_HORIZONTAL_ZIPLINE_START.append( startArm )
                startArm.SetParent( startSupport ) ; startSupport.SetAngles( startAng )
                break
            case 1: // Without support
                startArm = Zipline_CreateModel( ziplineArm, startPos, startArmAng )
                entityArray.append( startArm ) ; NON_HORIZONTAL_ZIPLINE_START.append( startArm )
                break
            default:
            break
        }

        switch ( setSkinEnd ) // With / Without support selection
        {
            case 0: // With support
                endSupport = Zipline_CreateModel( ziplineSupport, endPos, tempAngForSupport )
                endArm = Zipline_CreateModel( ziplineArm, endPosArm, tempAng )
                entityArray.append( endSupport ) ; entityArray.append( endArm ) ; NON_HORIZONTAL_ZIPLINE_END.append( endArm )
                startArm.SetParent( startSupport ) ; startSupport.SetAngles( startAng )
                break
            case 1: // Without support
                endArm = Zipline_CreateModel( ziplineArm, endPos, endArmAng )
                entityArray.append( endArm ) ; NON_HORIZONTAL_ZIPLINE_END.append( endArm )
                break
            default:
            break
        }

        foreach ( ent in entityArray ) { ZIPLINE_ENTS.append( ent ) ; IS_NON_VERTICAL_ZIPLINE.append( ent ) ; ent.SetScriptName( "IsNonVerticalZipline" ) }
    }

return entityArray }

entity function Zipline_CreateModel( asset a, vector pos, vector ang )
{
    entity prop = CreatePropDynamic( a, pos, ang, SOLID_VPHYSICS, -1 )
    prop.kv.fadedist = -1
    prop.AllowMantle()
    int realm = -1
    if ( realm> -1 )
    { prop.RemoveFromAllRealms(); prop.AddToRealm( realm ) }
    prop.e.gameModeId = realm

return prop }
