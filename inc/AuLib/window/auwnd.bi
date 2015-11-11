'AuWnd.bi (Auios Window)

#ifndef __AUIOS_WINDOW__
#define __AUIOS_WINDOW__
    'include "math.bi"
    
    #inclib "auwnd"

    namespace Auios
        type AuWindow
            as long w,h
            as long depth
            as long pages
            as long flags
            as ubyte visible
            as zstring*48 title
            
        end type
        
        declare function AuWindowSet(as long = 800, as long = 600, as long = 32, as long = 1, as long = 0, as zstring*32 = "Application") as AuWindow
        declare function AuWindowGetSize(as AuWindow, byref as long, byref as long) as integer
        declare function AuWindowCreate(as AuWindow) as integer
        
        declare function AuWindowHide(thisWnd as AuWindow) as integer
        declare function AuWindowDestroy(as AuWindow) as integer
        declare function AuWindowDump(as AuWindow, as zstring*32 = "") as integer
        
        declare function AuWindowPrintBar(charVar as zstring*1, cnt as long) as integer
    end namespace
#endif