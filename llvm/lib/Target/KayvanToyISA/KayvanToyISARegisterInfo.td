//===-- KayvanToyISARegisterInfo.td - KayvanToyISA Register defs ---------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the KayvanToyISA register file
//===----------------------------------------------------------------------===//

class KayvanToyISAReg<bits<16> Enc, string n> : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "KTISA";
}

let Namespace = "KTISA" in {
def sub_even : SubRegIndex<32>;
def sub_odd  : SubRegIndex<32, 32>;
def sub_even64 : SubRegIndex<64>;
def sub_odd64  : SubRegIndex<64, 64>;
}

let Namespace = "KTISA",
FallbackRegAltNameIndex = NoRegAltName in {
  def RegNamesStateReg : RegAltNameIndex;
}

// Registers are identified with 5-bit ID numbers.
// Ri - 32-bit integer registers
class Ri<bits<16> Enc, string n> : KayvanToyISAReg<Enc, n>;

// Integer registers
def R0 : Ri< 0, "g0">, DwarfRegNum<[0]> {
  let isConstant = true;
}
def R1 : Ri< 1, "g1">, DwarfRegNum<[1]>;
def R2 : Ri< 2, "g2">, DwarfRegNum<[2]>;
def R3 : Ri< 3, "g3">, DwarfRegNum<[3]>;
def R4 : Ri< 4, "g4">, DwarfRegNum<[4]>;
def R5 : Ri< 5, "g5">, DwarfRegNum<[5]>;
def R6 : Ri< 6, "g6">, DwarfRegNum<[6]>;
def R7 : Ri< 7, "g7">, DwarfRegNum<[7]>;
def R8 : Ri< 8, "o0">, DwarfRegNum<[8]>;
def R9 : Ri< 9, "o1">, DwarfRegNum<[9]>;
def R10 : Ri<10, "o2">, DwarfRegNum<[10]>;
def R11 : Ri<11, "o3">, DwarfRegNum<[11]>;
def R12 : Ri<12, "o4">, DwarfRegNum<[12]>;
def R13 : Ri<13, "o5">, DwarfRegNum<[13]>;
def R14 : Ri<14, "sp">, DwarfRegNum<[14]>;
def R15 : Ri<15, "o7">, DwarfRegNum<[15]>;

def GPR : RegisterClass<"KTISA", [i32], 32, (sequence "R%u", 0, 15)>;