'AuMs.bi (Auios Mouse)

#ifndef __AUIOS_MOUSE__
#define __AUIOS_MOUSE__
    
    #inclib "aums"
    
    namespace Auios
        type AuMs
            as long state
            as long x,y
            as long wheel
            as long buttons
            as long clip
        end type
        
        declare sub AuMsDump(thisMs as AuMs)
        declare function AuMsGet() as AuMs
        declare function AuMsCompare(thisMs1 as AuMs, thisMs2 as AuMs) as long
    end namespace
#endif