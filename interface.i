%module InterfaceTest

%{
#include "interface.h"
%}

%include <stl.i>


%include <swiginterface.i>
%interface_impl(Interface);

namespace std {
  %template(InterfaceVector) std::vector < Interface* >;
};

%include "interface.h"

