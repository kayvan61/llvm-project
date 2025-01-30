
include "KayvanToyISAInstrFormats.td"

class ImmAsmOperand<string prefix, int width, string suffix> : AsmOperandClass {
  let Name = prefix # "Imm" # width # suffix;
  let RenderMethod = "addImmOperands";
  let DiagnosticType = !strconcat("Invalid", Name);
}

class SImmAsmOperand<int width, string suffix = "">
    : ImmAsmOperand<"S", width, suffix> {
}

def simm4  : Operand<i32> {
  let OperandNamespace = "KTISAOp";
  let ParserMatchClass = SImmAsmOperand<4>;
  let EncoderMethod = "getImmOpValue";
  let DecoderMethod = "decodeSImmOperand<4>";
  let OperandType = "OPERAND_SIMM4";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (!MCOp.evaluateAsConstantImm(Imm))
      return false;
    return isInt<}] # 4 # [{>(Imm);
  }];
}
def simm5  : Operand<i32> {
  let OperandNamespace = "KTISAOp";
  let ParserMatchClass = SImmAsmOperand<5>;
  let EncoderMethod = "getImmOpValue";
  let DecoderMethod = "decodeSImmOperand<5>";
  let OperandType = "OPERAND_SIMM5";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (!MCOp.evaluateAsConstantImm(Imm))
      return false;
    return isInt<}] # 5 # [{>(Imm);
  }];
}
def simm6  : PatLeaf<(imm), [{ return isInt<6>(N->getSExtValue()); }]>;
def simm9  : PatLeaf<(imm), [{ return isInt<9>(N->getSExtValue()); }]>;
def simm11 : PatLeaf<(imm), [{ return isInt<11>(N->getSExtValue()); }]>;

def ADDRRR : ArithRRRInstr<0b0001, (outs GPR:$dr), (ins GPR:$sr1, GPR:$sr2),
             "add $dr $sr1 $sr2", []>;
def ANDRRR : ArithRRRInstr<0b0101, (outs GPR:$dr), (ins GPR:$sr1, GPR:$sr2),
             "add $dr $sr1 $sr2", []>;
def XORRRR : ArithRRRInstr<0b1001, (outs GPR:$dr), (ins GPR:$sr1, GPR:$sr2),
             "add $dr $sr1 $sr2", []>;

def ADDRRI : ArithRRIInstr<0b0001, (outs GPR:$dr), (ins GPR:$sr1, simm5:$simm5),
             "add $dr $sr1 $simm5", []>;
def ANDRRI : ArithRRIInstr<0b0101, (outs GPR:$dr), (ins GPR:$sr1, simm5:$simm5),
             "and $dr $sr1 $simm5", []>;
def XORRRI : ArithRRIInstr<0b1001, (outs GPR:$dr), (ins GPR:$sr1, simm5:$simm5),
             "xor $dr $sr1 $simm5", []>;