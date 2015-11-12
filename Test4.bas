#include "fbgfx.bi"
#include "auLib.bi"

using fb,auios

declare function Dist_2d(x1 as single, y1 as single, x2 as single, y2 as single) as single
declare function Dist_1d(a as single, b as single) as single

type entity
    public:
        as ubyte direction
        as single xa,ya,xb,yb,xm,ym,xd,yd
        as single x,y
        as single vx,vy
        as single slope
        as single steps
        as single speed
        as single radius
        as uinteger clr
        
        declare constructor
        declare function render() as integer
        
    private:
end type

'Create window
dim shared as AuWindow wnd
wnd = AuWindowSet()

dim as entity ent

AuWindowCreate(wnd)

'Main loop
do
    with ent
        if .direction then
            if .steps <= .xb then
                .steps+=.speed
                .x+=.speed
                .y+=.slope*.speed
            end if
            
        else
            if .steps >= .xa then
                .steps-=.speed
                .x-=.speed
                .y-=.slope*.speed
            end if
            
        end if
        if .steps < .xa then
                .direction = 1
                .x = .xa
                .y = .ya
            end if
        if .steps > .xb then
                .direction = 0
                .x = .xb
                .y = .yb
            end if
    end with
    
    screenlock
    cls
    line(0,0)-(wnd.w,wnd.h),rgb(200,200,200),bf
    
    print ent.slope
    
    ent.render()
    screenunlock
    
    sleep 20,1
loop until inkey = chr(27)

constructor entity
    direction = 1
    radius = 32
    clr = rgb(100,100,100)
    
    xa = 50
    ya = 400
    xb = 400
    yb = 300
    x = xa
    y = ya
    xm = (xa+xb)/2
    ym = (ya+yb)/2
    xd = dist_1d(xa,xb)
    yd = dist_1d(ya,yb)
    slope = (yb-ya)/(xb-xa)
    
    speed = 5
end constructor

function entity.render() as integer
    circle(xa,ya),radius/2,clr
    pset(xa,ya),clr
    
    circle(xb,yb),radius/2,clr
    pset(xb,yb),clr
    
    circle(xm,ym),radius/4,clr
    pset(xm,ym),clr
    
    circle(x,y),radius,clr
    pset(x,y),clr
    return 0
end function

function Dist_2d(x1 as single, y1 as single, x2 as single, y2 as single) as single
    return sqr(((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1)))
end function

function Dist_1d(a as single, b as single) as single
    return b-a
end function

end AuWindowDestroy(wnd)