'Window helper using FBGFX library by Auios

#ifndef __AUIOS_WINDOW__
#define __AUIOS_WINDOW__

    #include "fbgfx.bi"
    
    #inclib "auwnd"

    namespace Auios
        
        type AuWnd
            as ubyte isInit
            
            as long w,h
            as long depth
            as long pages
            as long flags
            
            as zstring*48 title
        end type
        
        declare sub AuWndDump(thisWnd as AuWnd)
        declare function AuWndInit overload(w as long = 640,h as long = 480,title as zstring*48 = "Application",depth as long = 32,pages as long = 1,flags as long = 0) as AuWnd
        declare function AuWndInit overload(flag as byte,as zstring*48 = "Application") as AuWnd
        declare sub AuWndCreate(thisWnd as AuWnd)
        declare sub AuWndDestroy(thisWnd as AuWnd)
        
    end namespace
#endif