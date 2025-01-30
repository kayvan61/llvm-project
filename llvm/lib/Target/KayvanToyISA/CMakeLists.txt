add_llvm_component_group(KayvanToyISA)

set(LLVM_TARGET_DEFINITIONS KayvanToyISA.td)

tablegen(LLVM KayvanToyISAGenAsmMatcher.inc -gen-asm-matcher)
tablegen(LLVM KayvanToyISAGenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM KayvanToyISAGenCallingConv.inc -gen-callingconv)
tablegen(LLVM KayvanToyISAGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM KayvanToyISAGenDisassemblerTables.inc -gen-disassembler)
tablegen(LLVM KayvanToyISAGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM KayvanToyISAGenMCCodeEmitter.inc -gen-emitter)
tablegen(LLVM KayvanToyISAGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM KayvanToyISAGenSearchableTables.inc -gen-searchable-tables)
tablegen(LLVM KayvanToyISAGenSubtargetInfo.inc -gen-subtarget)

add_public_tablegen_target(KayvanToyISACommonTableGen)

add_llvm_target(KayvanToyISACodeGen
  KayvanToyISATargetMachine.cpp
  KayvanToyISARegisterInfo.cpp
  KayvanToyISAISelLowering.cpp
  KayvanToyISAISelDAGtoDAG.cpp
  KayvanToyISAFrameLowering.cpp

  LINK_COMPONENTS
  AsmPrinter
  CodeGen
  CodeGenTypes
  Core
  MC
  SelectionDAG
  KTISADesc
  KTISAInfo
  Support
  Target
  TargetParser

  ADD_TO_COMPONENT
  KayvanToyISA
  )

add_subdirectory(AsmParser)
add_subdirectory(Disassembler)
add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
