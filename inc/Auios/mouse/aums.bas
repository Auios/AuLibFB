'AuMs.bas (Auios Mouse)
#define fbc -lib -x ../../../lib/win64/libaums.a

#include "crt.bi"
#include "aums.bi"

namespace Auios
    'Dump all variables to the console for debugging
    function AuMouseDump(thisMs as AuMouse) as integer
        with thisMs
            printf(!"==========\n") 'x10
            printf(!"State---: %d\n",.state)
            printf(!"X,Y-----: %d,%d\n",.x,.y)
            printf(!"Wheel---: %d\n",.wheel)
            printf(!"Buttons-: %d\n",.buttons)
            printf(!"Clip----: %d\n",.clip)
        end with
        return 0
    end function
    
    function AuMouseGet() as AuMouse
        dim as AuMouse thisMs
        with thisMs
            .state = getMouse(.x,.y,.wheel,.buttons,.clip)
        end with
        return thisMs
    end function
    
    function AuMouseCompare(thisMs1 as AuMouse,thisMs2 as AuMouse) as long
        return memcmp(@thisMs1,@thisMs2,sizeof(AuMouse)) 'Return 0 if they are the same
    end function
end namespace
