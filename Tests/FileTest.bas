'File test
#include "AuLib.bi"

using Auios

dim as AuWindow wnd = AuWindowSet()
AuWindowCreate(wnd)

dim as integer ff = freefile
dim as string buffer

open "data.txt" for binary as #ff

buffer = string(lof(ff),0)
get #ff,0,buffer

close #ff

print buffer

for i as integer = 0 to len(buffer)
    print i,buffer[i],chr(buffer[i])
next i

sleep

end AuWindowDestroy(wnd)