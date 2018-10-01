'vector.bi
'2018-10-01

#IFNDEF _AULIB_VECTOR_BI_
#DEFINE _AULIB_VECTOR_BI_

nameSpace AuLib
    #MACRO DeclareVector(_T)
    type _T##Vector
        as _T x, y
        
        declare function ToString() as string
        declare sub Set(x as _T, y as _T)
        declare sub Set(v as _T##Vector)
    end type
    
    function _T##Vector.ToString() as string
        return str(x) & "," & str(y)
    end function
    
    sub _T##Vector.Set(x as _T, y as _T)
        this.x = x
        this.y = y
    end sub
    
    sub _T##Vector.Set(v as _T##Vector)
        this.x = v.x
        this.y = v.y
    end sub
    #ENDMACRO
end nameSpace

#ENDIF