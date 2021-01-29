#ifndef OSERVABLE_H
#define OSERVABLE_H

#include "observer.h"

class Observable {
 public:
  Observable();

  void setObserver(Observer* observer);

  void change();

 private:
  Observer* m_observer;
};

#endif  // OSERVABLE_H
