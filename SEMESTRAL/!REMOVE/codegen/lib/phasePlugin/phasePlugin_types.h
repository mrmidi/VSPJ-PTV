//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// phasePlugin_types.h
//
// Code generation for function 'onParamChangeCImpl'
//

#ifndef PHASEPLUGIN_TYPES_H
#define PHASEPLUGIN_TYPES_H

// Include files
#include "phasePlugin.h"
#include "rtwtypes.h"

// Type Definitions
struct phasePluginPersistentData {
  derivedAudioPlugin plugin;
  boolean_T plugin_not_empty;
};

struct phasePluginStackData {
  phasePluginPersistentData *pd;
};

#endif
// End of code generation (phasePlugin_types.h)
