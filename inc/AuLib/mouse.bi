'mouse.bi
'2017-10-01

#IFNDEF _AULIB_MOUSE_BI_
#DEFINE _AULIB_MOUSE_BI_

#include once "./string.bi"
#include once "crt.bi"

namespace AuLib
    type Mouse
        as long state
        as long x,y
        as long wheel
        as long buttons
        as long clip
        as long visible
        
        declare sub Dump()
        declare function Set(x as long, y as long, visible as long, clip as long) as long
        declare function Get() as integer
        declare function Compare(target as AuLib.Mouse) as integer
        declare function Update() as integer
        declare sub Hide()
        declare sub Show()
    end type
    
    sub Mouse.Dump()
        printBar("-",10)
        printf(!"State---: %d\n", this.state)
        printf(!"X,Y-----: %d,%d\n", this.x, this.y)
        printf(!"Wheel---: %d\n", this.wheel)
        printf(!"Buttons-: %d\n", this.buttons)
        printf(!"Clip----: %d\n", this.clip)
    end sub
    
    function Mouse.Set(x as long, y as long, visible as long, clip as long) as long
        dim as long result = setMouse(x,y,visible,clip)
        this.x = x
        this.y = y
        this.visible = visible
        this.clip = clip
        return result
    end function
    
    function Mouse.Get() as integer
        this.state = getMouse(this.x, this.y, this.wheel, this.buttons, this.clip)
        return this.state
    end function
    
    'Useful for checking if the mouse has moved
    function Mouse.Compare(target as Mouse) as integer
        return memCmp(@this, @target, sizeof(Mouse)) 'Return 0 if they are the same
    end function
    
    function Mouse.Update() as integer
        this.state = getMouse(this.x, this.y, this.wheel, this.buttons, this.clip)
        return this.state
    end function
    
    sub Mouse.Hide()
        this.visible = 0
        setMouse(this.x, this.y, this.visible, this.clip)
    end sub
    
    sub Mouse.Show()
        this.visible = 1
        setMouse(this.x, this.y, this.visible, this.clip)
    end sub
end namespace

#ENDIF