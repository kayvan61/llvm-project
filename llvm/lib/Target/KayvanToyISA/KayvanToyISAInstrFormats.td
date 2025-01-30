

class InstrParent<dag outs, dag ins, string asm, list<dag> pat, InstrItinClass itin=NoItinerary> : Instruction {

  field bits<16> Inst;

  let Namespace = "KTISA";
  let Size = 2;

  bits<4> op;
  let Inst{15-12} = op;

  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString = asm;
  let Pattern = pat;

  let DecoderNamespace = "KayvanToyISA";
  field bits<32> SoftFail = 0;

  let Itinerary = itin;
}

class ArithRRRInstr<bits<4> opcode,
                    dag outs, dag ins, string asm, list<dag> pat,
                    InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<3> dr;
  bits<3> sr1;
  bits<3> sr2;

  let op = opcode;
  let Inst{11-9} = dr;
  let Inst{8-6}  = sr1;
  let Inst{5-3}  = 0;
  let Inst{2-0}  = sr2;
}

class ArithRRIInstr<bits<4> opcode,
                    dag outs, dag ins, string asm, list<dag> pat,
                    InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<3> dr;
  bits<3> sr1;
  bits<5> simm5;

  let op = opcode;
  let Inst{11-9} = dr;
  let Inst{8-6}  = sr1;
  let Inst{5}    = 1;
  let Inst{4-0}  = simm5;
}

class LoadRRIInst<bits<4> opcode,
                  dag outs, dag ins, string asm, list<dag> pat,
                  InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<3> dr;
  bits<3> br;
  bits<6> simm6;

  let op = opcode;
  let Inst{11-9} = dr;
  let Inst{8-6}  = br;
  let Inst{5-0}  = simm6;
}

class StoreRRIInst<bits<4> opcode,
                   dag outs, dag ins, string asm, list<dag> pat,
                   InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<3> sr;
  bits<3> br;
  bits<6> simm6;

  let op = opcode;
  let Inst{11-9} = sr;
  let Inst{8-6}  = br;
  let Inst{5-0}  = simm6;
}

class BRInst<dag outs, dag ins, string asm, list<dag> pat,
             InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<3> cond;
  bits<9> offs;

  let op = 0;
  let Inst{11-9} = cond;
  let Inst{8-0}  = offs;
}

class JMPInst<dag outs, dag ins, string asm, list<dag> pat,
              InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<3> br;

  let op = 0b1100;
  let Inst{11-9} = 0;
  let Inst{8-6}  = br;
  let Inst{5-0}  = 0;
}

class LEAInst<dag outs, dag ins, string asm, list<dag> pat,
              InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<9> simm9;
  bits<3> dr;

  let op = 0b1110;
  let Inst{11-9} = dr;
  let Inst{8-0} = simm9;
}

class RTIInst<dag outs, dag ins, string asm, list<dag> pat,
              InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  let op = 0b1000;
  let Inst{11-0} = 0;
}

class SHFInst<bits<1> dir, bits<1> arith,
              dag outs, dag ins, string asm, list<dag> pat,
              InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<3> dr;
  bits<3> sr1;
  bits<4> simm4;
  
  let op = 0b1101;
  let Inst{11-9} = dr;
  let Inst{8-6}  = sr1;
  let Inst{5}    = arith;
  let Inst{4}    = dir;
  let Inst{3-0}  = simm4;
}

class TRAPInst<dag outs, dag ins, string asm, list<dag> pat,
               InstrItinClass itin = NoItinerary> : InstrParent<outs, ins, asm, pat, itin> {
  bits<8> vect;
  
  let op = 0b1111;
  let Inst{7-0} = vect;
}