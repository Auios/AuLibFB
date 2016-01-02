type wnd
    as any ptr pBuffer
    as integer w,h
    as integer pitch,bpp
end type

declare sub windowCreate(byref thisWnd as wnd)
declare sub psetTest(thisWnd as wnd, x as long, y as long, clr as uinteger)

dim shared as wnd myWnd

windowCreate(myWnd)

psetTest(myWnd,myWnd.w/2,myWnd.h/2,rgb(255,100,100))

sleep()
screen(0):end(0)

'/////////

sub psetTest(thisWnd as wnd, x as long, y as long, clr as uinteger)
    dim as uinteger ptr pixel
    
    if(thisWnd.pBuffer) then
        pixel = thisWnd.pBuffer + (y * thisWnd.pitch) + (x * thisWnd.bpp)
        *pixel = clr
    end if
end sub

sub windowCreate(byref thisWnd as wnd)
    with thisWnd
        .w = 800
        .h = 600
        screenres(.w,.h,16,1,0)
        .pBuffer = screenPtr()
        screeninfo(,,,.bpp,.pitch)
    end with
end sub