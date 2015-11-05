'File test
#include "AuLib.bi"

using Auios

dim as AuFile myFile

print myFile.size
myFile = AuFileOpen("thisFile.txt")
print myFile.path
print myFile.size
print myFile.isOpen
AuFileReadAll(myFile)
print "fuck"
print myFile.contents
print len(myFile.contents)
AuFileClose(myFile)
print AuFile.isOpen
sleep