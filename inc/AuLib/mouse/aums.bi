'AuMs.bi (Auios Mouse)

#ifndef __AUIOS_MOUSE__
#define __AUIOS_MOUSE__
    
    #inclib "aums"
    
    namespace Auios
        type AuMouse
            private:
            as long state
            as long x,y
            as long wheel
            as long buttons
            as long clip
            as long visible
            
            public:
            declare function dump() as integer
            declare function set(as long, as long, as long, as long) as integer
            declare function get(byref as long, byref as long, byref as long) as integer
        end type
        
        declare function AuMouseCompare(thisMs1 as AuMouse, thisMs2 as AuMouse) as integer 'Return 0 if they are the same
    end namespace
#endif