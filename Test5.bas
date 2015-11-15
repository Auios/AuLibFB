#include "fbgfx.bi"
#include "auLib.bi"
using fb,auios

randomize timer

type entity
    as uinteger parent
    as single roll
    as string nme = "Alexea"
end type
type popPoint
    as uinteger inc
end type

declare sub action

redim shared as entity ent(1 to 1)
redim shared as popPoint PP(1 to 1)

dim shared as event e
dim shared as uinteger popInc

'Window stuff
dim shared as AuWindow wnd
wnd = AuWindowSet()
AuWindowCreate(wnd)

'Main loop
do
    if screenevent(@e) then
        select case e.type
        case event_key_press or event_key_repeat
            if e.ascii = 32 then action
        end select
    end if
    
    screenlock
    cls
    for i as uinteger = lbound(ent) to ubound(ent)
        with ent(i)
            draw string(3,((1+i)*9)-6),"ID: " & i & " - P: " & .parent,rgb(200,200,200)
        end with
    next i
    
    for i as uinteger = lbound(PP) to ubound(PP)
        with PP(i)
            circle(wnd.w-(i*5),-.inc+wnd.h),3,rgb(200,100,100),,,,f
        end with
    next i
    screenunlock
    
    sleep 1,1
loop until inkey = chr(27)

sub action
    for i as uinteger = lbound(ent) to ubound(ent)
        with ent(i)
            .roll = rnd
            
            if .roll < 0.1 then 'Has baby <3
                popInc+=1
                var nn = ubound(ent)+1
                redim preserve as entity ent(1 to nn)
                ent(nn).parent = i
            end if
        end with
    next i
    if popInc > 0 then
        var nn = ubound(PP)+1
        redim preserve as popPoint PP(1 to nn)
        PP(nn).inc = popInc
        popInc = 0
    end if
end sub

'return 0
end AuWindowDestroy(wnd)