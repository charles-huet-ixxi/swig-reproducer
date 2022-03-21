#pragma once
#include <optional>

namespace epi {
class Agent {};
} // namespace epi

class Interface {
public:
  virtual ~Interface() = default;
  virtual std::optional<epi::Agent> foo() = 0;
};
