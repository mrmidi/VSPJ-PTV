//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// stereoWidthPlugin.h
//
// Code generation for function 'stereoWidthPlugin'
//

#ifndef STEREOWIDTHPLUGIN_H
#define STEREOWIDTHPLUGIN_H

// Include files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

// Type Declarations
struct stereoWidthPluginStackData;

// Type Definitions
class derivedAudioPlugin {
public:
  derivedAudioPlugin();
  ~derivedAudioPlugin();
  boolean_T matlabCodegenIsDeleted;
  int PrivateLatency;
  double Width;
};

// Function Declarations
extern void createPluginInstance(stereoWidthPluginStackData *SD,
                                 unsigned long thisPtr);

extern int getLatencyInSamplesCImpl(stereoWidthPluginStackData *SD);

extern void onParamChangeCImpl(stereoWidthPluginStackData *SD, int paramIdx,
                               double value);

extern void processEntryPoint(stereoWidthPluginStackData *SD,
                              double samplesPerFrame, const double i1_data[],
                              const int i1_size[1], const double i2_data[],
                              const int i2_size[1], double o1_data[],
                              int o1_size[1], double o2_data[], int o2_size[1]);

extern void resetCImpl(stereoWidthPluginStackData *SD, double rate);

extern void stereoWidthPlugin_initialize(stereoWidthPluginStackData *SD);

extern void stereoWidthPlugin_terminate(stereoWidthPluginStackData *SD);

#endif
// End of code generation (stereoWidthPlugin.h)
