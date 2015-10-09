'AuMs.bas (Auios Mouse)
#define fbc -lib -x ../../../lib/libaums.a

#include "crt.bi"
#include "aums.bi"

namespace Auios
    'Dump all variables to the console for debugging
<<<<<<< HEAD
    function AuMsDump(thisMs as AuMouse) as integer
=======
    sub AuMsDump(thisMs as AuMs)
>>>>>>> parent of 2e822e0... Libs
        with thisMs
            printf(!"==========\n") 'x10
            printf(!"State---: %d\n",.state)
            printf(!"X,Y-----: %d,%d\n",.x,.y)
            printf(!"Wheel---: %d\n",.wheel)
            printf(!"Buttons-: %d\n",.buttons)
            printf(!"Clip----: %d\n",.clip)
        end with
    end sub
    
    function AuMouseGet() as AuMouse
        dim as AuMouse thisMs
        with thisMs
            .state = getMouse(.x,.y,.wheel,.buttons,.clip)
        end with
        return thisMs
    end function
    
<<<<<<< HEAD
    function AuMouseCompare(thisMs1 as AuMouse,thisMs2 as AuMouse) as long
        return memcmp(@thisMs1,@thisMs2,sizeof(AuMouse)) 'Return 0 if they are the same
=======
    function AuMsCompare(thisMs1 as AuMs,thisMs2 as AuMs) as long
        return memcmp(@thisMs1,@thisMs2,sizeof(AuMs))
>>>>>>> parent of 2e822e0... Libs
    end function
end namespace
