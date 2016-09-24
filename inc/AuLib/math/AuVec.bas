'AuVec.bas (Auios Vectors)
#define fbc -lib -x ../../../lib/win32/libauvec.a

#include "auvec.bi"

namespace Auios
    'INTEGER
    constructor vector2i(vec2 as vector2i)
        with this
            .x = vec2.x
            .y = vec2.y
        end with
    end constructor
    constructor vector2i(x as integer, y as integer)
        this.set(x,y)
    end constructor
    sub vector2i.set(x as integer, y as integer)
        with this
            .x = x
            .y = y
        end with
    end sub
    sub vector2i.rand(x_high as integer, y_high as integer)
        this.set(x_high*rnd, y_high*rnd)
    end sub
    sub vector2i.clean()
        this.set(0,0)
    end sub
    
    'UNSIGNED INTEGER
    constructor vector2ui(vec2 as vector2ui)
        with this
            .x = vec2.x
            .y = vec2.y
        end with
    end constructor
    constructor vector2ui(x as unsigned integer, y as unsigned integer)
        this.set(x,y)
    end constructor
    sub vector2ui.set(x as unsigned integer, y as unsigned integer)
        with this
            .x = x
            .y = y
        end with
    end sub
    sub vector2ui.rand(x_high as unsigned integer, y_high as unsigned integer)
        this.set(x_high*rnd, y_high*rnd)
    end sub
    sub vector2ui.clean()
        this.set(0,0)
    end sub
    
    'SINGLE (FLOAT)
    constructor vector2f(vec2 as vector2f)
        with this
            .x = vec2.x
            .y = vec2.y
        end with
    end constructor
    constructor vector2f(x as single, y as single)
        this.set(x,y)
    end constructor
    sub vector2f.set(x as single, y as single)
        with this
            .x = x
            .y = y
        end with
    end sub
    sub vector2f.rand(x_high as single, y_high as single)
        this.set(x_high*rnd, y_high*rnd)
    end sub
    sub vector2f.clean()
        this.set(0,0)
    end sub
    
    'DOUBLE
    constructor vector2d(vec2 as vector2d)
        with this
            .x = vec2.x
            .y = vec2.y
        end with
    end constructor
    constructor vector2d(x as double, y as double)
        this.set(x,y)
    end constructor
    sub vector2d.set(x as double, y as double)
        with this
            .x = x
            .y = y
        end with
    end sub
    sub vector2d.rand(x_high as double, y_high as double)
        this.set(x_high*rnd, y_high*rnd)
    end sub
    sub vector2d.clean()
        this.set(0,0)
    end sub
end namespace
