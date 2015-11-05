'AuFileIO.bas (Auios File IO)
#define fbc -lib -x ../../../lib/win32/libaufileio.a

#include "file.bi"
#include "fileio.bi"

namespace Auios
    function AuFileOpen(path as string, ID as integer) as AuFile
        dim as AuFile thisFile
        
        with thisFile
            .exists = AuFileExists(path)
            if(.exists) then
                open path for binary as #ID
                .isOpen = 1
                .path = path
                .size = LOF(ID)
            else
                .path = "NA"
            end if
        end with
        
        return thisFile
    end function
    
    function AuFileClose(thisFile as AuFile) as integer
        
        with thisFile
            close #.ID
            .isOpen = 0
        end with
        
        return 0
    end function
    
    function AuFileExists(path as String) as integer
        return fileExists(path)
    end function
    
    function AuFileLOF(thisFile as AuFile) as longint
        thisFile.size = LOF(thisFile.ID)
        return thisFile.size
    end function
    
    function AuFileReadAll(thisFile as AuFile) as string
        with thisFile
            '.contents = space(.size)
            get #.ID,,.contents
            return .contents
        end with
    end function
end namespace
