'misc.bi
'2018-10-01

#IFNDEF _AULIB_MISC_BAS_
#DEFINE _AULIB_MISC_BAS_

#define flen(_MyStr) cptr(uinteger ptr,@_MyStr)[1]

nameSpace AuLib
    function getRandom(min as integer, max as integer) as single
        return min + (max - min) * rnd()
    end function
    
    function getRandomInt(min as integer, max as integer) as integer
        return min + int(((max - min) + 1) * rnd())
    end function
end nameSpace

#ENDIF