#include "aulib.bi"

using auios

dim as AuWindow wnd
AuWindowDump(wnd, "dim")
sleep

wnd = AuWindowSet()
AuWindowDump(wnd, "set")
sleep

AuWindowCreate(wnd)
AuWindowDump(wnd, "create")
sleep

AuWindowHide(wnd)
AuWindowDump(wnd, "close")
sleep

AuWindowDestroy(wnd)
AuWindowDump(wnd, "destroy")
sleep

end 0