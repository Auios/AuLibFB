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
            as ubyte visible
            as zstring*48 title
            
            public:
            'declare function set() as integer
            declare function set(as long = 800, as long = 600, as long = 32, as long = 1, as long = 0, as zstring*32 = "Application") as integer
            declare function setSize(as long, as long) as integer
            declare function getSize(byref as long, byref as long) as integer
            declare function setTitle(as zstring*32) as integer
            declare function getTitle() as string
            declare function create() as integer
            declare function hide() as integer
            declare function destroy() as integer
            declare function dump(as zstring*32 = "") as integer
        end type
    end namespace
#endif