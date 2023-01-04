//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// stereoWidthPlugin_types.h
//
// Code generation for function 'onParamChangeCImpl'
//

#ifndef STEREOWIDTHPLUGIN_TYPES_H
#define STEREOWIDTHPLUGIN_TYPES_H

// Include files
#include "rtwtypes.h"
#include "stereoWidthPlugin.h"

// Type Definitions
struct stereoWidthPluginPersistentData {
  derivedAudioPlugin plugin;
  boolean_T plugin_not_empty;
};

struct stereoWidthPluginStackData {
  stereoWidthPluginPersistentData *pd;
};

#endif
// End of code generation (stereoWidthPlugin_types.h)
