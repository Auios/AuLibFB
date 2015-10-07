'TestProgram

#define fbc -p lib\

#include "fbgfx.bi"
#include "source/auwnd.bi"

using Auios

dim as AuWnd myWnd

myWnd = AuWndInit(800,600,"MyWindowTitle")
AuWndCreate(myWnd)

print "Hello world!"
print
AuWndDump(myWnd)
sleep

AuWndDestroy(myWnd)

AuWndInit(1,"MySecondWindowTitle")
AuWndCreate(myWnd)

print "Hello world again!"
print
AuWndDump(myWnd)
sleep

AuWndDestroy(myWnd)