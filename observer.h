#ifndef OBSERVER_H
#define OBSERVER_H

class Observer {
 public:
  Observer();
  virtual ~Observer() = default;
  virtual void update();
};

#endif  // OBSERVER_H
