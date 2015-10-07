'Window helper using FBGFX library by Auios

#ifndef __AUIOS_WINDOW__
#define __AUIOS_WINDOW__

    #include "fbgfx.bi"
    
    'inclib "auwindow"

    namespace Auios
        
        type AuWindow
            as ubyte isInit
            
            as long w,h
            as long depth
            as long pages
            as long flags
            
            as zstring*48 title
        end type
        
        declare sub AuWindowDump(thisWnd as AuWindow)
        declare function AuWindowInit(_w as long = 640,_h as long = 480,_title as zstring*48 = "Application",_depth as long = 32,_pages as long = 1,_flags as long = 0) as AuWindow
        declare sub AuWindowCreate(thisWnd as AuWindow)
        declare sub AuWindowDestroy(thisWnd as AuWindow)
        
    end namespace
#endif