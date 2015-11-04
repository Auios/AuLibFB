'File test
#include "AuLib.bi"

dim as string buffer

var ff = freefile
print ff
open "thisFile.txt" for binary as #ff
if lof(ff) > 0 then
    buffer = space(lof(ff))
    get #ff,5,buffer
end if

print buffer
close #ff

sleep