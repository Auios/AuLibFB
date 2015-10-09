'Test1

#define fbc -p .\lib\

#include "crt.bi"
#include "fbgfx.bi"
#include ".\inc\auios\auios.bi"

using Auios

'Variables
dim shared as AuWnd myWnd 'Could use myWnd = AuWndInit(2,"MyWindowTitle")
dim as AuMs ms,msOld

'Declares
declare sub keyboard()

'Init
myWnd = AuWndInit(800,600,"MyWindowTitle")
'Create the window
'AuWndCreate(AuWndInit())
AuWndCreate(myWnd)

line(0,0)-(myWnd.w,myWnd.h),rgb(100,100,100),bf

do
    msOld = ms
    ms = AuMsGet()
    'if memcmp(@ms,@msOld,sizeof(ms)) <> 0 then AuMsDump(ms)
    if AuMsCompare(ms,msOld) <> 0 then AuMsDump(ms)
    
    keyboard()
    
    if ms.buttons = 1 then
        circle(ms.x,ms.y),15,rgb(200,200,200),,,,f
    end if
    
    sleep 1,1
loop until inkey = chr(27)

AuWndDestroy(myWnd)

end 0

sub keyboard()
    if multikey(fb.sc_c) then line(0,0)-(myWnd.w,myWnd.h),rgb(100,100,100),bf
end sub