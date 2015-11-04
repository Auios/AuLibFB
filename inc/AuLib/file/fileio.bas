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
                .path = path
                open .path for binary as #ID
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
