'AuMs.bas (Auios Mouse)
#define fbc -lib -x ../../../lib/libaums.a

#include "crt.bi"
#include "aums.bi"

namespace Auios
    'Dump all variables to the console for debugging
    sub AuMsDump(thisMs as AuMs)
        with thisMs
            printf(!"==========\n") 'x10
            printf(!"State---: %d\n",.state)
            printf(!"X,Y-----: %d,%d\n",.x,.y)
            printf(!"Wheel---: %d\n",.wheel)
            printf(!"Buttons-: %d\n",.buttons)
            printf(!"Clip----: %d\n",.clip)
        end with
    end sub
    
    function AuMsGet() as AuMs
        dim as AuMs thisMs
        with thisMs
            .state = getMouse(.x,.y,.wheel,.buttons,.clip)
        end with
        return thisMs
    end function
    
    function AuMsCompare(thisMs1 as AuMs,thisMs2 as AuMs) as long
        return memcmp(@thisMs1,@thisMs2,sizeof(AuMs))
    end function
end namespace
