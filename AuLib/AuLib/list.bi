'list.bi
'2019-11-27

#IFNDEF _AULIB_LIST_BI_
#DEFINE _AULIB_LIST_BI_

#include once "crt.bi"

#DEFINE LISTALLOCSIZE 32

nameSpace AuLib
    #MACRO DeclareList(_T)
    type _T##List
        as uinteger allocated, count
        as _T item(any)
       
        declare constructor()
        declare sub allocate()
        declare sub deallocate()
        declare sub add(newItem as _T)
        declare sub remove(index as uinteger)
        declare function length() as uinteger
        declare function swapItem(srcIndex as uinteger, dstIndex as uinteger) as boolean
    end type
     
    constructor _T##List
        redim this.item(LISTALLOCSIZE-1)
        this.allocated = LISTALLOCSIZE
    end constructor
     
    sub _T##List.allocate()
        this.allocated+=LISTALLOCSIZE
        redim preserve this.item(this.allocated - 1)
    end sub
     
    sub _T##List.deallocate()
        this.allocated-=LISTALLOCSIZE
        redim preserve this.item(this.allocated - 1)
    end sub
     
    sub _T##List.add(newItem as _T)
        if(this.count >= this.allocated) then this.allocate()
        this.count+=1
        this.item(this.count-1) = newItem
    end sub
     
    sub _T##List.remove(index as uinteger)
        if(this.count = 0 OR index > this.count) then return
        for i as integer = index + 1 to this.allocated - 1
            this.item(i - 1) = this.item(i)
        next i
        this.count-=1
        if(this.count+(LISTALLOCSIZE\2)) < (this.allocated-LISTALLOCSIZE) then this.deallocate()
    end sub
     
    function _T##List.length() as uinteger
        return this.count
    end function
     
    function _T##List.swapItem(srcIndex as uinteger, dstIndex as uinteger) as boolean
        dim as boolean result = false
        if(dstIndex <= this.count-1 AND srcIndex <= this.count-1) then
            swap this.item(srcIndex), this.item(dstIndex)
            result = true
        end if
        return result
    end function
    #ENDMACRO
     
    #MACRO forEach(_V, _L)
    for i as uinteger = 1 to _L##.count
        dim as typeof(_L##.item) _V = _L##.item(i-1)
    #ENDMACRO
end nameSpace
#ENDIF