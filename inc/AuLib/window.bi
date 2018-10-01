'Window.bi
'2018-10-01

#IFNDEF _AULIB_WINDOW_BI_
#DEFINE _AULIB_WINDOW_BI_

#include once "./String.bi"
#include once "crt.bi"
#include once "fbgfx.bi"

nameSpace AuLib
    type AuWindow
        as long wdth, hght
        as long depth
        as long pages
        as long flags
        as long bpp
        as long pitch
        as long rate
        as boolean visible
        as boolean isInit
        as zstring*48 driver
        as zstring*64 title
        as any ptr buffer
        
        declare sub Init(wdth as long = 800, hght as long = 600, depth as long = 32, pages as long = 1, flags as long = 0, title as string = "Application")
        declare sub GetSize(byref wdth as long, byref hght as long)
        declare sub Show()
        declare sub Hide()
        declare sub Destroy()
        declare sub Dump(message as string = "")
    end type
    
    sub AuWindow.Init(wdth as long = 800, hght as long = 600, depth as long = 32, pages as long = 1, flags as long = 0, title as string = "Application")
        this.wdth = wdth
        this.hght = hght
        this.depth = depth
        this.pages = pages
        this.flags = flags
        this.title = title
        this.isInit = true
    end sub
    
    sub AuWindow.GetSize(byref wdth as long, byref hght as long)
        wdth = this.wdth
        hght = this.hght
    end sub
    
    sub AuWindow.Show()
        dim as integer result
        if(this.isInit) then
            this.visible = true
            result  = screenRes(this.wdth, this.hght, this.depth, this.pages, this.flags)
            this.buffer = screenPtr()
            screenInfo(,,,this.bpp, this.pitch, this.rate, this.driver)
            windowTitle(this.title)
        else
            result = -4669
        end if
    end sub
    
    sub AuWindow.Hide()
        this.visible = false
        screen(0)
    end sub
    
    sub AuWindow.Destroy()
        this.wdth = 0
        this.hght = 0
        this.depth = 0
        this.pages = 0
        this.flags = 0
        this.title = ""
        this.isInit = false
        this.visible = false
        screen(0)
    end sub
    
    sub AuWindow.Dump(message as string = "")
        printBar("-",10)
        if(message <> "") then printf(!"%s\n", message)
        printf(!"Width---: %d\n", this.wdth)
        printf(!"Height--: %d\n", this.hght)
        printf(!"Depth---: %d\n", this.depth)
        printf(!"Pages---: %d\n", this.pages)
        printf(!"Flags---: %d\n", this.flags)
        printf(!"Title---: %d\n", this.title)
        printf(!"Visible-: %d\n", this.visible)
    end sub
end nameSpace

#ENDIF