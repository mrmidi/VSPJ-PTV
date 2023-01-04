//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// tremoloPluginV2.h
//
// Code generation for function 'tremoloPluginV2'
//

#ifndef TREMOLOPLUGINV2_H
#define TREMOLOPLUGINV2_H

// Include files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Type Declarations
struct tremoloPluginV2StackData;

// Type Definitions
class derivedAudioPlugin {
public:
  derivedAudioPlugin();
  ~derivedAudioPlugin();
  boolean_T matlabCodegenIsDeleted;
  double PrivateSampleRate;
  int PrivateLatency;
  double Rate;
  double Depth;
  coder::array<char, 2U> Waveform;
  double sampleRate;
  double currentPhase;
  double angleChange;
};

// Function Declarations
extern void createPluginInstance(tremoloPluginV2StackData *SD,
                                 unsigned long thisPtr);

extern int getLatencyInSamplesCImpl(tremoloPluginV2StackData *SD);

extern void onParamChangeCImpl(tremoloPluginV2StackData *SD, int paramIdx,
                               double value);

extern void processEntryPoint(tremoloPluginV2StackData *SD,
                              double samplesPerFrame, const double i1_data[],
                              const int i1_size[1], const double i2_data[],
                              const int i2_size[1], double o1_data[],
                              int o1_size[1], double o2_data[], int o2_size[1]);

extern void resetCImpl(tremoloPluginV2StackData *SD, double rate);

extern void tremoloPluginV2_initialize(tremoloPluginV2StackData *SD);

extern void tremoloPluginV2_terminate(tremoloPluginV2StackData *SD);

#endif
// End of code generation (tremoloPluginV2.h)
