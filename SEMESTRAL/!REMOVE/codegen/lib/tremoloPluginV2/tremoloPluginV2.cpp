//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// tremoloPluginV2.cpp
//
// Code generation for function 'tremoloPluginV2'
//

// Include files
#include "tremoloPluginV2.h"
#include "tremoloPluginV2_types.h"
#include "coder_array.h"
#include <cmath>

// Function Declarations
static derivedAudioPlugin *getPluginInstance(tremoloPluginV2StackData *SD);

static void getPluginInstance_free(tremoloPluginV2StackData *SD);

static void getPluginInstance_init(tremoloPluginV2StackData *SD);

// Function Definitions
static derivedAudioPlugin *getPluginInstance(tremoloPluginV2StackData *SD)
{
  if (!SD->pd->plugin_not_empty) {
    double rate;
    //  Pass constructor args to plugin.
    SD->pd->plugin.Rate = 1.0;
    SD->pd->plugin.Depth = 1.0;
    SD->pd->plugin.Waveform.set_size(1, 4);
    SD->pd->plugin.Waveform[0] = 's';
    SD->pd->plugin.Waveform[1] = 'i';
    SD->pd->plugin.Waveform[2] = 'n';
    SD->pd->plugin.Waveform[3] = 'e';
    SD->pd->plugin.currentPhase = 0.0;
    //  Constructor
    SD->pd->plugin.PrivateSampleRate = 44100.0;
    SD->pd->plugin.PrivateLatency = 0;
    rate = SD->pd->plugin.PrivateSampleRate;
    SD->pd->plugin.sampleRate = rate;
    SD->pd->plugin.angleChange = SD->pd->plugin.Rate *
                                 (1.0 / SD->pd->plugin.sampleRate) * 2.0 *
                                 3.1415926535897931;
    SD->pd->plugin.matlabCodegenIsDeleted = false;
    SD->pd->plugin_not_empty = true;
  }
  return &SD->pd->plugin;
}

static void getPluginInstance_free(tremoloPluginV2StackData *SD)
{
  if (!SD->pd->plugin.matlabCodegenIsDeleted) {
    SD->pd->plugin.matlabCodegenIsDeleted = true;
  }
}

static void getPluginInstance_init(tremoloPluginV2StackData *SD)
{
  SD->pd->plugin_not_empty = false;
  SD->pd->plugin.matlabCodegenIsDeleted = true;
}

derivedAudioPlugin::derivedAudioPlugin() = default;

derivedAudioPlugin::~derivedAudioPlugin() = default;

void createPluginInstance(tremoloPluginV2StackData *SD, unsigned long)
{
  getPluginInstance(SD);
}

int getLatencyInSamplesCImpl(tremoloPluginV2StackData *SD)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  return plugin->PrivateLatency;
}

void onParamChangeCImpl(tremoloPluginV2StackData *SD, int paramIdx,
                        double value)
{
  static const char cv[6]{'s', 'q', 'u', 'a', 'r', 'e'};
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  switch (paramIdx) {
  case 0: {
    double Fs;
    //  reset
    //  Set method for Rate
    Fs = plugin->PrivateSampleRate;
    plugin->Rate = value;
    plugin->angleChange = plugin->Rate * (1.0 / Fs) * 2.0 * 3.1415926535897931;
  } break;
  case 1:
    plugin->Depth = value;
    break;
  case 2:
    switch (static_cast<int>(value)) {
    case 0:
      plugin->Waveform.set_size(1, 4);
      plugin->Waveform[0] = 's';
      plugin->Waveform[1] = 'i';
      plugin->Waveform[2] = 'n';
      plugin->Waveform[3] = 'e';
      break;
    case 1:
      plugin->Waveform.set_size(1, 6);
      for (int i{0}; i < 6; i++) {
        plugin->Waveform[i] = cv[i];
      }
      break;
    }
    break;
  }
}

void processEntryPoint(tremoloPluginV2StackData *SD, double samplesPerFrame,
                       const double i1_data[], const int i1_size[1],
                       const double i2_data[], const int i2_size[1],
                       double o1_data[], int o1_size[1], double o2_data[],
                       int o2_size[1])
{
  static const char cv[4]{'s', 'i', 'n', 'e'};
  derivedAudioPlugin *plugin;
  coder::array<double, 2U> result;
  coder::array<double, 2U> t1;
  coder::array<char, 2U> a;
  int i;
  int loop_ub;
  plugin = getPluginInstance(SD);
  result.set_size(i1_size[0], 2);
  loop_ub = i1_size[0];
  for (i = 0; i < loop_ub; i++) {
    result[i] = i1_data[i];
  }
  loop_ub = i2_size[0];
  for (i = 0; i < loop_ub; i++) {
    result[i + result.size(0)] = i2_data[i];
  }
  //  Processing method
  //  Get number of samples and channels
  t1.set_size(result.size(0), 2);
  //  Pre-allocate output
  //  Loop through each sample
  i = result.size(0);
  for (int n{0}; n < i; n++) {
    double x;
    boolean_T b_bool;
    //  Calculate the LFO value
    a.set_size(1, plugin->Waveform.size(1));
    loop_ub = plugin->Waveform.size(1);
    for (int i1{0}; i1 < loop_ub; i1++) {
      a[i1] = plugin->Waveform[i1];
    }
    b_bool = false;
    if (a.size(1) == 4) {
      loop_ub = 0;
      int exitg1;
      do {
        exitg1 = 0;
        if (loop_ub < 4) {
          if (a[loop_ub] != cv[loop_ub]) {
            exitg1 = 1;
          } else {
            loop_ub++;
          }
        } else {
          b_bool = true;
          exitg1 = 1;
        }
      } while (exitg1 == 0);
    }
    if (b_bool) {
      // lfo = sin(plugin.currentPhase);
      x = plugin->currentPhase;
      x = std::sin(x);
      x = plugin->Depth / 2.0 * x + (1.0 - plugin->Depth / 2.0);
      //  Sine wave
    } else {
      // lfo = sign(sin(plugin.currentPhase));
      x = plugin->currentPhase;
      x = std::sin(x);
      if (!std::isnan(x)) {
        if (x < 0.0) {
          x = -1.0;
        } else {
          x = (x > 0.0);
        }
      }
      x = plugin->Depth / 2.0 * x + (1.0 - plugin->Depth / 2.0);
      //  Square wave
    }
    //  Apply the LFO to the input
    t1[n] = result[n] * x;
    t1[n + t1.size(0)] = result[n + result.size(0)] * x;
    //  Update the phase
    plugin->currentPhase += plugin->angleChange;
    //  Update the phase of the LFO
    if (plugin->currentPhase > 6.2831853071795862) {
      //  Wrap phase if necessary
      plugin->currentPhase -= 6.2831853071795862;
      //  Wrap phase
    }
  }
  //  for
  if (samplesPerFrame < 1.0) {
    loop_ub = 0;
  } else {
    loop_ub = static_cast<int>(samplesPerFrame);
  }
  o1_size[0] = loop_ub;
  for (i = 0; i < loop_ub; i++) {
    o1_data[i] = t1[i];
  }
  if (samplesPerFrame < 1.0) {
    loop_ub = 0;
  } else {
    loop_ub = static_cast<int>(samplesPerFrame);
  }
  o2_size[0] = loop_ub;
  for (i = 0; i < loop_ub; i++) {
    o2_data[i] = t1[i + t1.size(0)];
  }
}

void resetCImpl(tremoloPluginV2StackData *SD, double rate)
{
  derivedAudioPlugin *plugin;
  double b_rate;
  plugin = getPluginInstance(SD);
  plugin->PrivateSampleRate = rate;
  //  process
  //  Reset method
  b_rate = plugin->PrivateSampleRate;
  plugin->sampleRate = b_rate;
  plugin->currentPhase = 0.0;
  plugin->angleChange =
      plugin->Rate * (1.0 / plugin->sampleRate) * 2.0 * 3.1415926535897931;
}

void tremoloPluginV2_initialize(tremoloPluginV2StackData *SD)
{
  getPluginInstance_init(SD);
}

void tremoloPluginV2_terminate(tremoloPluginV2StackData *SD)
{
  getPluginInstance_free(SD);
}

// End of code generation (tremoloPluginV2.cpp)
