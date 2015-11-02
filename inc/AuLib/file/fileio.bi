'AuFileIO.bi (Auios File IO)

#ifndef __AUIOS_FileIO__
#define __AUIOS_FileIO__

    #inclib "aufileio"

    namespace Auios
        type AuFile
            as integer exists
            as longint length
        end type
        
        declare function AuFileExists(as zString*64) as integer
    end namespace
#endif