'TestProgram
#include "fbgfx.bi"
#include "auwindow.bas"

using Auios

dim as AuWindow myWindow

myWindow = AuWindowInit(800,600,"Hello")
AuWindowCreate(myWindow)

AuWindowDump(myWindow)
sleep

AuWindowDestroy(myWindow)