#include "aulib.bi"

using auios

dim as AuWindow wnd
wnd.dump("dim")
sleep

wnd.set()
wnd.dump("set")
sleep

wnd.create()
wnd.dump("create")
sleep

wnd.hide()
wnd.dump("close")
sleep

wnd.destroy()
wnd.dump("destroy")
sleep

end 0