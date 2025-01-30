add_llvm_component_library(LLVMKTISAInfo
  KTISATargetInfo.cpp

  LINK_COMPONENTS
  MC
  Support

  ADD_TO_COMPONENT
  KayvanToyISA
  )
