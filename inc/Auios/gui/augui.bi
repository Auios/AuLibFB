'AuGUI.bi (Auios GUI)

#ifndef __AUIOS_GUI__
#define __AUIOS_GUI__
    
    #inclib "augui"
    
    namespace Auios
        type AuGUI
            as long x,y,w,h
            as ulong zorder
            
            as zstring*48 title
        end type
        
        declare function AuGUIInit(x as long,y as long,w as long = 200,h as long = 150,title as zstring*48 = "GUI Window") as AuGUI
        declare function AuGUIRender(thisGUI as AuGUI) as integer
    end namespace
#endif