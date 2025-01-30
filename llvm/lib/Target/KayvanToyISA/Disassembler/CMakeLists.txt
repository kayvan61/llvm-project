add_llvm_component_library(LLVMKayvanToyISADisassembler
  KTISADisassembler.cpp

  LINK_COMPONENTS
  MCDisassembler
  MC
  KTISAInfo
  Support

  ADD_TO_COMPONENT
  KayvanToyISA
  )
