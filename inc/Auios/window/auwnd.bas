'AuWnd.bas (Auios Window)
#define fbc -lib -x ../../../lib/libauwnd.a

#include "crt.bi"
#include "auwnd.bi"

namespace Auios
    'Dumps all the variables to the console for debug purposes
    function AuWindowDump(thisWnd as AuWindow) as integer
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
        return 0
    end function
    
    'Call this first before creating the window. This initializes the variables
    function AuWndInit(w as long,h as long,title as zstring*48,depth as long,pages as long,flags as long) as AuWindow
        dim as AuWindow thisWnd
        
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
    function AuWindowInit(flag as byte,title as zstring*48) as AuWindow
        dim as integer w,h
        dim as AuWindow thisWnd
        select case flag
        case 0 'Regular Init
            thisWnd = AuWindowInit()
            exit select
        case 1 'Quick Fullscreen Init
            screeninfo w,h
            thisWnd = AuWindowInit(w,h,title,32,1,fb.GFX_FULLSCREEN or fb.GFX_ALPHA_PRIMITIVES or fb.GFX_HIGH_PRIORITY)
            exit select
        case 2
            thisWnd = AuWindowInit(800,600,title,32,1,0)
            exit select
        case else
            thisWnd = AuWindowInit()
            exit select
        end select
        
        return thisWnd
    end function
    
    'Creates the window after initialization of AuWindow type
    function AuWindowCreate(thisWnd as AuWindow) as integer
        with thisWnd
            screenres(.w,.h,.depth,.pages,.flags)
            windowtitle .title
        end with
        return 0
    end function
    
    'Closes the window. Does not destroy the variables
    function AuWindowClose(thisWnd as AuWindow) as integer
        screen 0
        return 0
    end function
    
    'Close the window and destroys AuWindow variables.
    function AuWindowDestroy(thisWnd as AuWindow) as integer
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
        return 0
    end function
end namespace