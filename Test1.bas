'Test1

'define fbc -p .\lib\

#include "crt.bi"
#include "fbgfx.bi"
#include "auios\auios.bi"

using Auios

'Variables
dim shared as AuWindow myWnd 'Could use myWnd = AuWndInit(2,"MyWindowTitle")
dim as AuMouse ms,msOld
dim as AuGUI myGUI

'Declares
declare sub keyboard()

'Init
myWnd = AuWindowInit(800,600,"MyWindowTitle")
myGUI = AuGUIInit(10,10,200,150,"Test")
'Create the window
'AuWndCreate(AuWndInit())
AuWindowCreate(myWnd)

line(0,0)-(myWnd.w,myWnd.h),rgb(100,100,100),bf

do
    msOld = ms
    ms = AuMouseGet()
    'if memcmp(@ms,@msOld,sizeof(ms)) <> 0 then AuMsDump(ms)
    if AuMouseCompare(ms,msOld) <> 0 then AuMouseDump(ms)
    
    keyboard()
    
    screenlock
        AuGUIRender(myGUI)
        if ms.buttons = 1 then
            circle(ms.x,ms.y),15,rgb(200,200,200),,,,f
        end if
    screenunlock
    
    sleep 1,1
loop until inkey = chr(27)

AuWindowDestroy(myWnd)

end 0

sub keyboard()
    if multikey(fb.sc_c) then line(0,0)-(myWnd.w,myWnd.h),rgb(100,100,100),bf
end sub