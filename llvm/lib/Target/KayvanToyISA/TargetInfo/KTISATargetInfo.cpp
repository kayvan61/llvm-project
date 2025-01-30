
#include "TargetInfo/KTISATargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
using namespace llvm;

Target& llvm::getTheKayvanToyISATarget() {
  static Target TheKayvanToyISATarget;
  return TheKayvanToyISATarget;
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeKayvanToyISATargetInfo() {
  RegisterTarget<Triple::KayvanToyISA, /*HasJIT=*/false> X(getTheKayvanToyISATarget(), "ktisa", "Kayvan Toy ISA", "KayvanToyISA");
}
