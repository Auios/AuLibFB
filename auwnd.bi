'Window helper using FBGFX library by Auios

#ifndef __AUIOS_WINDOW__
#define __AUIOS_WINDOW__

    #include "fbgfx.bi"
    
    'inclib "auwindow"

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
        declare function AuWndInit(_w as long = 640,_h as long = 480,_title as zstring*48 = "Application",_depth as long = 32,_pages as long = 1,_flags as long = 0) as AuWnd
        declare sub AuWndCreate(thisWnd as AuWnd)
        declare sub AuWndDestroy(thisWnd as AuWnd)
        
    end namespace
#endif