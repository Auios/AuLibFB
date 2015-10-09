'AuWnd.bi (Auios Window)

#ifndef __AUIOS_WINDOW__
#define __AUIOS_WINDOW__
    
    #include "fbgfx.bi"
    
    #inclib "auwnd"

    namespace Auios
        type AuWindow
            public:
            as ubyte isInit
            
            as long w,h
            as long depth
            as long pages
            as long flags
            
            as zstring*48 title
        end type
        
<<<<<<< HEAD
<<<<<<< HEAD
        declare function AuWndDump(thisWnd as AuWindow) as integer
        declare function AuWindowInit overload(w as long = 640, h as long = 480, title as zstring*48 = "Application", depth as long = 32, pages as long = 1, flags as long = 0) as AuWindow
        declare function AuWindowInit overload(flag as byte,as zstring*48 = "Application") as AuWindow
        declare function AuWindowCreate(thisWnd as AuWindow) as integer
        declare function AuWindowClose(thisWnd as AuWindow) as integer
        declare function AuWindowDestroy(thisWnd as AuWindow) as integer
=======
=======
>>>>>>> parent of 2e822e0... Libs
        declare sub AuWndDump(thisWnd as AuWnd)
        declare function AuWndInit overload(w as long = 640, h as long = 480, title as zstring*48 = "Application", depth as long = 32, pages as long = 1, flags as long = 0) as AuWnd
        declare function AuWndInit overload(flag as byte,as zstring*48 = "Application") as AuWnd
        declare sub AuWndCreate(thisWnd as AuWnd)
        declare sub AuWndClose(thisWnd as AuWnd)
        declare sub AuWndDestroy(thisWnd as AuWnd)
<<<<<<< HEAD
>>>>>>> parent of 2e822e0... Libs
=======
>>>>>>> parent of 2e822e0... Libs
    end namespace
#endif