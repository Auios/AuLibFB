'file.bi
'2018-10-01

#IFNDEF _AULIB_FILE_BI_
#DEFINE _AULIB_FILE_BI_

#include once "crt.bi"

nameSpace AuLib
    type File
        as boolean isOpen
        as long endOfFile
        as ubyte mode
        as long fileNumber
        as zstring*255 fileName
        
        declare function OpenRead(fileName as string) as boolean
        declare function OpenWrite(fileName as string) as boolean
        declare sub CloseFile()
        declare sub Reset()
        declare function ReadLine() as string
        declare sub Print(lineStr as string)
    end type
    
    function File.OpenRead(fileName as string) as boolean
        if(this.isOpen) then return false
        this.fileNumber = freeFile()
        this.fileName = fileName
        this.mode = 1
        if(NOT open(this.fileName for input as #this.fileNumber)) then this.isOpen = true
        return this.isOpen
    end function
    
    function File.OpenWrite(fileName as string) as boolean
        if(this.isOpen) then return false
        this.fileNumber = freeFile()
        this.fileName = fileName
        this.mode = 2
        if(NOT open(this.fileName for output as #this.fileNumber)) then this.isOpen = true
        return this.isOpen
    end function
    
    sub File.CloseFile()
        if(this.isOpen) then
            close #this.fileNumber
            this.isOpen = 0
            this.fileNumber = 0
            this.mode = 0
        end if
    end sub
    
    sub File.Reset()
        if(this.isOpen) then
            close #this.fileNumber
            if(this.mode = 1) then this.openRead(this.fileName)
            if(this.mode = 2) then this.openWrite(this.fileName)
        end if
    end sub
    
    function File.ReadLine() as string
        dim as string text
        if(this.isOpen) then
            line input #this.fileNumber, text
            this.endOfFile = EoF(this.fileNumber)
        end if
        return text
    end function
    
    sub File.Print(lineStr as string)
        write #this.fileNumber, lineStr
    end sub
end nameSpace

#ENDIF