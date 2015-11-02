'AuFileIO.bas (Auios File IO)
#define fbc -lib -x ../../../lib/win32/libaufileio.a

#include "file.bi"
#include "fileio.bi"

namespace Auios
    function AuFileExists(path as zString*64) as integer
        return fileExists(path)
    end function
    
    function AuFileLOF(thisFile as AuFile) as longint
        return LOF(thisFile.ID)
    end function
end namespace
