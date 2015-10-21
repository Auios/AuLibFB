'AuMs.bi (Auios Mouse)

#ifndef __AUIOS_MOUSE__
#define __AUIOS_MOUSE__
    
    #inclib "aums"
    
    namespace Auios
        type AuMouse
            as long state
            as long x,y
            as long wheel
            as long buttons
            as long clip
        end type
        
        declare function AuMouseDump(thisMs as AuMouse) as integer
        declare function AuMouseGet() as AuMouse
        declare function AuMouseCompare(thisMs1 as AuMouse, thisMs2 as AuMouse) as integer 'Return 0 if they are the same
    end namespace
#endif