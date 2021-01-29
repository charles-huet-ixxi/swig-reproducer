%module(directors="1") Observation

// when an exception is thrown in the java code, redirect it to the java caller
%catches(Swig::DirectorException);

%{
#include "observable.h"
#include "observer.h"
%}

%include "observable.h"
%feature("director") Observer;
%include "observer.h"
