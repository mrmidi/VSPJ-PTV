//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// Chorus_types.h
//
// Code generation for function 'onParamChangeCImpl'
//

#ifndef CHORUS_TYPES_H
#define CHORUS_TYPES_H

// Include files
#include "Chorus.h"
#include "rtwtypes.h"

// Type Definitions
struct ChorusPersistentData {
  derivedAudioPlugin plugin;
  boolean_T plugin_not_empty;
};

struct ChorusStackData {
  ChorusPersistentData *pd;
};

#endif
// End of code generation (Chorus_types.h)
