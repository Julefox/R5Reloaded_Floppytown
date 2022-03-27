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

void function North_Wall( vector pos, vector ang )
{
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < 0, 96, 1200 > + < 529 * i, 0, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 10 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < 529, 96, 0 > + < 529 * i, 0, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 10 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < 1160, 64, 0 > + < 260.7 * i, 0, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < 2202.8, 0, 1792 > + < 260.7 * i, 0, 224 * j >,FLOPPYTOWN_ANG_OFFSET+ < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 10 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < 3245.6, 0, 0 > + < 260.7 * i, 0, 224 * j >,FLOPPYTOWN_ANG_OFFSET+ < 0, 180, 0 > ) }
    }
    for ( int j = 0 ; j < 2 ; j++ )
    {   CreateFloppytownModel( SQUARE_BLOCK, pos + < 2062, 140, 1792 > + < 0, 0, 224 * j >,FLOPPYTOWN_ANG_OFFSET+ < 0, 90, 0 > ) }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 12 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < 3900, 0, 0 > + < 529 * i, 0, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 6 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < 4500, -64, 896 > + < 260.7 * i, 0, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < 5044, -64, 1000 > + < 529 * i, 0, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
}   }

void function South_Wall( vector pos, vector ang )
{
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < -500, -80, 2000 > + < 529 * i, 0, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < -2097.3, 0, 1120 > + < 260.7 * i, 0, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < -2358, 0, 2016 > + < 260.7 * i, 0, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 19 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( WALL_PILLAR, pos + < -5840, -32, 2002 > + < 128 * i, 0, 286 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 270, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 6 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < -3400, -64, 1600 > + < 529 * i, 0, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function West_Wall( vector pos, vector ang )
{
    for ( int i = 0 ; i < 13 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {
            CreateFloppytownModel( WALL_PILLAR, pos + < -32, 0, 1716 > + < 0, 128 * i, 286 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateFloppytownModel( SQUARE_BLOCK, pos + < 0, 1664, 1120 > + < 0, 260.7 * i, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > )
        }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {
            CreateFloppytownModel( SQUARE_BLOCK, pos + < 0, 1664, 448 > + < 0, 260.7 * i, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateFloppytownModel( SQUARE_BLOCK, pos + < 0, 3228.2, 1120 > + < 0, 260.7 * i, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > )
        }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {
            CreateFloppytownModel( SQUARE_BLOCK, pos + < 0, 3749.6, 672 > + < 0, 260.7 * i, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateFloppytownModel( WALL_PILLAR, pos + < -32, 1536, 1144 > + < 0, 128 * i, 286 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < -89, 4360, 1200 > + < 0, 529 * i, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > ) }
}   }

void function East_Wall( vector pos, vector ang )
{
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < 0, 0, 1600 > + < 0, 529 * i, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < 0, -1058, 1600 > + < 0, 529 * i, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < 0, -2600, 2240 > + < 0, 260.7 * i, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 14 ; j++ )
        {   CreateFloppytownModel( SLANTED_SLICE, pos + < 0, -2730, 0 > + < 0, 529 * i, 200 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 13 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < -64, -3500, 0 > + < 0, 260.7 * i, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( SQUARE_BLOCK, pos + < -64, -4282.1, 2016 > + < 0, 260.7 * i, 224 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
}   }

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
    CreateFloppytownModel( THUNDERDOME_WALL, pos + < 768, 0, -96 > , FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
    CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos + < 760, 12, 148 > , FLOPPYTOWN_ANG_OFFSET + < -65, 0, 90 > )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < 896, 128, -96 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
            CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 767.6, 128, 200 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 25, 0, 0 > )
        }
}   }

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
    CreateFloppytownModel( THUNDERDOME_FRAME, pos + < 0, -304, 1248 >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 0, 324, 512 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_06( vector pos, vector ang )
{
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 256, -256, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 270, 0 > ) }
    }
    //CreateFloppytownModel( Space_Elevator, pos + < 0, 0, 1220 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 0, -256, 1792 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos + < 192, -256, 1792 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 192, 384, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( CARGO_SMALL, pos + < -128, 384, 1279.9 > + < 128 * i, 0, 128 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_07( vector pos, vector ang )
{
    for ( int i = 0 ; i < 5 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 0, 0, 2304 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 0, 512, 2304 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 1152, 0, 2048 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 0, 640, 1792 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 256, 640, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 512, 384, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 1024, 384, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 1280, 384, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 384, 512, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 16 ; j++ )
        {   CreateFloppytownModel( CONCRETE_PANEL, pos + < 1920, 320, 0 > + < 0, 128 * i, 128 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( CONCRETE_PANEL, pos + < 1920, -64, 1664 > + < 0, 128 * i, 128 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < 1344, 128, 2048 > + < 384 * i, 384 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 896, 192, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 640, 192, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 270, 0 > )
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 704, 128, SSB_UP_TO_0 > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {
            CreateFloppytownModel( BOX_BOTTOM_A, pos + < 512, 384, 768 > + < 0, 0 * i, 512 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > )
            CreateFloppytownModel( BOX_BOTTOM_B , pos + < 1024, 384, 768 > + < 0, 0 * i, 512 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > )
        }
    }
    CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos + < 768, 448, 2560 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 768, 256, 256 > + < 0 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < 768, 384, 512 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < 768, 384, 1536 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
        }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_FRAME, pos + < 768, 384, 768 > + < 0, 256 * i, 1024 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 1280, 0, 2016 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_08( vector pos, vector ang )
{
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -256, 64, 1664 > + < 512 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 13 ; j++ )
        {   CreateFloppytownModel( CONCRETE_PANEL, pos + < -448, 256, 0 > + < 128 * i, 0, 128 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -384, -128, 1600 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_09( vector pos, vector ang )
{
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -192, 128, 2048 > + < 384 * i, 384 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -256, 384, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -256, 0, 1984 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -384, 0, 1536 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < 384, 0, 1280 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 6 ; j++ )
        { 
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < 384, 256, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < -384, 256, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
        }
    }
}

void function Building_10( vector pos, vector ang )
{
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -384, 0, 1280 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -384, 128, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_11( vector pos, vector ang )
{
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -128, 0, 2048 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -384, 0, 2048 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -512, -64, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -448, 128, SSB_UP_TO_0 > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -192, 640, SSB_UP_TO_0 > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 8 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -256, 192, SSB_UP_TO_0 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
}   }

void function Building_12( vector pos, vector ang )
{
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -640, 0, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -384, 0, 1280 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -384, 512, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -256, -128, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -512, -128, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -512, 384, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -320, 1024, SSB_UP_TO_0_PATCH + 1536 > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 9 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -384, 960, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }

    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -512, 0, 1280 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -128, 64, 2304 > + < 0 * i, 384 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -256, 0, 2272-32 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos + < -256, 960, 2272 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
}   }

void function Building_13( vector pos, vector ang )
{
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -128, 64, 1792 > + < 0 * i, 384 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 7 ; i++ )
    {   for ( int j = 0 ; j < 7 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -384, -64, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -384, 832, SSB_UP_TO_0_PATCH + 1024 > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0; i < 2 ; i++ )
    {   for ( int j = 0; j < 8 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -256, 0, 1728 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_14( vector pos, vector ang )
{
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -512, -384, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_WALL, pos + < -384, -512, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -256, -320, 1024 > + < 512 * i, 384 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -384, -384, 960 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_15( vector pos, vector ang )
{
    for ( int i = 0 ; i < 7 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateFloppytownModel( PIPE_GRATE, pos + < -384, 32, 1024 > + < 128 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
            CreateFloppytownModel( PIPE_GRATE, pos + < -384, -32, 1024 > + < 128 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )

            CreateFloppytownModel( PIPE_GRATE, pos + < -384.1, 31.9, 1024 > + < 128 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 180 > )
            CreateFloppytownModel( PIPE_GRATE, pos + < -384.1, -31.9, 1024 > + < 128 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 180 > )
        }
    }
    for ( int i = 0 ; i < 11 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateFloppytownModel( PIPE_GRATE, pos + < -640, 96, 1024 > + < 128 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
            CreateFloppytownModel( PIPE_GRATE, pos + < -640, -96, 1024 > + < 128 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )

            CreateFloppytownModel( PIPE_GRATE, pos + < -640.1, 95.9, 1024 > + < 128 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 180 > )
            CreateFloppytownModel( PIPE_GRATE, pos + < -640.1, -95.9, 1024 > + < 128 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 180 > )
        }
    }
}

void function Building_16( vector pos, vector ang )
{
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < -256, 384, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < -256, -384, 0 > + < 256 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < 384, -256, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
            CreateFloppytownModel( THUNDERDOME_WALL, pos + < -384, -256, 0 > + < 0, 256 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
        }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -256, -256, 1280 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_17( vector pos, vector ang )
{
    CreateFloppytownModel( THUNDERDOME_WALL_512x352, pos + < -128, -384, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
    CreateFloppytownModel( THUNDERDOME_WALL_256x352, pos + < 256, -384, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
    CreateFloppytownModel( THUNDERDOME_WALL_512x352, pos + < 128, 384, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
    CreateFloppytownModel( THUNDERDOME_WALL_256x352, pos + < -256, 384, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
    CreateFloppytownModel( THUNDERDOME_WALL_512x352, pos + < -384, 128, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    CreateFloppytownModel( THUNDERDOME_WALL_256x352, pos + < -384, -256, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    CreateFloppytownModel( THUNDERDOME_WALL_512x352, pos + < 384, -128, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    CreateFloppytownModel( THUNDERDOME_WALL_256x352, pos + < 384, 256, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 3 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -256, -256, 352 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function Building_18( vector pos, vector ang )
{
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -512, -192, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 512, -192, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > )
        }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -448, 256, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -448, -256, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > )
        }
    }
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -320, 0, 1280 > + < 640 * i, 384 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    CreateFloppytownModel( MID_PLATFORM, pos + < 0, 0, 1280.1 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -384, -128, 1216 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
}   }

void function Building_19( vector pos, vector ang )
{
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < 0, -256, 1280 > + < 0 * i, 512 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 192, -448, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -128, -512, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) } // droit
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -128, 512, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 12 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -1664, 0, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 12 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {    CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -1664, -384, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > ) }
    }
    for ( int i = 0 ; i < 4 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -192, 64, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -192, -448, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 5 ; j++ )
        {   CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -1728, -320, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 3 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -1472, -192, 1280 > + < 512 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos + < 128, -384, 1216 > + < 0 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 1 ; i++ )
    {   for ( int j = 0 ; j < 4 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -64, -384, 1216 > + < 0 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < -1600, -256, 1216 > + < 256 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_MINI_CEILING, pos + < -1600, -64, 1216 > + < 256 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
}

void function Building_20( vector pos, vector ang )
{
    for ( int i = 0 ; i < 2 ; i++ )
    {   for ( int j = 0 ; j < 2 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < -192, -256, 256 > + < 384 * i, 512 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > ) }
    }
    for ( int i = 0 ; i < 8 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < 384, -448, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, -90, 0 > )
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -384, -448, SSB_UP_TO_0_PATCH > + < 0, 128 * i, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 90, 0 > )
        }
    }
    for ( int i = 0 ; i < 6 ; i++ )
    {   for ( int j = 0 ; j < 1 ; j++ )
        {
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -320, 512, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > )
            CreateFloppytownModel( SQUARE_SHELL_BOX, pos + < -320, -512, SSB_UP_TO_0_PATCH > + < 128 * i, 0, 256 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 180, 0 > )
        }
}   }

void function Building_21( vector pos, vector ang )
{
    for ( int i = 0 ; i < 0 ; i++ )
    {   for ( int j = 0 ; j < 0 ; j++ )
        {   CreateFloppytownModel( MID_PLATFORM, pos + < 0, 0, 0 > + < 512 * i, 0 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 0 ; i++ )
    {   for ( int j = 0 ; j < 0 ; j++ )
        {   CreateFloppytownModel( CONCRETE_PANEL, pos + < 0, 0, 0 > + < 128 * i, 0, 128 * j >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
    }
    for ( int i = 0 ; i < 0 ; i++ )
    {   for ( int j = 0 ; j < 0 ; j++ )
        {   CreateFloppytownModel( THUNDERDOME_CEILING, pos + < 0, 0, 0 > + < 256 * i, 256 * j, 0 >, FLOPPYTOWN_ANG_OFFSET + < 0, 0, 0 > ) }
}   }

void function AreaBuildAreVisible()
{
    for ( int i = 0 ; i <  3 ; i++ )
    {   for ( int j = 0 ; j <  7 ; j++ )
        {   CreateFloppytownModel( BUILDING_PLATFORM_LARGE, FT_BUILD_AREA_POS + < 1024 * i, 352 * j, 0 >, FT_BUILD_AREA_ANG ) }
    }
    ///////PROPS EXEDENT SIMULATION//////////////////////////////////////////////////
    //for ( int i = 0 ; i <  1000 ; i++ )
    //{
    //    CreateFloppytownModel( BUILDING_PLATFORM_LARGE, FT_BUILD_AREA_POS + <  0, 0, 10 * 0.1 >, FT_BUILD_AREA_ANG )
    //}
    /////////////////////////////////////////////////////////////////////////////////
}

void function EditorRefAreVisible()
{
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // EDITOR REF MANAGER // DEDICATED SPACE FOR THE CREATION OF EDITOR REF // has to be return false for the release
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    CreateEditorRef( FLOPPYTOWN_POS_OFFSET, FLOPPYTOWN_ANG_OFFSET, "Spawn Point Floppytown Origin" )

    CreateEditorRef( FT_FLOOR_POS, FT_FLOOR_ANG, "Floor Origin" )

    CreateEditorRef( FT_NORTH_WALL_POS, FLOPPYTOWN_ANG_OFFSET, "North Wall Origin" )
    CreateEditorRef( FT_SOUTH_WALL_POS, FLOPPYTOWN_ANG_OFFSET, "South Wall Origin" )
    CreateEditorRef( FT_WEST_WALL_POS,  FLOPPYTOWN_ANG_OFFSET, "West Wall Origin" )
    CreateEditorRef( FT_EAST_WALL_POS,  FLOPPYTOWN_ANG_OFFSET, "East Wall Origin" )

    CreateEditorRef( FT_BUILDING_POS_01, FLOPPYTOWN_ANG_OFFSET, "Build 01 Origin" )
    CreateEditorRef( FT_BUILDING_POS_02, FLOPPYTOWN_ANG_OFFSET, "Build 02 Origin" )
    CreateEditorRef( FT_BUILDING_POS_03, FLOPPYTOWN_ANG_OFFSET, "Build 03 Origin" )
    CreateEditorRef( FT_BUILDING_POS_04, FLOPPYTOWN_ANG_OFFSET, "Build 04 Origin" )
    CreateEditorRef( FT_BUILDING_POS_05, FLOPPYTOWN_ANG_OFFSET, "Build 05 Origin" )
    CreateEditorRef( FT_BUILDING_POS_06, FLOPPYTOWN_ANG_OFFSET, "Build 06 Origin" )
    CreateEditorRef( FT_BUILDING_POS_07, FLOPPYTOWN_ANG_OFFSET, "Build 07 Origin" )
    CreateEditorRef( FT_BUILDING_POS_08, FLOPPYTOWN_ANG_OFFSET, "Build 08 Origin" )
    CreateEditorRef( FT_BUILDING_POS_09, FLOPPYTOWN_ANG_OFFSET, "Build 09 Origin" )
    CreateEditorRef( FT_BUILDING_POS_10, FLOPPYTOWN_ANG_OFFSET, "Build 10 Origin" )
    CreateEditorRef( FT_BUILDING_POS_11, FLOPPYTOWN_ANG_OFFSET, "Build 11 Origin" )
    CreateEditorRef( FT_BUILDING_POS_12, FLOPPYTOWN_ANG_OFFSET, "Build 12 Origin" )
    CreateEditorRef( FT_BUILDING_POS_13, FLOPPYTOWN_ANG_OFFSET, "Build 13 Origin" )
    CreateEditorRef( FT_BUILDING_POS_14, FLOPPYTOWN_ANG_OFFSET, "Build 14 Origin" )
    CreateEditorRef( FT_BUILDING_POS_15, FLOPPYTOWN_ANG_OFFSET, "Build 15 Origin" )
    CreateEditorRef( FT_BUILDING_POS_16, FLOPPYTOWN_ANG_OFFSET, "Build 16 Origin" )
    CreateEditorRef( FT_BUILDING_POS_17, FLOPPYTOWN_ANG_OFFSET, "Build 17 Origin" )
    CreateEditorRef( FT_BUILDING_POS_18, FLOPPYTOWN_ANG_OFFSET, "Build 18 Origin" )
    CreateEditorRef( FT_BUILDING_POS_19, FLOPPYTOWN_ANG_OFFSET, "Build 19 Origin" )
    CreateEditorRef( FT_BUILDING_POS_20, FLOPPYTOWN_ANG_OFFSET, "Build 20 Origin" )
    //CreateEditorRef( FT_BUILDING_POS_21, FLOPPYTOWN_ANG_OFFSET, "Build 21 Origin" )

    CreateEditorRef( FT_BUILD_AREA_POS, FT_BUILD_AREA_ANG, "Spawn Point Area Build Origin" )
}
