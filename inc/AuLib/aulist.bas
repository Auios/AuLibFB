'AuList.bi
'12/21/2017

#IFNDEF _AULIST_BI_
#DEFINE _AULIST_BI_

#include once "crt.bi"

#IFNDEF LISTJUMPSIZE
#DEFINE LISTJUMPSIZE 32
#ENDIF

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
    end type
    
    constructor _T##List
        item = new _T[LISTJUMPSIZE]
        allocated = LISTJUMPSIZE
    end constructor
    
    sub _T##List.allocate()
        allocated+=LISTJUMPSIZE
        dim as _T ptr temp = new _T[allocated]
        memmove(temp, item, (allocated-LISTJUMPSIZE)*sizeof(_T))
        delete[] item
        item = temp
    end sub
    
    sub _T##List.deallocate()
        allocated-=LISTJUMPSIZE
        dim as _T ptr temp = new _T[allocated]
        memmove(temp, item, (allocated-LISTJUMPSIZE)*sizeof(_T))
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
        memmove(@cptr(_T ptr,item)[index], @cptr(_T ptr,item)[index+1], sizeof(_T)*(count-index-1))
        count-=1
        if(count+(LISTJUMPSIZE\2)) < (allocated-LISTJUMPSIZE) then this.deallocate()
    end sub
    #ENDMACRO
end nameSpace

#UNDEF LISTJUMPSIZE
#ENDIF