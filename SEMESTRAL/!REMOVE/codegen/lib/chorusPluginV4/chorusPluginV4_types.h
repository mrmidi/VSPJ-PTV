//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// chorusPluginV4_types.h
//
// Code generation for function 'onParamChangeCImpl'
//

#ifndef CHORUSPLUGINV4_TYPES_H
#define CHORUSPLUGINV4_TYPES_H

// Include files
#include "chorusPluginV4.h"
#include "rtwtypes.h"

// Type Definitions
struct chorusPluginV4PersistentData {
  derivedAudioPlugin plugin;
  boolean_T plugin_not_empty;
};

struct chorusPluginV4StackData {
  chorusPluginV4PersistentData *pd;
};

#endif
// End of code generation (chorusPluginV4_types.h)
