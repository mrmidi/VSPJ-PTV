//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// tremoloPluginV2_types.h
//
// Code generation for function 'onParamChangeCImpl'
//

#ifndef TREMOLOPLUGINV2_TYPES_H
#define TREMOLOPLUGINV2_TYPES_H

// Include files
#include "rtwtypes.h"
#include "tremoloPluginV2.h"

// Type Definitions
struct tremoloPluginV2PersistentData {
  derivedAudioPlugin plugin;
  boolean_T plugin_not_empty;
};

struct tremoloPluginV2StackData {
  tremoloPluginV2PersistentData *pd;
};

#endif
// End of code generation (tremoloPluginV2_types.h)
