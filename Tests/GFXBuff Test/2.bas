dim shared as integer bpp,pitch,rate,w,h
dim shared as any ptr pBuffer

declare sub psetTest(as long, as long, as uinteger)

screenres(800,600,16,1,0)

pBuffer = screenPtr()
screenInfo(w,h,,bpp,pitch,rate)

psetTest(w/2,h/2,rgb(255,100,100))

sleep()
screen(0):end(0)

'/////////

sub psetTest(x as long, y as long, clr as uinteger)
    dim as uinteger ptr pixel
    
    if(pBuffer) then
        pixel = pBuffer + (y*pitch) + (x * bpp)
        *pixel = clr
    end if
end sub