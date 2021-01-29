#include "observable.h"

Observable::Observable() {}

void Observable::setObserver(Observer *observer) { m_observer = observer; }

void Observable::change() { m_observer->update(); }
