'AuFileIO.bi (Auios File IO)

#ifndef __AUIOS_FileIO__
#define __AUIOS_FileIO__

    #inclib "aufileio"

    namespace Auios
        type AuFile
            as integer ID
            as integer exists
            as longint length
        end type
        
        declare function AuFileExists(as zString*64) as integer
        declare function AuFileLOF(as AuFile) as longint
    end namespace
#endif