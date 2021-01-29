#include <iostream>

#include "observable.h"
#include "observer.h"

int main() {
  Observer bar;
  Observable foo;

  foo.setObserver(&bar);

  foo.change();

  return 0;
}
