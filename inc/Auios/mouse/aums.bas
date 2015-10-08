'AuMs.bas (Auios Mouse)
#define fbc -lib -x ../../../lib/libaums.a -x ./libaums.a

#include "crt.bi"
#include "aums.bi"

namespace Auios
    function AuMsGet() as AuMs
        dim as AuMs thisMs
        with thisMs
            .state = getMouse(.x,.y,.wheel,.buttons,.clip)
        end with
        return thisMs
    end function
end namespace
