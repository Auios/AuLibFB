'AuMs.bas (Auios Mouse)
#define fbc -lib -x ../../../lib/win32/libaums.a

#include "crt.bi"
#include "../other/auother.bas"
#include "aums.bi"

namespace Auios
    'Dump all variables to the console for debugging
    function AuMouse.Dump() as integer
        with this
            printBar("-",10)
            printf(!"State---: %d\n",.state)
            printf(!"X,Y-----: %d,%d\n",.x,.y)
            printf(!"Wheel---: %d\n",.wheel)
            printf(!"Buttons-: %d\n",.buttons)
            printf(!"Clip----: %d\n",.clip)
        end with
        return 0
    end function
    
    function AuMouse.Set(x as long, y as long, visible as long, clip as long) as integer
        dim as long result = setmouse(x,y,visible,clip)
        with this
            .x = x
            .y = y
            .visible = visible
            .clip = clip
        end with
        return result
    end function
    
    function AuMouse.Get(byref x as long, byref y as long, byref wheel as long) as integer
        with this
            .state = getMouse(.x,.y,.wheel,.buttons,.clip)
            x = .x
            y = .y
            wheel = .wheel
            return .state
        end with
    end function
    
    function AuMouseCompare(thisMs1 as AuMouse,thisMs2 as AuMouse) as integer
        return memcmp(@thisMs1,@thisMs2,sizeof(AuMouse)) 'Return 0 if they are the same
    end function
end namespace
