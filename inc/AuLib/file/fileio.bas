'AuFileIO.bas (Auios File IO)
#define fbc -lib -x ../../../lib/win32/libaufileio.a

#include "file.bi"
#include "fileio.bi"

namespace Auios
    function AuFileOpenForInput(path as string, ID as integer) as AuFile
        dim as AuFile thisFile
        
        with thisFile
            .exists = AuFileExists(path)
            if(.exists) then
                .path = path
                open .path for input as ID
            else
                .path = "NA"
            end if
        end with
        
        return thisFile
    end function
    
    function AuFileOpenForOutput(path as string, ID as integer) as AuFile
        dim as AuFile thisFile
        
        with thisFile
            .exists = AuFileExists(path)
            if(.exists) then
                .path = path
                open .path for output as ID
            else
                .path = "NA"
            end if
        end with
        
        return thisFile
    end function
    
    function AuFileExists(path as String) as integer
        return fileExists(path)
    end function
    
    function AuFileLOF(thisFile as AuFile) as longint
        return LOF(thisFile.ID)
    end function
end namespace
