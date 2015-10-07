'Window helper using FBGFX library by Auios

#include "auwnd.bi"

#define fbc -lib -x ../lib/libauwnd.a

namespace Auios
    
    sub AuWndDump(thisWnd as AuWnd)
        with thisWnd
            print .title
            print .w
            print .h
            print .depth
            print .pages
            print .flags
        end with
    end sub
    
    function AuWndInit(w as long,h as long,title as zstring*48,depth as long,pages as long,flags as long) as AuWnd
        dim as AuWnd thisWnd
        
        with thisWnd
            .w = w
            .h = h
            .title = title
            .depth = depth
            .pages = pages
            .flags = flags
        end with
        
        return thisWnd
    end function
    
    function AuWndInit(flag as byte,title as zstring*48) as AuWnd
        dim as integer w,h
        dim as AuWnd thisWnd
        select case flag
        case 0 'Regular Init
            thisWnd = AuWndInit()
        case 1 'Quick Fullscreen Init
            screeninfo w,h
            thisWnd = AuWndInit(w,h,title,32,1,fb.GFX_FULLSCREEN or fb.GFX_ALPHA_PRIMITIVES or fb.GFX_HIGH_PRIORITY)
        end select
        
        return thisWnd
    end function
    
    sub AuWndCreate(thisWnd as AuWnd)
        with thisWnd
            screenres(.w,.h,.depth,.pages,.flags)
            windowtitle .title
        end with
    end sub
    
    sub AuWndClose(thisWnd as AuWnd)
        screen 0
    end sub
    
    sub AuWndDestroy(thisWnd as AuWnd)
        with thisWnd
            .w = 0
            .h = 0
            .depth = 0
            .pages = 0
            .flags = 0
            .title = "N/A"
        end with
        
        screen 0
    end sub
    
end namespace