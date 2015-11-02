'AuFileIO.bas (Auios File IO)
#define fbc -lib -x ../../../lib/win32/libaufileio.a

#include "fileio.bi"

namespace Auios
    function AuFileExists(path as zString*64) as integer
        return fileExists(path)
    end function
end namespace
