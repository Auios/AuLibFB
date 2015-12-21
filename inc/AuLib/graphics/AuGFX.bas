'AuGFX.bas
#define fbc -lib -x ../../../lib/win32/libaugfx.a

#include "augfx.bi"

namespace Auios
    
    sub AuPset(thisWnd as AuWindow, x as long, y as long, clr as uinteger)
        dim as uinteger ptr pixel
        
        with thisWnd
            if(.buffer <> 0) then
                pixel = .buffer + (y*.pitch) + (x * .bpp)
                *pixel = clr
                
                print *pixel,clr
            end if
        end with
    end sub
    
end namespace
