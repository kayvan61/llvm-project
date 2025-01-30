add_llvm_component_library(LLVMKayvanToyISAParser
  KTISAAsmParser.cpp

  LINK_COMPONENTS
  MC
  MCParser
  KTISADesc
  KTISAInfo
  Support
  TargetParser

  ADD_TO_COMPONENT
  KayvanToyISA
  )
