// required llvm boiler plate
include "llvm/Target/Target.td"
include "llvm/TableGen/SearchableTable.td"


// include all the other Target definitions
include "KayvanToyISARegisterInfo.td"
include "KayvanToyISAInstrInfo.td"

def KayvanToyISAInstrInfo : InstrInfo;

def KayvanToyISAAsmParser : AsmParser {
  let ShouldEmitMatchRegisterAltName = true;
  let AllowDuplicateRegisterNames = true;
}

def KayvanToyISAAsmParserVariant : AsmParserVariant {
  let RegisterPrefix = "%";
}

//===----------------------------------------------------------------------===//
// processors supported.
//===----------------------------------------------------------------------===//

class Proc<string Name, list<SubtargetFeature> Features,
           list<SubtargetFeature> TuneFeatures = []>
 : Processor<Name, NoItineraries, Features, TuneFeatures>;

def : Proc<"generic",         []>;

//===----------------------------------------------------------------------===//
// Declare the target which we are implementing
//===----------------------------------------------------------------------===//

def KayvanToyISAAsmWriter : AsmWriter {
  string AsmWriterClassName  = "InstPrinter";
  int PassSubtarget = 1;
  int Variant = 0;
}

def KayvanToyISA : Target {
  // Pull in Instruction Info:
  let InstructionSet = KayvanToyISAInstrInfo;
  let AssemblyParsers  = [KayvanToyISAAsmParser];
  let AssemblyParserVariants = [KayvanToyISAAsmParserVariant];
  let AssemblyWriters = [KayvanToyISAAsmWriter];
  let AllowRegisterRenaming = 1;
}