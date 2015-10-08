'AuWnd.bas (Auios Window)
#define fbc -lib -x ../../../lib/libauwnd.a

#include "crt.bi"
#include "auwnd.bi"

namespace Auios
    'Dumps all the variables to the console for debug purposes
    sub AuWndDump(thisWnd as AuWnd)
        with thisWnd
            printf(!"==========\n") 'x10
            printf(!"Title--: %s\n",.title)
            printf(!"isInit-: %d\n",.isInit)
            printf(!"Width--: %d\n",.w)
            printf(!"Height-: %d\n",.h)
            printf(!"Depth--: %d\n",.depth)
            printf(!"Pages--: %d\n",.pages)
            printf(!"Flags--: %d\n",.flags)
        end with
    end sub
    
    'Call this first before creating the window. This initializes the variables
    function AuWndInit(w as long,h as long,title as zstring*48,depth as long,pages as long,flags as long) as AuWnd
        dim as AuWnd thisWnd
        
        with thisWnd
            .isInit = 1
            .w = w
            .h = h
            .title = title
            .depth = depth
            .pages = pages
            .flags = flags
        end with
        
        return thisWnd
    end function
    
    'This is used for quick initializations
    function AuWndInit(flag as byte,title as zstring*48) as AuWnd
        dim as integer w,h
        dim as AuWnd thisWnd
        select case flag
        case 0 'Regular Init
            thisWnd = AuWndInit()
            exit select
        case 1 'Quick Fullscreen Init
            screeninfo w,h
            thisWnd = AuWndInit(w,h,title,32,1,fb.GFX_FULLSCREEN or fb.GFX_ALPHA_PRIMITIVES or fb.GFX_HIGH_PRIORITY)
            exit select
        case 2
            thisWnd = AuWndInit(800,600,title,32,1,0)
            exit select
        case else
            thisWnd = AuWndInit()
            exit select
        end select
        
        return thisWnd
    end function
    
    'Creates the window after initialization of AuWnd type
    sub AuWndCreate(thisWnd as AuWnd)
        with thisWnd
            screenres(.w,.h,.depth,.pages,.flags)
            windowtitle .title
        end with
    end sub
    
    'Closes the window. Does not destroy the variables
    sub AuWndClose(thisWnd as AuWnd)
        screen 0
    end sub
    
    'Close the window and destroys AuWnd variables.
    sub AuWndDestroy(thisWnd as AuWnd)
        with thisWnd
            .isInit = 0
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