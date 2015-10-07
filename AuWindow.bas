#include "auwindow.bi"

'define fbc -dll

namespace Auios
    
    sub AuWindowDump(thisWnd as AuWindow)
        with thisWnd
            print .title
            print .w
            print .h
            print .depth
            print .pages
            print .flags
        end with
    end sub
    
    function AuWindowInit(_w as long,_h as long,_title as zstring*48,_depth as long,_pages as long,_flags as long) as AuWindow export
        dim as AuWindow thisWnd
        
        with thisWnd
            .w = _w
            .h = _h
            .title = _title
            .depth = _depth
            .pages = _pages
            .flags = _flags
        end with
        
        return thisWnd
    end function
    
    sub AuWindowCreate(thisWnd as AuWindow) export
        with thisWnd
            screenres(.w,.h,.depth,.pages,.flags)
            windowtitle .title
        end with
    end sub
    
    sub AuWindowDestroy(thisWnd as AuWindow) export
        with thisWnd
            .w = 0
            .h = 0
            .depth = 0
            .pages = 0
            .flags = 0
        end with
        
        screen 0
    end sub
    
end namespace