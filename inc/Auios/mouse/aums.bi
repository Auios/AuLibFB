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
        
        declare function AuGetMs() as AuMs
    end namespace
#endif