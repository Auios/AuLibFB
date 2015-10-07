'TestProgram

#define fbc -p lib\

#include "fbgfx.bi"
#include "source/auwnd.bi"

using fb
using Auios

dim as AuWnd myWnd

myWnd = AuWndInit(800,600,"MyWindowTitle")
AuWndCreate(myWnd)

print "Hello world!"
print
AuWndDump(myWnd)
sleep

AuWndClose(myWnd)

print "Window closed"
AuWndDump(myWnd)
sleep

AuWndDestroy(myWnd)
AuWndDump(myWnd)
sleep