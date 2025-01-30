#include "KayvanToyISARegisterInfo.h"
#include "KayvanToyISA.h"
#include "KayvanToyISASubtarget.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

#define GET_REGINFO_TARGET_DESC
#include "KayvanToyISAGenRegisterInfo.inc"

KayvanToyISARegisterInfo::KayvanToyISARegisterInfo() : KayvanToyISAGenRegisterInfo(/*return address register*/KTISA::R14) {}

// TOOD: Save some registers. define an ABI for the ISA.
const MCPhysReg*
KayvanToyISARegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
  llvm_unreachable("not implemeneted");
  return nullptr;
}

// TODO: What is this? 
const uint32_t*
KayvanToyISARegisterInfo::getCallPreservedMask(const MachineFunction &MF, CallingConv::ID CC) const {
  llvm_unreachable("not implemeneted");
  return nullptr;
}

// TODO: What is this?
const uint32_t*
KayvanToyISARegisterInfo::getRTCallPreservedMask(CallingConv::ID CC) const {
  llvm_unreachable("not implemented");
  return nullptr;
}

// TODO: Reserved for what? 
BitVector
KayvanToyISARegisterInfo::getReservedRegs(const MachineFunction &MF) const {
  BitVector rsvd(getNumRegs());
  rsvd.set(KTISA::R0);
  rsvd.set(KTISA::R1);

  return rsvd;
}

bool KayvanToyISARegisterInfo::isReservedReg(const MachineFunction &MF, MCRegister Reg) const {
  return getReservedRegs(MF)[Reg];
}

const TargetRegisterClass*
KayvanToyISARegisterInfo::getPointerRegClass(const MachineFunction& MF, unsigned kind) const {
  return &KTISA::GPRRegClass;
}

bool
KayvanToyISARegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II, int SPAdj, unsigned int FIOperandNum, RegScavenger *RS) const {
  llvm_unreachable("not implemented");
  return false;
}

Register KayvanToyISARegisterInfo::getFrameRegister(const MachineFunction &MF) const {
  return KTISA::R15;
}
