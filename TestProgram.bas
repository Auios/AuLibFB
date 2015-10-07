'TestProgram
#include "fbgfx.bi"
#include "auwnd.bas"

using Auios

dim as AuWindow myWindow

myWindow = AuWindowInit(800,600,"Hello")
AuWindowCreate(myWindow)

AuWindowDump(myWindow)
sleep

AuWindowDestroy(myWindow)