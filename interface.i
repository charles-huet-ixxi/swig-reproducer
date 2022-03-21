%module(directors="1") InterfaceTest

%{
#include "interface.h"
%}

%include <stl.i>

namespace std {
  template<typename T>
  struct optional {
  };

}

// Note the use of "jboxtype" instead of just "jstype": for primitive types,
// such as "double", they're different and we must use the former as
// Optional<> can only be used with reference types in Java.
%typemap(jni) std::optional<epi::Agent>, const std::optional<epi::Agent>& "jobject"
%typemap(jtype) std::optional<epi::Agent>, const std::optional<epi::Agent>& "java.util.Optional<$typemap(jboxtype, epi::Agent)>"
%typemap(jstype) std::optional<epi::Agent>, const std::optional<epi::Agent>& "java.util.Optional<$typemap(jboxtype, epi::Agent)>"

%typemap(javadirectorin) std::optional<epi::Agent> "$jniinput"
%typemap(javadirectorout) std::optional<epi::Agent> "$javacall"


%typemap(javaout) std::optional<epi::Agent> { return $jnicall; }

/*
%typemap(directorin, descriptor="Ljava/util/Optional;") std::optional<epi::Agent>, const std::optional<epi::Agent>& "directorin $input = $1"
%typemap(directorout) std::optional<epi::Agent>, const std::optional<epi::Agent>& "$result = QDateTime::fromMSecsSinceEpoch($input);"
%typemap(javadirectorin) std::optional<epi::Agent> "$jniinput"
%typemap(javain) std::optional<epi::Agent> "$javainput.getTime()"
%typemap(javadirectorout) std::optional<epi::Agent> "$javacall.getTime()"
%typemap(in) std::optional<epi::Agent>
%{
  $1 = $javaclassname.getCPtr(opt$input);
%}


%typemap(out) std::optional<epi::Agent> {
*(std::optional<epi::Agent> **)&$result = new std::optional<epi::Agent>(new $1_ltype(($1_ltype &)$1));

if ($1)
    return java.util.Optional.of($1.value());
  else
    return java.util.Optional.empty();
}*/



%template() std::optional<epi::Agent>;

%feature("director") Interface;
%include "interface.h"

