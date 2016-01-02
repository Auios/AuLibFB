#include "aulib.bi"
#include "fbgfx.bi"

using auios

dim shared as AuWindow wnd

wnd = AuWindowSet()
AuWindowCreate(wnd)

AuPset(wnd,wnd.w/2,wnd.h/2,rgb(255,255,255))

print rgb(255,255,255)
print wnd.buffer
print wnd.pitch
print wnd.bpp
print wnd.w,wnd.h

sleep

end AuWindowDestroy(wnd)