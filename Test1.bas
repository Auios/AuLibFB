'Test1

#include "crt.bi"
#include "fbgfx.bi"
#include "auios\auios.bi"

using Auios

'Variables
dim shared as AuWindow myWnd 'Could use myWnd = AuWindowInit(2,"MyWindowTitle")
dim as AuMouse ms,msOld

'Declares
declare sub keyboard()

'Init
myWnd = AuWindowInit(800,600,"MyWindowTitle")
'Create the window
'AuWindowCreate(AuWindowInit())
AuWindowCreate(myWnd)

line(0,0)-(myWnd.w,myWnd.h),rgb(100,100,100),bf

do
    msOld = ms
    ms = AuMouseGet()
    'if memcmp(@ms,@msOld,sizeof(ms)) <> 0 then AuMouseDump(ms)
    if AuMouseCompare(ms,msOld) <> 0 then AuMouseDump(ms)
    
    keyboard()
    
    if ms.buttons = 1 then
        circle(ms.x,ms.y),15,rgb(200,200,200),,,,f
    end if
    
    sleep 1,1
loop until inkey = chr(27)

AuWindowDestroy(myWnd)

end 0

sub keyboard()
    if multikey(fb.sc_c) then line(0,0)-(myWnd.w,myWnd.h),rgb(100,100,100),bf
end sub