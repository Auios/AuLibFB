'TestProgram

#define fbc -p .\lib\

#include "crt.bi"
#include "fbgfx.bi"
#include ".\inc\auios\auios.bi"

using Auios

'Variables
dim as AuWnd myWnd  = AuWndInit(800,600,"MyWindowTitle") 'Same as using myWnd = AuWndInit(2,"MyWindowTitle")
dim as AuMs ms,msOld

'Create the window
'AuWndCreate(AuWndInit())
AuWndCreate(myWnd)

do
    msOld = ms
    ms = AuMsGet()
    'if memcmp(@ms,@msOld,sizeof(ms)) <> 0 then AuMsDump(ms)
    if AuMsCompare(ms,msOld) <> 0 then AuMsDump(ms)
    
    sleep 1,1
loop until inkey = chr(27)

AuWndDestroy(myWnd)

end 0