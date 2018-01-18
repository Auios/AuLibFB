'AuVector.bi
'1/5/2018

#IFNDEF _AUVECTOR_BI_
#DEFINE _AUVECTOR_BI_

nameSpace AuLib
    #MACRO DeclareVector(_T)
    type _T##Vector
        as _T x, y
        
        declare function toString() as string
        declare sub set(x as _T, y as _T)
    end type
    
    function _T##Vector.toString() as string
        return str(x) & "," & str(y)
    end function
    
    sub _T##Vector.set(x as _T, y as _T)
        this.x = x
        this.y = y
    end sub
    #ENDMACRO
end nameSpace

#ENDIF