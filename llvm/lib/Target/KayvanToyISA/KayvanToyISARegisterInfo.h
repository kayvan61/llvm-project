#ifndef LLVM_LIB_TARGET_KAYVANTISAREGISTERINFO_H
#define LLVM_LIB_TARGET_KAYVANTISAREGISTERINFO_H

#include "llvm/CodeGen/TargetRegisterInfo.h"

// need register names
#define GET_REGINFO_ENUM
#define GET_REGINFO_HEADER
#include "KayvanToyISAGenRegisterInfo.inc"

namespace llvm {
  struct KayvanToyISARegisterInfo : public KayvanToyISAGenRegisterInfo {
    KayvanToyISARegisterInfo();
  
    const MCPhysReg *getCalleeSavedRegs(const MachineFunction *MF) const override;
    const uint32_t *getCallPreservedMask(const MachineFunction &MF,
                                         CallingConv::ID CC) const override;
    const uint32_t* getRTCallPreservedMask(CallingConv::ID CC) const;
  
    BitVector getReservedRegs(const MachineFunction &MF) const override;
    bool isReservedReg(const MachineFunction &MF, MCRegister Reg) const;
  
    const TargetRegisterClass *getPointerRegClass(const MachineFunction &MF,
                                                  unsigned Kind) const override;

    bool eliminateFrameIndex(MachineBasicBlock::iterator II,
                             int SPAdj, unsigned FIOperandNum,
                             RegScavenger *RS = nullptr) const override;

    Register getFrameRegister(const MachineFunction &MF) const override;
  };
}

#endif
