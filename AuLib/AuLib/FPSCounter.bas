'FPSCounter.bas
'2018-10-01

type FPSCounter
    as single startTime
    as single endTime
    as single timePassed
    as single frames, FPS
    
    declare sub start()
    declare sub check()
    declare function getFPS() as single
end type

sub FPSCounter.Start()
    this.startTime = timer()
end sub

sub FPSCounter.Check()
    this.endTime = timer()
    this.timePassed+=this.endTime-this.startTime
    this.frames+=1
    if(this.timePassed >= 1) then
        this.FPS = this.frames
        this.timePassed = 0
        this.frames = 0
    end if
end sub

function FPSCounter.GetFPS() as single
    return this.FPS
end function
