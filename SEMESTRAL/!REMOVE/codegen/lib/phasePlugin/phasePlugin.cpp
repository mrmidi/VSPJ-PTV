//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// phasePlugin.cpp
//
// Code generation for function 'phasePlugin'
//

// Include files
#include "phasePlugin.h"
#include "phasePlugin_types.h"
#include "coder_array.h"
#include <cmath>

// Function Declarations
static derivedAudioPlugin *getPluginInstance(phasePluginStackData *SD);

static void getPluginInstance_free(phasePluginStackData *SD);

static void getPluginInstance_init(phasePluginStackData *SD);

// Function Definitions
static derivedAudioPlugin *getPluginInstance(phasePluginStackData *SD)
{
  if (!SD->pd->plugin_not_empty) {
    double rate;
    //  Pass constructor args to plugin.
    SD->pd->plugin.depth = 50.0;
    SD->pd->plugin.rate = 3.0;
    SD->pd->plugin.NSamples = 0.0;
    SD->pd->plugin.PrivateSampleRate = 44100.0;
    SD->pd->plugin.PrivateLatency = 0;
    rate = SD->pd->plugin.PrivateSampleRate;
    SD->pd->plugin.samplerate = rate;
    SD->pd->plugin.matlabCodegenIsDeleted = false;
    SD->pd->plugin_not_empty = true;
  }
  return &SD->pd->plugin;
}

static void getPluginInstance_free(phasePluginStackData *SD)
{
  if (!SD->pd->plugin.matlabCodegenIsDeleted) {
    SD->pd->plugin.matlabCodegenIsDeleted = true;
  }
}

static void getPluginInstance_init(phasePluginStackData *SD)
{
  SD->pd->plugin_not_empty = false;
  SD->pd->plugin.matlabCodegenIsDeleted = true;
}

derivedAudioPlugin::derivedAudioPlugin() = default;

derivedAudioPlugin::~derivedAudioPlugin() = default;

void createPluginInstance(phasePluginStackData *SD, unsigned long)
{
  getPluginInstance(SD);
}

int getLatencyInSamplesCImpl(phasePluginStackData *SD)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  return plugin->PrivateLatency;
}

void onParamChangeCImpl(phasePluginStackData *SD, int paramIdx, double value)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  switch (paramIdx) {
  case 0:
    plugin->depth = value;
    break;
  case 1:
    plugin->rate = value;
    break;
  }
}

void phasePlugin_initialize(phasePluginStackData *SD)
{
  getPluginInstance_init(SD);
}

void phasePlugin_terminate(phasePluginStackData *SD)
{
  getPluginInstance_free(SD);
}

void processEntryPoint(phasePluginStackData *SD, double samplesPerFrame,
                       const double i1_data[], const int i1_size[1],
                       const double i2_data[], const int i2_size[1],
                       double o1_data[], int o1_size[1], double o2_data[],
                       int o2_size[1])
{
  derivedAudioPlugin *plugin;
  coder::array<double, 2U> t1;
  double amp;
  double depth;
  double rate;
  int loop_ub;
  plugin = getPluginInstance(SD);
  t1.set_size(i1_size[0], 2);
  loop_ub = i1_size[0];
  for (int i{0}; i < loop_ub; i++) {
    t1[i] = i1_data[i];
  }
  loop_ub = i2_size[0];
  for (int i{0}; i < loop_ub; i++) {
    t1[i + t1.size(0)] = i2_data[i];
  }
  //  get the t value of sample
  loop_ub = t1.size(0);
  if (loop_ub < 2) {
    loop_ub = 2;
  }
  if (t1.size(0) == 0) {
    loop_ub = 0;
  }
  plugin->NSamples += static_cast<double>(loop_ub);
  plugin->t = plugin->NSamples / plugin->samplerate;
  depth = plugin->depth / 100.0;
  rate = plugin->rate;
  amp = 0.5 * depth;
  depth = 6.2831853071795862 * rate * plugin->t;
  depth = std::sin(depth);
  depth = amp * depth + (1.0 - amp);
  loop_ub = t1.size(0) * 2;
  t1.set_size(t1.size(0), 2);
  for (int i{0}; i < loop_ub; i++) {
    t1[i] = t1[i] * depth;
  }
  if (samplesPerFrame < 1.0) {
    loop_ub = 0;
  } else {
    loop_ub = static_cast<int>(samplesPerFrame);
  }
  o1_size[0] = loop_ub;
  for (int i{0}; i < loop_ub; i++) {
    o1_data[i] = t1[i];
  }
  if (samplesPerFrame < 1.0) {
    loop_ub = 0;
  } else {
    loop_ub = static_cast<int>(samplesPerFrame);
  }
  o2_size[0] = loop_ub;
  for (int i{0}; i < loop_ub; i++) {
    o2_data[i] = t1[i + t1.size(0)];
  }
}

void resetCImpl(phasePluginStackData *SD, double rate)
{
  derivedAudioPlugin *plugin;
  plugin = getPluginInstance(SD);
  plugin->PrivateSampleRate = rate;
}

// End of code generation (phasePlugin.cpp)
