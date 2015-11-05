'AuFileIO.bi (Auios File IO)

#ifndef __AUIOS_FileIO__
#define __AUIOS_FileIO__

    #inclib "aufileio"

    namespace Auios
        type AuFile
            as ubyte isOpen:1
            as ubyte UnusedMemory:7
            as integer ID
            as integer exists
            as longint size
            as string path
            as string contents
        end type
        
        declare function AuFileOpen(path as string, ID as integer = freefile) as AuFile
        declare function AuFileClose(thisFile as AuFile) as integer
        
        declare function AuFileExists(path as string) as integer
        declare function AuFileLOF(thisFile as AuFile) as longint
        
        declare function AuFileReadAll(thisFile as AuFile) as string
    end namespace
#endif