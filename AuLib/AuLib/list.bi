'list.bi
'2018-10-01

#IFNDEF _AULIB_LIST_BI_
#DEFINE _AULIB_LIST_BI_

#include once "crt.bi"

#DEFINE LISTALLOCSIZE 32

nameSpace AuLib
    #MACRO DeclareList(_T)
    type _T##List
        as uinteger allocated, count
        as _T ptr item
        
        declare constructor()
        declare sub allocate()
        declare sub deallocate()
        declare sub add(newItem as _T)
        declare sub remove(index as uinteger)
        declare function length() as uinteger
        declare function swapItem(srcIndex as uinteger, dstIndex as uinteger) as boolean
    end type
    
    constructor _T##List
        item = new _T[LISTALLOCSIZE]
        allocated = LISTALLOCSIZE
    end constructor
    
    sub _T##List.allocate()
        allocated+=LISTALLOCSIZE
        dim as _T ptr temp = new _T[allocated]
        memmove(temp, item, (allocated-LISTALLOCSIZE)*sizeof(_T))
        delete[] item
        item = temp
    end sub
    
    sub _T##List.deallocate()
        allocated-=LISTALLOCSIZE
        dim as _T ptr temp = new _T[allocated]
        memmove(temp, item, (allocated-LISTALLOCSIZE)*sizeof(_T))
        delete[] item
        item = temp
    end sub
    
    sub _T##List.add(newItem as _T)
        if(count >= allocated) then this.allocate()
        count+=1
        item[count-1] = newItem
    end sub
    
    sub _T##List.remove(index as uinteger)
        if(count = 0 OR index > count) then return
        memmove(@item[index], @item[index+1], sizeof(string)*(count-index-1))
        count-=1
        if(count+(LISTALLOCSIZE\2)) < (allocated-LISTALLOCSIZE) then this.deallocate()
    end sub
    
    function _T##List.length() as uinteger
        return this.count
    end function
    
    function _T##List.swapItem(srcIndex as uinteger, dstIndex as uinteger) as boolean
        dim as boolean result = false
        if(dstIndex <= this.count-1 AND srcIndex <= this.count-1) then
            swap this.item[srcIndex], this.item[dstIndex]
            result = true
        end if
        return result
    end function
    #ENDMACRO
    
    #MACRO forEach(_V, _L)
    for i as uinteger = 1 to _L##.count
        dim as typeof(*_L##.item) _V = _L##.item[i-1]
    #ENDMACRO
end nameSpace

#ENDIF