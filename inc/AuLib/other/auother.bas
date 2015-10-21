'AuOther.bas (Auios Other)

#ifndef __AUIOS_OTHER__
#define __AUIOS_OTHER__
    #include "crt.bi"
    
    namespace Auios
        declare function printBar(as zstring*1, as long) as integer
        
        function printBar(charVar as zstring*1, cnt as long) as integer
            for i as integer = 1 to 10
                printf(!"%s",charVar)
            next i
            printf(!"\n")
            return 0
        end function
    end namespace
#endif