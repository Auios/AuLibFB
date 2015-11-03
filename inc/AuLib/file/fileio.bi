'AuFileIO.bi (Auios File IO)

#ifndef __AUIOS_FileIO__
#define __AUIOS_FileIO__

    #inclib "aufileio"

    namespace Auios
        type AuFile
            as ubyte mode
            as integer ID
            as integer exists
            as longint length
            as string path
        end type
        
        declare function AuFileOpenForInput(path as string, ID as integer = freefile) as AuFile
        declare function AuFileOpenForOutput(path as string, ID as integer = freefile) as AuFile
        declare function AuFileExists(path as string) as integer
        declare function AuFileLOF(thisFile as AuFile) as longint
    end namespace
#endif