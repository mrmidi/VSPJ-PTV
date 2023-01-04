//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// phasePlugin.h
//
// Code generation for function 'phasePlugin'
//

#ifndef PHASEPLUGIN_H
#define PHASEPLUGIN_H

// Include files
#include "rtwtypes.h"
#include <cstddef>
#include <cstdlib>

// Type Declarations
struct phasePluginStackData;

// Type Definitions
class derivedAudioPlugin {
public:
  derivedAudioPlugin();
  ~derivedAudioPlugin();
  boolean_T matlabCodegenIsDeleted;
  double PrivateSampleRate;
  int PrivateLatency;
  double depth;
  double rate;
  double t;
  double samplerate;
  double NSamples;
};

// Function Declarations
extern void createPluginInstance(phasePluginStackData *SD,
                                 unsigned long thisPtr);

extern int getLatencyInSamplesCImpl(phasePluginStackData *SD);

extern void onParamChangeCImpl(phasePluginStackData *SD, int paramIdx,
                               double value);

extern void phasePlugin_initialize(phasePluginStackData *SD);

extern void phasePlugin_terminate(phasePluginStackData *SD);

extern void processEntryPoint(phasePluginStackData *SD, double samplesPerFrame,
                              const double i1_data[], const int i1_size[1],
                              const double i2_data[], const int i2_size[1],
                              double o1_data[], int o1_size[1],
                              double o2_data[], int o2_size[1]);

extern void resetCImpl(phasePluginStackData *SD, double rate);

#endif
// End of code generation (phasePlugin.h)
