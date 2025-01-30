

#include "llvm/CodeGen/TargetFrameLowering.h"
#include "llvm/Support/Alignment.h"
#include "KayvanToyISA.h"

namespace llvm {

class KayvanToyISASubtarget;

class KayvanToyISAFrameLowering : public llvm::TargetFrameLowering {
    KayvanToyISAFrameLowering(const KayvanToyISASubtarget &ST) : llvm::TargetFrameLowering(StackDirection::StackGrowsUp, llvm::Align::Constant<4>(), 0) {}
};
} // namespace llvm