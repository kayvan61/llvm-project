#pragma once

#include "llvm/MC/TargetRegistry.h"
#include "llvm/TargetParser/Triple.h"
namespace llvm {
    class Target;

    Target& getTheKayvanToyISATarget();
} // namespace llvm