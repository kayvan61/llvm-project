add_llvm_component_library(LLVMKTISADesc
  KTISAAsmBackend.cpp
  KTISAELFObjectWriter.cpp
  KTISAInstPrinter.cpp
  KTISAMCAsmInfo.cpp
  KTISAMCCodeEmitter.cpp
  KTISAMCTargetDesc.cpp
  KTISAMCExpr.cpp
  KTISATargetStreamer.cpp

  LINK_COMPONENTS
  MC
  KTISAInfo
  Support
  TargetParser

  ADD_TO_COMPONENT
  KayvanToyISA
  )
