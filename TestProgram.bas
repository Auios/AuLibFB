'TestProgram

#define fbc -p .\lib\

#include "crt.bi"
#include "fbgfx.bi"
#include ".\inc\auios\auios.bi"

'Namespace
using Auios
using fb

'Variables
dim shared as AuWnd myWnd 'Same as using myWnd = AuWndInit(2,"MyWindowTitle")
dim as AuMs ms,msOld

declare sub keyboard()

myWnd = AuWndInit(800,600,"MyWindowTitle")
'Create the window
'AuWndCreate(AuWndInit())
AuWndCreate(myWnd)
line(0,0)-(myWnd.w,myWnd.h),rgb(100,100,100),bf 'Fill background

do
    msOld = ms
    ms = AuMsGet()
    'if memcmp(@ms,@msOld,sizeof(ms)) <> 0 then AuMsDump(ms)
    if AuMsCompare(ms,msOld) <> 0 then AuMsDump(ms) 'Check if the mouse changed; If yes then dump the mouse.
    
    keyboard() 'Get input
    
    if ms.buttons = 1 then circle(ms.x,ms.y),10,rgb(200,200,200),,,,f 'Draw if left mouse button
    
    sleep 1,1
loop until inkey = chr(27)

AuWndDestroy(myWnd)

end 0

sub keyboard()
    if multikey(sc_c) then line(0,0)-(myWnd.w,myWnd.h),rgb(100,100,100),bf
end sub