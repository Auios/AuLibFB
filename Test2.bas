'Test2
'Slope of a line

#include "crt.bi"
#include "Auios/Auios.bi"

using auios
dim as byte k = 3
dim as AuWindow wnd = AuWindowInit()

AuWindowCreate(wnd)

printf(!"lol\n")
print "poke"
draw string(300,300),"ok omg",rgb(200,100,100)
line(5,2)-(7,1)

sleep

cls

sleep

end AuWindowDestroy(wnd)