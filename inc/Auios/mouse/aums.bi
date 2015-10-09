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
        
<<<<<<< HEAD
<<<<<<< HEAD
        declare function AuMouseDump(thisMs as AuMouse) as integer
        declare function AuMouseGet() as AuMouse
        declare function AuMouseCompare(thisMs1 as AuMouse, thisMs2 as AuMouse) as long 'Return 0 if they are the same
=======
        declare sub AuMsDump(thisMs as AuMs)
        declare function AuMsGet() as AuMs
        declare function AuMsCompare(thisMs1 as AuMs, thisMs2 as AuMs) as long
>>>>>>> parent of 2e822e0... Libs
=======
        declare sub AuMsDump(thisMs as AuMs)
        declare function AuMsGet() as AuMs
        declare function AuMsCompare(thisMs1 as AuMs, thisMs2 as AuMs) as long
>>>>>>> parent of 2e822e0... Libs
    end namespace
#endif