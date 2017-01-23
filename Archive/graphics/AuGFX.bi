'AuGFX.bi

#ifndef __AUIOS_GRAPHICS__
#define __AUIOS_GRAPHICS__
    #include "fbgfx.bi"
    #include "../window/auwnd.bi"
    
    #inclib "augfx"
    
    namespace Auios
        declare sub AuPset(thisWnd as AuWindow, x as long, y as long, clr as uinteger)
    end namespace

#endif