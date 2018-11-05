'AuTimer.bi
'2018-11-05

type AuTimer
    as single startTime
    as single stopTime
    as single timePassed
    as boolean running
    
    declare sub Start()
    declare sub Stop()
    declare sub Reset()
    declare function StartTime() as single
    declare function GetTime() as single
end type

sub AuTimer.Start()
    if(this.running) then return
    this.startTime = timer()
    this.running = true
end sub

sub AuTimer.Stop()
    if(NOT this.running) then return
    this.stopTime = timer()
    this.timePassed += this.stopTime - this.startTime
    this.running = false
end sub

sub AuTimer.Reset()
    this.startTime = 0
    this.stopTime = 0
    this.timePassed = 0
    this.running = false
end sub

function AuTimer.StartTime() as single
    return this.startTime
end function

function AuTimer.GetTime() as single
    return this.timePassed
end function
