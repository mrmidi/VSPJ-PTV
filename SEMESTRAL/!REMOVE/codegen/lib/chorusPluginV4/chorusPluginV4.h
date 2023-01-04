//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// chorusPluginV4.h
//
// Code generation for function 'chorusPluginV4'
//

#ifndef CHORUSPLUGINV4_H
#define CHORUSPLUGINV4_H

// Include files
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Type Declarations
struct chorusPluginV4StackData;

// Type Definitions
class derivedAudioPlugin {
public:
  derivedAudioPlugin();
  ~derivedAudioPlugin();
  boolean_T matlabCodegenIsDeleted;
  double PrivateSampleRate;
  int PrivateLatency;
  double Depth;
  double Rate;
  double Wet;
  double Predelay;
  double sampleRate;
  double maxDelay;
  coder::array<double, 2U> DelayLine;
  double DelayLineLength;
  double DelayLineIndex;
  double currentPhase;
  double angleChange;
  double mix;
};

// Function Declarations
extern void chorusPluginV4_initialize(chorusPluginV4StackData *SD);

extern void chorusPluginV4_terminate(chorusPluginV4StackData *SD);

extern void createPluginInstance(chorusPluginV4StackData *SD,
                                 unsigned long thisPtr);

extern int getLatencyInSamplesCImpl(chorusPluginV4StackData *SD);

extern void onParamChangeCImpl(chorusPluginV4StackData *SD, int paramIdx,
                               double value);

extern void processEntryPoint(chorusPluginV4StackData *SD,
                              double samplesPerFrame, const double i1_data[],
                              const int i1_size[1], const double i2_data[],
                              const int i2_size[1], double o1_data[],
                              int o1_size[1], double o2_data[], int o2_size[1]);

extern void resetCImpl(chorusPluginV4StackData *SD, double rate);

#endif
// End of code generation (chorusPluginV4.h)
