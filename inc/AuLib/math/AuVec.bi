'AuVec.bi (Auios Vectors)
'9/23/2016

#ifndef __AUIOS_VECTOR__
#define __AUIOS_VECTOR__
    
    #inclib "auvec"

    namespace Auios
        'INTEGER
        type vector2i
            as integer x,y
            
            declare constructor(vec2 as vector2i)
            declare constructor(x as integer, y as integer)
            declare sub set(x as integer, y as integer)
            declare sub rand(x_high as integer, y_high as integer)
            declare sub clean()
        end type
        
        'UNSIGNED INTEGER
        type vector2ui
            as unsigned integer x,y
            
            declare constructor(vec2 as vector2ui)
            declare constructor(x as unsigned integer, y as unsigned integer)
            declare sub set(x as unsigned integer, y as unsigned integer)
            declare sub rand(x_high as unsigned integer, y_high as unsigned integer)
            declare sub clean()
        end type
        
        'SINGLE
        type vector2f
            as single x,y
            
            declare constructor(vec2 as vector2f)
            declare constructor(x as single, y as single)
            declare sub set(x as single, y as single)
            declare sub rand(x_high as single, y_high as single)
            declare sub clean()
        end type
        
        'DOUBLE
        type vector2d
            as double x,y
            
            declare constructor(vec2 as vector2d)
            declare constructor(x as double, y as double)
            declare sub set(x as double, y as double)
            declare sub rand(x_high as double, y_high as double)
            declare sub clean()
        end type
    end namespace
#endif