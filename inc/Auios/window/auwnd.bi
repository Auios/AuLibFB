'AuWnd.bi (Auios Window)

#ifndef __AUIOS_WINDOW__
#define __AUIOS_WINDOW__
    
    #include "fbgfx.bi"
    
    #inclib "auwnd"

    namespace Auios
        type AuWnd
            public:
            as ubyte isInit
            
            as long w,h
            as long depth
            as long pages
            as long flags
            
            as zstring*48 title
        end type
        
        declare function AuWndDump(thisWnd as AuWnd) as integer
        declare function AuWndInit overload(w as long = 640, h as long = 480, title as zstring*48 = "Application", depth as long = 32, pages as long = 1, flags as long = 0) as AuWnd
        declare function AuWndInit overload(flag as byte,as zstring*48 = "Application") as AuWnd
        declare function AuWndCreate(thisWnd as AuWnd) as integer
        declare function AuWndClose(thisWnd as AuWnd) as integer
        declare function AuWndDestroy(thisWnd as AuWnd) as integer
    end namespace
#endif