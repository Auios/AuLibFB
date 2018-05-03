type FPSCounter
    as double startTime
    as double endTime
    as double timePassed
    as integer frames, FPS
    
    declare sub start()
    declare sub check()
    declare function getFPS() as integer
end type

sub FPSCounter.start()
    this.startTime = timer()
end sub

sub FPSCounter.check()
    this.endTime = timer()
    this.timePassed+=this.endTime-this.startTime
    this.frames+=1
    if(this.timePassed >= 1) then
        this.FPS = this.frames
        this.timePassed = 0
        this.frames = 0
    end if
end sub

function FPSCounter.getFPS() as integer
    return this.FPS
end function
