'AuGUI.bas (Auios GUI)
#define fbc -lib -x ../../../lib/win64/libaugui.a

#include "crt.bi"
#include "augui.bi"

namespace Auios
    function AuGUIInit(x as long,y as long,w as long,h as long,title as zstring*48) as AuGUI
        dim as AuGUI thisGUI
        with thisGUI
            .x = x
            .y = y
            .w = w
            .h = h
            .title = title
        end with
        return thisGUI
    end function
    
    function AuGUIRender(thisGUI as AuGUI) as integer
        with thisGUI
            'view(.x,.y)-(.x+.w,.y+10)
            'window(0,0)-(.w,10)
            line(.x,.y)-(.x+.w,.y+10),rgb(200,200,200),bf
            draw string(.x+4,.y+2),.title,rgb(100,100,100)
        end with
        return 0
    end function
end namespace
