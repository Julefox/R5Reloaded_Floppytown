untyped

globalize_all_functions

void function Floppytown_MapInit_Assembly()
{   printt( "Floppytown_MapInit_Assembly OK" )

}

//void function Ft_Geofix( asset a, vector pos, vector ang, int Xaxis, int Yaxis, int Zaxis )
//{   for ( int i = 0 ; i <  Xaxis ; i++ )
//    {   for ( int j = 0 ; j <  Yaxis ; j++ )
//        {   for ( int k = 0 ; k <  Zaxis ; k++ )
//            {
//                CreateFloppytownModel( a, pos + < 1024 * i, 352 * j, 0 * k > , ang )
//}   }   }   }

void function Ft_Floor( vector pos, vector ang, int Xaxis, int Yaxis, int Zaxis )
{   for ( int i = 0 ; i <  Xaxis ; i++ )
    {   for ( int j = 0 ; j <  Yaxis ; j++ )
        {   for ( int k = 0 ; k <  Zaxis ; k++ )
            {
                CreateFloppytownModel( BUILDING_PLATFORM_LARGE, pos + < 1024 * i, 352 * j, 0 * k > , ang )
}   }   }   }

void function Building_01( vector pos, vector ang )
{
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( BUILDING_PLATFORM, pos + < -592, -528, 1792.1 > + < 592 * i, 352 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 9 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -592, -464, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 592, -480, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 270, 0 > )  
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -528, -528, SSB_UP_TO_0 > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 568, -464, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 592, -864, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > )
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -464, -850, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
        }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -400, -912, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 568, -848, SSB_UP_TO_0_PATCH >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -192, -720, 256 > + < 512 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -320, -784, 192 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_02( vector pos, vector ang )
{
    //for ( int i = 0 ; i < 3 ; i++ )  // Side of the building not visible //
    //{   for ( int j = 0 ; j < 5 ; j++ )
    //    { CreateFloppytownModel( THUNDERDOME_WALL, pos + < 0, 512, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    //}
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 640, -128, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 640, 128, 768 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > ) }
    }
    //for ( int i = 0 ; i < 4 ; i++ )  // Side of the building not visible //
    //{   for ( int j = 0 ; j < 6 ; j++ )
    //    { reateFloppytownModel( THUNDERDOME_WALL, pos + < -128, -384, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > ) }
    //}
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 0, -512, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 512, -256, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        { CreateFloppytownModel( THUNDERDOME_WALL, pos + < 384, -384, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 0, -384, 768 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 256, -384, 768 > + < 256, 256, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
    //for ( int i = 0 ; i < 2 ; i++ ) // Side of the building not visible //
    //{   for ( int j = 0 ; j < 2 ; j++ )
    //    { CreateFloppytownModel( THUNDERDOME_WALL, pos + < -128, 128, 768 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > ) }
    //}
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 0, 0, 768 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 0, 128, 1280 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < 896, 128, -96 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
            CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 767.6, 128, 200 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 25, 0, 0 > )
        }
    }
CreateFloppytownModel( THUNDERDOME_WALL, pos + < 768, 0, -96 > , FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos + < 760, 12, 148 > , FLOPPYTOWN_ANG_OFFSET + < -65, 0, 90 > ) }

void function Building_03( vector pos, vector ang )
{
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos+ < 0, -256, 0 > + < 0 * i, 256 * j, 1280 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 64, -320, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 270, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 64, 448, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 270, 0 > ) }
    }
    CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos + < 0, 384, 768 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -128, -384, 640 > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        { CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 0, 384, 896 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) } // 330 
}   }

void function Building_04( vector pos, vector ang )
{
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 128, -256, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 270, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 0, -256, 512 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 0, 384, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_05( vector pos, vector ang )
{
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        { CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 128, -256, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 270, 0 > ) }
    }
    CreateFloppytownModel( SPACE_ELEVATOR, pos + < 0, 0, 1220 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 0, 324, 512 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
CreateFloppytownModel( THUNDERDOME_FRAME, pos + < 0, -304, 1248 >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
