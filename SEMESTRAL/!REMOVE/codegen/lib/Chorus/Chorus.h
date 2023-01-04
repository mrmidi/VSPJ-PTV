//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// Chorus.h
//
// Code generation for function 'Chorus'
//

#ifndef CHORUS_H
#define CHORUS_H

// Include files
#include "Chorus_types1.h"
#include "rtwtypes.h"
#include "coder_array.h"
#include <cstddef>
#include <cstdlib>

// Type Declarations
struct ChorusStackData;

// Type Definitions
namespace coder {
namespace dspcodegen {
class VariableFractionalDelay {
public:
  VariableFractionalDelay();
  ~VariableFractionalDelay();
  boolean_T matlabCodegenIsDeleted;
  int isInitialized;
  boolean_T isSetupComplete;
  dsp_VariableFractionalDelay_0 cSFunObject;
};

} // namespace dspcodegen
class audioOscillator {
public:
  void step(::coder::array<double, 1U> &varargout_1);
  static void generateSine(double *ph, double samplesPerFrame, double phaseStep,
                           double A, double DCOffset,
                           ::coder::array<double, 1U> &y);
  static void generateSquare(double *ph, double frameLength, double phaseStep,
                             double dutyCycle, double A, double DCOffset,
                             ::coder::array<double, 1U> &y);
  static void generateSawtooth(double *ph, double frameLength, double phaseStep,
                               double width, double A, double DCOffset,
                               ::coder::array<double, 1U> &y);
  audioOscillator();
  ~audioOscillator();
  boolean_T matlabCodegenIsDeleted;
  int isInitialized;
  boolean_T TunablePropsChanged;
  double SamplesPerFrame;
  double SampleRate;
  double pPhaseStep;
  double pPhase;
  double pFrequency[200];
  double pAmplitude[200];
  double pPhaseOffset[200];
  double pDCOffset[200];
  double pDutyCycle;
  double pWidth;
  double pFrequencyCast;
  double pAmplitudeCast;
  double pPhaseOffsetCast;
  double pDCOffsetCast;
  double pDutyCycleCast;
  double pWidthCast;

protected:
  double pType;

private:
  boolean_T isSetupComplete;
};

} // namespace coder
class derivedAudioPlugin {
public:
  void process(const coder::array<double, 2U> &x,
               coder::array<double, 2U> &out);
  derivedAudioPlugin();
  ~derivedAudioPlugin();
  boolean_T matlabCodegenIsDeleted;
  double PrivateSampleRate;
  int PrivateLatency;
  double Delay;
  double WetDryMix;
  coder::dspcodegen::VariableFractionalDelay pFractionalDelay;
  coder::audioOscillator pSine1;
  coder::audioOscillator pSine2;
  double pSR;
};

// Function Declarations
extern void Chorus_initialize(ChorusStackData *SD);

extern void Chorus_terminate(ChorusStackData *SD);

extern void createPluginInstance(ChorusStackData *SD, unsigned long thisPtr);

extern int getLatencyInSamplesCImpl(ChorusStackData *SD);

extern void onParamChangeCImpl(ChorusStackData *SD, int paramIdx, double value);

extern void processEntryPoint(ChorusStackData *SD, double samplesPerFrame,
                              const double i1_data[], const int i1_size[1],
                              const double i2_data[], const int i2_size[1],
                              double o1_data[], int o1_size[1],
                              double o2_data[], int o2_size[1]);

extern void resetCImpl(ChorusStackData *SD, double rate);

#endif
// End of code generation (Chorus.h)
