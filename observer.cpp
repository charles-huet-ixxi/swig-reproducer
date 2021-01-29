#include "observer.h"

#include <iostream>

Observer::Observer() {}

void Observer::update() { std::cout << "base observer called" << std::endl; }
