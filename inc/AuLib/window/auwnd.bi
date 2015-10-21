'AuWnd.bi (Auios Window)

#ifndef __AUIOS_WINDOW__
#define __AUIOS_WINDOW__
    'include "math.bi"
    
    #inclib "auwnd"

    namespace Auios
        type AuWindow
            private:
            as long w,h
            as long depth
            as long pages
            as long flags
            as zstring*48 title
            
            public:
            declare constructor(as long, as long, as long, as long, as long, as zstring*32)
            declare destructor()
            declare function set(as long, as long, as long, as long, as long, as zstring*32) as integer
            declare function setSize(as long, as long) as integer
            declare function getSize() as integer
            declare function setTitle(as zstring*32) as integer
            declare function getTitle() as string
            declare function create() as integer
            declare function close() as integer
            declare function destroy() as integer
            declare function dump() as integer
        end type
    end namespace
#endif